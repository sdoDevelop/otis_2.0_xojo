#tag Class
Protected Class BaseCanvas_TimeDateLabel
Inherits BaseCanvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  
		  Select Case DeterminePartClicked(X,Y)
		    
		  Case "Label"
		    
		    MouseDownOn = "Label"
		    
		  Case "Calender"
		    
		    MouseDownOn = "Calender"
		    
		  End Select
		  
		  
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  
		  
		  Select Case DeterminePartClicked(X,Y)
		    
		  Case "Label"
		    
		    If MouseDownOn = "Label" Then
		      
		      
		    End If
		    
		    
		  Case "Calender"
		    
		    If MouseDownOn = "Calender" Then
		      
		      RaiseEvent CalenderClicked(X,Y)
		      
		    End If
		    
		    
		  End Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		   Dim g1 as Graphics = g
		  
		  If Prepped Then
		    
		    DrawMe(g1)
		    
		  ElseIf Not Prepped And LabelText <> "" Then
		    
		    PrepClass
		    DrawMe(g1)
		    
		  ElseIf Not Prepped And LabelText = "" Then
		    
		    
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DeterminePartClicked(X as integer, Y as integer) As String
		  Dim ReturnValue as String
		  
		  
		  If X >= TextLeft And X <= TextRight And Y >= TextTop And Y <= TextBottom Then
		    Return "Label"
		  End If
		  
		  If X >= CalLeft And X <= CalRight And Y >= CalTop And Y <= CalBottom Then
		    Return "Calender"
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawCalander(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  // Shrink the calander
		  Dim ShrunkPicture as New Picture(CalWidth,CalHeight)
		  Dim SourcePicture as Picture = Calender_Picture
		  Dim g2 as Graphics = ShrunkPicture.Graphics
		  g2.DrawPicture(SourcePicture,0,0,CalWidth,CalHeight,0,0,SourcePicture.Width,SourcePicture.Height)
		  
		  // Draw ShrunkPicture into g1
		  g1.DrawPicture(ShrunkPicture,CalLeft,CalTop)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawLabel(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  Dim LabelCenter,LabelRight as integer
		  Dim TextHalf,TextHeight,TextBaseline as integer
		  Dim TheText as String = LabelText
		  
		  
		  
		  // Find the Coordinates of the Label
		  LabelRight = me.Left + me.Width
		  If LabelCenter = 0 Then
		    LabelCenter = Floor( me.Width / 2 )
		  End If
		  
		  
		  // Set up text dimensions and settings
		  TextHeight = me.Height * 0.8
		  TextBaseline = me.Height * 0.8
		  g1.TextSize = TextHeight
		  g1.ForeColor = get_color("Text",0)
		  g1.Bold = True
		  TextHalf = Floor( g1.StringWidth(TheText) / 2 )
		  me.TextLeft = LabelCenter - TextHalf
		  me.TextRight = me.TextLeft + g1.StringWidth(TheText)
		  me.TextTop= TextBaseline + TextHeight
		  me.TextBottom = TextBaseline
		  
		  // Draw the text
		  g1.DrawString(TheText,me.TextLeft,TextBaseline)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawMe(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  DrawLabel(g1)
		  DrawCalander(g1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrepClass()
		  
		  
		  
		  SetUpPartsDict
		  SetCalCoordinates
		  
		  
		  Prepped = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCalCoordinates()
		  
		  
		  
		  
		  // Determine Calander Coordinates
		  CalRight =me.Width
		  CalHeight = me.Height * 0.8
		  CalWidth = CalHeight
		  CalLeft = CalRight - CalWidth - 1
		  CalTop = 0  'me.Height * 0.05
		  CalBottom = CalTop + CalHeight
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPartState(PartName as string, PartState as string)
		  
		  
		  
		  For i1 as integer = 0 To parts.Ubound
		    
		    If parts(i1).Value("PartName") = PartName Then
		      parts(i1).Value("PartState") = PartState
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUpPartsDict()
		  
		  
		  
		  ReDim Parts(1)
		  
		  Parts(0) = New Dictionary
		  Parts(0).Value("PartName") = "Label"
		  Parts(0).Value("PartState") = "Normal"
		  
		  Parts(1) = New Dictionary
		  Parts(1).Value("PartName") = "Calender"
		  Parts(1).Value("PartState") = "Normal"
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CalenderClicked(X as integer, Y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event OtisPaint()
	#tag EndHook


	#tag Property, Flags = &h0
		CalBottom As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CalHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CalLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CalRight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CalTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CalWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LabelCenter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LabelText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MouseDownOn As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			An array of dictionaries all with the following structure
			
			PartName
			PartState
		#tag EndNote
		Parts() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Prepped As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TextBottom As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextRight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextTop As Integer
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
			Name="CalBottom"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CalHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CalLeft"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CalRight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CalTop"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CalWidth"
			Group="Behavior"
			Type="Integer"
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
			Name="LabelCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LabelText"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="MouseDownOn"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Prepped"
			Group="Behavior"
			Type="Boolean"
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
			Name="TextBottom"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextLeft"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextRight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextTop"
			Group="Behavior"
			Type="Integer"
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
