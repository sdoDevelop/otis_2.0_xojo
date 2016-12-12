#tag Class
Protected Class ResourceClass
	#tag Method, Flags = &h0
		Function Exists() As Boolean
		  Dim ReturnValue as Boolean
		  
		  
		  If FilePath <> Nil Then
		    
		    If FilePath.Exists Then
		      ReturnValue = True
		    Else
		      ReturnValue = False
		    End If
		    
		    ReturnValue = False
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		FilePath As FolderItem
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
