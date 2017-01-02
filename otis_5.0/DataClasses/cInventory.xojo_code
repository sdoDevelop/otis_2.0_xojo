#tag Class
Protected Class cInventory
	#tag Method, Flags = &h0
		Sub LoadMe()
		  
		  sOrderByFields = "item_department,item_manufacturer,item_name"
		  
		  // Load all inventory into the items variable
		  aroItems() = datafile.tbl_inventory.List(sCondition,sOrderByFields)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aroItems() As DataFile.tbl_inventory
	#tag EndProperty

	#tag Property, Flags = &h0
		sCondition As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sOrderByFields As String = "item_subcategory"
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
