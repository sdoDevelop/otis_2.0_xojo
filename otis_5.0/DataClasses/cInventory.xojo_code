#tag Class
Protected Class cInventory
	#tag Method, Flags = &h0
		Sub LoadMe()
		  
		  jsGroupedItems = New Dictionary
		  
		  // Load all inventory into the items variable
		  aroItems() = datafile.tbl_inventory.List(sCondition,sOrderByFields)
		  
		  sOrderByFields = "item_department,item_manufacturer,item_name"
		  If bGrouped Then
		    
		    // Grab the inventory in groups
		    dim arvValues() as Variant
		    dim dictValues as New Dictionary
		    
		    // Loop through all of the items and make an array of all unique values in the group by column
		    For each item as DataFile.tbl_inventory in aroItems()
		      dim jsFieldValues as JSONItem
		      jsFieldValues = item.GetMyFieldValues(True)
		      
		      'dim dictCopy as New Dictionary
		      'dim sKeys() as String
		      'sKeys = jsFieldValues.Names
		      'For i1 as integer = 0 To sKeys.Ubound
		      
		      'dictCopy.Value(sKeys(i1)) = jsFieldValues(sKeys(i1))
		      
		      'Next
		      
		      dim vCurrentValue as Variant
		      vCurrentValue = jsFieldValues.Value(sGroupBy)
		      'If arvValues.IndexOf(vCurrentValue.Hash) = -1 Then
		      If Not dictValues.HasKey(vCurrentValue) Then
		        // Add value to array
		        dictValues.Value(vCurrentValue) = ""
		        'arvValues.Append(vCurrentValue)
		      End If
		      
		    Next
		    
		    arvValues = dictValues.Keys
		    
		    dim aroGroups() as DataFile.tbl_inventory
		    // Now we have all unique values
		    For i1 as integer = 0 To arvValues.Ubound
		      dim aroSingleGroup() as DataFile.tbl_inventory
		      
		      //should probably do sql binding
		      dim stheCondition as string
		      
		      stheCondition = sGroupBy + " = '" + arvValues(i1) + "'"
		      aroSingleGroup = datafile.tbl_inventory.List(stheCondition,sOrderByFields)
		      
		      jsGroupedItems.value( arvValues(i1) ) = aroSingleGroup
		      
		    Next
		    
		    
		  End If
		  
		  'dim test1() as DataFile.tbl_inventory
		  'test1 = jsGroupedItems(0)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aroItems() As DataFile.tbl_inventory
	#tag EndProperty

	#tag Property, Flags = &h0
		bGrouped As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		jsGroupedItems As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		sCondition As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sGroupBy As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sOrderByFields As String = "item_subcategory"
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="bGrouped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="sCondition"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sGroupBy"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sOrderByFields"
			Group="Behavior"
			InitialValue="item_subcategory"
			Type="String"
			EditorType="MultiLineEditor"
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
