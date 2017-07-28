#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  Preferences.save
		  try
		    db.close
		  catch
		    'do nothing
		  end try
		  app.UpdateInitiater = Nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'The splash screen will:
		  'a. Show the user helpful information about your app
		  'b. Give the user something to look at while the app is being Initialized
		  'winSplash will call App.Initialize before closing
		  dim w as new winSplash
		  w.Display
		  
		  
		  'me.Initialize
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  'For more information on App.UnhandledException:
		  'http://docs.xojo.com/index.php/Application.UnhandledException
		  
		  break
		  
		  dim dt as new date
		  dim ars() as string
		  ars.append "Date: "+ dt.SQLDateTime
		  ars.append "Exception Type: " + typeOfException(error)
		  
		  if error isa BKS_Database.DatabaseException then
		    ars.Append error.Message
		  end
		  
		  ars.Append "Stack:"
		  ars.append Join(error.CleanStack, EndOfLine)
		  
		  
		  if error isa BKS_Debug.BKS_AssertFailedException then
		    ars.append error.Message
		  end
		  
		  dim sMessage as string = Join(ars, EndOfLine)
		  MsgBox sMessage
		  
		  return true
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckForUpdates()
		  dim rd1 as New ResourceDirectories
		  
		  dim instKaju as New Kaju.UpdateChecker( rd1.kaju_folder.FilePath )
		  instKaju.ServerPublicRSAKey = "30820120300D06092A864886F70D01010105000382010D00308201080282010100CCBC0370666662B013162A06AF3C73F1154DAE4E9D714A1C77CD8E0C91FAE040D0BE5319467CB5CDA4AA4539D35D48C98CE946539EEBFCF1F8B7E08CEE7C5A886B8933F3EB499B21F2A7A0DC4765C1CB3EA7DB0BEC68FFA294545D180C21ABF3AC9881B00ED2EC31F518C4C096A2A1CF05B17324B00AAAFC70D8887D62C9BB8019C7AB3E47352BC2945CBA634811DC77AFE347B60F611FB910C0BD68876F3BD47E00F8389A4767E69A0D5480DBA42606CD9ED3AD23EBCDC21B8CA3782D8B94FD209BCC0D9FB6D858C294F6A2F6C5234C5F7C23473A801B61F3A176B2B5795A3B33520DAE4EDDFD5F18031FA27C8839A9E4A25C104BDE6E25E8D0FFE949FA1361020111"
		  instKaju.UpdateURL = "http://104.238.132.54/kaju/otis_5.0/Otis5.0_UpdateInformation.json"
		  
		  instKaju.Execute
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckVersions()
		  #if not DebugBuild then Return
		  
		  'Usage: Use this Method to test for the correct Version of Xojo or any third plug-ins (like MBS)
		  
		  'dim sXojoVersion as string = XojoVersionString
		  'if sXojoVersion <> "20xxrx.x" then
		  ''untested sXojoVersion version
		  'break
		  'end if
		  '
		  'dim sMBSVersion as string = mbs.Version
		  'if MBS.VersionString<>"xx.x" then
		  ''untested MBS plugin version
		  'break
		  'end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditPreferencesAction()
		  dim w as new winPrefs
		  w.Display
		  w.showModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize()
		  RegisterThirdPartyPlugins 'Register third party plugins (if needed)
		  CheckVersions 'Checks Xojo and third plug-in versions (In the debugger only)
		  
		  
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
		  
		  
		  // Check Databases for structural integrity
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
		    // Simply initializes structure
		    InitializationModule.InitialSetup
		  End If
		  
		  
		  // Login
		  If Login.Go Then
		    ' We have successfully logged into the regestration server
		    
		    Login.State = "Online"
		    
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
		    Else
		      // we must now check if there is any data in the local database
		      If Not InitializationModule.CheckForLocalData Then
		        FullSyncPlease = True
		      End If
		    End If
		    
		    // Push data to server possibly
		    If Not FullSyncPlease Then
		      'we are not pulling down all new information
		      // Run Sync
		      Try
		        OSM.RunSync()
		      Catch err as RuntimeException
		        ErrManage("App.Initialize","Could not Push...:  " + err.Message )
		        break
		      End Try
		      
		    Else
		      ' run a full sync
		      Try
		        osm.RunFullSync
		      Catch err as RuntimeException
		        ErrManage("App.Initialize","Could not do full sync | " + err.Message )
		        break
		        RD1.otis_data_file.FilePath.Delete
		        MsgBox("Error while trying to sync data from the server. App must quit")
		        Quit
		      End Try
		      
		    End If
		    
		  Else
		    'Login to reg server not succesful
		    
		    If app.bUserAuthenticationFailed Then Quit
		    
		    // Check if we have a valid client id to work offline with
		    If GetNewClientIDPlease Then
		      'No valid client id
		      MsgBox("Could not connect to server, and no valid client id is present, or there is no local data. We must quit.")
		      Quit
		    Else
		      'valid client id
		      
		      // Check to see if there is any local data
		      If InitializationModule.CheckForLocalData Then
		        // There is local data
		        // Ask the user if they want to work offline
		        Dim msgboxResult as integer
		        msgboxResult = MsgBox( "Could not log into server. Would you like to work offline?",4 )
		        
		        If msgboxResult = 6 Then
		          'Yes
		          Login.State = "Offline"
		        ElseIf msgboxResult = 7 Then
		          'No
		          Quit
		        End If
		        
		      Else
		        // THere is no local data
		        MsgBox("There is no local data present, must quit")
		        Quit
		      End If
		    End If
		    
		  End If
		  
		  // Set Color Scheme
		  UiColors.DefaultScheme
		  
		  // Open the database file
		  db = DataFile.OpenDB
		  if db = nil then
		    quit
		  end if
		  
		  // Check the amount of pkids that we have available
		  
		  If CheckNumberAvailableIDs < 50 Then
		    If Methods.GetNewIDBlock Then
		      
		    End If
		  End If
		  
		  // Lets check if any eipls need numbers from being created offline
		  Methods.CreateNumbersForOfflineEIPLs
		  
		  'Load preferences
		  Preferences.Load
		  
		  
		  '#Pragma Error "Replace your initialization code"
		  'At this point everything should be Initialized and ready to go.
		  'Show your main window
		  App.MainWindow =  new winMain_1TabPanel
		  app.MainWindow.show
		  
		  CheckForUpdates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterThirdPartyPlugins()
		  ''Usage: Use this Method to register third plug-ins (like MBS)
		  '
		  ''Example: (From MBS)
		  'const name = "Joe Smith."
		  'const serialnumber = "123456789"
		  'const enddate = 201711
		  '
		  'if not RegisterMBSPlugin(name, "MBS Complete", enddate, serialnumber) then
		  'break 'do something
		  'end if
		  '
		  '
		  ''Example: (MBS Obfuscated)
		  ''Joe Smith., MBS Complete, 201711, 123456789
		  'dim x as integer = 100
		  'dim s as string = "MBS "
		  'dim n as string = decodeBase64("Sm9lIFNtaXRoLg==", encodings.UTF8)
		  'dim y as integer = 89
		  '
		  'if not registerMBSPlugin(n, s+"Complete", 2017*x+11, 1234567*x+y) then  
		  'break 'do something
		  'end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bUserAuthenticationFailed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		db As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		GMTOffset As Integer = -6
	#tag EndProperty

	#tag Property, Flags = &h0
		MainWindow As winMain_1TabPanel
	#tag EndProperty

	#tag Property, Flags = &h0
		RegDB As PostgreSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		sUserName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UpdateInitiater As Kaju.UpdateInitiater
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

	#tag Constant, Name = kPreferences, Type = String, Dynamic = False, Default = \"Preferences...", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Options..."
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Options..."
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="bUserAuthenticationFailed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GMTOffset"
			Group="Behavior"
			InitialValue="-6"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sUserName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
