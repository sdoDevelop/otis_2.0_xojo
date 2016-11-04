#tag Class
Protected Class sdoLabel
Inherits sdoCanvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  
		  
		  Return KeyDownMethod(Key)
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  Return MouseDownMethod(X,Y)
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  
		  
		  MouseExitMethod
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  
		  
		  MouseMoveMethod(X,Y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  
		  
		  MouseUpMethod(X,Y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub PropogateOpen()
		  
		  
		  OpenMethod
		End Sub
	#tag EndEvent

	#tag Event
		Sub PropogatePaint(g as Graphics)
		  Dim g1 as Graphics = g
		  
		  
		  
		  PaintMethod(g1)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AdvanceEditThroughParts()
		  
		  
		  
		  If AdvanceEditThroughParts Then
		    
		  Else
		    
		    RaiseSave
		    RaiseEvent DoneEditingSection
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AdvanceEditThroughParts() As Boolean
		  Dim ThePart as String
		  Dim PreviousEditSection as Integer
		  Dim TheExit,TheEnter as Boolean
		  
		  
		  PreviousEditSection = CurrentEditSection
		  
		  Select Case CurrentEditSection
		  Case -1
		    ThePart = Sections.Data(0).Name
		    TheEnter = True
		  Case 0 To Sections.Data.Ubound - 1
		    ThePart = Sections.Data(PreviousEditSection + 1).Name
		    TheExit = True
		    TheEnter = True
		  Case Sections.Data.Ubound
		    TheExit = True
		  End Select
		  
		  
		  
		  
		  If TheExit Then
		    ExitEditMode
		  End If
		  
		  Dim DoWeSkip as Boolean
		  Dim x1 as integer
		  x1 = PreviousEditSection + 1
		  
		  If x1 <= Sections.Data.Ubound Then
		    
		    DoWeSkip = Sections.Data(x1).Skip
		    
		    If Not DoWeSkip Then
		      EnterEditMode(ThePart)
		    Else 
		      x1 = x1 + 1
		      If x1 <= Sections.Data.Ubound Then
		        ThePart = Sections.Data(x1).Name
		        EnterEditMode(ThePart)
		      End If
		    End If
		    
		  End If
		  
		  
		  
		  
		  
		  If CurrentEditSection = -1 Then
		    Return False
		  Else 
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DeterminePartByXY(X as integer, Y as integer) As String
		  
		  
		  
		  For i1 as integer = 0 To Sections.Data.Ubound
		    
		    If X >= Sections.Data(i1).Left + TextLeft And X <= Sections.Data(i1).Width +Sections.Data(i1).Left + TextLeft And Y >= Sections.Data(i1).Top + TextTop And Y <=Sections.Data(i1).Bottom + TextBottom Then
		      Return Sections.Data(i1).Name
		    End If
		    
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DetermineSectionTextCoordinates(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  Dim RunningLeft as integer
		  
		  
		  
		  For i1 as integer = 0 To Sections.Data.Ubound
		    
		    Sections.Data(i1).Width = g1.StringWidth(Sections.Data(i1).TheText)
		    Sections.Data(i1).Top = 0
		    Sections.Data(i1).Bottom = Sections.Data(i1).Top + TextHeight
		    Sections.Data(i1).Left = RunningLeft
		    Sections.Data(i1).Right = Sections.Data(i1).Left + Sections.Data(i1).Width
		    
		    RunningLeft = Sections.Data(i1).Right  + 1
		    
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DetermineTextColor()
		  
		  
		  
		  
		  For i1 as integer = 0 To Sections.Data.Ubound
		    
		    Select Case Sections.Data(i1).State
		    Case "Normal"
		      Sections.Data(i1).TextColor = get_color("Text",0)
		      Sections.Data(i1).BackgroundEnabled = False
		    Case  "Hover"
		      Sections.Data(i1).TextColor = get_color("Blue",4)
		      Sections.Data(i1).BackgroundEnabled = False
		    Case  "Pressed"
		      Sections.Data(i1).TextColor = get_color("Blue",2)
		      Sections.Data(i1).BackgroundEnabled = False
		    Case "Disabled"
		      Sections.Data(i1).TextColor = get_color("Text",0)
		      Sections.Data(i1).BackgroundEnabled = False
		    Case "Edit"
		      Sections.Data(i1).TextColor = RGB(255,0,0)  'get_color("Text",0)
		      Sections.Data(i1).BackgroundEnabled = True
		      Sections.Data(i1).BackgroundColor = RGB(255,0,0)  'get_color("Blue",4)
		    Case ""
		      Sections.Data(i1).TextColor = get_color("Text",0)
		      Sections.Data(i1).BackgroundEnabled = False
		    End Select
		    
		    
		  Next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DetermineTextCoordinates(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  Dim BorderWidth as integer
		  
		  
		  
		  // Set a border size if borders are enabled
		  If Borders Then
		    BorderWidth = 1
		  Else
		    BorderWidth = 0
		  End If
		  
		  // Set TextSize
		  Dim TargetTextHeight as integer
		  TargetTextHeight =Height * 0.8
		  If TextSize = 0 Then
		    g1.TextSize = TargetTextHeight
		    // we need to set the text size ourself
		    While g1.TextHeight > TargetTextHeight
		      g1.TextSize = g1.TextSize - 1
		      If g1.TextHeight < TargetTextHeight Then
		        Exit
		      End If
		    Wend
		  End If
		  Dim  UnderHangingAdjustment as integer
		  UnderHangingAdjustment = TargetTextHeight - g1.TextSize
		  
		  
		  // Horizontal Coordinates
		  TextWidth = g1.StringWidth(LabelText) + Sections.Data.Ubound
		  TextHalf = Floor( TextWidth / 2 )
		  
		  Select Case JustificationHorizontal
		  Case 0
		    TextLeft = 2 + BorderWidth
		    TextRight = TextLeft + TextWidth
		  Case 1
		    TextLeft = HalfHorizontal - TextHalf
		    TextRight = HalfHorizontal + TextHalf
		  Case 2
		    TextRight = Width
		    TextLeft = TextRight - TextWidth
		  End Select
		  
		  TextHeight = g1.TextHeight
		  TextHalf = TextHeight / 2
		  
		  
		  
		  TextBottom = Height * 0.8
		  TextTop = TextBottom - TextHeight
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawText(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  Dim WLeft,WTop,WWidth,WBottom,WHeight as integer
		  
		  'g1.TextUnit=FontUnits.Point
		  
		  
		  DetermineTextColor
		  DetermineTextCoordinates(g1)
		  DetermineSectionTextCoordinates(g1)
		  
		  // Break the text into sections so we can iterate through them and draw
		  'RaiseEvent BreakTextIntoParts
		  
		  For i1 as integer = 0 To Sections.Data.Ubound
		    
		    WLeft = TextLeft + Sections.Data(i1).Left
		    WTop = TextTop + Sections.Data(i1).Top
		    WWidth = Sections.Data(i1).Width
		    WBottom = TextTop + Sections.Data(i1).Bottom
		    WHeight = WBottom - WTop
		    
		    If Sections.Data(i1).BackgroundEnabled Then
		      
		      // Draw the text background
		      g1.ForeColor = Sections.Data(i1).BackgroundColor
		      g1.FillRoundRect(WLeft,WTop,WWidth,WHeight,0,0)
		    End If
		    
		    // Draw the Text
		    g1.ForeColor = Sections.Data(i1).TextColor
		    g1.DrawString(Sections.Data(i1).TheText,WLeft,WBottom)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EnterEditMode(ThePart as string)
		  
		  SetFocus
		  
		  SetPartState(ThePart,"Edit")
		  Editing = True
		  CurrentEditSection = Sections.NameIndex(ThePart)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EnterValueArrayIntoSections(TheValues() as string)
		  
		  
		  For i1 as integer = 0 To TheValues.Ubound
		    
		    Sections.Data(i1).TheText = TheValues(i1)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ExitEditMode()
		  
		  
		  CurrentEditSection = -1
		  ReDim TextBuffer(-1)
		  Editing = False
		  ZeroPartState
		  Refresh
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IncrementSection(TheSection as Integer, UpDown as String)
		  Dim IntegerCharacters as String ="0,1,2,3,4,5,6,7,8,9"
		  
		  
		  
		  If IntegerCharacters = Join( Sections.Data(TheSection).AcceptedCharacters,"," ) Then
		    // The section is a number field
		    
		    Dim TheValue as Integer
		    Dim TheNewValue as integer
		    TheValue = val( Sections.Data(TheSection).TheText)
		    Select Case UpDown
		    Case "up"
		      TheNewValue = TheValue + 1
		    Case "down"
		      TheNewValue = TheValue - 1
		    End Select
		    
		    Sections.Data(TheSection).TheText = TheNewValue.ToText
		    If Not RaiseEvent CheckSectionValue(TheSection) Then
		      'New value is not valid
		      'revert to old value
		      Sections.Data(TheSection).TheText = TheValue.ToText
		    End If
		    
		  End If
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function KeyDownMethod(Key as String) As Boolean
		  Dim SectionAcceptedCharacters() as String
		  Dim ThePart as String
		  
		  
		  If Editing Then
		    
		    ThePart = Sections.Data(CurrentEditSection).Name
		    SectionAcceptedCharacters = Sections.Data(CurrentEditSection).AcceptedCharacters
		    
		    If SectionAcceptedCharacters.IndexOf(Key) <> -1 Then
		      
		      
		      // Add the key to the buffer
		      TextBuffer.Append(Key)
		      
		      // Write Text to screen
		      Sections.Data(CurrentEditSection).TheText = Join(TextBuffer(),"")
		      Refresh
		      
		      // Check if that puts us over at or over max for the current section
		      If Sections.Data(CurrentEditSection).MaxCharacters <= TextBuffer.Ubound + 1 Then
		        'We are at or exceeding max characters....exceed shouldn't be able to happen
		        
		        If RaiseEvent CheckSectionValue(CurrentEditSection) Then
		          'Value is valid
		          'RaiseSave
		          
		          // Advance the edit field
		          AdvanceEditThroughParts
		        Else
		          'Value is not valid
		          MsgBox("Entered value not valid, please try again.")
		          ReDim TextBuffer(-1)
		        End If
		        '
		      Else
		        'We are still below max characters
		      End If
		      
		    Else
		      'Not an accepted character
		      
		      // Check If it is another key we want to handle
		      Select Case Key
		      Case Chr(30)  'UpArrow
		        IncrementSection(CurrentEditSection,"up")
		      Case Chr(31)  'DownArrow
		        IncrementSection(CurrentEditSection,"Down")
		      End Select
		    End If
		    
		  Else
		    'Not Editing
		    'do nothing
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MouseDownMethod(X as integer, Y as integer) As Boolean
		  Dim ThePart as String
		  
		  
		  ThePart = DeterminePartByXY(X,Y)
		  
		  If Sections.NameIndex(ThePart) > -1 Then
		    MouseDownPart = ThePart
		    SetPartState(ThePart,"Pressed")
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MouseExitMethod()
		  
		  
		  
		  ZeroPartStateSafe
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MouseMoveMethod(X as integer, Y as integer)
		  Dim ThePart as string
		  
		  ZeroPartStateSafe
		  ThePart = DeterminePartByXY(X,Y)
		  
		  If Not me.Editing Then
		    If Sections.NameIndex(ThePart) > -1 Then
		      SetPartState(ThePart,"Hover")
		    Else
		      
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MouseUpMethod(X as integer, Y as integer)
		  Dim ThePart as String
		  Dim PartIndex as integer
		  
		  ThePart = DeterminePartByXY(X,Y)
		  PartIndex = Sections.NameIndex(ThePart)
		  
		  If MouseDownPart = ThePart Then
		    If CurrentEditSection <> -1 Then
		      If CurrentEditSection = PartIndex Then
		        ExitEditMode
		        Return
		      Else
		        ExitEditMode
		      End If
		    End If
		    
		    If Not Sections.Data(PartIndex).Skip Then
		      SetPartState(ThePart,"Hover")
		      EnterEditMode(ThePart)
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OpenMethod()
		  
		  
		  
		  
		  RaiseEvent PropogateOpen
		  
		  
		  
		  
		  
		  'RaiseEvent BreakTextIntoParts
		  EnterValueArrayIntoSections( RaiseEvent LoadValues )
		  
		  
		  
		  
		  ''''''''''
		  ZeroPartState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PaintMethod(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  
		  DrawText(g1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RaiseSave()
		  
		  
		  RaiseEvent SaveEvent
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReDimSections(TheUbound as integer)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetPartState(ThePart as String, TheState as string)
		  
		  
		  
		  If Not Editing Then
		    
		    If me.Enabled Then
		      Sections.Data(Sections.NameIndex(ThePart)).State = TheState
		    Else
		      Sections.Data(Sections.NameIndex(ThePart)).State = "Disabled"
		    End If
		    
		  End If
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ZeroPartState()
		  
		  
		  For i1 as integer = 0 To Sections.Data.Ubound
		    
		    Sections.Data(i1).State = "Normal"
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ZeroPartStateSafe()
		  
		  
		  For i1 as integer = 0 To Sections.Data.Ubound
		    
		    If Sections.Data(i1).State <> "Edit" Then
		      Sections.Data(i1).State = "Normal"
		    End If
		    
		  Next
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event BreakTextIntoParts()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CheckSectionValue(TheSection as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CheckValue()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoneEditingSection()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LoadValues() As String()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PropogateOpen()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SaveEvent()
	#tag EndHook


	#tag Note, Name = OpenEventNotes
		
		
		
		In the initialize event we need to specify the following items
		
		- Sections that the label will be broken up into. 
		- Label Text
	#tag EndNote


	#tag Property, Flags = &h1
		Protected CurrentEditSection As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Editing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			0 = Left
			1 = Center
			2 = Right
		#tag EndNote
		JustificationHorizontal As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private KeyInputBuffer() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LabelText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LabelTextSectioned() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MouseDownPart As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionBottom() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionLeft() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionRight() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Sections As SectionsModule.SectionsArray
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionTop() As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SectionWidth() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SkipSection() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TextBackground() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TextBackgroundColor() As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextBaseline As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextBottom As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TextBuffer() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextColor() As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextHalf As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextRight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextWidth As Integer
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
			Name="BorderColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Borders"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CornerArc"
			Group="Behavior"
			Type="Integer"
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
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Position"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="JustificationHorizontal"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LabelText"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
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
	#tag EndViewBehavior
End Class
#tag EndClass
