#tag Module
Protected Module resource_management
	#tag Method, Flags = &h0
		Function get_filepath(selector as string) As FolderItem
		  dim app_folder as FolderItem
		  dim db_folder as FolderItem
		  dim error_folder as FolderItem
		  dim inf_folder as FolderItem
		  
		  dim otis_db_file as FolderItem
		  dim local_db_log_file as FolderItem
		  dim error_log_file as FolderItem
		  dim un_file as FolderItem
		  dim resources_file as FolderItem
		  
		  
		  
		  dim tos as TextOutputStream
		  
		  // Some Settings
		  dim app_name as string = "otis"
		  
		  
		  // Create the file structure on computer
		  app_folder = SpecialFolder.ApplicationData.Child( app_name )
		  if Not app_folder.Exists then
		    app_folder.CreateAsFolder
		  end if
		  
		  db_folder = app_folder.Child( "db" )
		  If Not db_folder.Exists then
		    db_folder.CreateAsFolder
		  End If
		  
		  error_folder = app_folder.Child( "err" )
		  If Not error_folder.Exists then
		    error_folder.CreateAsFolder
		  End If
		  
		  inf_folder = app_folder.Child( "inf" )
		  If Not inf_folder.Exists then
		    inf_folder.CreateAsFolder
		  End If
		  
		  otis_db_file = db_folder.Child( "otis_db.sqlite" )
		  local_db_log_file = error_folder.Child( "db_log.txt" )
		  error_log_file = error_folder.Child( "error_log.txt" )
		  un_file = inf_folder.Child( "un.txt" )
		  resources_file = inf_folder.Child( "resources.txt" )
		  
		  
		  
		  Select Case selector
		  Case "app_folder"
		    Return app_folder
		  Case "db_folder"
		    Return db_folder
		  Case "error_folder"
		    Return error_folder
		  Case "inf_folder"
		    Return inf_folder
		  Case "otis_db_file"
		    Return otis_db_file
		  Case "un_file" 
		    Return un_file
		  Case "resources_file"
		    Return resources_file
		  End Select
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
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
