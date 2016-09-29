#tag Class
Protected Class otis_sqlite_database
Inherits SQLiteDatabase
	#tag Method, Flags = &h1
		Protected Sub initialize()
		  // Point of script is to run all the sql commands necessary to build the local_db structure
		  
		  
		  dim sql_array() as string
		  dim sql_query as string
		  
		  
		  
		  sql_array
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function initialized() As Boolean
		  dim resources_file as FolderItem
		  dim tis as TextInputStream
		  dim s1, s2 as string
		  dim lines() as string
		  dim parts() as string
		  
		  
		  // Get the path to our resources_file to tell us if we are initialized or not
		  resources_file = get_filepath( "resources_file" )
		  
		  If resources_file <> Nil Then
		    tis = TextInputStream.Open( resources_file )
		    If t <> Nil Then
		      'read file into a string variable
		      s1 = tis.ReadAll
		      tis.Close
		    Else
		      'could not read file
		      Return False
		    End If
		  End If
		  
		  
		  // Seperate the string into each line
		  lines() = Split( s1, EndOfLine )
		  
		  // Loop through the lines, seperate into header and value, then check if its the line we need
		  For i1 as integer = 0 To lines.Ubound
		    parts() = Split( lines(i1), " = " )
		    If InStr( parts(0), "initialized" ) > 0 Then
		      'this is the line we want
		      If InStr( parts(1), "true" ) > 0 Then
		        Return True
		      Else
		        Return False
		      End If
		    End If
		  Next
		  
		  Return False
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="DatabaseFile"
			Visible=true
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugMode"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EncryptionKey"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LoadExtensions"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MultiUser"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShortColumnNames"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadYieldInterval"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Timeout"
			Visible=true
			Type="Double"
			EditorType="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
