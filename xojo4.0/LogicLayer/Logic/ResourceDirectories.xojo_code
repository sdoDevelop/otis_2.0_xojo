#tag Class
Protected Class ResourceDirectories
	#tag Method, Flags = &h0
		Sub Constructor()
		  Dim RC as New Logic.ResourceClass
		  
		  
		  
		  RC = New Logic.ResourceClass
		  RC.FilePath = SpecialFolder.ApplicationData.Child("otis")
		  If Not RC.Exists Then
		    RC.FilePath.CreateAsFolder
		  End If
		  app_folder = RC
		  
		  'RC = db_folder
		  RC = New Logic.ResourceClass
		  RC.FilePath = app_folder.FilePath.Child("db")
		  If Not RC.Exists Then
		    RC.FilePath.CreateAsFolder
		  End If
		  db_folder = RC
		  
		  'RC = db_file
		  RC = New Logic.ResourceClass
		  RC.FilePath = db_folder.FilePath.Child("otis_data.sqlite")
		  db_file = RC
		  
		  'RC = info_folder
		  RC = New Logic.ResourceClass
		  RC.FilePath = app_folder.FilePath.Child("info")
		  If Not RC.Exists Then
		    RC.FilePath.CreateAsFolder
		  End If
		  info_folder = RC
		  
		  'RC = initialized_file
		  RC = New Logic.ResourceClass
		  RC.FilePath = info_folder.FilePath.Child("initialized.txt")
		  initialized_file = RC
		  
		  RC = New Logic.ResourceClass
		  RC.FilePath = info_folder.FilePath.Child("client_id.txt")
		  client_id_file = RC
		  
		  RC = New Logic.ResourceClass
		  RC.FilePath = info_folder.FilePath.Child("udf.txt")
		  user_data_file = RC
		  
		  RC = New Logic.ResourceClass
		  RC.FilePath = db_folder.FilePath.Child("utility_db.sqlite")
		  utility_db_file = RC
		  
		  RC = New Logic.ResourceClass
		  RC.FilePath = db_folder.FilePath.Child("sync_db.sqlite")
		  sync_db = RC
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		app_folder As Logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		client_id_file As Logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		db_file As Logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		db_folder As logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		info_folder As Logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		initialized_file As Logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		sync_db As Logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		user_data_file As Logic.ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		utility_db_file As Logic.ResourceClass
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
