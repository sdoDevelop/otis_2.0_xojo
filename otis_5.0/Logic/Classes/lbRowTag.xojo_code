#tag Class
Protected Class lbRowTag
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(oRecord as DataFile.tbl_inventory, sFieldNames() as string)
		  
		  
		  // First we extract the field names and values as a json item
		  dim jsFieldValues as new JSONItem
		  jsFieldValues = oRecord.GetMyFieldValues(True)
		  
		  // Loop through each field that was specified
		  For each CurrentField as string in sFieldNames
		    
		    dim s1 as string = jsFieldValues.value(CurrentField)
		    If CurrentField.InStr("_cost") <> 0  Then
		      dim s2 as string = ConvertCentsString_To_DollarString(s1)
		      s1 = s2
		    End If
		    vColumnValues.Append(s1 )
		    
		  Next
		  
		  // Set the pkid 
		  pkid = jsFieldValues.Value("pkid")
		  
		  // Put the oRecord into the rowtag
		  vtblRecord = oRecord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsItem() As Boolean
		  
		  If vtblRecord <> Nil Then
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		aroChildren() As lbRowTag
	#tag EndProperty

	#tag Property, Flags = &h0
		iCellTypes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iFolderLevel As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		isFolder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pkid As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			GroupFolder
			GrandParent
			LinkingTypeFolder
			LinkedItem
		#tag EndNote
		sRowType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sSubRowType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		vColumnValues() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		vLinkTable As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		vtblRecord As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="iFolderLevel"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isFolder"
			Group="Behavior"
			Type="Boolean"
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
			Name="pkid"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sRowType"
			Group="Behavior"
			Type="Boolean"
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
