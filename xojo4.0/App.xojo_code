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


	#tag MenuHandler
		Function EditPrefs() As Boolean Handles EditPrefs.Action
			EditPreferencesAction
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			winAbout.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Untitled() As Boolean Handles Untitled.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler


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
		  
		  
		  
		  If Not Logic.HaveClientID Then
		    Logic.GetClientID
		  End If
		  
		  If Not Logic.IsInitialized Then
		    'otis things not Initialized
		    Logic.InitializeClient
		  End If
		  
		  db = DataFile.OpenDB
		  if db = nil then
		    quit
		  end if
		  
		  'Load preferences
		  Preferences.Load
		  
		  
		  '#Pragma Error "Replace your initialization code"
		  'At this point everything should be Initialized and ready to go.
		  'Show your main window
		  'Example:
		  dim w as new Window1
		  w.show
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
		ClientID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		db As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		RegDB As Logic.otis_PostgreSQL_Database
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
			Name="ClientID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
