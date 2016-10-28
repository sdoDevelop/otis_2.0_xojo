#tag Class
Protected Class otis_database_manager
	#tag Method, Flags = &h0
		Sub connect_to_local()
		  dim otis_db_file as FolderItem
		  
		  
		  // Get the path to our db file
		  otis_db_file = get_filepath( "otis_db_file" )
		  
		  // Check if there is a database file, if there isnt we need to delete our version file to force an update
		  if Not otis_db_file.Exists then
		    dim f as FolderItem
		    f = resource_management.get_filepath("resources_file")
		    if f <> nil then
		      if f.Exists then
		        f.Delete
		      end if
		    end if
		  end if
		  
		  
		  // Create the database
		  local_db = new otis_sqlite_database
		  local_db.DatabaseFile = otis_db_file
		  If Not local_db.CreateDatabaseFile Then
		    ' cannot open the database file for some reaseon 
		    dim err as RuntimeException
		    err = new RuntimeException
		    err.Message = "cannot connect to database for some reason"
		    Raise err
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub connect_to_remote(grab_saved_data as boolean = true)
		  dim user_data() as Variant
		  dim dont_have_ud as Boolean
		  dim username as string
		  dim password as string
		  dim auto_login as Boolean
		  dim open_login_window as Boolean
		  dim save_username_checkbox as Boolean
		  dim save_password_checkbox as Boolean
		  dim auto_login_checkbox as Boolean
		  dim abort_login_loop as Boolean
		  
		  
		  If grab_saved_data Then
		    // First we need to see if we can aquire a saved user name as password
		    Try
		      user_data = get_user_data
		    Catch err as RuntimeException
		      dont_have_ud = True
		      err_manage( "remote_db", "could not get user credentials" )
		    End Try
		  Else
		    dont_have_ud = True
		  End If
		  
		  
		  // put user data into variables if the exist and determine if we should open the login window
		  If Not dont_have_ud Then 'we have the ud
		    username = user_data(0)
		    password = user_data(1)
		    auto_login = user_data(2)
		    If Not auto_login Then
		      open_login_window = True
		    End If
		  Else 'we donot hav ethe ud
		    open_login_window = True
		  End If
		  
		  // Getting user credentials from user
		  If open_login_window Then
		    'open a login windows to grab user info
		    dim dialog_box as new window_login
		    dialog_box.username = username
		    dialog_box.password = password
		    dialog_box.ShowModal
		    
		    'check if the user aborted the login
		    If dialog_box.aborted Then
		      'user aborted the login
		      remote_connected = False
		      Return
		    Else 'user did not abort
		      'after user has closed the window we put all the info into some variables
		      username = dialog_box.username
		      password = dialog_box.password
		      save_username_checkbox = dialog_box.save_username
		      save_password_checkbox = dialog_box.save_password
		      auto_login_checkbox = dialog_box.auto_login
		    End If
		  End If
		  
		  
		  
		  'try to connect to the database
		  While Not abort_login_loop
		    
		    'set the database details
		    remote_db = new otis_PostgreSQL_Database
		    remote_db.UserName = username
		    remote_db.Password = password
		    remote_db.Host = "45.32.72.207"
		    remote_db.Port = 5432
		    remote_db.DatabaseName = "otis_data"
		    
		    If Not remote_db.Connect Then
		      dim the_message as string = remote_db.ErrorMessage
		      ' check why the server connection failed
		      If Instr( the_message, "database" ) > 0 and InStr( the_message, "does not exist" ) > 0 Then
		        ' 1 | FATAL: database "db name" does not exist
		        dim err as new RuntimeException
		        err.Message = "Database " + remote_db.DatabaseName + " does not exist"
		        err.ErrorNumber = 010001
		        abort_login_loop = True
		        remote_connected = False
		        Raise err
		        
		      ElseIf InStr( the_message, "could not connect to server: Network is unreachable" ) > 0 Then
		        ' 1 | could not connect to server: Network is unreachable
		        dim err as new RuntimeException
		        err.Message = "Could not connect to server: Network is Unreachable"
		        err.ErrorNumber = 010003
		        abort_login_loop = True
		        remote_connected = False
		        Raise err
		        
		      ElseIf InStr( the_message, "password authentication failed" ) > 0 Then
		        ' 1 | FATAL: password authentication failed for user "..."
		        dim dialog as new window_login
		        dialog.authentication_failed = True
		        dialog.username = username
		        dialog.password = password
		        dialog.ShowModal
		        
		        'check if the user aborted the login
		        If dialog.aborted Then
		          'user aborted the login
		          remote_connected = False
		          Return
		        Else 'user did not abort
		          'after user has closed the window we put all the info into some variables
		          username = dialog.username
		          password = dialog.password
		          save_username_checkbox = dialog.save_username
		          save_password_checkbox = dialog.save_password
		          auto_login_checkbox = dialog.auto_login
		        End If
		        
		      Else
		        remote_connected = False
		        dim err as RuntimeException
		        err.Message = remote_db.ErrorMessage
		        abort_login_loop = True
		        Raise err
		        
		      End If
		    Else
		      remote_connected = True
		      abort_login_loop = True
		      MsgBox( "connected" )
		    End If
		    
		    
		    
		    
		    
		  Wend
		  
		  'check if we need to save any user creds
		  redim user_data(-1)
		  If remote_connected Then
		    If save_username_checkbox Then
		      ReDim user_data(2)
		      user_data(0) = remote_db.UserName
		      
		      If save_password_checkbox Then
		        user_data(1) = remote_db.Password
		        
		        If auto_login_checkbox Then
		          user_data(2) = True
		        End If
		        
		      End If
		      
		      if save_user_data( user_data(0), user_data(1), user_data(2) ) then
		        MsgBox("saved")
		      end if
		    End If
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function data_state() As string
		  
		  
		  
		  // check if local db is initialized
		  If local_db.data_ready Then
		    
		    'we are initialized now we check if the remote is connected
		    If remote_connected Then
		      
		      'we need to sync remote and local databases
		      Return "half_sync"
		      
		    Else
		      
		      'initialized but remote not connected, we can work offline
		      Return "offline"
		      
		    End If
		    
		  Else 
		    
		    'we are not initialized now we check if the remote is connected
		    If remote_connected Then
		      
		      'we are not initialized but remote is connected
		      'we can do a full sync
		      Return "full_sync"
		      
		    Else
		      
		      'not initialized, remote not connected, we are out of luck, no offline work possible.....for now....
		      Return "no_luck"
		      
		    End If
		    
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute(querry_type as string, table as string, columns() as string, values() as string, conditions() as string)
		  dim rs as RecordSet
		  Dim exre1 as New ExecuteReturn
		  
		  
		  
		  exre1 = local_db.execute(querry_type,table,columns(),values(),conditions())
		  
		  If exre1 <> Nil Then
		    rs = exre1.TheRecordSet
		  End If
		  
		  
		  
		  Exception err as RuntimeException
		    raise err
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function execute(querry_type as string, table as string, columns() as string, values() as string, conditions() as string) As ExecuteReturn
		  dim rs as RecordSet
		  Dim exre1 as New ExecuteReturn
		  
		  
		  
		  exre1 = local_db.execute(querry_type,table,columns(),values(),conditions())
		  
		  If exre1 <> Nil Then
		    rs = exre1.TheRecordSet
		  End If
		  
		  Return exre1
		  
		  Exception err as RuntimeException
		    raise err
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function full_sync() As integer
		  dim rs as RecordSet
		  dim sql_string as string
		  dim sql_array() as string
		  dim sql as string
		  dim errors as integer
		  
		  
		  rs = remote_db.SQLSelect( "Select * From create_insert_statements();" )
		  If remote_db.Error Then
		    break
		    err_manage("remote_db", remote_db.ErrorMessage)
		  End If
		  sql_string = rs.Field("create_insert_statements")
		  sql_array = Split( sql_string, "|" )
		  
		  // Loop through all of the sql grabbed from the server
		  For i1 as integer = 0 To sql_array.Ubound
		    
		    'execute sql
		    sql = sql_array(i1)
		    local_db.SQLExecute( sql )
		    
		    'check for errors
		    If local_db.Error Then
		      break
		      err_manage( "local_db", "full_sync: " + local_db.ErrorMessage )
		      errors = errors + 1
		    End If
		    
		  Next
		  
		  If errors = 0 Then
		    local_db.data_ready = True
		  End If
		  
		  Return errors
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_user_data() As variant()
		  dim udf as FolderItem
		  dim db as new SQLiteDatabase
		  dim ps as SQLitePreparedStatement
		  dim rs as RecordSet
		  
		  
		  
		  // find the filepath to our user data database
		  udf = get_filepath( "udf" )
		  ' if the database already exists 
		  If Not udf.Exists Then
		    Return Array( "", "", False )
		  End If
		  
		  'Now we connect to the database file
		  db.DatabaseFile = udf
		  If Not db.Connect Then
		    ' cannot open the database file for some reaseon 
		    dim err as RuntimeException
		    err = new RuntimeException
		    err.Message = "cannot connect to user info database for some reason"
		    Raise err
		  End If
		  
		  ' now we grab the user data fromt he database
		  dim sql as string
		  sql = "Select * from udf_;"
		  ps = db.Prepare(sql)
		  rs = ps.SQLSelect
		  If db.Error Then
		    dim err as new RuntimeException
		    err.Message = "cannot get user data for some reaseon" + db.ErrorMessage
		    Raise err
		  End If
		  
		  If rs.RecordCount = 0 Then
		    dim err as new RuntimeException
		    err.Message = "cannot get user data for some reaseon" + db.ErrorMessage
		    Raise err
		  Else
		    dim username as string
		    dim password as string
		    dim auto_login as Boolean
		    username = rs.Field( "username_" )
		    password = rs.Field( "password_" )
		    auto_login = rs.Field( "auto_login" )
		    Return Array( username, password, auto_login )
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initialize_local()
		  dim otis_db_file as FolderItem
		  
		  
		  ' Get the path to our db file
		  otis_db_file = get_filepath( "otis_db_file" )
		  
		  ' Create the database
		  local_db = new otis_sqlite_database
		  local_db.DatabaseFile = otis_db_file
		  
		  // Check if the db is up to date
		  If local_db.version_matches And otis_db_file.Exists Then
		    'call it initialized
		    local_db.initialized = True
		  Else
		    'db is not up to date
		    'delete the db file
		    dim f as FolderItem = get_filepath( "otis_db_file" )
		    If f.Exists Then
		      f.Delete
		      if f.LastErrorCode <> 0 Then
		        'could not delete file
		        err_manage( "local_db", "Could not delete sqlite database file" )
		      end if
		    End If
		  End If
		  
		  
		  ' Create / Connect to local database
		  If Not local_db.CreateDatabaseFile Then
		    ' cannot open the database file for some reaseon 
		    dim err as RuntimeException
		    err = new RuntimeException
		    err.Message = "cannot connect to database for some reason"
		    Raise err
		  End If
		  
		  
		  If not local_db.initialized Then
		    
		    'db is not initialized
		    local_db.construct_db
		    
		    'Set db_version to current
		    dim tos as TextOutputStream
		    dim fos as FolderItem
		    fos = get_filepath( "resources_file" )
		    if fos.Exists Then
		      fos.Delete
		    end if
		    if fos <> Nil Then
		      tos = TextOutputStream.Create(fos)
		      tos.Write( "db_version=" + str(app.MajorVersion) + "." + str(app.MinorVersion) + "." + str(app.BugVersion) )
		      tos.Close
		    end if
		    
		    local_db.initialized = True
		    
		  Else
		    'db is initialized
		    
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  Exception err as RuntimeException
		    err_manage( "local_db", err.message )
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function save_user_data(username as string, password as string, auto_login as boolean) As boolean
		  dim udf as FolderItem
		  dim db as new SQLiteDatabase
		  dim ps as SQLitePreparedStatement
		  
		  
		  
		  // find the filepath to our user data database
		  udf = get_filepath( "udf" )
		  ' if the database already exists 
		  If udf.Exists Then
		    udf.Delete
		  End If
		  
		  'Now we create a database file
		  db.DatabaseFile = udf
		  If Not db.CreateDatabaseFile Then
		    ' cannot open the database file for some reaseon 
		    dim err as RuntimeException
		    err = new RuntimeException
		    err.Message = "cannot connect to user info database for some reason"
		    Raise err
		  End If
		  
		  'Now we create the table and columns
		  dim sql as string
		  sql = "Create Table udf_ (username_ text, password_ text, auto_login Boolean );"
		  db.SQLExecute(sql)
		  If db.Error Then
		    dim err as RuntimeException
		    err = new RuntimeException
		    err.Message = "could not create user data table" + db.ErrorMessage
		    Raise err
		  End If
		  
		  'Finally we add the data to the table
		  sql = "Insert into udf_ ( username_, password_, auto_login ) Values( '" + username + "', '" + password + "', '" + str(auto_login) + "' );"
		  'ps = db.Prepare( sql )
		  'ps.Bind( 0, username )
		  'ps.Bind( 1, password )
		  'ps.Bind( 2, auto_login )
		  'ps.SQLExecute
		  db.SQLExecute(sql)
		  If db.Error Then
		    dim err as new RuntimeException
		    err.Message = "could not instert user data" + db.ErrorMessage
		    Raise err
		  End If
		  
		  Return True
		  
		  
		  
		  Exception err as runtimeException
		    Return False
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SyncToServer(sql as string)
		  
		  
		  If Not work_offline Then
		    remote_db.SQLExecute(sql)
		    If remote_db.Error Then
		      MsgBox("Could Not Sync to server: " + remote_db.ErrorMessage)
		    End If
		    
		  Else
		    
		    'we are offline log the querry to the querry database
		    
		    
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		local_db As otis_sqlite_database
	#tag EndProperty

	#tag Property, Flags = &h21
		Private remote_connected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		remote_db As otis_postgresql_database
	#tag EndProperty

	#tag Property, Flags = &h0
		work_offline As boolean
	#tag EndProperty


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
		#tag ViewProperty
			Name="work_offline"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
