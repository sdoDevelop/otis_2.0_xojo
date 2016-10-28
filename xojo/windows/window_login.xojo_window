#tag Window
Begin Window window_login
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   234
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Login"
   Visible         =   True
   Width           =   582
   Begin ImageWell imagewell_otis_logo
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   150
      HelpTag         =   ""
      Image           =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   28
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   35
      Visible         =   True
      Width           =   150
   End
   Begin TextField textfield_username
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &c00FFFFFF
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   292
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   44
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   249
   End
   Begin Label label_username
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   206
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Username"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   47
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin Label label_password
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   206
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Password"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   77
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin TextField textfield_password
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &c00FFFFFF
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   292
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   249
   End
   Begin CheckBox checkbox_save_username
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Save Username"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   292
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   109
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   113
   End
   Begin CheckBox checkbox_save_password
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Save Password"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   292
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox checkbox_auto_login
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Auto-Login"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   292
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   152
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton pushbutton_ok
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   472
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   176
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pushbutton_cancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   389
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   176
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label label_authentication_failed
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   294
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Authentication Failed"
      TextAlign       =   0
      TextColor       =   &c00E30A0A
      TextFont        =   "FreeSerif"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   22
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   129
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  textfield_username.Text = username
		  textfield_password.Text = password
		  If authentication_failed Then
		    me.label_authentication_failed.Visible = True
		  Else
		    me.label_authentication_failed.Visible = False
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  username = textfield_username.Text
		  password = textfield_password.Text
		  save_username = checkbox_save_username.Value
		  save_password = checkbox_save_password.Value
		  auto_login = checkbox_auto_login.Value
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub change_checkboxes()
		  
		  
		  If checkbox_save_username.Value Then
		    
		    checkbox_save_password.Enabled = True
		    If checkbox_save_password.Value Then
		      
		      checkbox_auto_login.Enabled = True
		      
		    Else
		      
		      checkbox_auto_login.Value = False
		      checkbox_auto_login.Enabled = False
		      
		    End If
		    
		  Else
		    
		    checkbox_save_password.Value = False
		    checkbox_save_password.Enabled = False
		    checkbox_auto_login.Value = False
		    checkbox_auto_login.Enabled = False
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub my_open()
		  textfield_username.Text = username
		  textfield_password.Text = password
		  If authentication_failed Then
		    me.label_authentication_failed.Visible = True
		  Else
		    me.label_authentication_failed.Visible = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub my_open(p_username as string, p_password as string, p_server_address as string, p_server_port as integer, p_db_name as String)
		  username = p_username
		  password = p_password
		  server_address = p_server_address
		  server_port = p_server_port
		  db_name = p_db_name
		  
		  my_open
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aborted As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		authentication_failed As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		auto_login As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		db_name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		password As string
	#tag EndProperty

	#tag Property, Flags = &h0
		save_password As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		save_username As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		server_address As String
	#tag EndProperty

	#tag Property, Flags = &h0
		server_port As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		username As string
	#tag EndProperty


#tag EndWindowCode

#tag Events checkbox_save_username
	#tag Event
		Sub Action()
		  change_checkboxes
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events checkbox_save_password
	#tag Event
		Sub Action()
		  change_checkboxes
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events checkbox_auto_login
	#tag Event
		Sub Action()
		  change_checkboxes
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pushbutton_ok
	#tag Event
		Sub Action()
		  me.Window.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pushbutton_cancel
	#tag Event
		Sub Action()
		  aborted = True
		  me.Window.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="aborted"
		Group="Behavior"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="authentication_failed"
		Group="Behavior"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="auto_login"
		Group="Behavior"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="db_name"
		Group="Behavior"
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="password"
		Group="Behavior"
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="save_password"
		Group="Behavior"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="save_username"
		Group="Behavior"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="server_address"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="server_port"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="username"
		Group="Behavior"
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
