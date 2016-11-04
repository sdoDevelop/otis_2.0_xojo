#tag Class
Protected Class OtisTimePicker
Inherits OtisCanvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  
		  
		  
		  If CurrentEdit <> "" Then
		    
		    If FilterInput(Key,CurrentEdit) Then
		      
		      AddValue(key)
		      
		    End If
		    If key = chr(13) Then
		      
		      CloseUserEdit
		      
		    End If
		    
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim theSection As String
		  
		  
		  theSection = FindPartByXY(X,Y)
		  SetSectionState(theSection,"Pressed")
		  MouseDownSection = theSection
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  
		  
		  ZeroSectionStates
		  
		  Refresh//DrawCanvas
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  dim s1 as string
		  
		  me.ZeroSectionStates
		  
		  s1 =  FindPartByXY(X,Y)
		  If s1 <> "" Then
		    SetSectionState(s1,"Hover")
		    Refresh//DrawCanvas
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Dim thePart As String
		  
		  
		  
		  ZeroSectionStates
		  
		  If X >= -1 And X <= me.Width And Y >=0 And Y <= me.Height Then
		    
		    thePart = FindPartByXY(X,Y)
		    SetSectionState(thePart,"Hover")
		    
		    If thePart = MouseDownSection Then
		      
		      HandleEvents(thePart,"MouseUp")
		      
		    End If
		    
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  #If TargetWin32 Then
		    Me.DoubleBuffer = True
		  #Else
		    Me.DoubleBuffer = False
		  #Endif
		  
		  ZeroSectionStates
		  Refresh//DrawCanvas
		  
		  CharacterLimits = new Dictionary
		  CharacterLimits.Value("HourText") = 2
		  CharacterLimits.Value("MinuteText") = 2
		  CharacterLimits.Value("PeriodText") = 2
		  
		  RaiseEvent OtisOpen
		End Sub
	#tag EndEvent

	#tag Event
		Sub OtisPaint(g as Graphics)
		  
		  g = DrawCanvas(g)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddValue(Value as String)
		  Dim CharacterLimit as integer
		  
		  
		  
		  ValueBuffer.Append(Value)
		  
		  Select Case CurrentEdit
		  Case "HourText"
		    
		    If ValueBuffer.Ubound = 0 Then
		      HourText = val(Value)
		    Else
		      HourText = val( HourText.ToText + Value )
		    End If
		    
		  Case "MinuteText"
		    
		    If ValueBuffer.Ubound = 0 Then
		      MinuteText = val(Value)
		    Else
		      MinuteText = val(MinuteText.ToText + Value )
		    End If
		    
		  Case "PeriodText"
		    
		    If ValueBuffer.Ubound = 0 Then
		      PeriodText = Value
		    Else
		      PeriodText = PeriodText + Value
		    End If
		    
		  End Select
		  
		  CharacterLimit = CharacterLimits.Value(CurrentEdit)
		  If ValueBuffer.Ubound > CharacterLimit - 2 Then
		    
		    If CurrentEdit = "PeriodText" Then
		      If Not OtisContainer(me.ParentContainer).AdvanceEdit Then
		      End If
		      
		    Else
		      If Not AdvanceEdit Then
		      End If
		      
		    End If
		    
		  End If
		  
		  Refresh//DrawCanvas
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AdvanceEdit() As boolean
		  // Returns True if we are editing a field 
		  // returns false if we are not editing a field
		  
		  Dim ReturnBoolean as Boolean
		  
		  Select Case CurrentEdit
		  Case ""
		    CloseUserEdit
		    OpenUserEdit("HourText")
		    ReturnBoolean = True
		  Case "HourText"
		    CloseUserEdit
		    OpenUserEdit("MinuteText")
		    ReturnBoolean = True
		  Case "MinuteText"
		    CloseUserEdit
		    OpenUserEdit("PeriodText")
		    ReturnBoolean = True
		  Case "PeriodText"
		    CloseUserEdit
		    ReturnBoolean = False
		    
		  End Select
		  
		  Return ReturnBoolean
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseUserEdit()
		  
		  
		  RaisingSave
		  ZeroSectionStates("InFocusSwap")
		  Refresh//DrawCanvas
		  CurrentEdit = ""
		  
		  
		  
		  
		  
		End Sub
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
		Private Function DrawBackground(GraphicObject as Graphics) As Graphics
		  Dim g1 as Graphics = GraphicObject
		  
		  
		  If NotValid = True Then
		    GoRed(g1)
		  Else
		    ResetBackground(g1)
		  End If
		  
		  
		  Return g1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawBorders(GraphicsObject as graphics) As graphics
		  dim g1 as Graphics = GraphicsObject
		  
		  g1.ForeColor = get_color("Gray",0)
		  
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
		Private Function DrawCanvas(graphicsObject as Graphics) As Graphics
		  //Dim p1 as New Picture(me.Width,me.Height)
		  //if p1 = nil then
		  //p1 = new Picture(me.Width,me.Height)
		  //end if
		  Dim g1 as Graphics = graphicsObject
		  
		  
		  
		  g1 = DrawBackground(g1)
		  //g1 = DrawBorders(g1)
		  
		  g1 = DrawTextSection(g1,"HourText")
		  g1 = DrawTextSection(g1,"ColonText")
		  g1 = DrawTextSection(g1,"MinuteText")
		  g1 = DrawTextSection(g1,"PeriodText")
		  
		  dim TriangleName as String
		  For i1 as Integer = 1 To 6
		    TriangleName = "Triangle" + i1.ToText
		    g1 = DrawArrow(g1,TriangleName)
		  Next
		  
		  
		  Return g1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawTextSection(GraphicsObject as graphics, TextSection as String) As graphics
		  Dim TextColor as Color
		  Dim TextValue as String
		  Dim TheTop,TheLeft,TheRight,TheBottom,HorizontalBuffer,VerticalBuffer as Integer
		  Dim TextBottom,TextLeft,TextHeight,TextWidth,TextTop as integer
		  Dim x1,x2,x3,x4 as Integer
		  Dim g1 as Graphics = GraphicsObject
		  Dim TheValue as String
		  Dim theState as String
		  Dim theTextColor as Color
		  Dim theHighlightColor as Color
		  Dim HighlightText as Boolean
		  
		  // Set the value that we well be writing
		  Select Case TextSection
		  Case "HourText"
		    TheValue = HourText.ToText
		  Case "ColonText"
		    TheValue = ":"
		  Case "MinuteText"
		    TheValue = MinuteText.ToText
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
		  Case "InFocus"
		    theTextColor = get_color("Text",0)
		    HighlightText = True
		    theHighlightColor = get_color("Blue",4)
		  End Select
		  If TextSection = "ColonText" Then
		    theTextColor = get_color("Text",0)
		    HighlightText = False
		  End If
		  
		  // Get the coordinates of the Hour Text Section
		  TheTop = PartCoordinates( TextSection, "Top" )
		  TheLeft = PartCoordinates( TextSection, "Left" )
		  TheRight = PartCoordinates( TextSection, "Right" )
		  TheBottom = PartCoordinates( TextSection, "Bottom" )
		  HorizontalBuffer = PartCoordinates( "Buffer","Horizontal" )
		  VerticalBuffer = PartCoordinates( "Buffer","Vertical" )
		  break
		  // Determine Text Coordinates 
		  x1 = TheBottom - TheTop
		  TextHeight = x1
		  g1.TextSize = TextHeight
		  x2 = TheRight - TheLeft
		  x2 = Floor( x2 / 2 )
		  x2 = TheRight - x2
		  TextWidth = g1.StringWidth(TheValue)
		  x3 = TextWidth
		  x3 = Floor( x3 / 2 )
		  TextLeft = x2 - x3
		  TextBottom = TheBottom - VerticalBuffer
		  TextTop = TextBottom - TextHeight
		  
		  If HighlightText Then
		    // Draw Highlight
		    g1.ForeColor = theHighlightColor
		    g1.FillRect(TextLeft, TextTop,TextWidth,TextHeight + 1)
		  End If
		  
		  // Draw the value
		  g1.ForeColor = theTextColor
		  g1.DrawString( TheValue, TextLeft, TextBottom )
		  
		  Return g1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterInput(InputCharacter as String, Section as String) As Boolean
		  Dim AcceptedCharacters As New Dictionary
		  Dim Ac1() As String
		  
		  Dim HourTextAcceptedCharacters() As String = Split("0,1,2,3,4,5,6,7,8,9",",")
		  Dim MinuteTextAcceptedCharacters() As String = Split("0,1,2,3,4,5,6,7,8,9",",")
		  Dim PeriodTextAcceptedCharacters() As String = Split("a,m,p",",")
		  
		  
		  AcceptedCharacters.Value("HourText") = HourTextAcceptedCharacters
		  AcceptedCharacters.Value("MinuteText") = MinuteTextAcceptedCharacters
		  AcceptedCharacters.Value("PeriodText") = PeriodTextAcceptedCharacters
		  
		  
		  ac1() = AcceptedCharacters.Value(Section)
		  
		  If ac1.IndexOf(InputCharacter) > -1 Then
		    Return True
		  End If
		  
		  Return False
		  
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
		Private Function GetSectionValue(Section as string) As Variant
		  
		  
		  Select Case Section
		  Case "HourText"
		    Return HourText
		  Case "MinuteText"
		    Return MinuteText
		  Case "PeriodText"
		    Return PeriodText
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEvents(Section as String, EventName as String)
		  
		  
		  Select Case Section
		  Case "Triangle1"
		    
		    Select Case EventName
		    Case "MouseUp"
		      IncrementSection("HourText","Up")
		    End Select
		    
		  Case "Triangle2"
		    
		    Select Case EventName
		    Case "MouseUp"
		      IncrementSection("MinuteText","Up")
		    End Select
		    
		  Case "Triangle3"
		    
		    Select Case EventName
		    Case "MouseUp"
		      IncrementSection("PeriodText","Up")
		    End Select
		    
		  Case "Triangle4"
		    
		    Select Case EventName
		    Case "MouseUp"
		      IncrementSection("HourText","Down")
		    End Select
		    
		  Case "Triangle5"
		    
		    Select Case EventName
		    Case "MouseUp"
		      IncrementSection("MinuteText","Down")
		    End Select
		    
		  Case "Triangle6"
		    
		    Select Case EventName
		    Case "MouseUp"
		      IncrementSection("PeriodText","Down")
		    End Select
		    
		  Case "HourText"
		    
		    Select Case EventName
		    Case "MouseUp"
		      OpenUserEdit("HourText")
		    End Select
		    
		  Case "ColonText"
		    
		  Case "MinuteText"
		    
		    Select Case EventName
		    Case "MouseUp"
		      OpenUserEdit("MinuteText")
		    End Select
		    
		  Case "PeriodText"
		    
		    Select Case EventName
		    Case "MouseUp"
		      OpenUserEdit("PeriodText")
		    End Select
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IncrementSection(Section As String, UpDown as string)
		  Dim TheHour,TheMinute as Integer
		  Dim thePeriod as String
		  
		  
		  TheHour = HourText
		  TheMinute = MinuteText
		  thePeriod = PeriodText
		  
		  Select Case Section
		  Case "HourText"
		    
		    Select Case UpDown
		    Case "Up" 
		      If TheHour = 12 Then
		        HourText = 1
		      Else
		        HourText = TheHour + 1
		      End If
		    Case "Down"
		      If TheHour = 1 Or TheHour = 0 Then
		        HourText  = 12
		      Else
		        HourText = TheHour - 1
		      End If
		      
		    End Select
		    
		  Case "MinuteText"
		    
		    Select Case UpDown
		    Case "Up" 
		      If TheMinute = 59 Then
		        MinuteText = 1
		      Else
		        MinuteText =MinuteText + 1
		      End If
		    Case "Down"
		      If MinuteText = 1 Or MinuteText = 0 Then
		        MinuteText  = 59
		      Else
		        MinuteText = MinuteText - 1
		      End If
		      
		    End Select
		    
		  Case "PeriodText"
		    
		    If thePeriod = "am" Then
		      PeriodText = "pm"
		    Else
		      PeriodText = "am"
		    End If
		    
		  End Select
		  
		  Refresh//DrawCanvas
		  
		  
		End Sub
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

	#tag Method, Flags = &h0
		Sub LoadControl(aDate as OtisDate)
		  Dim d1 as OtisDate = aDate
		  
		  Dim theHour as integer
		  Dim thePeriod as string
		  If d1.Hour >= 12 Then
		    theHour = d1.Hour - 12
		    thePeriod = "pm"
		  ElseIf d1.Hour = 0 Then
		    theHour = 12
		    thePeriod = "am"
		  Else
		    theHour = d1.Hour
		    thePeriod = "am"
		  End If
		  
		  
		  HourText = theHour
		  MinuteText = d1.Minute
		  PeriodText = thePeriod
		  
		  me.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OpenUserEdit(EditingField as String)
		  
		  
		  me.SetFocus
		  
		  If CurrentEdit <> "" Then
		    CloseUserEdit
		  End If
		  
		  SetSectionState(EditingField,"InFocus")
		  CurrentEdit = EditingField
		  ReDim ValueBuffer(-1)
		  
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
		Private Sub RaisingSave()
		  Dim theDate as New Date
		  Dim theHour as integer
		  
		  
		  theHour = HourText
		  If theHour = 12 And PeriodText = "am" Then
		    theHour = 0
		  End If
		  theDate.Hour = theHour
		  theDate.Minute = MinuteText
		  
		  
		  
		  // Check if this is valid
		  If theHour > 0 And MinuteText > 0 And (PeriodText = "am" Or PeriodText = "pm") Then
		    If theHour < 24 And MinuteText < 60 Then
		      NotValid = False
		    End If
		  Else
		    NotValid = True
		  End If
		  
		  If Not NotValid Then
		    
		    If RaiseEvent PreSave Then
		      
		      RaiseEvent SaveValue(theDate)
		      
		    End If
		    
		  Else
		    
		    
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetSectionState(Section as string, State as string)
		  
		  If SectionState.Value(Section) <> "InFocus" Then
		    ZeroSectionStates
		    
		    SectionState.Value(Section) = State
		    
		    Refresh //DrawCanvas
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ZeroSectionStates()
		  Dim SectionNames() as string = Array("Triangle1","Triangle2","Triangle3","Triangle4","Triangle5","Triangle6","HourText","ColonText","MinuteText","PeriodText")
		  Dim bool1 as Boolean
		  
		  
		  If SectionState = Nil Then
		    SectionState = New Dictionary
		    bool1 = True
		  End If
		  
		  If Not bool1 Then
		    
		    dim TriangleName as String
		    For i1 as Integer =  0 To SectionNames.Ubound
		      If SectionState.Value(SectionNames(i1)).StringValue <> "InFocus" Then
		        
		        SectionState.Value(SectionNames(i1)) = "Normal"
		        
		      End If
		    Next
		    
		  Else
		    
		    dim TriangleName as String
		    For i1 as Integer =  0 To SectionNames.Ubound
		      
		      SectionState.Value(SectionNames(i1)) = "Normal"
		      
		    Next
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ZeroSectionStates(SpecialState as String)
		  
		  
		  Select Case SpecialState
		  Case "InFocusSwap"
		    SectionState = Nil
		    ZeroSectionStates
		  End Select
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event EditDoneAdvance()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event OtisOpen()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PreSave() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SaveValue(DateValue as Date)
	#tag EndHook


	#tag Note, Name = EventDef_ReadMe
		
		EditDoneAdvance
		---------------------
		
		
		
		
		
		PreSave
		----------
		Return True to save
		Return False to cancel save
		
		
		
		
		
		
		SaveValue
		-------------
		Only Fires if you return true on Pre Save
	#tag EndNote


	#tag Property, Flags = &h21
		Private CharacterLimits As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		HourText As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MinuteText As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MouseDownSection As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NotValid As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		PeriodText As String = "pm"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SectionState As dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ValueBuffer() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CornerHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CornerWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentEdit"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultHeight"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultWidth"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeightIsFixed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HourText"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
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
			Name="MaxHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinuteText"
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
			Name="RoundCorners"
			Group="Behavior"
			Type="Boolean"
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
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WidthIsFixed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
