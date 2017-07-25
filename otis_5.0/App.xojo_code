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
		    Select Case InitializationModule.CheckSyncStateOfData
		    Case -1
		      FullSyncPlease = True
		    Case 0
		      
		    Case 1
		      
		    End Select
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
		    Break
		    If app.bUserAuthenticationFailed Then Quit
		    
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
		        Login.State = "Offline"
		      ElseIf msgboxResult = 7 Then
		        'No
		        Quit
		      End If
		    End If
		    
		  End If
		  
		  // Set Color Scheme
		  UiColors.DefaultScheme
		  
		  ///////////////////////////
		  db = DataFile.OpenDB
		  if db = nil then
		    quit
		  end if
		  
		  // Lets check if any eipls need numbers from being created offline
		  Methods.CreateNumbersForOfflineEIPLs
		  
		  'Load preferences
		  Preferences.Load
		  
		  
		  '#Pragma Error "Replace your initialization code"
		  'At this point everything should be Initialized and ready to go.
		  'Show your main window
		  'Example:
		  App.MainWindow =  new winMain_1TabPanel
		  app.MainWindow.show
		  
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
