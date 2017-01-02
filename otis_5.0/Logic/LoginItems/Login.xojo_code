#tag Module
Protected Module Login
	#tag Method, Flags = &h1
		Protected Function Go() As Boolean
		  Dim LoginInfo() as Variant
		  Dim oUsername as String
		  Dim oPassword as String
		  Dim oSaveUsername as Boolean
		  Dim oSavePassword as Boolean
		  Dim oPKID as Int64
		  Dim oAutoLogin as Boolean
		  Dim OpenLoginWindow as Boolean
		  
		  // Check if any user data is stored in file
		  LoginInfo = UserInfo.GetLoginInfo
		  If LoginInfo.Ubound <> 3 Then
		    'no login info obtained
		    OpenLoginWindow = True
		  Else
		    'login info obtained
		    oUsername = LoginInfo(0)
		    oPassword = LoginInfo(1)
		    oAutoLogin = LoginInfo(2)
		    oPKID = LoginInfo(3)
		    If oAutoLogin = False Then
		      OpenLoginWindow = True
		    End If
		  End If
		  
		  // Check if there is a username and password
		  If oUsername = "" Or oPassword = "" Then
		    'Username or password not specified
		    OpenLoginWindow = True
		  End If
		  
		  
		  Dim oAbort as Boolean
		  Dim lw1 as New window_login
		  While Not oAbort
		    
		    If OpenLoginWindow Then
		      lw1.username = oUsername
		      lw1.password = oPassword
		      lw1.SetFields
		      lw1.ShowModal
		      
		      If lw1.aborted Then
		        'user aborted login process
		        Return False
		      Else
		        'user did not abort login process
		        oUsername = lw1.username
		        oPassword = lw1.password
		        oSaveUsername = lw1.save_username
		        oSavePassword = lw1.save_password
		        oAutoLogin = lw1.auto_login
		      End If
		      
		    End If
		    
		    If oUsername = "" Or oPassword = "" Then
		      ' no username or password specified
		      OpenLoginWindow = True
		      lw1.authentication_failed = True
		      Continue
		    Else
		      'username and password have been specified
		      
		      // Try to login
		      Dim rd1 as New ResourceDirectories
		      Dim db1 as PostgreSQLDatabase 
		      db1 = New PostgreSQLDatabase
		      db1.UserName = oUsername
		      db1.Password = oPassword
		      db1.Host = RegDBHost
		      db1.Port = RegDBPort
		      db1.DatabaseName = RegDBDatabaseName
		      app.RegDB = db1
		      
		      If Not db1.Connect Then
		        Dim oErrorMessage as String = db1.ErrorMessage
		        
		        If Instr( oErrorMessage, "database" ) > 0 and InStr( oErrorMessage, "does not exist" ) > 0 Then
		          ' 1 | FATAL: database "db name" does not exist
		          dim err as new RuntimeException
		          err.Message = "Database " + App.RegDb.DatabaseName + " does not exist"
		          err.ErrorNumber = 010001
		          ErrManage("Login.Go",err.Message)
		          Return False
		          
		        ElseIf InStr( oErrorMessage, "could not connect to server: Network is unreachable" ) > 0 Then
		          ' 1 | could not connect to server: Network is unreachable
		          dim err as new RuntimeException
		          err.Message = "Could not connect to server: Network is Unreachable"
		          err.ErrorNumber = 010003
		          ErrManage("Login.Go",err.Message)
		          Return False
		          
		        ElseIf InStr( oErrorMessage, "password authentication failed" ) > 0 Then
		          ' 1 | FATAL: password authentication failed for user "..."
		          lw1.authentication_failed = True
		          OpenLoginWindow = True
		          Continue
		          
		        Else
		          'Not sure what happened
		          Dim err as New RuntimeException
		          err.Message = "Something strange happened don't have an error catch for this connection error"
		          ErrManage("Login.Go",Err.Message)
		          Return False
		        End If
		        
		        
		      Else
		        // We have connected
		        oAbort = True
		        Exit
		      End If
		      
		    End If
		    
		    
		    
		  Wend
		  
		  // Close the login window
		  lw1.close
		  
		  // Check if we need to save any information
		  Dim ProcedeWithSaving as Boolean
		  Dim saveUsername as String
		  Dim savePassword as String
		  Dim saveAutoLogin as Boolean
		  Dim savePKID as Int64 = oPKID
		  
		  'should we save username
		  If oSaveUsername Then
		    ProcedeWithSaving = True
		    saveUsername = oUsername
		  Else
		    saveUsername = ""
		  End If
		  
		  'should we save password
		  If oSaveUsername And oSavePassword then
		    ProcedeWithSaving = True
		    savePassword = oPassword
		  Else
		    savePassword = ""
		  End If
		  
		  saveAutoLogin = oAutoLogin
		  
		  If oSaveUsername Then
		    UserInfo.SaveLoginInfo(saveUsername,savePassword,saveAutoLogin,savePKID)
		  End If
		  
		  
		  Return True
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		#tag Note
			Online
			or
			Offline
			or
			ReadOnly
		#tag EndNote
		Protected State As String
	#tag EndProperty


	#tag Constant, Name = RegDBDatabaseName, Type = String, Dynamic = False, Default = \"otis_data", Scope = Private
	#tag EndConstant

	#tag Constant, Name = RegDBHost, Type = String, Dynamic = False, Default = \"45.63.78.70", Scope = Private
	#tag EndConstant

	#tag Constant, Name = RegDBPort, Type = Double, Dynamic = False, Default = \"5432", Scope = Private
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
