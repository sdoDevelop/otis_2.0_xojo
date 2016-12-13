#tag Module
Protected Module InitializationModule
	#tag Method, Flags = &h21
		Private Function CheckDatabase() As Boolean
		  Dim rd1 as New ResourceDirectories
		  
		  Return CheckDatabase( rd1.db_file.FilePath, LocalDatabaseCheckScript )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckDatabase(DatabaseFile as FolderItem, CreationScript as string) As Boolean
		  // RuntimeException
		  
		  Dim RD1 as new ResourceDirectories
		  Dim db1 as New SQLiteDatabase 
		  Dim ErrorCount as integer
		  Dim ErrorList() as string
		  Dim ReturnValue as Integer  ' 0=unchanged , 1=check failed , 2=check passed
		  
		  
		  // Connect To database file
		  db1.DatabaseFile = DatabaseFile
		  If Not db1.Connect Then
		    // No database file
		    ReturnValue = 1
		    
		  Else
		    ' There is a database file
		    
		    // Create tables in database file
		    
		    ' Break sql into individual statements
		    Dim sql_statements() as string
		    sql_statements = Split( CreationScript, ";" )
		    
		    // Add ';' back to sql statements and execute
		    For i1 as integer = 0 To sql_statements.Ubound
		      
		      If InStr(sql_statements(i1),"Select") > 0 Then
		        ' Add ';' back in
		        sql_statements(i1) = sql_statements(i1) + " Where pkid = 0 ;"
		      Else
		        sql_statements.Remove(i1)
		        Continue
		      End If
		      
		      'extract just the fields
		      Dim s1,oFields() as string
		      s1 = Mid(sql_statements(i1),InStr(s1,"Select") + 7 )
		      s1 = Left(s1,s1.InStr("From") - 1)
		      oFields = Split(s1,",")
		      
		      'Execute sql
		      Dim rs1 as RecordSet
		      rs1 = db1.SQLSelect(sql_statements(i1))
		      If db1.Error Then
		        ErrorList.Append db1.ErrorMessage
		        ErrorCount = ErrorCount + 1
		      End If
		      
		      If rs1 <> Nil Then
		        // Check oFields total compared to rs1.FieldCount
		        If oFields.Ubound + 1 <> rs1.FieldCount Then
		          'Number of fields to not match 
		          ReturnValue = 1
		          Exit
		        Else
		          If ReturnValue <> 1 Then
		            ReturnValue = 2
		          End If
		        End If
		      Else
		        ReturnValue = 1
		      End If
		      
		      
		    Next
		    
		    // Check if there were any errors
		    If ErrorCount <> 0 Then
		      'errors occurred
		      break
		      ReturnValue = 1
		    Else
		      If ReturnValue <> 1 Then
		        ReturnValue = 2
		      End If
		      
		    End If
		    
		    Dim rs2 as RecordSet
		    // Now we check the count of tables
		    rs2 = db1.SQLSelect("Select count(*) From sqlite_master Where type = 'table';")
		    If db1.Error Then
		      break
		    End If
		    
		    dim n1 as integer
		    n1 = rs2.Field("count(*)").IntegerValue
		    If n1 <> sql_statements.Ubound + 1 Then
		      'table number mismatch
		      ReturnValue = 1
		    Else
		      
		    End If
		    
		    
		  End If
		  
		  db1.Close
		  
		  Select Case ReturnValue
		  Case 0 or 1 
		    Return False
		  Case 2
		    Return True
		  End Select
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CheckDatabases() As Boolean
		  // Returns True if databases check out alright
		  // Returns False if databases do not check out alright
		  
		  
		  // Check if all of the tables are actually created correctly in the database
		  Dim bool1,bool2,bool3 as Boolean
		  Dim rd1 as New ResourceDirectories
		  
		  
		  bool1 = CheckDatabase(rd1.otis_data_file.FilePath,OtisDataCheckScript)
		  bool2 = CheckDatabase(rd1.utility_db_file.FilePath,UtilityDBCheckScript)
		  bool3 = CheckDatabase(rd1.sync_db_file.FilePath,SyncDBCheckScript)
		  rd1 = nil
		  
		  If bool1 And bool2 And bool3 Then
		    ' All tables are created correctly we can be pretty sure that we are ready to go
		    Return True
		  Else
		    ' Tables have not been created correctly, we must do a reset
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CheckForClientID()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CheckInitializedFile() As Boolean
		  // Returns True if initialized file says true
		  // Returns False if Initialized file says false or doesn't exist
		  
		  
		  
		  Dim RD1 as New Logic.ResourceDirectories
		  
		  
		  // Open the folder
		  Dim InitializedFileValue as string
		  Dim f As FolderItem = RD1.initialized_file.FilePath
		  If f <> Nil Then
		    If f.Exists Then
		      // Be aware that TextInputStream.Open coud raise an exception
		      Dim t As TextInputStream
		      // Read the file
		      Try
		        t = TextInputStream.Open(f)
		        InitializedFileValue = t.ReadAll
		        t.Close
		      Catch e As IOException
		        Return False
		      End Try
		    End If
		  End If
		  
		  
		  If InitializedFileValue = "True" Then
		    Return True
		  Else
		    Return False
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateDatabase()
		  Dim rd1 as New ResourceDirectories
		  
		  CreateDatabase( rd1.otis_data_file.FilePath, OtisDataCreationScript )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateDatabase(DatabaseFile as FolderItem, CreationScript as String)
		  // RuntimeException
		  
		  Dim RD1 as new ResourceDirectories
		  Dim db1 as New SQLiteDatabase
		  Dim ErrorCount as integer
		  Dim ErrorList() as string
		  
		  
		  // Create the database file
		  db1.DatabaseFile = DatabaseFile
		  If Not db1.CreateDatabaseFile Then
		    db1.Close
		    Dim err as RuntimeException
		    err.Message = "Could not create database file"
		    Raise err
		  End If
		  
		  
		  // Create tables in database file
		  
		  ' Break sql into individual statements
		  Dim sql_statements() as string
		  sql_statements = Split( CreationScript, ";" )
		  
		  // Add ';' back to sql statements and execute
		  For i1 as integer = 0 To sql_statements.Ubound
		    
		    ' Add ';' back in
		    sql_statements(i1) = sql_statements(i1) + ";"
		    
		    'Execute sql
		    db1.SQLExecute(sql_statements(i1))
		    If db1.Error Then
		      ErrorCount = ErrorCount + 1
		      Redim ErrorList(ErrorCount - 1)
		      ErrorList( ErrorCount - 1 ) = db1.ErrorMessage
		      ErrManage( "dbCreation",db1.ErrorMessage )
		    End If
		    
		  Next
		  
		  db1.Close
		  
		  // Check if there were any errors
		  If ErrorCount <> 0 Then
		    Dim err as New RuntimeException
		    err.Message = "There were errors during database table creation"
		    Raise err
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateDatabases()
		  // Create the database and tables
		  OtisDBModule.CreateDatabase
		  If Not OtisDBModule.CheckDatabase Then
		    'Database creation did not work
		    dim err as New RuntimeException
		    err.Message = "Something wrong with database creation"
		    ErrManage( "InitializeClient",err.Message + " | " + Join(err.Stack,",") )
		    raise err
		  End If
		  
		  // Create the Utility database
		  CreateDatabase(RD1.utility_db_file.FilePath,UtilityDBCreationScript)
		  If Not CheckDatabase(rd1.utility_db_file.FilePath,UtilityDBCheckScript) Then
		    'Database creation did not work
		    dim err as New RuntimeException
		    err.Message = "Something wrong with utility database creation"
		    ErrManage( "InitializeClient",err.Message + " | " + Join(err.Stack,",") )
		    raise err
		  End If
		  
		  // Create the Sync database
		  CreateDatabase(RD1.sync_db.FilePath,SyncDBCreationScript)
		  If Not CheckDatabase(rd1.sync_db.FilePath,SyncDBCheckScript) Then
		    'Database creation did not work
		    dim err as New RuntimeException
		    err.Message = "Something wrong with utility database creation"
		    ErrManage( "InitializeClient",err.Message + " | " + Join(err.Stack,",") )
		    raise err
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteDatabases()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetNewClientID() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitialSetup()
		  
		  
		  // Create the databases
		  CreateDatabases
		  
		  //
		  
		  
		  
		  
		  Exception err as RuntimeException
		    Raise err
		End Sub
	#tag EndMethod


	#tag Constant, Name = OtisDataCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant

	#tag Constant, Name = OtisDataCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SyncDBCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SyncDBCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant

	#tag Constant, Name = UtilityDBCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant

	#tag Constant, Name = UtilityDBCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant


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
