#tag Class
Protected Class sdoCanvas
Inherits Canvas
	#tag Event
		Sub Open()
		  
		  
		  
		  
		  ' do all initial value settings in this event
		  RaiseEvent Initialize
		  
		  OpenMethod
		  
		  
		  RaiseEvent PropogateOpen
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim g1 as Graphics = g
		  
		  
		  
		  PaintMethod(g1)
		  
		  PropogatePaint(g1)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub DrawBackground(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  
		  g1.ForeColor = BackgroundColor
		  g1.FillRoundRect(0,0,me.Width,me.Height,CornerArc,CornerArc)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawBorders(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  
		  g1.ForeColor = BorderColor
		  g1.DrawRoundRect(0,0,me.Width,me.Height,CornerArc,CornerArc)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OpenMethod()
		  
		  
		  #If TargetWin32 Then
		    DoubleBuffer = True
		  #Else
		    DoubleBuffer = False
		  #endif
		  
		  me.AcceptFocus = True
		  
		  // Set up some variables
		  State = New Dictionary
		  
		  'BackgroundColor = New Color
		  'BorderColor = New Color
		  
		  
		  SetCoordinates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PaintMethod(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  SetCoordinates
		  
		  If Not Transparent Then
		    DrawBackground(g1)
		  End If
		  
		  If Borders Then
		    DrawBorders(g1)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetCoordinates()
		  
		  
		  HalfHorizontal = Width / 2
		  HalfVertical = Height / 2
		  CenterHorizontal = Left + Floor( Width / 2 )
		  CenterVertical = Top + Floor(Height / 2)
		  Right = Left + Width
		  Bottom = Top + Height
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Initialize()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PropogateOpen()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PropogatePaint(g as Graphics)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event sdoOpen()
	#tag EndHook


	#tag Property, Flags = &h0
		BackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Borders As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Bottom As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CenterHorizontal As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CenterVertical As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CornerArc As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HalfHorizontal As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HalfVertical As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Right As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			
			Normal
			Hover
			Pressed
			Disabled
		#tag EndNote
		Protected State As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Transparent As Boolean
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
