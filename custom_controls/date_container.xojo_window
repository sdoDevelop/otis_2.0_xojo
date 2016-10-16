#tag Window
Begin ContainerControl date_container
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   37
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   82
   Begin otis_label Label_Hour
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
      last_click      =   0
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "00"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   9
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin otis_label Label_Minute
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
      last_click      =   0
      Left            =   30
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
      Text            =   "00"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   9
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin otis_label Label_period
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
      last_click      =   0
      Left            =   54
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
      Text            =   "pm"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   9
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin Canvas Canvas_triangles
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   35
      HelpTag         =   ""
      Index           =   -2147483648
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
      Top             =   1
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   81
      Begin otis_label Label_colen
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Canvas_triangles"
         Italic          =   False
         last_click      =   0
         Left            =   16
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   ":"
         TextAlign       =   1
         TextColor       =   &c00000000
         TextFont        =   "FreeSerif"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   27
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  ReDim TriangleState(6)
		  TriangleState(0) = "Normal"
		  TriangleState(1) = "Normal"
		  TriangleState(2) = "Normal"
		  TriangleState(3) = "Normal"
		  TriangleState(4) = "Normal"
		  TriangleState(5) = "Normal"
		  TriangleState(6) = "Normal"
		  
		  DrawArrows
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawArrows()
		  dim CanvasPicture as Picture
		  dim g as Graphics
		  
		  CanvasPicture = new Picture(Canvas_triangles.Width,Canvas_triangles.Height)
		  g = CanvasPicture.Graphics
		  
		  
		  
		  For i1 as integer = 1 To 6
		    
		     Select Case i1
		    Case 1,2,3
		      'draw up arrows
		      SetShrunkArrowUp(TriangleState(i1))
		      g.DrawPicture(ShrunkArrowUp,TriangleLeft(i1),TriangleTop(i1))
		    Case 4,5,6
		      'draw down arrows
		      SetShrunkArrowDown(TriangleState(i1))
		      g.DrawPicture(ShrunkArrowDown,TriangleLeft(i1),TriangleTop(i1))
		    End Select
		    
		  Next
		  
		  
		  Canvas_triangles.Backdrop = CanvasPicture
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetShrunkArrowDown(state as string)
		  
		  // Lets crop the down arrow
		  dim CropHeight as integer
		  dim CropArrowUp, CropArrowDown as Picture
		  CropHeight = arrow_down.Height * 0.5
		  
		  dim g as Graphics
		  CropArrowDown = new Picture(arrow_down.Width,CropHeight)
		  g = CropArrowDown.Graphics
		  
		  dim p1 as Picture 
		  Select Case state
		  Case "Normal"
		    p1 = arrow_down
		  Case "Hover"
		    p1 = arrow_down_24_white
		  Case "Pressed"
		    p1 = arrow_down_24_dark
		  End Select
		  
		  
		  g.DrawPicture(p1,0,0 - CropHeight)
		  
		  
		  // Now we shrink it
		  
		  dim ShrunkWidth,ShrunkHeight,ShrunkCenter as integer
		  ShrunkWidth = Floor(CropArrowDown.Width * 0.5)
		  ShrunkHeight = Floor(CropArrowDown.Height * 0.5)
		  ShrunkCenter = ShrunkWidth / 2
		  ShrunkArrowDown = new Picture(ShrunkWidth,ShrunkHeight)
		  
		  g = ShrunkArrowDown.Graphics
		  g.DrawPicture(CropArrowDown,0,0,ShrunkWidth,ShrunkHeight,0,0,CropArrowDown.Width,CropArrowDown.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetShrunkArrowUp(state as string)
		  
		  
		  // Lets crop the up arrow
		  dim CropHeight as integer
		  dim CropArrowUp, CropArrowDown as Picture
		  CropHeight = arrow_up.Height * 0.5
		  
		  dim g as Graphics
		  CropArrowUp = new Picture(arrow_up.Width,CropHeight)
		  g = CropArrowUp.Graphics
		  
		  dim p1 as Picture 
		  Select Case state
		  Case "Normal"
		    p1 = arrow_up
		  Case "Hover"
		    p1 = arrow_up_24_white
		  Case "Pressed"
		    p1 = arrow_up_24_dark
		  End Select
		  
		  g.DrawPicture(p1,0,0)
		  
		  
		  // Now we shrink it
		  
		  dim ShrunkWidth,ShrunkHeight,ShrunkCenter as integer
		  ShrunkWidth = Floor(CropArrowUp.Width * 0.5)
		  ShrunkHeight = Floor(CropArrowUp.Height * 0.5)
		  ShrunkCenter = ShrunkWidth / 2
		  ShrunkArrowUp = new Picture(ShrunkWidth,ShrunkHeight)
		  
		  
		  
		  g = ShrunkArrowUp.Graphics
		  g.DrawPicture(CropArrowUp,0,0,ShrunkWidth,ShrunkHeight,0,0,CropArrowUp.Width,CropArrowUp.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TriangleBottom(index as integer) As integer
		  Select Case index
		  Case 1, 2, 3
		    return TriangleTop(index) + ShrunkArrowUp.Height
		  Case 4, 5, 6
		    return TriangleTop(index) + ShrunkArrowDown.Height
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TriangleLeft(index as integer) As integer
		  Dim LeftSide, ShrunkCenter as integer
		  
		  
		  ShrunkCenter = ShrunkArrowUp.Width / 2
		  
		  Select Case index
		  Case 1, 4
		    LeftSide = Label_Hour.Center - ShrunkCenter
		  Case 2, 5
		    LeftSide = Label_Minute.Center - ShrunkCenter
		  Case 3, 6
		    LeftSide = Label_Period.Center - ShrunkCenter
		  End Select
		  
		  Return LeftSide
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TriangleRight(index as integer) As integer
		  Dim LeftSide, ShrunkCenter as integer
		  
		  
		  ShrunkCenter = ShrunkArrowUp.Width / 2
		  
		  Select Case index
		  Case 1, 4
		    LeftSide = Label_Hour.Center + ShrunkCenter
		  Case 2, 5
		    LeftSide = Label_Minute.Center + ShrunkCenter
		  Case 3, 6
		    LeftSide = Label_Period.Center + ShrunkCenter
		  End Select
		  
		  Return LeftSide
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TriangleTop(index as integer) As integer
		  Select Case index
		  Case 1, 2, 3
		    Return 2
		  Case 4, 5, 6
		    Return 27
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ShrunkArrowDown As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ShrunkArrowUp As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		TriangleState() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas_triangles
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  
		  // Check if the mouse is horizontaly in position
		  Select Case X
		  Case TriangleLeft(1) To TriangleRight(1)
		    Select Case Y
		    Case TriangleTop(1) To TriangleBottom(1)
		      
		      // Triangle 1
		      TriangleState(1) = "Hover"
		      DrawArrows
		      
		    Case TriangleTop(4) To TriangleBottom(4)
		      
		      // Triangle 4
		      TriangleState(4) = "Hover"
		      DrawArrows
		      
		    End Select
		  Case TriangleLeft(2) To TriangleRight(2)
		    Select Case Y
		    Case TriangleTop(2) To TriangleBottom(2)
		      
		      // Triangle 2
		      TriangleState(2) = "Hover"
		      DrawArrows
		      
		    Case TriangleTop(5) To TriangleBottom(5)
		      
		      // Triangle 5
		      TriangleState(5) = "Hover"
		      DrawArrows
		      
		    End Select
		  Case TriangleLeft(3) To TriangleRight(3)
		    Select Case Y
		    Case TriangleTop(3) To TriangleBottom(3)
		      
		      // Triangle 3
		      TriangleState(3) = "Hover"
		      DrawArrows
		      
		    Case TriangleTop(6) To TriangleBottom(6)
		      
		      // Triangle 6
		      TriangleState(6) = "Hover"
		      DrawArrows
		      
		    End Select
		  Else
		    
		    If TriangleState.IndexOf("Hover") > -1 Or TriangleState.IndexOf("Pressed") > -1 Then
		      TriangleState(0) = "Normal"
		      TriangleState(1) = "Normal"
		      TriangleState(2) = "Normal"
		      TriangleState(3) = "Normal"
		      TriangleState(4) = "Normal"
		      TriangleState(5) = "Normal"
		      TriangleState(6) = "Normal"
		      DrawArrows
		    End If
		    
		  End Select
		  
		  
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
		Name="ShrunkArrowDown"
		Group="Behavior"
		Type="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ShrunkArrowUp"
		Group="Behavior"
		Type="Picture"
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
