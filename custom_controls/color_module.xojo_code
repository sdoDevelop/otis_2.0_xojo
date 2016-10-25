#tag Module
Protected Module color_module
	#tag Method, Flags = &h0
		Function get_color(base_color as string, index as integer) As Color
		  dim colors() as Color
		  dim c as color
		  
		  Select Case base_color
		  Case "Blue"
		    
		    c = RGB(13,78,146)
		    colors.Append(c)
		    
		    c = RGB(11,68,127)
		    colors.Append(c)
		    
		    c = RGB(23,136,255)
		    colors.Append(c)
		    
		    c = RGB(3,18,33)
		    colors.Append(c)
		    
		    c = RGB(20,123,229)
		    colors.Append(c)
		    
		  Case "Red"
		    
		    c = RGB(127,67,62)
		    colors.Append(c)
		    
		    c = RGB(204,50,38)
		    colors.Append(c)
		    
		    c = RGB(255,63,48)
		    colors.Append(c)
		    
		    c = RGB(255,134,124)
		    colors.Append(c)
		    
		    
		  Case "Gray"
		    
		    c = RGB(28,28,28)
		    colors.Append(c)
		    
		    c = RGB(38,38,38)
		    colors.Append(c)
		    
		    c = RGB(65,65,65)
		    colors.Append(c)
		    
		    c = RGB(75,75,75)
		    colors.Append(c)
		    
		    c = RGB(135,135,135)
		    colors.Append(c)
		    
		    c = RGB(145,145,145)
		    colors.Append(c)
		    
		  Case "Text"
		    
		    c = RGB(235,235,235)
		    Return c
		    
		  End Select
		  
		  Return colors(index)
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
