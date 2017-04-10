#tag Module
Protected Module OSM
	#tag Method, Flags = &h21
		Private Sub AddChangeToLocal(oJSON as JSONItem)
		  dim db1 as New SQLiteDatabase
		  dim rd1 as New ResourceDirectories
		  
		  
		  // Point database adapter to the sync database file
		  db1.DatabaseFile = rd1.sync_db_file.FilePath
		  
		  // Connect to database
		  If Not db1.CreateDatabaseFile Then
		    'connection unsuccseful
		    dim err as New RuntimeException
		    err.Message = "Could not create/connect to sync database. | " + db1.ErrorMessage
		    ErrManage("OSM.AddChangeToLocal",err.Message)
		    Raise err
		  End If
		  
		  ' If we get here connection has been succseful
		  
		  dim sql1 as string
		  dim ps1 as SQLitePreparedStatement
		  dim json_info as JSONItem = oJSON
		  
		  // Prepare the sql
		  sql1 = "Insert Into changes_raw (json_info,pushed) Values(?,?);"
		  ps1 = db1.Prepare(sql1)
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = db.ErrorMessage
		    ErrManage("OSM.AddChangeToLocal",err.Message)
		    raise err
		  End If
		  
		  dim s1 as string = json_info.ToString
		  
		  // Bind Values
		  ps1.BindType(0,SQLitePreparedStatement.SQLITE_TEXT)
		  ps1.BindType(1,SQLitePreparedStatement.SQLITE_BOOLEAN)
		  ps1.Bind(0,s1)
		  ps1.Bind(1,False)
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = db.ErrorMessage
		    ErrManage("OSM.AddChangeToLocal",err.Message)
		    raise err
		  End If
		  
		  // Execute
		  ps1.SQLExecute
		  'db1.SQLExecute("Insert Into changes_raw (json_info,pushed) Values($$" + json_info.ToString + "$$, False);")
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = db.ErrorMessage
		    ErrManage("OSM.AddChangeToLocal",err.Message)
		    raise err
		  End If
		  
		  db1.Commit
		  db1.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckForUnpushedChanges() As Boolean
		  // Returns True if there are unpushed changes
		  // False if there are pushed changes
		  
		  Dim db1 as SQLiteDatabase
		  Dim sql1 as string
		  Dim rd1 as New ResourceDirectories
		  Dim rs1 as RecordSet
		  Dim upc1 as integer
		  
		  
		  db1.DatabaseFile = rd1.sync_db_file.FilePath
		  If Not db1.Connect Then
		    'database couldnt connect
		    dim err as RuntimeException
		    err.Message = "Could not connect to sync database in check for updates"
		    ErrManage("OSM.CheckForUnpushedChanges",err.Message)
		    Raise err
		  End If
		  
		  sql1 = "Select count(*) From changes_raw Where pushed = False;"
		  rs1 = db1.SQLSelect(sql1)
		  If db1.Error Then
		    dim err as RuntimeException
		    err.Message = "Could not pull changes from sync_db. | " + db1.ErrorMessage
		    ErrManage("OSM.CheckForUnpushedChanges",err.Message)
		    Raise err
		  End If
		  
		  If rs1 <> Nil Then
		    upc1 = rs1.Field("cound(*)").IntegerValue
		    
		    If upc1 > 0 Then
		      ' There are unpushed changes
		      Return True
		    Else 
		      ' No unpushed changes
		      Return False
		    End If
		    
		  Else
		    'Something went wrong
		    dim err as RuntimeException
		    err.Message = "Could not pull changes from sync_db. |  Record Set nil"
		    ErrManage("OSM.CheckForUnpushedChanges", err.Message)
		    Raise err
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExecuteBoundSQLScript(sSQLScript as String) As Boolean
		  dim sStatementWithValuesArrray() as String
		  dim sBindingPlaceholder as string = "?"
		  dim db1 as New SQLiteDatabase
		  dim rd1 as New ResourceDirectories
		  dim ps1Array() as SQLitePreparedStatement
		  dim hopeformoreerrorlist() as string
		  
		  
		  // Connect to the database
		  db1.DatabaseFile = rd1.otis_data_file.FilePath
		  If Not db1.Connect Then
		    dim err as new RuntimeException
		    err.Message = "could not connect to database | " + db1.ErrorMessage
		    raise err
		    Return False
		  End If
		  
		  // Break the Script we were sent into each individual statement
		  ' Statements look like this: Insert Into tbl_inventory(field1,field2,field3) Values(|PLACEHOLDER|,|PLACEHOLDER|,|PLACEHOLDER|)|EOSTATEMENT|albert:Text,sonya:Text,54:Integer|EOINSERT|Insert Into tbl_inventory(field1,field2,field3) Values(|PLACEHOLDER|,|PLACEHOLDER|,|PLACEHOLDER|)|EOSTATEMENT|albert:Text,sonya:Text,54:Integer|EOINSERT|
		  ' After breaking it into an array we will have an insert statment followed by pairs of value:valueType
		  sStatementWithValuesArrray = sSQLScript.Split("|EOINSERT|")
		  
		  // Loop through all of the individual statements
		  For each sStatementWithValues as string In sStatementWithValuesArrray()
		    dim sStatement as string
		    dim sValueValueTypes as string
		    dim sValueValueTypesArray() as string
		    dim tempArray() as string
		    
		    dim ps1 as SQLitePreparedStatement
		    
		    
		    // Split the value:valueType pairs from the insert statement
		    tempArray = sStatementWithValues.Split("|EOSTATEMENT|")
		    ' and load them into proper variables
		    sStatement = tempArray(0)
		    sValueValueTypes = tempArray(1)
		    
		    // Replace the temporary placeholders with sqlite specific placeholders
		    sStatement = ReplaceAll( sStatement, "|PLACEHOLDER|", sBindingPlaceholder )
		    
		    // Prepare the statement
		    ps1 = db1.Prepare(sStatement)
		    
		    // Split the values:valuetypes apart from each other
		    sValueValueTypesArray = sValueValueTypes.Split("(,)")
		    
		    // Loop through each value:valueType
		    dim i1 as Integer = 0
		    For each ValueValueType as string In sValueValueTypesArray
		      dim sValue as String
		      dim vFormattedValue as Variant
		      dim sType as String
		      dim tempArray2() as String
		      
		      // Split the ValueValueType into its value and type variables
		      tempArray2 = ValueValueType.Split("(:)")
		      sValue = tempArray2(0)
		      sType = tempArray2(1)
		      
		      // Set the bind type for the current value
		      If sValue = "None" Then
		        ps1.BindType(i1,SQLitePreparedStatement.SQLITE_NULL)
		        
		        Select Case sType
		        Case "Text"
		          vFormattedValue = ""
		        Case "Boolean"
		          vFormattedValue = Nil
		        Case "Integer"
		          vFormattedValue = Nil
		        End Select
		        
		      Else
		        
		        Select Case sType
		        Case "Text"
		          ps1.BindType(i1,SQLitePreparedStatement.SQLITE_TEXT)
		          vFormattedValue = sValue
		        Case "Boolean"
		          ps1.BindType(i1,SQLitePreparedStatement.SQLITE_BOOLEAN)
		          vFormattedValue = sValue
		        Case "Integer"
		          ps1.BindType(i1,SQLitePreparedStatement.SQLITE_INTEGER)
		          vFormattedValue = Val(sValue)
		        End Select
		      End If
		      
		      if db1.ErrorMessage <> "" And db1.ErrorMessage <> "not an error" Then
		        break
		      end if
		      If db1.Error Then
		        break
		      End If
		      
		      // Bind the vaue to the prepared statement
		      ps1.Bind(i1,vFormattedValue)
		      If db1.Error Then
		        break
		      End If
		      // Increase Index by 1
		      i1 = i1 + 1
		      
		    Next
		    
		    // Append the prepared statement to an array
		    ps1Array.Append(ps1)
		    
		  Next
		  
		  dim sErrorArray() as String
		  dim iErrorCount as integer
		  dim iIndex as integer
		  
		  // Loop through each prepared Statement
		  For each psStatement as SQLitePreparedStatement In ps1Array
		    
		    // Execute the Statement
		    psStatement.SQLExecute
		    If db1.Error Then
		      break
		      iErrorCount = iErrorCount + 1
		      sErrorArray.Append( db1.ErrorMessage )
		    End If
		    iIndex = iIndex + 1
		  Next
		  
		  
		  Return True
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExecuteSQLScript(oScript as string, oSplitCharacter as string = ";") As Boolean
		  Dim SQLArray() as String
		  Dim CurrentStatement as String
		  Dim db1 as New SQLiteDatabase
		  Dim rd1 as New ResourceDirectories
		  Dim ErrorCount as integer
		  Dim ErrorList() as String
		  
		  
		  db1.DatabaseFile = rd1.otis_data_file.FilePath
		  SQLArray = Split(oScript,oSplitCharacter)
		  
		  If db1.Connect Then
		    
		    For i1 as integer = 0 To SQLArray.Ubound
		      
		      CurrentStatement = SQLArray(i1) + ";"
		      
		      db1.SQLExecute(CurrentStatement)
		      If db1.Error Then
		        ErrorList.Append( db1.ErrorMessage )
		        ErrorCount = ErrorCount + 1
		      End If
		      
		    Next
		    
		    If ErrorCount > 0 Then
		      Return False
		    Else
		      Return True
		    End If
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetUnpushedChanges() As OSM.UnpushedChangesClass
		  
		  
		  
		  dim db1 as New SQLiteDatabase
		  dim rd1 as New ResourceDirectories
		  dim sql1 as String
		  dim rs1 as RecordSet
		  
		  // Connect to local database
		  db1.DatabaseFile = rd1.sync_db_file.FilePath
		  If Not db1.Connect Then
		    'database couldnt connect
		    dim err as New RuntimeException
		    err.Message = "Could not connect to sync database."
		    ErrManage("OSM.Push",err.Message)
		    Raise err
		  End If
		  
		  // Pull records out of the sync database
		  sql1 = "Select * From changes_raw Where pushed = 0"
		  rs1 = db1.SQLSelect(sql1)
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = "Could not pull changes from sync_db. | " + db1.ErrorMessage
		    ErrManage("OSM.Push",err.Message)
		    Raise err
		  End If
		  
		  If rs1 = Nil Then
		    dim err as New RuntimeException
		    err.Message = "Could not pull changes from sync_db. | "
		    ErrManage("OSM.Push",err.Message)
		    Raise err
		  End If
		  
		  dim jsonStringArray() as string
		  dim idArray() as Int64
		  
		  // Loop through each record
		  For i1 as integer = 0 To rs1.RecordCount - 1
		    
		    dim s1 as string
		    dim n1 as int64
		    s1 = rs1.Field("json_info")
		    n1 = rs1.Field("pkid").Int64Value
		    jsonStringArray.Append(s1)
		    idArray.Append(n1)
		    
		    
		    rs1.MoveNext
		    
		  Next
		  
		  Dim oUCC as New OSM.UnpushedChangesClass
		  oUCC.arsChangeDescriptions = jsonStringArray
		  oUCC.iRecordIds = idArray
		  
		  Return oUCC
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RunFullSync()
		  Dim rs1 as RecordSet
		  Dim SQLScript as String
		  Dim db1 as PostgreSQLDatabase = app.RegDB
		  
		  
		  dim oString(),oCD as String
		  dim oUCC as OSM.UnpushedChangesClass
		  
		  
		  // Create sql
		  dim sql as string
		  Dim ps1 as PostgreSQLPreparedStatement
		  sql = "Select * From public.create_full_sync_script();"
		  
		  // Preapere the statement
		  ps1 = db1.Prepare(sql)
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = "Could not get full sync script. | " + db1.ErrorMessage
		    ErrManage("OSM.RunSync",err.Message)
		    Raise err
		  End If
		  
		  // Execute
		  rs1 = ps1.SQLSelect
		  'rs1 = db1.SQLSelect("Select * From utility.run_sync('" + oCD + "', " + str(oClientID) + ");")
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = "Could not get full sync script. | " + db1.ErrorMessage
		    ErrManage("OSM.RunSync",err.Message)
		    Raise err
		  End If
		  
		  // Check if rs1 is nil
		  If rs1 = Nil Then
		    'No changes delivered...all up to date?
		    Return
		  End If
		  
		  // Pull the sql_script from the results
		  dim sql_script as string
		  sql_script = rs1.Field("create_full_sync_script").StringValue
		  
		  // Execute the sql script on the local database
		  If ExecuteBoundSQLScript(sql_script) Then
		    'update succsesful
		  Else
		    'upddate not succseful
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RunSync()
		  Dim rs1 as RecordSet
		  Dim SQLScript as String
		  Dim db1 as PostgreSQLDatabase = app.RegDB
		  
		  If db1 = Nil Then
		    MsgBox("Otis is offline right now. Cannot push changes to server.")
		    Return
		  End If
		  
		  dim oString(),oCD as String
		  dim oUCC as OSM.UnpushedChangesClass
		  
		  //  Get the change description array from unpushed changes
		  oUCC = GetUnpushedChanges
		  oString() = oUCC.arsChangeDescriptions
		  oCD = Join(oString(),"(,)")
		  
		  
		  // Get the client id
		  dim oClientID as integer
		  oClientID = UserInfo.ClientID
		  
		  // Create sql
		  dim sql as string
		  Dim ps1 as PostgreSQLPreparedStatement
		  sql = "Select * From utility.run_sync($1, $2);"
		  
		  // Preapere the statement
		  ps1 = db1.Prepare(sql)
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = "Could not push changes from sync_db. | " + db1.ErrorMessage
		    ErrManage("OSM.RunSync",err.Message)
		    Raise err
		  End If
		  
		  // Bind Values
		  ps1.bind(0,oCD)
		  ps1.bind(1,oClientID)
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = "Could not push changes from sync_db. | " + db1.ErrorMessage
		    ErrManage("OSM.RunSync",err.Message)
		    Raise err
		  End If
		  
		  // Execute
		  rs1 = ps1.SQLSelect
		  'rs1 = db1.SQLSelect("Select * From utility.run_sync('" + oCD + "', " + str(oClientID) + ");")
		  If db1.Error Then
		    dim err as New RuntimeException
		    err.Message = "Could not push changes from sync_db. | " + db1.ErrorMessage
		    ErrManage("OSM.RunSync",err.Message)
		    Raise err
		  End If
		  
		  // Set all the records as pushed
		  SetToPushed( oUCC.iRecordIds )
		  
		  // Check if rs1 is nel
		  If rs1 = Nil Then
		    'No changes delivered...all up to date?
		    Return
		  End If
		  
		  // Pull the sql_script from the results
		  dim sql_script as string
		  sql_script = rs1.Field("run_sync").StringValue
		  
		  // Execute the sql script on the local database
		  If ExecuteSQLScript(sql_script) Then
		    'update succsesful
		  Else
		    'upddate not succseful
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetToPushed(iRecordIDs() as int64)
		  dim db1 as New SQLiteDatabase
		  dim rd1 as New ResourceDirectories
		  dim sql1 as String
		  dim rs1 as RecordSet
		  
		  // Connect to local database
		  db1.DatabaseFile = rd1.sync_db_file.FilePath
		  If Not db1.Connect Then
		    'database couldnt connect
		    dim err as New RuntimeException
		    err.Message = "Could not connect to sync database."
		    ErrManage("OSM.SetToPushed",err.Message)
		    Raise err
		  End If
		  
		  For i1 as integer = 0 to iRecordIDs.Ubound
		    dim id1 as int64 = iRecordIDs(i1)
		    dim sql as string 
		    
		    sql = "Update changes_raw Set pushed = 1 Where pkid = " + id1.ToText + ";"
		    db1.SQLExecute(sql)
		    If db1.Error Then
		      dim err as new RuntimeException
		      err.Message = "Error setting records to pushed | " + db1.ErrorMessage
		      ErrManage("OSM.SetToPushed",err.Message)
		      raise err
		    End If
		    
		  Next
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StoreSync(oChangeDescription as JSONItem)
		  'dim oCDString as string
		  
		  
		  'oCDString = oChangeDescription.ToString
		  
		  // Push JSON to local sync database using AddSyncContent
		  Try
		    AddChangeToLocal( oChangeDescription )
		  Catch err as runtimeexception
		    raise err
		  End Try
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
