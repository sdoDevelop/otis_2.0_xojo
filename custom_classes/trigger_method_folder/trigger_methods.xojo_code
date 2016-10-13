#tag Module
Protected Module trigger_methods
	#tag Method, Flags = &h0
		Function c_execute_triggers() As boolean
		  dim method_names() as string
		  
		  
		  c_set_up_dict
		  method_names = c_trigger_exists
		  
		  If method_names.Ubound > -1 Then
		    
		    For i1 as integer = 0 To method_names.Ubound
		      dim caller as method_caller
		      caller = method_directory.Value(method_names(i1))
		      caller.Invoke
		    Next
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub c_set_up_dict()
		  method_directory = new Dictionary
		  method_directory.Value("testmet") = AddressOf trigger_methods.testmet
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function c_trigger_exists() As string()
		  dim tis as TextInputStream
		  dim f as FolderItem
		  dim textfile as string
		  dim triggers as JSONItem
		  dim trigger as JSONItem
		  dim trigger_names() as string
		  dim confirmed_triggers() as string
		  
		  
		  // get the contents of the trriggers file
		  f = resource_management.get_filepath("triggers_file")
		  tis = TextInputStream.open(f)
		  textfile = tis.ReadAll
		  
		  // insert text file into json 
		  triggers = new JSONItem(textfile)
		  trigger_names = triggers.Names
		  
		  // loop through all of the triggers
		  For i1 as integer = 0 To trigger_names.Ubound
		    dim found as Boolean
		    trigger = triggers.Value( trigger_names(i1) )
		    
		    If trigger.Value("type") <> tg_library.type Then
		      Continue
		    End If
		    If trigger.Value("when") <> tg_library.when Then
		      Continue
		    End If
		    If trigger.Value("table") <> tg_library.table_name Then
		      Continue
		    End If
		    
		    dim trigger_columns() as string = Split( trigger.Value("columns"),",")
		    If trigger_columns.Ubound > -1 Then
		      
		      For i2 as integer = 0 To tg_library.column_names.Ubound
		        If trigger_columns.IndexOf(tg_library.column_names(i2)) = -1 Then
		          Exit
		        Else
		          found = True
		        End If
		      Next
		      
		    Else
		      found = True
		    End If
		    
		    If found Then
		      confirmed_triggers.Append(trigger.Value("method"))
		    End If
		    
		  Next
		  
		  Return confirmed_triggers
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub method_caller()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub testmet()
		  app.otis_db.local_db.SQLExecute("Insert Into events_(pkid) Values('hello');")
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		method_directory As dictionary
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
End Module
#tag EndModule
