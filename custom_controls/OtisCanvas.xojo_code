#tag Class
Protected Class OtisCanvas
Inherits Canvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  
		  // Draw Borders
		  ResetBackground(g)
		  
		  
		  
		  // 
		  RaiseEvent OtisPaint(g)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AdvanceMe() As Boolean
		  Dim ReturnValue as Boolean
		  
		  
		  If me IsA OtisTimePicker Then
		    ReturnValue = OtisTimePicker(me).AdvanceEdit
		  ElseIf me IsA OtisDatePicker Then
		    ReturnValue = OtisDatePicker(me).AdvanceEdit
		  End If
		  
		  If 1=2 Then //Not ReturnValue Then
		    dim oc1 as OtisContainer = me.ParentContainer
		    If oc1 <> Nil Then
		      If Not oc1.AdvanceEdit Then
		        
		      End If
		      
		    End If
		  End If
		  
		  Return ReturnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GoRed(GraphicObject as Graphics)
		  Dim g1 as Graphics = GraphicObject
		  
		  
		  
		  g1.Transparency = 50
		  g1.ForeColor = get_color("Red",1)
		  g1.FillRect(0,0,me.Width,me.Height)
		  g1.Transparency = 0
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub KillFocus()
		  
		  
		  UniCloseUserEdit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetBackground(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  
		  
		  
		  g1.ForeColor = get_color("Gray",3)
		  g1.FillRoundRect(0,0,me.Width,me.Height,2,2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UniCloseUserEdit()
		  
		  
		  If  me IsA OtisTimePicker Then
		    OtisTimePicker(me).CloseUserEdit
		  ElseIf me IsA OtisDatePicker Then
		    OtisDatePicker(me).CloseUserEdit
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event OtisPaint(g as Graphics)
	#tag EndHook


	#tag Property, Flags = &h0
		CurrentEdit As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ParentContainer As OtisContainer
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
			Name="CurrentEdit"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
	#tag EndViewBehavior
End Class
#tag EndClass
