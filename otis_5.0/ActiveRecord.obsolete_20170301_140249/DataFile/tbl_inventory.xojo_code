#tag Class
Protected Class tbl_inventory
Inherits DataFile.ActiveRecordBase
	#tag Event
		Sub PostDelete()
		  
		  // Grab all the link children of this record from the database
		  dim oLinkChildren() as DataFile.tbl_inventory_link
		  oLinkChildren() = DataFile.tbl_inventory_link.List 
		  
		  
		  
		  For Each oLinkChild as DataFile.tbl_inventory_link In oLinkChildren
		    
		    // Grab the inventory item
		    dim oItem as DataFile.tbl_inventory
		    oItem = DataFile.tbl_inventory.FindByID(oLinkChild.ifkinventory_child)
		    
		    
		    
		    oLinkChild.Delete
		    
		  Next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function BaseSQL(bAsCount as Boolean = false) As String
		  dim ars() as string
		  
		  ars.Append "select "
		  if bAsCount = false then
		    ars.Append "*"
		  else
		    ars.Append "count(*) as iCnt"
		  end if
		  
		  ars.Append "From tbl_inventory"
		  
		  Return ars.JoinSQL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteOK(Byref sError as string) As Boolean
		  //Add your delete Validation here
		  
		  //Use sError to provide feedback to the user.
		  //Example:
		  //sError = "This Record cannot be deleted because xyz"
		  
		  
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindByID(id as Integer) As DataFile.tbl_inventory
		  //Usage:
		  //dim tbl_inventory as DataFile.tbl_inventory = DataFile.tbl_inventory.FindByID( id )
		  dim s as string
		  s = "Select * from tbl_inventory WHERE pkid = " + str(id)
		  
		  dim rs as RecordSet = DB.SQLSelect(s)
		  
		  if DB.error then
		    System.debugLog DB.ErrorMessage
		    return nil
		  end
		  if rs.RecordCount = 0 then return nil
		  
		  dim tbl_inventory as new DataFile.tbl_inventory
		  tbl_inventory.ReadRecord(rs)
		  return tbl_inventory
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(stmt as PreparedSQLStatement) As DataFile.tbl_inventory()
		  //Note: You should use this method if your query contains user entered data. Using this method will help prevent SQL injection attacks
		  dim aro() as DataFile.tbl_inventory
		  
		  dim rs as recordset = stmt.SQLSelect
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return aro
		  end
		  
		  while rs.eof = false
		    dim oRecord as new DataFile.tbl_inventory
		    oRecord.ReadRecord(rs)
		    aro.Append oRecord
		    rs.MoveNext
		  wend
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(sCriteria as string = "", sOrder as string = "", iOffset as Integer = -1) As DataFile.tbl_inventory()
		  //Note: You should not use this method if your query contains user entered data.
		  //Using this method with user entered data could expose you to SQL injection attacks.
		  dim aro() as DataFile.tbl_inventory
		  dim ars() as string
		  
		  
		  ars.append DataFile.tbl_inventory.BaseSQL
		  if sCriteria.Trim <> "" then
		    ars.append "WHERE " + sCriteria
		  end if
		  
		  if sOrder.trim <> "" then
		    ars.append " ORDER BY " + sOrder
		  else
		    'ars.append "<Your Field Here>"
		  end if
		  
		  if iOffset > -1 then
		    ars.append " LIMIT " + str(kMaxReturn) + " Offset " + str(iOffset)
		  end if
		  
		  dim s as string = ars.JoinSQL
		  dim rs as RecordSet = DB.SQLSelect(s)
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return aro
		  end
		  
		  do until rs.EOF
		    dim oRecord as new DataFile.tbl_inventory
		    oRecord.ReadRecord(rs)
		    
		    aro.Append(oRecord)
		    rs.MoveNext
		  loop
		  
		  
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListCount(stmt as PreparedSQLStatement) As Integer
		  //Note: You should use this method if your query contains user entered data. Using this method will help prevent SQL injection attacks
		  
		  dim rs as Recordset = stmt.SQLSelect
		  
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return 0
		  end
		  return rs.Field("iCnt").IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListCount(sCriteria as string = "") As Integer
		  //Note: You should not use this method if your query contains user entered data.
		  //Using this method with user entered data could expose you to SQL injection attacks.
		  dim ars() as string
		  
		  
		  ars.append DataFile.tbl_inventory.BaseSQL(True)
		  if sCriteria<>"" then
		    ars.append "WHERE " + sCriteria
		  end if
		  dim s as string = ars.JoinSQL
		  dim rs as RecordSet = DB.SQLSelect(s)
		  
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return 0
		  end
		  return rs.Field("iCnt").IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListGrouped(sCriteria as string = "", sOrder as string, iOffset as integer = -1) As Dictionary
		  // Returns a dictionary with keys as group names and values as an array of DataFile.tbl_inventory
		  
		  dim dictReturn as New Dictionary
		  
		  // Load the entire inventory into a varialbe
		  dim oItems() as DataFile.tbl_inventory
		  oItems() = DataFile.tbl_inventory.List(sCriteria, sOrder, iOffset)
		  
		  dim sOrderByFields() as String
		  dim sGroupField as String
		  
		  //Find the field that we are grouping by
		  '          It is the first field of the order by clause
		  sOrderByFields() = sOrder.split(",")
		  sGroupField = sOrderByFields(0)
		  
		  dim sCurrentGroupName as String
		  dim oCurrentGroup() as DataFile.tbl_inventory
		  
		  // Loop through the inventory
		  For each oItem as DataFile.tbl_inventory In oItems
		    dim jsFieldValues as JSONItem
		    
		    // Get the field value pairs as a json item of this item
		    jsFieldValues = oItem.GetMyFieldValues(True)
		    
		    // Check to see if the Current group name is the same as the one in this item
		    If jsFieldValues.Value(sGroupField) <> sCurrentGroupName then
		      ' The current group and the current item differ
		      
		      // Check if there is anything in the current group
		      If oCurrentGroup.Ubound <> -1 Then
		        ' The current group is not empty
		        
		        // Store the current group in the return dict
		        '          We have to make a copy of the Array otherwise we get right fucked
		        dim StupidDamnArrays() as DataFile.tbl_inventory
		        For Each oElement as DataFile.tbl_inventory In oCurrentGroup
		          StupidDamnArrays.Append(oElement)
		        Next
		        dictReturn.Value(sCurrentGroupName) = StupidDamnArrays
		        
		        // Clear the current group 
		        ReDim oCurrentGroup(-1)
		        
		        // update the current group name
		        sCurrentGroupName = jsFieldValues.Value(sGroupField)
		        
		      Else
		        sCurrentGroupName = jsFieldValues.Value(sGroupField)
		      End If
		      
		    End If
		    
		    // Add the current item to the current group array
		    oCurrentGroup.Append(oItem)
		    
		  Next
		  
		  If oCurrentGroup.Ubound <> -1 Then
		    dim StupidDamnArrays() as DataFile.tbl_inventory
		    For Each oElement as DataFile.tbl_inventory In oCurrentGroup
		      StupidDamnArrays.Append(oElement)
		    Next
		    dictReturn.Value(sCurrentGroupName) = oCurrentGroup
		  End If
		  
		  Return dictReturn
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bhide As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bitem_taxable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bphysical_item As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bshow_items As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bshow_items_discreetly As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		iitem_purchase_price_cost As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iitem_quantity As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iitem_rental_price_cost As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iitem_sale_price_cost As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_barcode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_category As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_department As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_depth As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_description As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_height As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_manufacturer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_model As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_owner As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_rfid_code As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_serial_code As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_status As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_subcategory As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_weight As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sitem_width As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="bhide"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bitem_taxable"
			Group="Behavior"
			Type="Boolean"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bphysical_item"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bshow_items"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bshow_items_discreetly"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iitem_quantity"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iitem_rental_price_cost"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ipkid"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastInsertID"
			Group="Behavior"
			Type="Int64"
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
			Name="sitem_barcode"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_category"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_department"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_depth"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_height"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_manufacturer"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_model"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_name"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_owner"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_rfid_code"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_serial_code"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_status"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_subcategory"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_weight"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sitem_width"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="srow_created"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="srow_modified"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="srow_username"
			Group="Behavior"
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
