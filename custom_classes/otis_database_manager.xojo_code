#tag Class
Protected Class otis_database_manager
	#tag Method, Flags = &h0
		Sub connect_to_local()
		  dim otis_db_file as FolderItem
		  
		  
		  // Get the path to our db file
		  otis_db_file = get_filepath( "otis_db_file" )
		  
		  // Create the database
		  local_db = new otis_sqlite_database
		  local_db.DatabaseFile = otis_db_file
		  If Not local_db.CreateDatabaseFile Then
		    ' cannot open the database file for some reaseon 
		    dim err as RuntimeException
		    err = new RuntimeException
		    err.Message = "cannot connect to database for some reason"
		    Raise err
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function connect_to_remote() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub create_local_db()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function split_sql(script as string) As string()
		  dim start_pos, end_pos as integer
		  dim fin as Boolean
		  dim n1, n2, n3 as integer
		  
		  
		  
		  start_pos = 0
		  end_pos = 0
		  
		  
		  While Not fin
		    
		    ' find the next occurance of ";"
		    n1 = InStr( start_pos, script, ";" )
		    
		    If n1 > 0 Then
		      ' check if there is a create trigger command in the subset
		      n2 = InStr( start_pos, script, "Create Trigger" )
		      If n2 > 0 Then
		        'this command is a trigger
		        n3 = InStr( start_pos, script, "End;" )
		        If n3 > 0 Then
		          'found the end of the trigger
		          'set the end point for the command
		          end_pos = n3 + 3
		        End If
		      End If
		      
		    Else
		      'no trigger funciton in subset
		      end_pos = n1
		    End If
		    
		    
		  Wend
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private is_online As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private local_db As otis_sqlite_database
	#tag EndProperty

	#tag Property, Flags = &h21
		Private remote_db As otis_postgresql_database
	#tag EndProperty


	#tag Constant, Name = client_table_creation, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"-- ##################################\n-- ###### Create Otis Database ######\n-- ##################################\n\n\n\n-- User Tables\n\t\n\t-- events_\n\tCreate Table events_\n\t\t(\n\t\tpkid text\x2C\n\t\trow_created_ timestamp\x2C\n\t\trow_modified_ timestamp\x2C\n\t\trow_username_ text\x2C\n\t\tname_ text\x2C\n\t\tstart_time time\x2C\n\t\tend_time time\x2C\n\t\tloadin_time time\x2C\n\t\tloadout_time time\x2C\n\t\tstart_date date\x2C\n\t\tend_date date\x2C\n\t\tloadin_date\tdate\x2C\n\t\tloadout_date date\x2C\n\t\tdetails text\x2C\n\t\taccount_manager text\n\t\t);\n\n\t-- lineitems_\n\tCreate Table lineitems_ \n\t\t(\n\t\tpkid text\x2C\n\t\trow_created_ timestamp\x2C\n\t\trow_modified_ timestamp\x2C\n\t\trow_username_ text\x2C\n\t\tfkeipl_ text\x2C\n\t\tfkinventory text\x2C\n\t\tname_ text\x2C\n\t\tmanufacturer_ text\x2C\n\t\tmodel_ text\x2C\n\t\tdepartment_ text\x2C\n\t\tcategory_ text\x2C\n\t\tsubcategory_ text\x2C\n\t\tdescription_ text -- from inventory\n\t\ttype_ text\x2C\n\t\tprice_ \tinteger\x2C\n\t\tnote_ text\x2C --line item specific\n\t\trate_ text\x2C\n\t\tdiscount_percent_ integer\x2C\n\t\tdiscount_amount_ integer\x2C\n\t\ttotal_ integer\x2C\n\t\ttime_ integer\x2C\n\t\ttaxable_ boolean\x2C\n\t\ttaxtotal_ integer\x2C\n\t\tquantity_ double precision\x2C\n\t\tignore_price_discrepency boolean\n\t\t);\n\n\n\t-- inventory\n\tCREATE TABLE inventory_ \n\t\t(\n  \t \tpkid \t\t\ttext\x2C\n   \t\trow_created_ \ttimestamp\x2C\n    \trow_modified_ \ttimestamp\x2C\n    \trow_username_ \ttext\x2C\n    \tname_ \t\t\ttext\x2C\n\t\tmanufacturer_ \ttext\x2C\n\t\tmodel_ \t\t\ttext\x2C\n\t\tdepartment_ \ttext\x2C\n\t\tcategory_ \t\ttext\x2C\n\t\tsubcategory_ \ttext\x2C\n\t\tdescription_ \ttext\x2C\n\t\ttype_ \t\t\ttext\x2C\n\t\tquantity_ \t\tinteger\x2C\n\t\tprice_ \t\t\tinteger\x2C\n\t\towner_ \t\t\ttext\x2C\n\t\ttaxable_\t\ttext\x2C\n\t\t);\n\n\n\t-- eipl_\n\tCreate Table eipl_ \n\t\t(\n\t\tpkid text\x2C\n\t\trow_created_ timestamp\x2C\n\t\trow_modified_ timestamp\x2C\n\t\trow_username_ text\x2C\n\t\tfkevents_ text\x2C\n\t\teipl_number_ integer\x2C\n\t\tdue_date_ date\x2C\n\t\ttype_ text\x2C\n\t\tbalance integer\x2C\n\t\tgrand_total_ integer\x2C\n\t\tsubtotal_ integer\x2C\n\t\tdiscount_amount_ integer\x2C\n\t\tdiscount_percent_ integer\x2C\n\t\tshipping_method_ text\x2C\n\t\ttax_total_ integer\x2C\n\t\tdiscount_total_ integer\n\t\t);\n\n\n\t-- payments_\n\tCreate Table payments_ \n\t\t(\n\t\tpkid text\x2C\n\t\trow_created_ \t\ttimestamp\x2C\n\t\trow_modified_ \t\ttimestamp\x2C\n\t\trow_username_ \t\ttext\x2C\n\t\tfkeipl_ \t\t\ttext\x2C\n\t\tpayment_date \t\tdate\x2C\n\t\tmemo_\t\t\t\ttext\x2C\n\t\tpayment_amount\t\tinteger\x2C\n\t\tpayment_type\t\ttext\n\t\t);\n\n\n\t-- contact_venue_data\n\tCREATE TABLE contact_venue_data \n\t\t(\n  \t \tpkid text\x2C\n   \t\trow_created_ timestamp\x2C\n    \trow_modified_ timestamp\x2C\n    \trow_username_ text\x2C\n    \tfkcontacts_ text\x2C\n    \tfkvenues_ text\x2C\n    \tfkevents_ text\x2C\n    \tfkeipl_ text\x2C\n    \tprimary_ boolean\n\t\t);\n\n\t-- contacts\n\tCREATE TABLE contacts_ \n\t\t(\n  \t \tpkid text\x2C\n   \t\trow_created_ \t\ttimestamp\x2C\n    \trow_modified_ \t\ttimestamp\x2C\n    \trow_username_ \t\ttext\x2C\n    \tfkconven\t\t\ttext\x2C\n    \tprimary_\t\t\ttext\x2C\n    \tname_first \t\t\ttext\x2C\n    \tname_last \t\t\ttext\x2C\n    \tjob_title\t\t\ttext\x2C\n    \tcompany\t\t\t\ttext\x2C\n    \temail \t\t\t\ttext\x2C\n    \tphone_number\t\ttext\x2C\n    \taddress_line1\t\ttext\x2C\n    \taddress_line2\t\ttext\x2C\n    \taddress_city\t\ttext\x2C\n    \taddress_state\t\ttext\x2C\n    \taddress_zip\t\t\ttext\x2C\n    \taddress_country\t\ttext\n\t\t);\n\n\n\t-- venues\n\tCREATE TABLE venues_ \n\t\t(\n  \t \tpkid text\x2C\n   \t\trow_created_ \t\ttimestamp\x2C\n    \trow_modified_ \t\ttimestamp\x2C\n    \trow_username_ \t\ttext\x2C\n    \tfkconven\t\t\ttext\x2C\n    \tprimary_\t\t\ttext\x2C\n    \tname_ \t\t\t\ttext\x2C\n    \tvenue_type\t\t\ttext\x2C\n    \tcompany\t\t\t\ttext\x2C\n    \temail \t\t\t\ttext\x2C\n    \tphone_number\t\ttext\x2C\n    \taddress_line1\t\ttext\x2C\n    \taddress_line2\t\ttext\x2C\n    \taddress_city\t\ttext\x2C\n    \taddress_state\t\ttext\x2C\n    \taddress_zip\t\t\ttext\x2C\n    \taddress_country\t\ttext\n\t\t);\n\n\n\t-- discounts_\n\tCREATE TABLE discounts_\n\t\t(\n  \t \tpkid text\x2C\n   \t\trow_created_ \t\ttimestamp\x2C\n    \trow_modified_ \t\ttimestamp\x2C\n    \trow_username_ \t\ttext\x2C\n    \tfkeipl_ \t\t\ttext\x2C\n    \tdepartment_\t\t\ttext\x2C\n    \ttype_\t\t\t\ttext\x2C\n    \tamount_ \t\t\tinteger\x2C\n    \tgrand_total_ \t\tinteger\x2C\n    \tsubtotal \t\t\tinteger\x2C\n    \tdiscount_percent_ \tinteger\x2C\n    \tdiscount_amount_ \tinteger\n\t\t);\n\n\n-- Utility Tables\n\n\t-- trigger_log\n\tCREATE TABLE trigger_log\n\t\t(\n  \t \tpkid \t\t\t\ttext\x2C\n   \t\trow_created_ \t\ttimestamp\x2C\n    \ttable_name\t\t\ttext\x2C\n    \tnew_variable\t\ttext\x2C -- column_name\x2Cvalue.column_name\x2Cvalue\n    \told_variable\t\ttext -- column_name\x2Cvalue.column_name\x2Cvalue\n\n\t\t);\n\n"
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
			Name="local_db"
			Group="Behavior"
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
