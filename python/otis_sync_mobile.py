#!/usr/bin/python

def CreateInsertStatement(oTableName,oFields,oPlaceHolder):

    # Join the fields into a string
    oFldStr = ",".join(oFields)

    # Loop through the fields to create placeholders
    oPlcHlds = []
    oCounter = 1
    oPH = oPlaceHolder
    for field in oFields:
        if len(oPlaceHolder) == 2:
            # If the placeholder contains a number then we need to use ocounter
            if oPlaceHolder[1:] == "1":
                oPH = oPlaceHolder[:1] + str(oCounter)
                oCounter = oCounter + 1
        oPlcHlds.append(oPH)

    # Join the placeholders list into a string
    oPlcHldStr = ",".join(oPlcHlds)

    # Create the statement
    oStmt = "Insert Into " + oTableName + " (" + oFldStr + ") Values(" + oPlcHldStr + ");"

    return oStmt

def CreateUpdateStatement(oTableName,oFields,oPlaceHolder):

    # Loop through each field and create the field = placeholder pair
    oPairs = []
    oCounter = 1
    oPH = oPlaceHolder
    for oField in oFields:
        if len(oPlaceHolder) == 2:
            # If the placeholder contains a number then we need to use ocounter
            if oPlaceHolder[1:] == "1":
                oPH = oPlaceHolder[:1] + str(oCounter)
                oCounter = oCounter + 1

        oPairs.append(oField + " = " + oPH)

    if oCounter > 1:
        oPH = oPlaceHolder[:1] + str(oCounter)
    oPairStr = ",".join(oPairs)
    oStmt = "Update " + oTableName + " set " + oPairStr + " Where pkid = " + oPH + ";"

    return oStmt


def CreateDeleteStatement(oTableName,oPlaceHolder):

    oStmt = "Delete From " + oTableName + " Where pkid = " + oPlaceHolder + ";"
    return oStmt

def CreateChangePushieFromChangeDesc(oChangeDescription,oPlaceHolder):
    import json

    oChangeDesc = {}
    oChangeDesc = json.loads(oChangeDescription)

    # Pull the parts of oChangeDesc into variables

    oTableName = oChangeDesc["TableName"]
    oStmtType = oChangeDesc["StatementType"]
    oValues = []

    # Launch functions to create the statment
    oStmt = ""
    if oStmtType == "Insert":
        oFldValList = oChangeDesc["Fields"]
        oFields = oFldValList.keys()
        oValues = oFldValList.values()
        oStmt = CreateInsertStatement(oTableName,oFields,oPlaceHolder)
    elif oStmtType == "Update":
        oFldValList = oChangeDesc["Fields"]
        oFields = oFldValList.keys()
        oValues = oFldValList.values()
        oStmt = CreateUpdateStatement(oTableName,oFields,oPlaceHolder)
        oPKID = oChangeDesc["pkid"]
        oValues.append(oPKID)
    elif oStmtType == "Delete":
        oStmt = CreateDeleteStatement(oTableName,oPlaceHolder)
        oPKID = oChangeDesc["pkid"]
        oValues.append(oPKID)

    # Put the information togeter in a JSON ChangePushie
    oChangePushie = {}
    oChangePushie["Statement"] = oStmt
    oChangePushie["Values"] = oValues
    oChangePushie["ChangeDesc"] = oChangeDesc

    return oChangePushie

def RunSync(oChangeDescriptions,oClientID):
    import json

    # Connect to the server
    import psycopg2 as pgdb
    import psycopg2.extras
    conn = pgdb.connect(database="otis_data", user="postgres", password="3agle5f0rL!fe", host="45.63.78.70")

    print('Checking if there is a change description')
    if oChangeDescriptions != "":
        print('There is a change description')
        file = open("/home/ocd.txt","w")
        file.write(oChangeDescriptions)
        file.close()

        # Create lists of change pushies
        oChangePushies = []
        oLocalChangePushies = []
        temp = []
        temp = oChangeDescriptions.split("(,)")
        for oChangeDesc in temp:
            oChangePushie = CreateChangePushieFromChangeDesc(oChangeDesc,"%s")
            oLocalChangePushie = CreateChangePushieFromChangeDesc(oChangeDesc,"?")
            oChangePushies.append(oChangePushie)
            oLocalChangePushies.append(oLocalChangePushie)

       # Set up cursor
        curs = conn.cursor()

        # Loop through our oChangePushies
        for oChangePushie in oChangePushies:
            # Prepare the statements
            sql_statement = oChangePushie["Statement"]
            audit_statement = "Insert Into utility.tbl_audit (change_pushie,local_change_pushie,change_init_client_id) Values(%s,%s,%s) Returning pkid;"

            # Run the statement from change pushie to update the server
            curs.execute(sql_statement,oChangePushie["Values"])

            # Record the change pushies into an audit table and grab the id fromit
            curs.execute(audit_statement,[json.dumps(oChangePushie),json.dumps(oLocalChangePushie),oClientID])
            oReturn = curs.fetchone()
            oPKID = oReturn[0]
    else:
        print('no change description')
    #Fi

    #Prepare the sql to grab all the change pushies to give back to the client
    sql_statement = """
                    Select a.pkid as apkid,a.local_change_pushie From
                        utility.tbl_audit a
                        left outer join
                            utility.tbl_audit_audit b
                            on a.pkid = b.fk_tbl_audit
                        where
                            b.pkid is null Or b.client_id <> 3456;
                        """
    curs = conn.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
    curs.execute(sql_statement)
    oReturn = curs.fetchall()

    # Commit and close the database
    conn.commit()
    conn.close()

    return oReturn
