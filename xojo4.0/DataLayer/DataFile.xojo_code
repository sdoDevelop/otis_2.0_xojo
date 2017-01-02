#tag Module
Protected Module DataFile
	#tag Method, Flags = &h0
		Function DB() As SQLiteDatabase
		  Return App.db
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDatabaseFile() As FolderItem
		  '#pragma Error "Need to set location of your database file"
		  
		  Dim rd1 as New Logic.ResourceDirectories
		  
		  
		  
		  dim f as FolderItem = rd1.db_file.FilePath
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenDB() As SQLiteDatabase
		  dim f as FolderItem = GetDatabaseFile
		  if f = nil or f.Exists = false then
		    break 'Go to GetDatabaseFile() and set db name and path
		    Return nil
		  end if
		  
		  dim db as new SQLiteDatabase
		  
		  db.DatabaseFile = f
		  
		  ' Uncomment the next line if it's an encrypted database
		  ' db.encryptionKey = ""
		  
		  if db.Connect = false Then 
		    return nil
		  end
		  
		  //Important to tell ActiveRecord what the connection is!
		  BKS_ActiveRecord.Connect(db)
		  
		  //Make any db updates here before registering
		  
		  //Register the tables with ActiveRecord
		  Register( db )
		  
		  return db
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Register(db as SQLiteDatabase)
		  // Tables
		  BKS_ActiveRecord.Table( db, "tbl_contacts", GetTypeInfo( tbl_contacts ) )
		  BKS_ActiveRecord.Table( db, "tbl_contact_venue_data", GetTypeInfo( tbl_contact_venue_data ) )
		  BKS_ActiveRecord.Table( db, "tbl_departments", GetTypeInfo( tbl_departments ) )
		  BKS_ActiveRecord.Table( db, "tbl_eipl", GetTypeInfo( tbl_eipl ) )
		  BKS_ActiveRecord.Table( db, "tbl_events", GetTypeInfo( tbl_events ) )
		  BKS_ActiveRecord.Table( db, "tbl_inventory", GetTypeInfo( tbl_inventory ) )
		  BKS_ActiveRecord.Table( db, "tbl_lineitems", GetTypeInfo( tbl_lineitems ) )
		  BKS_ActiveRecord.Table( db, "tbl_payments", GetTypeInfo( tbl_payments ) )
		  BKS_ActiveRecord.Table( db, "tbl_venues", GetTypeInfo( tbl_venues ) )
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kMaxReturn, Type = Double, Dynamic = False, Default = \"50", Scope = Public
	#tag EndConstant


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