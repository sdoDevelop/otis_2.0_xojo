



-- Create Languages
CREATE PROCEDURAL LANGUAGE 'plpythonu' HANDLER plpython_call_handler; 

-- Create Functions
CREATE Or Replace FUNCTION public.create_full_sync_script()
    RETURNS text
    LANGUAGE 'plpythonu'
    NOT LEAKPROOF 
AS $function$
#I know we dont need to....
#   but dammit.... I like initializing variables
sql = ""
rs = None
table_names = []
column_names = []
column_values = []
column_data_types = {}
insert_st_list = []
tup_list = None
cursor = None


# Get all the names of tables that contain our data
sql = "Select table_name From information_schema.tables Where table_schema = 'public'"
table_names = plpy.execute(sql)

# loop through each table
for table_dict in table_names:
    # get the current table name
    table = table_dict['table_name']

    # grab the data types for each column in this table
    sql = "Select column_name, data_type From information_schema.columns Where table_name = '" + table + "'"
    rv = plpy.execute(sql)

    # loop through to create a dictionary of data types
    #    now = [ {column_name:pkid,data_type:text},{column_name:time,data_type:date} ]
    #   we want = {pkid:text,time:date}
    for row in rv:
        column_data_types[row["column_name"]] = row["data_type"]

    # set up a cursor and loop through all records in the table
    cursor = plpy.cursor("Select * From " + table )
    while True:

        # grab a row
        row = cursor.fetch(1)

        # check if we actually grabbed any rows
        if not row:
            break

        # pull the column names and values into lists
        tup_list = row[0].items()
        column_names = [x[0] for x in tup_list]
        column_values_tmp = [x[1] for x in tup_list]
        column_values = []
        number_types = ['smallint','integer','bigint','decimal','numeric','real','double precision','serial','bigserial']
        array_types = ['ARRAY','anyarray']
        placeholder_characters = "|PLACEHOLDER|"
        value_placeholders = []

        # prepare the data depending on what its data type is
        for name, value in zip(column_names,column_values_tmp):
            if column_data_types[name] in number_types: #(column_data_types[name] == 'integer') :
                column_values.append(str(value) + "(:)Integer" )
                #if value:
                #    column_values.append(str(value))
                #else:
                #    column_values.append("0")
            elif column_data_types[name] == "boolean":
                column_values.append(str(value) + "(:)Boolean")
                #if value:
                #    column_values.append("'" + str(value) + "'")
                #else:
                #    column_values.append("'False'")
            #elif column_data_types[name] in array_types:
                #if value:
                #    column_values.append("'" + str(value) + "'")
                #else:
                #    column_values.append("''")
            else:
                column_values.append(str(value) + "(:)Text")
                #if value:
                #    column_values.append("'" + value + "'")
                #else:
                #    column_values.append("''")
            # Add a placeholder
            value_placeholders.append(placeholder_characters)

        # create our insert statment
        insert_statement = "Insert Into " + table + " (" + ','.join(column_names) + ") Values(" + ','.join(value_placeholders) + ");"
        insert_statement = insert_statement + '|EOSTATEMENT|' + '(,)'.join(column_values)
        # append insert statment to or array
        insert_st_list.append(insert_statement)


return '|EOINSERT|'.join(insert_st_list)
$function$;

ALTER FUNCTION public.create_full_sync_script()
    OWNER TO postgres;