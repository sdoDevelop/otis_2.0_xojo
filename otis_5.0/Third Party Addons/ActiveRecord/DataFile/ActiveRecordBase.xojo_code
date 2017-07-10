#tag Class
Protected Class ActiveRecordBase
Inherits BKS_ActiveRecord.Base
	#tag Event
		Sub AfterDelete()
		  
		  
		  If oChangeDescription <> Nil Then
		    // Store the Change Description in the local sync database
		    osm.StoreSync(oChangeDescription)
		  End If
		  
		  PostDelete
		End Sub
	#tag EndEvent

	#tag Event
		Sub AfterSave()
		  
		  If oChangeDescription <> Nil Then
		    // Store the Change Description in the local sync database
		    osm.StoreSync(oChangeDescription)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub AfterUpdate()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub BeforeCreate()
		  Dim StatementType as string
		  dim n1 as integer
		  
		  // DEFAULT VALUES
		  
		  // Add a pkid
		  n1 = Methods.GetNewPKID
		  me.ipkid = n1
		  
		  // create and modified dates
		  dim d1 as new date
		  me.srow_created = d1.SQLDateTime
		  me.srow_modified = d1.SQLDateTime
		  
		  // username
		  me.srow_username = app.sUserName
		  
		  // Trigger Pre Create Event 
		  PreCreate
		  
		  If me.IsModified Then
		    
		    // Get the values of all changed fields
		    Dim oJSON as New JSONItem
		    oJSON.Value("Fields") = me.GetMyFieldValues
		    
		    // Get the table name
		    Dim TableName as string
		    TableName = me.GetTableName
		    
		    // Compile into a json item
		    StatementType = "Insert"
		    oJSON.Value("StatementType") = StatementType
		    oJSON.Value("TableName") = TableName
		    oChangeDescription = oJSON
		    
		  Else 
		    
		    // No changes made so we set the changes description to nil
		    oChangeDescription = Nil
		    
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub BeforeDelete()
		  Dim StatementType as string
		  dim n1 as integer
		  
		  
		  
		  Dim oJSON as New JSONItem
		  
		  // Grab the pkid value and put it in the fields value
		  'dim j2 as New JSONItem
		  'j2.value("pkid") =  ipkid
		  'oJSON.Value("Fields") = j2
		  
		  // Get the table name
		  Dim TableName as string
		  TableName = me.GetTableName
		  
		  // Compile into a json item
		  StatementType = "Delete"
		  oJSON.Value("StatementType") = StatementType
		  oJSON.Value("TableName") = TableName
		  oJSON.Value("pkid") = ipkid
		  oChangeDescription = oJSON
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub BeforeUpdate()
		  Dim StatementType as string
		  dim n1 as integer
		  
		  
		  
		  // MODIFIED VALUES
		  // row username
		  me.srow_username = app.sUserName
		  
		  // modified date
		  dim d1 as new date
		  me.srow_modified = d1.SQLDateTime
		  
		  If me.IsModified Then
		    
		    // Get the values of all changed fields
		    Dim oJSON as New JSONItem
		    dim j2 as New JSONItem
		    j2 = me.GetMyFieldValues
		    
		    // Launch our PreUpdate definition
		    PreUpdate
		    
		    // Grab the pkid value and put it in the fields value
		    'j2.value("pkid") =  ipkid
		    oJSON.Value("Fields") = j2
		    
		    
		    // Get the table name
		    Dim TableName as string
		    TableName = me.GetTableName
		    
		    // Compile into a json item
		    StatementType = "Update"
		    oJSON.Value("StatementType") = StatementType
		    oJSON.Value("TableName") = TableName
		    oJSON.Value("pkid") = ipkid
		    oChangeDescription = oJSON
		    
		  Else 
		    
		    // No changes made so we set the changes description to nil
		    oChangeDescription = Nil
		    
		  End If
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event PostDelete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PreCreate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PreUpdate()
	#tag EndHook


	#tag Property, Flags = &h0
		ipkid As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		oChangeDescription As JSONItem = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		srow_created As String
	#tag EndProperty

	#tag Property, Flags = &h0
		srow_modified As String
	#tag EndProperty

	#tag Property, Flags = &h0
		srow_username As String
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
