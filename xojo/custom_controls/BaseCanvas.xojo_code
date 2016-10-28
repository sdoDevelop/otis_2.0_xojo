#tag Class
Protected Class BaseCanvas
Inherits Canvas
	#tag Method, Flags = &h0
		Sub DrawBackground(GraphicsObject As Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  
		  If BackgroundColor <> &c000000 Then
		    
		    g1.ForeColor = BackgroundColor
		    
		    If RoundCorners Then
		      g1.FillRoundRect(0,0,me.Width,me.Height,CornerWidth,CornerHeight)
		    Else
		      g1.FillRect(0,0,me.Width,me.Height)
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDimensions()
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetHeight(TheTop as integer, TotalHeight as integer) As integer
		  // returns me right side
		  
		  
		  me.Top = TheTop
		  
		  If me.HeightIsFixed Then
		    
		    me.Height = me.DefaultHeight
		    
		  Else
		    
		    Dim x1 as integer
		    
		    x1 = me.DefaultHeight * TotalHeight
		    
		    If me.MaxHeight <> -1 Then
		      If x1 > me.MaxHeight  Then
		        me.Height = me.MaxHeight
		      Else
		        me.Height = x1
		      End If
		    Else
		      me.Height = x1
		    End If
		    
		  End If
		  
		  
		  Return me.Top + me.Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetWidth(TheLeft as integer,TotalWidth as integer) As integer
		  // returns me right side
		  
		  
		  me.Left = TheLeft
		  
		  If me.WidthIsFixed Then
		    
		    me.Width = me.DefaultWidth
		    
		  Else
		    
		    Dim x1 as integer
		    
		    x1 = me.DefaultWidth * TotalWidth
		    
		    If me.MaxWidth <> -1 Then
		      If x1 > me.MaxWidth  Then
		        me.Width = me.MaxWidth
		      Else
		        me.Width = x1
		      End If
		    Else
		      me.Width = x1
		    End If
		    
		  End If
		  
		  
		  Return me.Left + me.Width
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		CornerHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CornerWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		HeightIsFixed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RoundCorners As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		WidthIsFixed As Boolean
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
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
