#tag Module
Protected Module UserInfo
	#tag Method, Flags = &h1
		Protected Function GetLoginInfo() As variant()
		  dim udf as FolderItem
		  dim db as new SQLiteDatabase
		  dim ps as SQLitePreparedStatement
		  dim rs as RecordSet
		  Dim rd1 as New Logic.ResourceDirectories
		  
		  
		  
		  // find the filepath to our user data database
		  udf = rd1.user_data_file.FilePath
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

	#tag Method, Flags = &h1
		Protected Function GetUserInfo() As JSONItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SaveLoginInfo(username as string, password as string, auto_login as boolean) As boolean
		  dim udf as FolderItem
		  dim db as new SQLiteDatabase
		  dim ps as SQLitePreparedStatement
		  dim rd1 as New Logic.ResourceDirectories
		  
		  
		  
		  // find the filepath to our user data database
		  udf = rd1.user_data_file.FilePath
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

	#tag Method, Flags = &h1
		Protected Sub SaveUserInfo(oJSON as JSONItem)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected CurrentUser As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UserInfo As JSONItem
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
			Name="UserName"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
