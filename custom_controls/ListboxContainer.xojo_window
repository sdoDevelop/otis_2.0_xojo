#tag Window
Begin ContainerControl ListboxContainer
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &c00000000
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   True
   Height          =   528
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   False
   UseFocusRing    =   False
   Visible         =   True
   Width           =   300
   Begin OtisListBox TheListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   493
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   35
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas Header
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   34
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  
		  If X > 0 And X < me.Width Then
		    If Y >HeaderHeight And Y <= HeaderHeight + HeaderBaseHeight Then
		      
		      HeaderBaseColor = get_color("Blue",2)
		      IsResizing = True
		      Return True
		      
		    End If
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  
		  
		  // Change Header Height
		  HeaderHeight = Y
		  
		  // Reset header and listbox positions
		  Header.Height = HeaderHeight + HeaderBaseHeight
		  TheListbox.Top = HeaderHeight + HeaderBaseHeight
		  TheListbox.Height = me.Height - Header.Height
		  
		  TheListbox.Refresh
		  Header.Refresh
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  
		  
		  If X > 0 And X < me.Width Then
		    If Y >HeaderHeight And Y <= HeaderHeight + HeaderBaseHeight Then
		      
		      //Headerbase
		      HeaderBaseColor = get_color("Blue",4)
		      header.Refresh
		      
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  
		  
		  If IsResizing Then
		    HeaderBaseColor = get_color("Gray",1)
		    IsResizing = False
		  End If
		  header.Refresh
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  SetHeaderUp
		  SetListboxUp
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim g1 as Graphics = g
		  
		  
		  
		  me.BackColor = get_color("Gray",0)
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  
		  SetHeaderUp
		  SetListboxUp
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub SetHeaderUp()
		  // Set Header Up
		  HeaderHeight = TheListbox.RowHeight + 6
		  HeaderBaseHeight = 4
		  Header.Top = 0
		  Header.Left = 0
		  Header.Width = me.Width
		  Header.Height = HeaderHeight + HeaderBaseHeight
		  HeaderText = "Name"
		  HeaderTextColor = get_color("Text",0)
		  
		  Header.Refresh
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetListboxUp()
		  
		  // Set Listbox Up
		  TheListbox.Top = HeaderHeight + HeaderBaseHeight
		  TheListbox.Left = 0
		  TheListbox.Width = me.Width
		  TheListbox.Height = me.Height
		  
		  
		  
		  
		  TheListbox.Refresh
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		HeaderBackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		HeaderBaseColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HeaderBaseHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		HeaderHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		HeaderText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		HeaderTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsResizing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Untitled As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events TheListbox
	#tag Event
		Sub Change()
		  
		  If window_main.scripts.load_event Then
		    
		  End If
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  Dim g1 as Graphics = g
		  
		  
		  
		  
		  
		  // Set Text Color
		  g1.ForeColor = get_color("Text",0)
		  
		  
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  
		  If row = me.ListIndex Then
		    
		    // Selected Row
		    g.ForeColor = get_color("Blue",4)
		    g.FillRect(0,0,g.Width,g.Height)
		    
		  ElseIf row Mod 2 = 0 Then
		    
		    // Event Row
		    g.ForeColor = get_color("Gray",5)
		    g.FillRect(0, 0, g.Width, g.Height)
		    
		  Else
		    
		    // Odd Row
		    g.ForeColor = get_color("Gray",4)
		    g.FillRect(0, 0, g.Width, g.Height)
		    
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Header
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim g1 as Graphics = g
		  
		  
		  
		  // Draw Background
		  g1.ForeColor = get_color("Gray",3)
		  g1.FillRect(0,0,g1.Width,g1.Height)
		  
		  
		  // Draw HeaderBase
		  g1.ForeColor = HeaderBaseColor
		  g1.FillRect(0,HeaderHeight ,g1.Width,HeaderBaseHeight - 1)
		  g1.ForeColor = get_color("Gray",2)
		  g1.DrawLine(0,HeaderHeight + HeaderBaseHeight - 1,g1.Width,HeaderHeight + HeaderBaseHeight - 1)
		  
		  
		  // Draw Text
		  Dim TextBaseLine,TextLeft,TextSize as integer
		  
		  
		  TextBaseLine = Floor( HeaderHeight * 0.80)
		  TextLeft = 6
		  TextSize = Floor( HeaderHeight * 0.60)
		  
		  g1.Bold = True
		  g1.ForeColor = HeaderTextColor
		  g1.TextSize = TextSize
		  g1.DrawString(HeaderText,TextLeft,TextBaseLine)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  #If TargetWin32 Then
		    Me.DoubleBuffer = True
		  #Else
		    Me.DoubleBuffer = False
		  #Endif
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Name="HeaderBackgroundColor"
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HeaderBaseColor"
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HeaderHeight"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HeaderText"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HeaderTextColor"
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Untitled"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
