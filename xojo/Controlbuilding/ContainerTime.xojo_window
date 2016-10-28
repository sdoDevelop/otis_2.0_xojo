#tag Window
Begin ContainerControl ContainerTime
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   40
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
   UseFocusRing    =   True
   Visible         =   True
   Width           =   75
   Begin OtisCanvas CanvasBackground
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   40
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   75
   End
   Begin OtisTextField TextField_UserEdit
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
      Left            =   0
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "FreeSerif"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   26
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  dim s1 as string
		  
		  ZeroSectionStates
		  
		  s1 =  FindPartByXY(X,Y)
		  If s1 <> "" Then
		    SetSectionState(s1,"Hover")
		    DrawCanvas
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  ZeroSectionStates
		  DrawCanvas
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AdvanceEdit() As boolean
		  // Returns True if we are editing a field 
		  // returns false if we are not editing a field
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawArrow(GraphicsObject as graphics, Section as String) As graphics
		  Dim theArrow as Picture
		  Dim TheSectionState,UpDown as String
		  Dim ArrowWidth as integer
		  Dim ArrowWidthPerc as Double = 0.5
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  ' Get the state of the section
		  TheSectionState = SectionState.Value(Section)
		  Select Case Section
		  Case "Triangle1"
		    UpDown = "Up"
		    ArrowWidth = PartCoordinates("Triangle1","Right") - PartCoordinates("Triangle1","Left")
		    ArrowWidth = Floor( ArrowWidth * ArrowWidthPerc )
		  Case "Triangle2"
		    UpDown = "Up"
		    ArrowWidth = PartCoordinates("Triangle2","Right") - PartCoordinates("Triangle2","Left")
		    ArrowWidth = Floor( ArrowWidth * ArrowWidthPerc )
		  Case "Triangle3"
		    UpDown = "Up"
		    ArrowWidth = PartCoordinates("Triangle3","Right") - PartCoordinates("Triangle3","Left")
		    ArrowWidth = Floor( ArrowWidth * ArrowWidthPerc )
		  Case "Triangle4"
		    UpDown = "Down"
		    ArrowWidth = PartCoordinates("Triangle4","Right") - PartCoordinates("Triangle4","Left")
		    ArrowWidth = Floor( ArrowWidth * ArrowWidthPerc )
		  Case "Triangle5"
		    UpDown = "Down"
		    ArrowWidth = PartCoordinates("Triangle5","Right") - PartCoordinates("Triangle5","Left")
		    ArrowWidth = Floor( ArrowWidth * ArrowWidthPerc )
		  Case "Triangle6"
		    UpDown = "Down"
		    ArrowWidth = PartCoordinates("Triangle6","Right") - PartCoordinates("Triangle6","Left")
		    ArrowWidth = Floor( ArrowWidth * ArrowWidthPerc )
		  End Select
		  
		  theArrow = PrepArrow(TheSectionState,UpDown,ArrowWidth)
		  
		  
		  dim x1, x2, x3, x4,TheTop,TheBottom,TheLeft,TheRight,HorizontalBuffer,VerticalBuffer as integer
		  dim d1, d2 as Double
		  dim ArrowLeft,ArrowTop as Integer
		  
		  // Get the coordinates of the Hour Text Section
		  TheTop = PartCoordinates( Section, "Top" )
		  TheLeft = PartCoordinates( Section, "Left" )
		  TheRight = PartCoordinates( Section, "Right" )
		  TheBottom = PartCoordinates( Section, "Bottom" )
		  HorizontalBuffer = PartCoordinates( "Buffer","Horizontal" )
		  VerticalBuffer = PartCoordinates( "Buffer","Vertical" )
		  
		  // Determine Text Coordinates 
		  x2 = TheRight - TheLeft
		  x2 = Floor( x2 / 2 )
		  x2 = TheRight - x2
		  x3 = Floor( theArrow.Width / 2 )
		  ArrowLeft = x2 - x3
		  x1 = TheBottom - TheTop
		  x1 = Floor( x1 / 2 )
		  x1 = TheBottom - x1
		  x4 = Floor( theArrow.Height / 2 )
		  ArrowTop = x1 - x4
		  
		  g1.DrawPicture(theArrow,ArrowLeft,ArrowTop)
		  
		  Return g1
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawBorders(GraphicsObject as graphics) As graphics
		  dim g1 as Graphics = GraphicsObject
		  
		  Dim x1,x2,y1,y2 as integer
		  x1 = 0
		  x2 = 0
		  y1 = 0
		  y2 = me.Height
		  g1.DrawLine(x1,y1,x2,y2)
		  x1 = PartCoordinates("ColonText","Left")
		  x2 = x1
		  g1.DrawLine(x1,y1,x2,y2)
		  x1 = PartCoordinates("MinuteText","Left")
		  x2 = x1
		  g1.DrawLine(x1,y1,x2,y2)
		  x1 = PartCoordinates("PeriodText","Left")
		  x2 = x1
		  g1.DrawLine(x1,y1,x2,y2)
		  x1 = PartCoordinates("PeriodText","Right")
		  x2 = x1
		  g1.DrawLine(x1,y1,x2,y2)
		  
		  Return g1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawCanvas()
		  Dim p1 as New Picture(CanvasBackground.Width,CanvasBackground.Height)
		  Dim g1 as Graphics = p1.Graphics
		  
		  
		  
		  
		  g1 = DrawBorders(g1)
		  
		  g1 = DrawTextSection(g1,"HourText")
		  g1 = DrawTextSection(g1,"ColonText")
		  g1 = DrawTextSection(g1,"MinuteText")
		  g1 = DrawTextSection(g1,"PeriodText")
		  
		  dim TriangleName as String
		  For i1 as Integer = 1 To 6
		    TriangleName = "Triangle" + i1.ToText
		    g1 = DrawArrow(g1,TriangleName)
		  Next
		  
		  
		  CanvasBackground.Backdrop = p1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawTextSection(GraphicsObject as graphics, TextSection as String) As graphics
		   Dim TextColor as Color
		  Dim TextValue as String
		  Dim TheTop,TheLeft,TheRight,TheBottom,HorizontalBuffer,VerticalBuffer as Integer
		  Dim TextBottom,TextLeft,TextHeight as integer
		  Dim x1,x2,x3,x4 as Integer
		  Dim g1 as Graphics = GraphicsObject
		  Dim TheValue as String
		  Dim theState as String
		  Dim theTextColor as Color
		  
		  // Set the value that we well be writing
		  Select Case TextSection
		  Case "HourText"
		    TheValue = Hour.ToText
		  Case "ColonText"
		    TheValue = ":"
		  Case "MinuteText"
		    TheValue = Minute.ToText
		  Case "PeriodText"
		    TheValue = PeriodText
		  End Select
		  
		  theState = SectionState.Value(TextSection).StringValue
		  
		  // Check State and set text properties for the state
		  Select Case theState
		  Case "Normal"
		    theTextColor = get_color("Text",0)
		  Case "Hover"
		    theTextColor = get_color("Blue",4)
		  Case "Pressed" 
		    theTextColor = get_color("Gray",3)
		  End Select
		  If TextSection = "ColonText" Then
		    theTextColor = get_color("Text",0)
		  End If
		  g1.ForeColor = theTextColor
		  
		  // Get the coordinates of the Hour Text Section
		  TheTop = PartCoordinates( TextSection, "Top" )
		  TheLeft = PartCoordinates( TextSection, "Left" )
		  TheRight = PartCoordinates( TextSection, "Right" )
		  TheBottom = PartCoordinates( TextSection, "Bottom" )
		  HorizontalBuffer = PartCoordinates( "Buffer","Horizontal" )
		  VerticalBuffer = PartCoordinates( "Buffer","Vertical" )
		  
		  // Determine Text Coordinates 
		  x1 = TheBottom - TheTop
		  TextHeight = x1
		  g1.TextSize = TextHeight
		  x2 = TheRight - TheLeft
		  x2 = Floor( x2 / 2 )
		  x2 = TheRight - x2
		  x3 = g1.StringWidth(TheValue)
		  x3 = Floor( x3 / 2 )
		  TextLeft = x2 - x3
		  TextBottom = TheBottom - VerticalBuffer
		  
		  // Draw the value
		  g1.DrawString( TheValue, TextLeft, TextBottom )
		  
		  Return g1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindPartByXY(X as integer, Y as integer) As String
		  Dim d1 as Dictionary
		  dim theTop, theRight,theLeft,theBottom as integer
		  Dim TriangleName as String
		  
		  
		  For i1 as integer = 1 To 6
		    TriangleName = "Triangle" + i1.ToText
		    d1 = PartCoordinates(TriangleName)
		    theTop = d1.Value("Top")
		    theLeft = d1.Value("Left")
		    theRight = d1.Value("Right")
		    theBottom = d1.Value("Bottom")
		    If IsWithin(X,Y,theTop,theLeft,theRight,theBottom) Then
		      Return TriangleName
		    End If
		  Next
		  
		  TriangleName = "HourText"
		  d1 = PartCoordinates(TriangleName)
		  theTop = d1.Value("Top").IntegerValue
		  theLeft = d1.Value("Left").IntegerValue
		  theRight = d1.Value("Right").IntegerValue
		  theBottom = d1.Value("Bottom").IntegerValue
		  If IsWithin(X,Y,theTop,theLeft,theRight,theBottom) Then
		    Return TriangleName
		  End If
		  
		  TriangleName = "ColonText"
		  d1 = PartCoordinates(TriangleName)
		  theTop = d1.Value("Top").IntegerValue
		  theLeft = d1.Value("Left").IntegerValue
		  theRight = d1.Value("Right").IntegerValue
		  theBottom = d1.Value("Bottom").IntegerValue
		  If IsWithin(X,Y,theTop,theLeft,theRight,theBottom) Then
		    Return TriangleName
		  End If
		  
		  TriangleName = "MinuteText"
		  d1 = PartCoordinates(TriangleName)
		  theTop = d1.Value("Top").IntegerValue
		  theLeft = d1.Value("Left").IntegerValue
		  theRight = d1.Value("Right").IntegerValue
		  theBottom = d1.Value("Bottom").IntegerValue
		  If IsWithin(X,Y,theTop,theLeft,theRight,theBottom) Then
		    Return TriangleName
		  End If
		  
		  TriangleName = "PeriodText"
		  d1 = PartCoordinates(TriangleName)
		  theTop = d1.Value("Top").IntegerValue
		  theLeft = d1.Value("Left").IntegerValue
		  theRight = d1.Value("Right").IntegerValue
		  theBottom = d1.Value("Bottom").IntegerValue
		  If IsWithin(X,Y,theTop,theLeft,theRight,theBottom) Then
		    Return TriangleName
		  End If
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsWithin(X as integer,Y as integer, theTop as integer, theLeft as integer, theRight as integer, theBottom as integer) As boolean
		  If X >= theLeft And X <= theRight And Y >= theTop And Y <= theBottom  Then
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OpenUserEdit()
		  
		  
		  Select Case CurrentEdit
		  Case ""
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PartCoordinates(PartName as String) As Dictionary
		  Dim d1 as new Dictionary
		  
		  d1.Value("Top") = PartCoordinates(PartName,"Top")
		  d1.Value("Left") = PartCoordinates(PartName,"Left")
		  d1.Value("Right") = PartCoordinates(PartName,"Right")
		  d1.Value("Bottom") = PartCoordinates(PartName,"Bottom")
		  
		  
		  
		  Return d1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PartCoordinates(PartName as String, DesiredSide as String) As Integer
		  Dim TheTop, TheBottom, TheLeft, TheRight,TheVertical,TheHorizontal as integer
		  
		  
		  // Horizontal Space Percentages
		  Dim HourSectionPerc as Double = 0.30
		  Dim ColonSectionPerc as Double = 0.09
		  Dim MinuteSectionPerc as Double = 0.30
		  Dim PeriodTextPerc as Double = .30
		  
		  // Vertical Space Percentages
		  Dim TopArrowsPerc as Double = 0.33
		  Dim TextSectionPerc as Double = 0.33
		  Dim BottomArrowsPerc as Double = 0.33
		  
		  
		  // Check which section was requested
		  Select Case PartName
		  Case "Triangle1"
		    
		    TheTop = 0
		    TheLeft = 0
		    TheRight = Floor( me.Width * HourSectionPerc )
		    TheBottom = Floor( me.Height * TopArrowsPerc )
		    
		  Case "Triangle2"
		    
		    TheTop = 0
		    TheLeft = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc ) )
		    TheRight = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc + MinuteSectionPerc ) )
		    TheBottom = Floor( me.Height * TopArrowsPerc )
		    
		  Case "Triangle3"
		    TheTop = 0
		    TheLeft = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc + MinuteSectionPerc ) )
		    TheRight = me.Width
		    TheBottom = Floor( me.Height * TopArrowsPerc )
		    
		  Case "Triangle4"
		    
		    TheTop = Floor( me.Height * ( TopArrowsPerc + TextSectionPerc ) )
		    TheLeft = 0
		    TheRight = Floor( me.Width * HourSectionPerc )
		    TheBottom = me.Height
		    
		  Case "Triangle5"
		    
		    TheTop = Floor( me.Height * ( TopArrowsPerc + TextSectionPerc ) )
		    TheLeft = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc ) )
		    TheRight = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc + MinuteSectionPerc ) )
		    TheBottom = me.Height
		    
		  Case "Triangle6"
		    
		    TheTop = Floor( me.Height * ( TopArrowsPerc + TextSectionPerc ) )
		    TheLeft = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc + MinuteSectionPerc ) )
		    TheRight = me.Width
		    TheBottom = me.Height
		    
		  Case "HourText"
		    
		    TheTop = Floor( me.Height * TopArrowsPerc )
		    TheLeft = 0
		    TheRight = Floor( me.Width * HourSectionPerc )
		    TheBottom = Floor( me.Height * ( TopArrowsPerc + TextSectionPerc ) )
		    
		  Case "ColonText"
		    
		    TheTop = Floor( me.Height * TopArrowsPerc )
		    TheLeft = Floor( me.Width * ( HourSectionPerc ) )
		    TheRight = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc ) )
		    TheBottom = Floor( me.Height * ( TopArrowsPerc + TextSectionPerc ) )
		    
		  Case "MinuteText"
		    
		    TheTop = Floor( me.Height * TopArrowsPerc )
		    TheLeft = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc ) )
		    TheRight = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc + MinuteSectionPerc  ))
		    TheBottom = Floor( me.Height * ( TopArrowsPerc + TextSectionPerc ) )
		    
		  Case "PeriodText"
		    
		    TheTop = Floor( me.Height * TopArrowsPerc )
		    TheLeft = Floor( me.Width * ( HourSectionPerc + ColonSectionPerc + MinuteSectionPerc ) )
		    TheRight = me.Width
		    TheBottom = Floor( me.Height * ( TopArrowsPerc + TextSectionPerc ) )
		    
		  Case "Buffer"
		    
		    TheVertical = 1
		    TheHorizontal = 1
		    
		  End Select
		  
		  
		  Select Case DesiredSide
		  Case "Top"
		    Return TheTop
		  Case "Left"
		    Return TheLeft
		  Case "Right"
		    Return TheRight
		  Case "Bottom"
		    Return TheBottom
		  Case "Vertical"
		    Return TheVertical
		  Case "Horizontal"
		    Return TheHorizontal
		  End Select
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrepArrow(State as String, UpDown as String, ArrowWidth as integer) As Picture
		  Dim ReturnPicture as Picture
		  dim ShrunkArrowUp,ShrunkArrowDown as Picture
		  
		  Select Case UpDown
		  Case "Up"
		    // Lets crop the up arrow
		    dim CropHeight as integer
		    dim CropArrowUp, CropArrowDown as Picture
		    
		    dim p1 as Picture 
		    Select Case State
		    Case "Normal"
		      p1 = arrow_up
		    Case "Hover"
		      p1 = arrow_up_24_blue
		    Case "Pressed"
		      p1 = arrow_up_24_dark
		    End Select
		    
		    CropHeight = p1.Height * 0.5
		    dim g as Graphics
		    CropArrowUp = new Picture(arrow_up.Width,CropHeight)
		    g = CropArrowUp.Graphics
		    
		    g.DrawPicture(p1,0,0)
		    
		    
		    // Now we shrink it
		    dim ShrunkWidth,ShrunkHeight,ShrunkCenter as integer
		    dim x1, x2, x3, x4 as integer
		    dim ShrinkRatio as double
		    ShrinkRatio = ArrowWidth / p1.Width
		    ShrunkWidth = ArrowWidth
		    ShrunkHeight = Floor(CropArrowUp.Height * ShrinkRatio )
		    ShrunkCenter = ShrunkWidth / 2
		    ShrunkArrowUp = new Picture(ShrunkWidth,ShrunkHeight)
		    
		    g = ShrunkArrowUp.Graphics
		    g.DrawPicture(CropArrowUp,0,0,ShrunkWidth,ShrunkHeight,0,0,CropArrowUp.Width,CropArrowUp.Height)
		    
		    ReturnPicture = ShrunkArrowUp
		    
		  Case "Down"
		    
		    
		    // Lets crop the down arrow
		    dim CropHeight as integer
		    dim CropArrowUp, CropArrowDown as Picture
		    
		    dim p1 as Picture 
		    Select Case State
		    Case "Normal"
		      p1 = arrow_down
		    Case "Hover"
		      p1 = arrow_down_24_blue
		    Case "Pressed"
		      p1 = arrow_down_24_dark
		    End Select
		    
		    CropHeight = p1.Height * 0.5
		    dim g as Graphics
		    CropArrowDown = new Picture(arrow_down.Width,CropHeight)
		    g = CropArrowDown.Graphics
		    
		    
		    g.DrawPicture(p1,0,0 - CropHeight)
		    
		    
		    // Now we shrink it
		    dim ShrunkWidth,ShrunkHeight,ShrunkCenter as integer
		    dim x1, x2, x3, x4 as integer
		    dim ShrinkRatio as double
		    ShrinkRatio = ArrowWidth / p1.Width
		    ShrunkWidth = ArrowWidth
		    ShrunkHeight = Floor( CropArrowDown.Height * ShrinkRatio )
		    ShrunkCenter = ShrunkWidth / 2
		    ShrunkArrowDown = new Picture(ShrunkWidth,ShrunkHeight)
		    
		    g = ShrunkArrowDown.Graphics
		    g.DrawPicture(CropArrowDown,0,0,ShrunkWidth,ShrunkHeight,0,0,CropArrowDown.Width,CropArrowDown.Height)
		    
		    
		    ReturnPicture = ShrunkArrowDown
		    
		  End Select
		  
		  Return ReturnPicture
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetSectionState(Section as string, State as string)
		  
		  
		  SectionState.Value(Section) = State
		  
		  DrawCanvas
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ZeroSectionStates()
		  SectionState = New Dictionary
		  
		  dim TriangleName as String
		  For i1 as Integer = 1 To 6
		    TriangleName = "Triangle" + i1.ToText
		    SectionState.Value(TriangleName) = "Normal"
		  Next
		  
		  SectionState.Value("HourText") = "Normal"
		  SectionState.Value("ColonText") = "Normal"
		  SectionState.Value("MinuteText") = "Normal"
		  SectionState.Value("PeriodText") = "Normal"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CurrentEdit As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Hour As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Minute As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PeriodText As String = "pm"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SectionState As dictionary
	#tag EndProperty


#tag EndWindowCode

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
		Name="Hour"
		Group="Behavior"
		Type="Integer"
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
		Name="Minute"
		Group="Behavior"
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
		Name="PeriodText"
		Group="Behavior"
		InitialValue="pm"
		Type="String"
		EditorType="MultiLineEditor"
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
