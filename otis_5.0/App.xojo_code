#tag Class
Protected Class App
Inherits Application
	#tag Method, Flags = &h21
		Private Sub Initialize()
		  Dim RD1 as New Logic.ResourceDirectories
		  
		  
		  // Check Initialized File
		  Dim Initialized as string
		  Dim ReInitializePlease as Boolean
		  Dim GetNewClientID as Boolean
		  Initialized = InitializationModule.CheckInitializedFile
		  If Initialized = True Then
		    
		  Else
		    ReInitializePlease = True
		  End If
		  
		  // Check Databases
		  If Not CheckDatabases Then
		    ReInitializePlease = True
		  End If
		  
		  // Check if we have a client id
		  If Not InitializationModule.CheckForClientID Then
		    GetNewClientID = True
		  End If
		  
		  
		  
		  // Check if we need to ReInitialize
		  If ReInitializePlease Then
		    InitializationModule.InitialSetup
		    
		    
		    
		    
		    
		    // Login
		    
		    
		    
		    
		End Sub
	#tag EndMethod


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


End Class
#tag EndClass
