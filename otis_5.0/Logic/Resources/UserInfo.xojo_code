#tag Module
Protected Module UserInfo
	#tag Method, Flags = &h1
		Protected Function CheckForClientID() As Boolean
		  Dim rd1 as New ResourceDirectories
		  
		  
		  Dim f As FolderItem = rd1.client_id_file.FilePath
		  If f <> Nil Then
		    If f.Exists Then
		      // Be aware that TextInputStream.Open coud raise an exception
		      Dim t As TextInputStream
		      Try
		        t = TextInputStream.Open(f)
		        UserInfo.ClientID = val( t.ReadAll )
		        t.Close
		      Catch e As IOException
		        Return False
		      End Try
		      
		    End If
		    
		  Else
		    Return False
		    
		  End If
		  
		  If UserInfo.ClientID <> 0 Then
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetLoginInfo() As Variant()
		  dim udf as FolderItem
		  dim db as new SQLiteDatabase
		  dim ps as SQLitePreparedStatement
		  dim rs as RecordSet
		  Dim rd1 as New ResourceDirectories
		  
		  
		  
		  // find the filepath to our user data database
		  udf = rd1.user_db_file.FilePath
		  ' if the database already exists 
		  If Not udf.Exists Then
		    Dim v as Variant = "None"
		    Return Array(v)
		  End If
		  
		  'Now we connect to the database file
		  db.DatabaseFile = udf
		  If Not db.Connect Then
		    ' cannot open the database file for some reaseon 
		    'dim err as RuntimeException
		    'err = new RuntimeException
		    'err.Message = "cannot connect to user info database for some reason"
		    'Raise err
		    Return Nil
		  End If
		  
		  ' now we grab the user data fromt he database
		  dim sql as string
		  sql = "Select * from login_info"
		  ps = db.Prepare(sql)
		  rs = ps.SQLSelect
		  If db.Error Then
		    'dim err as new RuntimeException
		    'err.Message = "cannot get login data for some reaseon" + db.ErrorMessage
		    'Raise err
		    dim v as Variant = "None"
		    Return Array(v)
		  End If
		  
		  If rs.RecordCount = 0 Then
		    dim err as new RuntimeException
		    err.Message = "cannot get user data for some reaseon" + db.ErrorMessage
		    Dim v as Variant = "NONE"
		    Return Array(v)
		  Else
		    dim username as string
		    dim password as string
		    dim auto_login as Boolean
		    dim pkid as Int64
		    username = rs.Field( "username" ).StringValue
		    password = rs.Field( "password" ).StringValue
		    auto_login = rs.Field( "auto_login" ).BooleanValue
		    pkid = rs.Field( "pkid" ).Int64Value
		    Return Array( username, password, auto_login, pkid )
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetNewClientIDFromServer() As integer
		  Dim rs1 as RecordSet
		  Dim db1 as New PostgreSQLDatabase
		  db1 = app.RegDB
		  
		  
		  
		  // Get a client ID
		  
		  rs1 = db1.SQLSelect("Select * From client_reg.fnc_get_new_client_id();")
		  If db1.Error Then
		    dim err as RuntimeException
		    err.Message = db1.ErrorMessage
		  End If
		  
		  
		  If rs1 <> Nil Then
		    UserInfo.ClientID = rs1.Field("fnc_get_new_client_id").Value
		    SaveClientID
		  End If
		  
		  Return UserInfo.ClientID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveClientID()
		  Dim rd1 As New ResourceDirectories
		  
		  
		  
		  Dim f As FolderItem = rd1.client_id_file.FilePath
		  If f <> Nil Then
		    Try
		      //TextOutputStream.Create raises an IOException if it can't open the file for some reason.
		      Dim t As TextOutputStream = TextOutputStream.Create(f)
		      t.Write(UserInfo.ClientID.ToText)
		      t = Nil
		    Catch e As IOException
		      //handle
		    End Try
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveLoginInfo(oUsername as String, oPassword as String, oAutoLogin as Boolean, oPKID as Integer)
		  dim udf as FolderItem
		  dim db as new SQLiteDatabase
		  dim ps as SQLitePreparedStatement
		  dim rd1 as New ResourceDirectories
		  dim sql as string
		  
		  
		  // Set filepath and connect to database
		  udf = rd1.user_db_file.FilePath
		  db.DatabaseFile = udf
		  If Not db.Connect Then
		    break
		    ErrManage("UserInfo.SaveLoginInfo","Could not connect to user data database. | " + db.ErrorMessage )
		  End If
		  
		  'Finally we add the data to the table
		  If oPKID = 0 Then
		    sql = "Insert into login_info ( username, password, auto_login ) Values( ?,?,?  );"
		    ps = db.Prepare( sql )
		    ps.BindType(0,SQLitePreparedStatement.SQLITE_TEXT)
		    ps.BindType(1,SQLitePreparedStatement.SQLITE_TEXT)
		    ps.BindType(2,SQLitePreparedStatement.SQLITE_BOOLEAN)
		    ps.Bind( 0, ousername )
		    ps.Bind( 1, opassword )
		    ps.Bind( 2, oautologin )
		  Else
		    sql = "Update login_info Set username = ?, password = ?, auto_login = ? Where pkid = ? ;" 
		    ps = db.Prepare( sql )
		    ps.BindType(0,SQLitePreparedStatement.SQLITE_TEXT)
		    ps.BindType(1,SQLitePreparedStatement.SQLITE_TEXT)
		    ps.BindType(2,SQLitePreparedStatement.SQLITE_BOOLEAN)
		    ps.BindType(3,SQLitePreparedStatement.SQLITE_INT64)
		    ps.Bind( 0, ousername )
		    ps.Bind( 1, opassword )
		    ps.Bind( 2, oautologin )
		    ps.Bind( 3, oPKID )
		  End If
		  If db.Error Then
		    dim err as new RuntimeException
		    err.Message = "could not insert user data" + db.ErrorMessage
		    Raise err
		  End If
		  
		  ps.SQLExecute
		  'db.SQLExecute(sql)
		  If db.Error Then
		    dim err as new RuntimeException
		    err.Message = "could not instert user data" + db.ErrorMessage
		    Raise err
		  End If
		  
		  
		  ////////////////////
		  ////////////////////////
		  ////////////////////
		  //Problem preparing statment
		  //IMPORTANT SPOT
		  
		  
		  
		  
		  
		  
		  
		  Exception err as runtimeException
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ClientID As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Username As String
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
End Module
#tag EndModule
