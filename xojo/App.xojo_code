#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  app.UseGDIPlus = True
		  scripts = new scripts_class
		  scripts.start_script
		  window_main.Show
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function Editpreferences() As Boolean Handles Editpreferences.Action
			
			dim w as new window_preferences
			w.Show
			
			
			
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h0
		MSNameL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MSRubberViewsL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		otis_db As otis_database_manager
	#tag EndProperty

	#tag Property, Flags = &h0
		scripts As scripts_class
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
