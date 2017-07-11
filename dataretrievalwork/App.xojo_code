#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim w as new winSplash
		  w.Display
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Initialize()
		  'RegisterThirdPartyPlugins 'Register third party plugins (if needed)
		  'CheckVersions 'Checks Xojo and third plug-in versions (In the debugger only)
		  
		  //Set timezone
		  dim d1 as new date 
		  app.GMTOffset = d1.GMTOffset
		  
		  Dim RD1 as New ResourceDirectories
		  
		  
		  // Check Initialized File
		  Dim Initialized as Boolean
		  Dim ReInitializePlease as Boolean
		  Dim GetNewClientIDPlease as Boolean
		  Initialized = InitializationModule.CheckInitializedFile
		  
		  If Initialized = True Then
		  Else
		    ReInitializePlease = True
		  End If
		  
		  
		  // Check Databases
		  If Not InitializationModule.CheckDatabases Then
		    ReInitializePlease = True
		  End If
		  
		  
		  // Check if we have a client id
		  If Not UserInfo.CheckForClientID Then
		    GetNewClientIDPlease = True
		  End If
		  
		  
		  
		  // Check if we need to ReInitialize
		  If ReInitializePlease Then
		    GetNewClientIDPlease = True
		    InitializationModule.InitialSetup
		  End If
		  
		  
		  // Login
		  If Login.Go Then
		    ' We have successfully logged into the regestration server
		    
		    // Now we check if we need to acquire a client id
		    If GetNewClientIDPlease Then
		      
		      // Get the client ID
		      If UserInfo.GetNewClientIDFromServer <> 0 Then
		        'acquired id successfuly
		      Else
		        'could not get an id
		        Dim err as RuntimeException
		        err.Message = "Could not acquire a client id from server"
		        ErrManage("App.Initialize",err.Message)
		        Raise err
		      End If
		      
		      
		    Else
		      'New client id not needed
		    End If
		    
		    // Now lets check if we need to pull all of the data from the server down
		    'need to do full sync conditions
		    'If we have reinitialized
		    Dim FullSyncPlease as Boolean
		    If ReInitializePlease Then
		      FullSyncPlease = True
		    End If
		    
		    // Push data to server possibly
		    If Not FullSyncPlease Then
		      'we are not pulling down all new information
		      // Run Sync
		      Try
		        OSM.RunSync()
		      Catch err as RuntimeException
		        ErrManage("App.Initialize","Could not Push...  " + err.Message )
		        break
		      End Try
		      
		    Else
		      ' run a full sync
		      // Next Step Here!!!!
		      Try
		        osm.RunFullSync
		      Catch err as RuntimeException
		        ErrManage("App.Initialize","Could not do full sync | " + err.Message )
		        break
		        RD1.otis_data_file.FilePath.Delete
		      End Try
		      
		    End If
		    
		  Else
		    'Login to reg server not succesful
		    
		    // Check if we have a valid client id to work offline with
		    If GetNewClientIDPlease Then
		      'No valid client id
		    Else
		      'valid client id
		      
		      // Ask the user if they want to work offline
		      Dim msgboxResult as integer
		      msgboxResult = MsgBox( "Could not log into server. Would you like to work offline?",4 )
		      
		      If msgboxResult = 6 Then
		        'Yes
		        
		      ElseIf msgboxResult = 7 Then
		        'No
		        Quit
		      End If
		    End If
		    
		  End If
		  
		  // Set Color Scheme
		  'UiColors.DefaultScheme
		  
		  ///////////////////////////
		  db = DataFile.OpenDB
		  if db = nil then
		    quit
		  end if
		  
		  'Load preferences
		  'Preferences.Load
		  
		  
		  '#Pragma Error "Replace your initialization code"
		  'At this point everything should be Initialized and ready to go.
		  'Show your main window
		  'Example:
		  App.MainWindow =  new winMain_1TabPanel
		  app.MainWindow.show
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		db As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		GMTOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MainWindow As Window
	#tag EndProperty

	#tag Property, Flags = &h0
		RegDB As PostgreSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		sUserName As String
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
