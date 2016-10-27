#tag Window
Begin Window window_main
   BackColor       =   &c49363600
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   True
   Height          =   570
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   662573055
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   938
   Begin OtisLabel label_event_name
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
      Left            =   286
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      state           =   "Normal"
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   18.0
      TextUnit        =   0
      Top             =   60
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   368
   End
   Begin OtisTextField textfield_event_name
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   323
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   70
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   288
   End
   Begin EventDateTimes EventDateTimes1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      Height          =   133
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   217
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   116
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   335
   End
   Begin ListboxContainer ListboxContainer_EventList
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      HeaderBackgroundColor=   &c00000000
      HeaderBaseColor =   &c00000000
      HeaderHeight    =   0
      HeaderTextColor =   &c00000000
      Height          =   528
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   42
      Transparent     =   False
      Untitled        =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   205
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select Case key
		    
		  Case chr(9) 
		    If Not EventDateTimes1.AdvanceEdit Then
		      
		    End If
		    Return True
		  End Select
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  me.BackColor = get_color("Gray",0)
		  scripts = new scripts_class
		  
		  scripts.load_event_listbox
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  me.ResizeControls
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EventNewEvent() As Boolean Handles EventNewEvent.Action
			
			scripts.new_event
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub ResizeControls()
		  Dim DefaultWidth as double
		  dim MaxWidth as integer
		  dim WidthIsFixed as Boolean
		  Dim Events_ListboxRight as integer
		  Dim RunningLeft as integer
		  
		  
		  // Start with the events listbox
		  DefaultWidth = 0.22
		  MaxWidth = -1
		  WidthIsFixed = False
		  Events_ListboxRight = ResizeSpecificWidth(ListboxContainer_EventList,RunningLeft,DefaultWidth,MaxWidth,WidthIsFixed,me.Width)
		  
		  
		  // Now all the controls that line up along the listbox
		  
		  ' add a gap between listbox and next controls
		  RunningLeft = Events_ListboxRight + 8
		  
		  // EventDateTimes1
		  DefaultWidth = 0.40
		  MaxWidth = -1
		  WidthIsFixed = False
		  Events_ListboxRight = ResizeSpecificWidth(EventDateTimes1,RunningLeft,DefaultWidth,MaxWidth,WidthIsFixed,me.Width)
		  
		  
		  ListboxContainer_EventList.Refresh
		  EventDateTimes1.Refresh
		  EventDateTimes1.RefreshControls
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeSpecificWidth(TheControl as Variant, RunningLeft as integer, DefaultWidth as double, MaxWidth as integer, WidthIsFixed as Boolean,TotalWidth as integer)
		  
		  
		  Dim x1 as integer
		  
		  x1 = ResizeSpecificWidth(TheControl,RunningLeft,DefaultWidth,MaxWidth,WidthIsFixed,TotalWidth)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResizeSpecificWidth(TheControl as Variant, RunningLeft as integer, DefaultWidth as double, MaxWidth as integer, WidthIsFixed as Boolean,TotalWidth as integer) As integer
		  
		  
		  
		  Dim x1 as integer
		  Dim theValue as integer
		  Dim theReturn as integer
		  
		  If WidthIsFixed Then
		    theValue = DefaultWidth
		  Else
		    
		    x1 = DefaultWidth * TotalWidth
		    
		    If MaxWidth = -1 Then
		      theValue = x1
		    Else
		      If x1 > MaxWidth Then
		        theValue = MaxWidth
		      Else
		        theValue = x1
		      End If
		    End If
		  End If
		  
		  
		  
		  If TheControl IsA ListboxContainer Then
		    
		    ListboxContainer(TheControl).Left = RunningLeft
		    ListboxContainer(TheControl).Width = theValue
		    
		  ElseIf TheControl IsA EventDateTimes Then
		    
		    EventDateTimes(TheControl).Left = RunningLeft
		    EventDateTimes(TheControl).Width = theValue
		    
		  End If
		  
		  theReturn = RunningLeft + theValue
		  
		  Return theReturn
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pkid_events_ As String
	#tag EndProperty

	#tag Property, Flags = &h0
		scripts As scripts_class
	#tag EndProperty

	#tag Property, Flags = &h0
		Untitled2 As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events label_event_name
	#tag Event
		Sub MouseEnter()
		  me.TextColor = get_color( "Blue", 4 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.TextColor = get_color( "Text", 0 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  scripts.EventName_ShowTextfield
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events textfield_event_name
	#tag Event
		Sub LostFocus()
		  dim db as otis_database_manager
		  db = app.otis_db
		  dim error as Boolean
		  dim rs as RecordSet
		  Dim exre1 as New ExecuteReturn
		  
		  
		  
		  // save value to database
		  
		  
		  
		  // get rid of me
		  me.Enabled = False
		  me.Visible = False
		  
		  // check if the entered value is different than the label and if it is any text
		  If me.Text <> label_event_name.Text And me.Text <> "" Then
		    
		    Try
		      exre1 = db.execute( "Update", "events_", Array("name_"),Array("'" +me.Text + "'"),array("pkid = '" + pkid_events_ + "'"))
		    Catch err as RuntimeException
		      MsgBox("Error occured while updating event name")
		      error = True
		    End Try
		    
		    If exre1 <> Nil Then
		      rs = exre1.TheRecordSet
		    End If
		    
		    If Not error Then
		      'set label to the name
		      label_event_name.Text = me.Text
		      scripts.load_event_listbox
		      ListboxContainer_EventList.TheListbox.Index = scripts.GetEvent_Index_ByPkid(pkid_events_)
		    End If
		    
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub KeyUp(Key As String)
		  if key = Chr(13) then
		    dim db as otis_database_manager
		    db = app.otis_db
		    dim error as Boolean
		    dim rs as RecordSet
		    Dim exre1 as New ExecuteReturn
		    
		    
		    
		    // save value to database
		    
		    
		    
		    // get rid of me
		    me.Enabled = False
		    me.Visible = False
		    
		    // check if the entered value is different than the label and if it is any text
		    If me.Text <> label_event_name.Text And me.Text <> "" Then
		      
		      Try
		        exre1 = db.execute( "Update", "events_", Array("name_"),Array("'" +me.Text + "'"),array("pkid = '" + pkid_events_ + "'"))
		      Catch err as RuntimeException
		        MsgBox("Error occured while updating event name")
		        error = True
		      End Try
		      
		      If exre1 <> Nil Then
		        rs = exre1.TheRecordSet
		      End If
		      
		      If Not error Then
		        'set label to the name
		        label_event_name.Text = me.Text
		        scripts.load_event_listbox
		        ListboxContainer_EventList.TheListbox.Index = scripts.GetEvent_Index_ByPkid(pkid_events_)
		      End If
		      
		    End If
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EventDateTimes1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  g.ForeColor = get_color("Gray",3)
		  g.FillRoundRect(0,0,me.Width,me.Height,6,6)
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Resizing()
		  
		  
		  me.RefreshControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="pkid_events_"
		Group="Behavior"
		Type="String"
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
		Name="Untitled2"
		Group="Behavior"
		Type="Integer"
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
