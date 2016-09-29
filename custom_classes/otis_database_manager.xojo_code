#tag Class
Protected Class otis_database_manager
	#tag Method, Flags = &h0
		Sub initialize_local()
		  dim otis_db_file as FolderItem
		  
		  
		  ' Get the path to our db file
		  otis_db_file = get_filepath( "otis_db_file" )
		  
		  ' Create the database
		  local_db = new otis_sqlite_database
		  local_db.DatabaseFile = otis_db_file
		  
		  // Check if the db is up to date
		  If local_db.version_matches Then
		    local_db.initialized = True
		  Else
		    'db is not up to date
		    'delete the db file
		    dim f as FolderItem = get_filepath( "otis_db_file" )
		    If f.Exists Then
		      f.Delete
		      if f.LastErrorCode <> 0 Then
		        'could not delete file
		        err_manage( "local_db", "Could not delete sqlite database file" )
		      end if
		    End If
		  End If
		  
		  
		  ' Create / Connect to local database
		  If Not local_db.CreateDatabaseFile Then
		    ' cannot open the database file for some reaseon 
		    dim err as RuntimeException
		    err = new RuntimeException
		    err.Message = "cannot connect to database for some reason"
		    Raise err
		  End If
		  
		  
		  If not local_db.initialized Then
		    
		    'db is not initialized
		    local_db.construct_db
		    
		    'Set db_version to current
		    dim tos as TextOutputStream
		    dim fos as FolderItem
		    fos = get_filepath( "resources_file" )
		    if fos.Exists Then
		      fos.Delete
		    end if
		    if fos <> Nil Then
		      tos = TextOutputStream.Create(fos)
		      tos.Write( "db_version=" + str(app.MajorVersion) + "." + str(app.MinorVersion) + "." + str(app.BugVersion) )
		      tos.Close
		    end if
		    
		    local_db.initialized = True
		    
		  Else
		    'db is initialized
		    local_db.data_ready = True
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  Exception err as RuntimeException
		    err_manage( "local_db", err.message )
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private is_online As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		local_db As otis_sqlite_database
	#tag EndProperty

	#tag Property, Flags = &h0
		remote_db As otis_postgresql_database
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
