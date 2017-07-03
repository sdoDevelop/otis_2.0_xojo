#tag Class
Protected Class tbl_contact_methods
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
		  
		  ars.Append "From tbl_contact_methods"
		  
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
		Shared Function FindByID(id as Integer) As DataFile.tbl_contact_methods
		  //Usage:
		  //dim tbl_contact_methods as DataFile.tbl_contact_methods = DataFile.tbl_contact_methods.FindByID( id )
		  dim s as string
		  s = "Select * from tbl_contact_methods WHERE pkid = " + str(id)
		  
		  dim rs as RecordSet = DB.SQLSelect(s)
		  
		  if DB.error then
		    System.debugLog DB.ErrorMessage
		    return nil
		  end
		  if rs.RecordCount = 0 then return nil
		  
		  dim tbl_contact_methods as new DataFile.tbl_contact_methods
		  tbl_contact_methods.ReadRecord(rs)
		  return tbl_contact_methods
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(stmt as PreparedSQLStatement) As DataFile.tbl_contact_methods()
		  //Note: You should use this method if your query contains user entered data. Using this method will help prevent SQL injection attacks
		  dim aro() as DataFile.tbl_contact_methods
		  
		  dim rs as recordset = stmt.SQLSelect
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return aro
		  end
		  
		  while rs.eof = false
		    dim oRecord as new DataFile.tbl_contact_methods
		    oRecord.ReadRecord(rs)
		    aro.Append oRecord
		    rs.MoveNext
		  wend
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(sCriteria as string = "", sOrder as string = "", iOffset as Integer = -1) As DataFile.tbl_contact_methods()
		  //Note: You should not use this method if your query contains user entered data.
		  //Using this method with user entered data could expose you to SQL injection attacks.
		  dim aro() as DataFile.tbl_contact_methods
		  dim ars() as string
		  
		  
		  ars.append DataFile.tbl_contact_methods.BaseSQL
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
		    dim oRecord as new DataFile.tbl_contact_methods
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
		  
		  
		  ars.append DataFile.tbl_contact_methods.BaseSQL(True)
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
		Shared Function ListGrouped(sCriteria as string = "", sOrder as string = "", sGroupBy as String = "") As Dictionary
		  dim jsMaster as New Dictionary
		  dim oRecordList() as DataFile.tbl_contact_methods
		  
		  If sGroupBy = "" Then
		    Return Nil
		  End If
		  
		  // Lets get the complete list of records from the database
		  oRecordList() = DataFile.tbl_contact_methods.List(sCriteria, sOrder)
		  
		  // now we need to loop through each one of the records and startp putting them in there place
		  dim sGroupByList() as string = sGroupBy.split(", ")
		  dim jsCurrent() as Dictionary
		  dim idx_record as integer
		  For Each oRecord as DataFile.tbl_contact_methods In oRecordList()
		    
		    jsCurrent.append( jsMaster)
		    
		    dim jsFieldValues as JSONItem = oRecord.GetMyFieldValues(True)
		    
		    
		    For idx1 as integer = 0 To sGroupByList.Ubound
		      
		      dim sGroupField as string = sGroupByList(idx1)
		      dim n3 as integer = jsCurrent.Ubound
		      dim sGroupValue as String =  jsFieldValues.Value(sGroupField)
		      
		      // Check if this record fits into any existing groups
		      dim sArray() as string
		      for Each vKey as Variant In jsCurrent(n3).Keys
		        sArray.Append( str( vKey ) )
		      Next
		      'If jsCurrent(n3).Keys.IndexOf( sGroupValue ) > -1 Then
		      If sArray.IndexOf( sGroupValue ) > -1 THen
		        ' there is a place for this record at this level
		        
		        ' now we check if the value of the current level group is a jsonitem, array, or s"none"
		        If jsCurrent(n3).Value( sGroupValue ) IsA Dictionary Then
		          ' we must dig depper into jsonitems
		          
		          jsCurrent.Append( jsCurrent(n3).Value( sGroupValue ) )
		          Continue
		          
		        Elseif jsCurrent(n3).Value( sGroupValue ) IsA DataFile.tbl_contact_methods Then
		          ' we can put the record here
		          
		        Else
		          
		          #Pragma BreakOnExceptions Off
		          Try
		            // pull the array of records from the value
		            dim oRecords() as DataFile.tbl_contact_methods
		            oRecords() = jsCurrent(n3).Value(sGroupValue)
		            oRecords.Append(oRecord)
		            jsCurrent(n3).Value(sGroupValue) = oRecords
		            Continue
		          Exception
		          End Try
		          #Pragma BreakOnExceptions Default
		          
		          'ElseIf jsCurrent(n3).Value( sGroupValue ) IsA String THen
		          If jsCurrent(n3).Value( sGroupValue ) = "none" THen
		            
		            // We need to check if this is the last group by field
		            If idx1 = sGroupByList.Ubound Then
		              // this is the last of the group by fields so we can put an array with this record in the value
		              dim oRecords() as DataFile.tbl_contact_methods
		              oRecords.Append( oRecord )
		              jsCurrent(n3).Value( sGroupValue ) = oRecords
		            Else
		              // We still need to group by deeper
		              // we will continue on the loop so as to advance the level of deepness by one group creating field
		              jsCurrent(n3).Value( sGroupValue ) = New Dictionary
		              jsCurrent.Append( jsCurrent(n3).Value( sGroupValue ) )
		              Continue
		            End If
		          End If
		          
		        End If
		        
		      Else
		        ' There is no place created for this record at this level
		        
		        // we will create a new key for this unique value and mark it as s"none" 
		        jsCurrent(n3).Value( sGroupValue ) = "none"
		        
		        // Now we will continue on with our looping with the index backtracked so we will try to categorize this record with this new key created
		        idx1 = idx1 - 1
		        Continue
		        
		      End If
		    Next
		    
		    ReDim jsCurrent(-1)
		    idx_record = idx_record + 1
		  Next
		  
		  Return jsMaster
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bhide As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bprimary_method As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ifkcontactables As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		smethod As String
	#tag EndProperty

	#tag Property, Flags = &h0
		smethod_location As String
	#tag EndProperty

	#tag Property, Flags = &h0
		smethod_type As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="bprimary_method"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ifkcontactables"
			Group="Behavior"
			Type="Int64"
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
			Name="smethod"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="smethod_type"
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