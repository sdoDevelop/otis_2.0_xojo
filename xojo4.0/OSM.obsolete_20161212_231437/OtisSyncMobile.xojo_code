#tag Module
Protected Module OtisSyncMobile
	#tag Method, Flags = &h1
		Protected Sub AddSyncContent(pJSONItem as JSONItem)
		  DIm db1 as New SQLiteDatabase
		  Dim rd1 as New Logic.ResourceDirectories
		  
		  db1.DatabaseFile = rd1.sync_db.FilePath
		  If db1.Connect Then
		    ' Connected to sync db
		    Dim ps1 as SQLitePreparedStatement
		    Dim sql1 as string = "Insert Into tbl_sync_content ( ojson ) Values( ? ) ; "
		    ps1 = db1.Prepare(sql1)
		    ps1.Bind(0,pJSONItem.ToString)
		    If db1.Error Then
		      Dim err as RuntimeException
		      err.Message = db1.ErrorMessage
		      Raise err
		    End If
		    
		    ps1.SQLExecute
		    If db1.Error Then
		      Dim err as RuntimeException
		      err.Message = db1.ErrorMessage
		      Raise err
		    End If
		    
		  Else
		    
		    Dim err as RuntimeException
		    err.Message = "Could not connect to sync database. | " + db1.ErrorMessage
		    Raise err
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFieldsFromBase(oBase as BKS_ActiveRecord.Base) As JSONItem
		  
		  
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
