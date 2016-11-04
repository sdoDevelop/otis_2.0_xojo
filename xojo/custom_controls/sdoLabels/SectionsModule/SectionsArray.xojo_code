#tag Class
Protected Class SectionsArray
	#tag Method, Flags = &h0
		Sub Constructor(TheUbound as integer)
		  
		  
		  
		  Redim Data(TheUbound)
		  
		  For i1 as integer = 0 To TheUbound
		    
		    data(i1) =  New SectionsModule.SectionClass
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NameIndex(TheName as string) As Integer
		  
		  
		  For i1 as integer = 0 To me.Data.Ubound
		    
		    If TheName = me.Data(i1).Name Then
		      Return i1
		    End If
		    
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Data() As SectionsModule.SectionClass
	#tag EndProperty


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
End Class
#tag EndClass
