#tag Class
Protected Class OtisContainer
Inherits ContainerControl
	#tag Event
		Sub Open()
		  
		  
		  For i1 as integer = 0 To self.ControlCount - 1
		    
		    dim c1 as control
		    c1 = self.Control(i1)
		    
		    If c1 IsA OtisCanvas Then
		      OtisCanvas(c1).ParentContainer = self
		    End If
		    If c1 IsA OtisCanvas Then
		      OtisCanvas(c1).ParentContainer = self
		    End If
		    
		  Next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AdvanceEdit() As Boolean
		  // returns true if we are still editing
		  // returns false if we are done editing
		  
		  
		  Dim theFocus as String
		  dim c1 as control
		  dim oc2 as OtisCanvas
		  
		  theFocus = WhoHasFocus
		  
		  dim x1 as integer = FindControlByName(theFocus)
		  c1 = me.Control(x1)
		  
		  
		  If c1 <> Nil Then
		    
		    If c1 IsA OtisCanvas Then
		      dim oc1 as OtisCanvas = OtisCanvas(c1)
		      
		      'advance the edit selection
		      If Not oc1.AdvanceMe Then
		        'if we are done editing this control we advance the tab and start editing that one
		        oc2 = NextInTab(theFocus)
		        
		        If oc2 <> Nil Then
		          If Not oc2.AdvanceMe Then
		            
		          End If
		        End If
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindControlByName(Name as String) As Integer
		  
		  
		  For i1 as integer = 0 To me.ControlCount - 1 
		    
		    dim c1 as Control
		    c1 = me.Control(i1)
		    If c1.Name = Name Then
		      Return i1
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextInTab(CurrentControl as String) As OtisCanvas
		  Dim TheCurrentControl as Control
		  Dim CurrentControlIndex,CurrentTab as integer
		  
		  
		  CurrentControlIndex = FindControlByName( CurrentControl )
		  TheCurrentControl = me.Control( CurrentControlIndex )
		  
		  If TheCurrentControl IsA OtisCanvas Then
		    
		    Dim CurrentOtisCanvas As OtisCanvas = OtisCanvas(TheCurrentControl )
		    CurrentTab = CurrentOtisCanvas.TabIndex
		    
		    for i1 as integer = 0 To me.ControlCount - 1
		      
		      Dim LoopControl as Control
		      Dim LoopOtisCanvas as OtisCanvas
		      
		      LoopControl = me.Control(i1)
		      If LoopControl IsA OtisCanvas Then
		        
		        LoopOtisCanvas = OtisCanvas(LoopControl)
		        If LoopOtisCanvas.TabIndex = CurrentTab +1 then
		          
		          Return LoopOtisCanvas
		        End If
		      End If
		    next
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhoHasFocus() As String
		  Dim ReturnValue as String
		  
		  For i1 as integer = 0 To me.ControlCount - 1
		    
		    dim c1 as control = me.Control(i1)
		    If c1 IsA OtisCanvas Then
		      
		      dim oc1 as OtisCanvas = OtisCanvas(c1)
		      If oc1.CurrentEdit <> "" Then
		        ReturnValue = oc1.Name
		        exit
		      End If
		    End If
		  Next
		  
		  Return ReturnValue
		End Function
	#tag EndMethod


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
			InitialValue="0"
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
			InitialValue="0"
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
End Class
#tag EndClass
