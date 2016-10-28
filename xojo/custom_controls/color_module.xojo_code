#tag Module
Protected Module color_module
	#tag Method, Flags = &h0
		Function get_color(base_color as string, index as integer) As Color
		  dim colors() as Color
		  dim c as color
		  
		  Select Case base_color
		  Case "Blue"
		    
		    c = &c011C38
		    colors.Append(c)
		    
		    c = &c042C55
		    colors.Append(c)
		    
		    c = &c07396C
		    colors.Append(c)
		    
		    c = &c0E4782
		    colors.Append(c)
		    
		    c = &c255E99
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
		    
		    c = RGB(48,48,48)
		    colors.Append(c)
		    
		    c = RGB(58,58,58)
		    colors.Append(c)
		    
		    c = RGB(68,68,68)
		    colors.Append(c)
		    
		    c = RGB(78,78,78)
		    colors.Append(c)
		    
		    c = RGB(138,138,138)
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
