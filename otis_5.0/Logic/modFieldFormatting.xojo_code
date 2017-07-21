#tag Module
Protected Module modFieldFormatting
	#tag Method, Flags = &h1
		Protected Function GetFormattingString(sFieldPath as String) As String
		  
		  dim sTableName, sFieldName, sArray() as String
		  sArray = sFieldPath.Split(".")
		  If sArray.Ubound = 1 Then
		    sTableName = sArray(0)
		    sFieldName = sArray(1)
		  End If
		  
		  Select Case sTableName
		  Case "tbl_lineitems"
		    Select Case sFieldName
		    Case "li_price"
		      Return tbl_lineitems.li_price
		    End Select
		    
		    
		    
		  End Select
		  
		  Return ""
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
