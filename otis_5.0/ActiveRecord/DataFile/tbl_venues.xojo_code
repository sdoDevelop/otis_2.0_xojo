#tag Class
Protected Class tbl_venues
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
		  
		  ars.Append "From tbl_venues"
		  
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
		Shared Function FindByID(id as Integer) As DataFile.tbl_venues
		  //Usage:
		  //dim tbl_venues as DataFile.tbl_venues = DataFile.tbl_venues.FindByID( id )
		  dim s as string
		  s = "Select * from tbl_venues WHERE pkid = " + str(id)
		  
		  dim rs as RecordSet = DB.SQLSelect(s)
		  
		  if DB.error then
		    System.debugLog DB.ErrorMessage
		    return nil
		  end
		  if rs.RecordCount = 0 then return nil
		  
		  dim tbl_venues as new DataFile.tbl_venues
		  tbl_venues.ReadRecord(rs)
		  return tbl_venues
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(stmt as PreparedSQLStatement) As DataFile.tbl_venues()
		  //Note: You should use this method if your query contains user entered data. Using this method will help prevent SQL injection attacks
		  dim aro() as DataFile.tbl_venues
		  
		  dim rs as recordset = stmt.SQLSelect
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return aro
		  end
		  
		  while rs.eof = false
		    dim oRecord as new DataFile.tbl_venues
		    oRecord.ReadRecord(rs)
		    aro.Append oRecord
		    rs.MoveNext
		  wend
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(sCriteria as string = "", sOrder as string = "", iOffset as Integer = -1) As DataFile.tbl_venues()
		  //Note: You should not use this method if your query contains user entered data.
		  //Using this method with user entered data could expose you to SQL injection attacks.
		  dim aro() as DataFile.tbl_venues
		  dim ars() as string
		  
		  
		  ars.append DataFile.tbl_venues.BaseSQL
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
		    dim oRecord as new DataFile.tbl_venues
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
		  
		  
		  ars.append DataFile.tbl_venues.BaseSQL(True)
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
		sfkconven As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sphone_number As String
	#tag EndProperty

	#tag Property, Flags = &h0
		svenue_company As String
	#tag EndProperty

	#tag Property, Flags = &h0
		svenue_email As String
	#tag EndProperty

	#tag Property, Flags = &h0
		svenue_name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		svenue_type As String
	#tag EndProperty


	#tag ViewBehavior
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
			Name="sfkconven"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sphone_number"
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
			Name="svenue_company"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="svenue_email"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="svenue_name"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="svenue_type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
