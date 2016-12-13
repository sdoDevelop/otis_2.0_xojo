#tag Module
Protected Module OSM
	#tag Method, Flags = &h21
		Private Sub AddSyncContent(pJSONItem as JSONItem)
		  DIm db1 as New SQLiteDatabase
		  Dim rd1 as New Logic.ResourceDirectories
		  
		  
		  // Add the client id to the pJSONItem
		  pJSONItem.Value("ClientID") = UserInfo.ClientID
		  
		  
		  // Set the fielpath for the synch db and connect
		  db1.DatabaseFile = rd1.sync_db.FilePath
		  If db1.Connect Then
		    ' Connected to sync db
		    
		    // Add the sync content to the server
		    Dim ps1 as SQLitePreparedStatement
		    Dim sql1 as string = "Insert Into tbl_sync_content ( ojson ) Values( ? ) ; "
		    ps1 = db1.Prepare(sql1)
		    ps1.Bind(0,pJSONItem.ToString)
		    If db1.Error Then
		      Dim err as RuntimeException
		      err.Message = db1.ErrorMessage
		      ErrManage( "OSM.AddSyncContent", err.Message )
		      Raise err
		    End If
		    
		    ps1.SQLExecute
		    If db1.Error Then
		      Dim err as RuntimeException
		      err.Message = db1.ErrorMessage
		      ErrManage( "OSM.AddSyncContent", err.Message )
		      Raise err
		    End If
		    
		  Else
		    ' Could Not Connect 
		    
		    Dim err as RuntimeException
		    err.Message = "Could not connect to sync database. | " + db1.ErrorMessage
		    ErrManage( "OSM.AddSyncContent", err.Message )
		    Raise err
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckForUnpushedChanges() As Boolean
		  // Returns True if there are unpushed changes
		  // False if there are pushed changes
		  
		  Dim db1 as SQLiteDatabase
		  Dim sql1 as string
		  Dim rd1 as New Logic.ResourceDirectories
		  Dim rs1 as RecordSet
		  Dim upc1 as integer
		  
		  
		  db1.DatabaseFile = rd1.sync_db.FilePath
		  If Not db1.Connect Then
		    'database couldnt connect
		    dim err as RuntimeException
		    err.Message = "Could not connect to sync database in check for updates"
		    ErrManage("OSM.CheckForUnpushedChanges",err.Message)
		    Raise err
		  End If
		  
		  sql1 = "Select count(*) From changes_raw Where pushed = False;"
		  rs1 = db1.SQLSelect(sql1)
		  If db1.Error Then
		    dim err as RuntimeException
		    err.Message = "Could not pull changes from sync_db. | " + db1.ErrorMessage
		    ErrManage("OSM.CheckForUnpushedChanges",err.Message)
		    Raise err
		  End If
		  
		  If rs1 <> Nil Then
		    upc1 = rs1.Field("cound(*)").IntegerValue
		    
		    If upc1 > 0 Then
		      ' There are unpushed changes
		      Return True
		    Else 
		      ' No unpushed changes
		      Return False
		    End If
		    
		  Else
		    'Something went wrong
		    dim err as RuntimeException
		    err.Message = "Could not pull changes from sync_db. |  Record Set nil"
		    ErrManage("OSM.CheckForUnpushedChanges", err.Message
		    Raise err
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ConsolidateChanges()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Push()
		  
		  
		  
		  dim db1 as SQLiteDatabase
		  dim rd1 as New Logic.ResourceDirectories
		  dim sql1 as String
		  dim rs1 as RecordSet
		  
		  // Connect to database
		  db1.DatabaseFile = rd1.sync_db
		  If Not db1.Connect Then
		    'database couldnt connect
		    dim err as RuntimeException
		    err.Message = "Could not connect to sync database."
		    ErrManage("OSM.Push",err.Message)
		    Raise err
		  End If
		  
		  // Pull records out of the sync database
		  sql1 = "Select * From changes_raw Where pushed = False
		  rs1 = db1.SQLSelect(sql1)
		  If db1.Error Then
		    dim err as RuntimeException
		    err.Message = "Could not pull changes from sync_db. | " + db1.ErrorMessage
		    ErrManage("OSM.Push",err.Message)
		    Raise err
		  End If
		  
		  If rs1 = Nil Then
		    dim err as RuntimeException
		    err.Message = "Could not pull changes from sync_db. | "
		    ErrManage("OSM.Push",err.Message)
		    Raise err
		  End If
		  
		  // Loop through each record
		  For i1 as integer = 0 To rs1.RecordCount - 1
		    
		    // Grab the Field Names and column values
		    dim FieldNames() as string
		    dim FieldValues() as Variant
		    For i2 as integer = 0 To rs1.FieldCount - 1
		      FieldNames.Append( rs1.IdxField(i2).Name )
		      FieldValues.Append( rs1.IdxField(i2).Value )
		    Next
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StoreSync(oBase as BKS_ActiveRecord.Base)
		  // We take the table base item and use required methods in base to extract the json description and then launch the AddSyncContent
		  
		  
		  // Extract JSON from oBase
		  dim oJSON as JSONItem
		  oJSON = oBase.GetMyFieldValues
		  
		  // Push JSON to local sync database using AddSyncContent
		  AddSyncContent( oJSON )
		End Sub
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
