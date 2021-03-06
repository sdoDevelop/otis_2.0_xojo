#tag Module
Protected Module login_scripts
	#tag Method, Flags = &h1
		Protected Sub start_script()
		  // In this script we will be handling launcing all the necesarry methods to
		      // Connect to the local database and create its structure 
		      // Connect to the remote databse
		  
		  
		  // Check for update
		  
		  
		  // Attempt connection to local database
		  app.otis_db = new otis_database_manager
		  Try 
		    app.otis_db.connect_to_local
		  Catch err as RuntimeException
		    err_manage_temp
		    Return
		  End Try
		  
		  // Check if the local database is initialized
		  If Not otis_db.local_db.initialized Then
		    'database not initialized we need to do so
		    otis_db.local_db.initialize
		    
		    
		    
		    
		    MsgBox( "running" )
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
