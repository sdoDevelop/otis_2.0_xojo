#tag Class
Protected Class tbl_contactables
Inherits DataFile.ActiveRecordBase
	#tag Method, Flags = &h0
		Shared Function BaseSQL(bAsCount as Boolean = false) As String
		  dim ars() as string
		  
		  ars.Append "select "
		  if bAsCount = false then
		    ars.Append "*"
		  else
		    ars.Append "count(*) as iCnt"
		  end if
		  
		  ars.Append "From tbl_contactables"
		  
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
		Shared Function FindByID(id as Integer) As DataFile.tbl_contactables
		  //Usage:
		  //dim tbl_contactables as DataFile.tbl_contactables = DataFile.tbl_contactables.FindByID( id )
		  dim s as string
		  s = "Select * from tbl_contactables WHERE pkid = " + str(id)
		  
		  dim rs as RecordSet = DB.SQLSelect(s)
		  
		  if DB.error then
		    System.debugLog DB.ErrorMessage
		    return nil
		  end
		  if rs.RecordCount = 0 then return nil
		  
		  dim tbl_contactables as new DataFile.tbl_contactables
		  tbl_contactables.ReadRecord(rs)
		  return tbl_contactables
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(stmt as PreparedSQLStatement) As DataFile.tbl_contactables()
		  //Note: You should use this method if your query contains user entered data. Using this method will help prevent SQL injection attacks
		  dim aro() as DataFile.tbl_contactables
		  
		  dim rs as recordset = stmt.SQLSelect
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return aro
		  end
		  
		  while rs.eof = false
		    dim oRecord as new DataFile.tbl_contactables
		    oRecord.ReadRecord(rs)
		    aro.Append oRecord
		    rs.MoveNext
		  wend
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(sCriteria as string = "", sOrder as string = "", iOffset as Integer = -1) As DataFile.tbl_contactables()
		  //Note: You should not use this method if your query contains user entered data.
		  //Using this method with user entered data could expose you to SQL injection attacks.
		  dim aro() as DataFile.tbl_contactables
		  dim ars() as string
		  
		  
		  ars.append DataFile.tbl_contactables.BaseSQL
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
		    dim oRecord as new DataFile.tbl_contactables
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
		  
		  
		  ars.append DataFile.tbl_contactables.BaseSQL(True)
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
		Sub ListGrouped(sCriteria as String = "", sOrder as String = "", sGroupBy as String = "")
		  dim FullList() as DataFile.tbl_contactables
		  
		  
		  // Get the full list of events from the database
		  FullList() = DataFile.tbl_contactables.List(sCriteria, sOrder)
		  
		  
		  
		  // Now we loop through each field that we want to group by
		  dim s1() as String
		  s1() = Split(sGroupBy, ",")
		  dim LoopIndex as integer
		  For Each sGroupFieldName as String In s1()
		    
		    dim sCurValue, sCurGroup as String
		    
		    // Split the sGroupFieldName into its seperate table.field parts
		    dim sField, sTable as String
		    If sGroupFieldName.InStr(".") > 0 Then
		      ' there is a period in the sGroupFieldName meaning there is both a table name and field name
		      dim s87() as string = sGroupFieldName.Split(".")
		      If s87.Ubound = 1 Then
		        sTable = s87(0)
		        sField = s87(1)
		      Else
		        sField = sGroupFieldName
		      End If
		    Else
		      sField = sGroupFieldName
		    End If
		    
		    dim CurrentRecordList() as DataFile.tbl_contactables
		    If LoopIndex = 0 Then
		      CurrentRecordList() = FullList
		    End If
		    
		    // Now we loop through each record in the current record list
		    For Each Record as DataFile.tbl_contactables In CurrentRecordList()
		      
		      dim RelatedPhones() as DataFile.tbl_phone_numbers
		      dim RelatedEmails() as DataFile.tbl_email_addresses
		      dim jsFieldValues as JSONItem
		      dim sKeys() as String
		      
		      // Check if this group field is from a related table
		      If sTable <> "" Then
		        'it is
		        
		        // Check which table it is and get a copy of the primary record
		        If sTable = "tbl_phone_numbers" Then
		          dim RelatedRecords() as DataFile.tbl_phone_numbers
		          dim RelatedRecord as DataFile.tbl_phone_numbers
		          RelatedRecords = DataFile.tbl_phone_numbers.List("fkcontactables_parent = " + Record.ipkid.ToText + " And primary_phone = True")
		          If RelatedRecords.Ubound = -1 Then
		            RelatedRecords = DataFile.tbl_phone_numbers.List("fkcontactables_parent = " + Record.ipkid.ToText)
		          End If
		          If RelatedRecords.Ubound <> -1 Then
		            RelatedRecord = RelatedRecords(0)
		            jsFieldValues = RelatedRecord.GetMyFieldValues(True)
		          End If
		          
		        ElseIf sTable = "tbl_email_addresses" Then
		          dim RelatedRecords(), RelatedRecord as DataFile.tbl_email_addresses
		          RelatedRecords = DataFile.tbl_email_addresses.List("fkcontactables_parent = " + Record.ipkid.ToText + " And primary_phone = True")
		          If RelatedRecords.Ubound = -1 Then
		            RelatedRecords = DataFile.tbl_email_addresses.List("fkcontactables_parent = " + Record.ipkid.ToText)
		          End If
		          If RelatedRecords.Ubound <> -1 Then
		            RelatedRecord = RelatedRecords(0)
		            jsFieldValues = RelatedRecord.GetMyFieldValues(True)
		          End If
		          
		        Else
		          jsFieldValues = Record.GetMyFieldValues(True)
		        End If 
		        
		        // Get the keys in the json item
		        sKeys() = jsFieldValues.Names
		        
		        // Check to be sure that the field is in the current jsonitem
		        If sKeys.IndexOf(sField) <> 0 Then
		          ' the field it in the jsonitem
		          sCurValue = jsFieldValues.Value(sField)
		          
		          // Check if this record belongs in a new group or the current one
		          If sCurValue <> "" And sCurValue = sCurGroup Then
		            ' it belongs in the 
		            
		            
		            
		            
		            
		            
		            
		          End If
		    Next
		  Next
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Untitled()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bhide As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		saddress_city As String
	#tag EndProperty

	#tag Property, Flags = &h0
		saddress_country As String
	#tag EndProperty

	#tag Property, Flags = &h0
		saddress_line1 As String
	#tag EndProperty

	#tag Property, Flags = &h0
		saddress_line2 As String
	#tag EndProperty

	#tag Property, Flags = &h0
		saddress_state As String
	#tag EndProperty

	#tag Property, Flags = &h0
		saddress_zip As String
	#tag EndProperty

	#tag Property, Flags = &h0
		scompany As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sfkconven As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sindv_bus_ven As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sjob_title As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sname_first As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sname_last As String
	#tag EndProperty

	#tag Property, Flags = &h0
		stype As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="bhide"
			Group="Behavior"
			Type="Boolean"
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
			Name="saddress_city"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="saddress_country"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="saddress_line1"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="saddress_line2"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="saddress_state"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="saddress_zip"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="scompany"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sfkconven"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sindv_bus_ven"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sjob_title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sname_first"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sname_last"
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
			Name="stype"
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
