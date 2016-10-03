#tag Class
Protected Class otis_database_manager
	#tag Method, Flags = &h0
		Sub connect_to_local()
		  dim otis_db_file as FolderItem
		  
		  
		  // Get the path to our db file
		  otis_db_file = get_filepath( "otis_db_file" )
		  
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
		Function connect_to_remote() As Boolean
		  dim user_data() as Variant
		  dim dont_have_ud as Boolean
		  dim username as string
		  dim password as string
		  dim auto_login as Boolean
		  dim open_login_window as Boolean
		  dim save_username_checkbox as Boolean
		  dim save_password_checkbox as Boolean
		  dim auto_login_checkbox as Boolean
		  
		  
		  // First we need to see if we can aquire a saved user name as password
		  Try
		    user_data = get_user_data
		  Catch err as RuntimeException
		    dont_have_ud = True
		    err_manage( "remote_db", "could not get user credentials" )
		  End Try
		  
		  
		  // put user data into variables if the exist and determine if we should upen the login window
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
		    dim dialog_box as new window_login
		    dialog_box.username = username
		    dialog_box.password = password
		    dialog_box.ShowModal
		    username = dialog_box.username
		    password = dialog_box.password
		    save_username_checkbox = dialog_box.save_username
		    save_password_checkbox = dialog_box.save_password
		    auto_login_checkbox = dialog_box.auto_login
		  End If
		  
		  
		  
		  
		  
		  
		  MsgBox username + password
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub create_local_db()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_user_data() As variant()
		  dim udf as FolderItem
		  dim db as SQLiteDatabase
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
		  If local_db.version_matches Then
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
		  dim db as SQLiteDatabase
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
		  sql = "Insert into udf_ ( username_, password_, auto_login ) Values( $1, $2, $3 );"
		  ps = db.Prepare( sql )
		  ps.Bind( 0, username )
		  ps.Bind( 1, password )
		  ps.Bind( 2, auto_login )
		  ps.SQLExecute
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
		Sub Untitled()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private is_online As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		local_db As otis_sqlite_database
	#tag EndProperty

	#tag Property, Flags = &h0
		remote_db As otis_postgresql_database
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
	#tag EndViewBehavior
End Class
#tag EndClass
