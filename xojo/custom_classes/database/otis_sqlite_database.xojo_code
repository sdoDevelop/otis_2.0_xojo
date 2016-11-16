#tag Class
Protected Class otis_sqlite_database
Inherits SQLiteDatabase
	#tag Method, Flags = &h0
		Sub construct_db()
		  // Point of script is to run all the sql commands necessary to build the local_db structure
		  ' Raises RuntimeException if any errors occured during the initialization
		  
		  dim sql_script_array() as string
		  dim sql_script as string
		  dim sql_array() as string
		  dim sql_query as string
		  dim ps as SQLitePreparedStatement
		  dim sql as string
		  
		  dim err_count as integer
		  
		  
		  sql_script_array.Append( client_table_creation )
		  
		  // Loop through all of the sql scripts
		  For i1 as integer = 0 To sql_script_array.Ubound
		    
		    err_print_seperator( "local_db", "#########  Script " + str( i1.ToText ) + "  #########" )
		    
		    'load sql commands into an array
		    sql_script = sql_script_array(i1)
		    sql_array() = split_sql( sql_script )
		    
		    For i2 as integer = 0 To sql_array.Ubound
		      
		      'prepare the statement
		      sql = sql_array(i2)
		      me.SQLExecute(sql)
		      If me.Error Then
		        'hmmm error
		        break
		        err_manage( "local_db", me.ErrorMessage ) 
		        err_count = err_count + 1
		      End If
		      
		    Next
		    
		  Next
		  
		  If err_count > 0 Then
		    ' errors occured during the db creation
		    dim err as new RuntimeException
		    err.Message = "Errors occured during the initialization of the database, please report this to Sean"
		    raise err
		  End If
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function execute(querry_type as string, table as string, columns() as string, values() as string, conditions() as string) As ExecuteReturn
		  // querry_type = Insert, Update, Delete, Select
		  // tables = ex. "contacts, contact_venue_data"
		  // columns
		  // values
		  // conditions = (field1 = field2, And, field2 = pkid, Or, pkid = ulif)
		  // returning
		  
		  dim table_string as string
		  dim column_string as string
		  dim value_string as string
		  dim condition_string as string
		  dim sql_string as string
		  dim the_date as new date
		  dim rs as RecordSet
		  Dim exre1 as New ExecuteReturn
		  
		  
		  
		  
		  // Concat our sql sections
		  table_string = table
		  column_string = Join( columns,"," )
		  value_string = Join( values,"," )
		  If conditions(0) <> "" Then
		    condition_string = " Where " +  Join( conditions," " )
		  End If
		  
		  // Set up some of the tg_library
		  ReDim tg_library.column_names(-1)
		  ReDim tg_library.values(-1)
		  tg_library.type = querry_type
		  tg_library.table_name = table
		  tg_library.column_names = columns()
		  tg_library.values = values()
		  dim sql as string = "Select * From " + table_string + condition_string + ";"
		  
		  tg_library.old_rs = SQLSelect(sql)
		  If Error Then
		    err_manage("local_db", ErrorMessage)
		  End If
		  
		  // Determine what type of querry we are dealing with... select, insert, delete, update
		  Select Case querry_type
		  Case "Select"
		    // Perform any before tasks
		    ' set up our tg_library
		    tg_library.when = "Before"
		    tg_library.type = "Select"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		    // execute our sql
		    sql_string = "Select " + column_string + " From " + table_string +  condition_string + ";"
		    rs = SQLSelect(sql_string)
		    If Error Then
		      dim err as new RuntimeException
		      err.Message = ErrorMessage
		      err_manage("local_db",ErrorMessage)
		      raise err
		    End If
		    
		    
		    // perform any after tasks
		    ' set up our tg_library
		    tg_library.when = "After"
		    tg_library.type = "Select"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		  Case "Insert"
		    // perform any before tasks
		    ' set up our tg_library
		    tg_library.when = "Before"
		    tg_library.type = "Insert"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		    
		    dim mod_columns() as string
		    dim mod_values() as string
		    
		    // add some values that we autoset
		    mod_columns.Append("pkid")
		    mod_columns.Append("row_created_")
		    mod_columns.Append("row_modified_")
		    If column_string <> "" Then
		      column_string = Join( Array( Join(mod_columns,", "), column_string), ", " )
		    Else
		      column_string  = Join(mod_columns,", ")
		    End If
		    
		    'Create a Unique pkid and save it to our return object
		    dim theNewUUID as string = NewUUID
		    exre1.ThePKID = theNewUUID
		    mod_values.Append("'" + theNewUUID + "'")
		    mod_values.Append("'" + the_date.SQLDateTime + "'")
		    mod_values.Append("'" + the_date.SQLDateTime + "'")
		    If value_string <> "" Then
		      value_string = Join(  Array(   Join(mod_values,", ")  , value_string), ", " ) 
		    Else
		      value_string = Join(mod_values, ", ")
		    End If
		    
		    // execute our sql
		    sql_string = "Insert Into " + table_string + " (" + column_string + ") " + "Values( " + value_string + ");"
		    SQLExecute(sql_string)
		    exre1.ThePKID = theNewUUID
		    If Error Then
		      dim err as new RuntimeException
		      err.Message = ErrorMessage
		      err_manage("local_db",ErrorMessage)
		      raise err
		    Else
		      'Sync back to the server
		      App.otis_db.SyncToServer(sql_string)
		    End If
		    
		    //Fill the tg_library.new_rs
		    sql = "Select * From " + table_string + " Where pkid = '" + theNewUUID + "';"
		    
		    tg_library.new_rs = SQLSelect(sql)
		    If Error Then
		      err_manage("local_db", ErrorMessage)
		    End If
		    
		    
		    // perform any after tasks
		    ' set up our tg_library
		    tg_library.when = "After"
		    tg_library.type = "Insert"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		    
		    
		  Case "Update"
		    // perform any before tasks
		    ' set up our tg_library
		    tg_library.when = "Before"
		    tg_library.type = "Update"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		    dim mod_columns() as string
		    dim mod_values() as string
		    
		    mod_columns.Append("row_modified_")
		    column_string = Join( Array( Join(mod_columns,", "), column_string), ", " )
		    
		    mod_values.Append(the_date.SQLDateTime)
		    value_string = Join( Array( Join(mod_values,", "), value_string), ", " )
		    
		    // execute our sql
		    dim column_value_string as string
		    dim column_value_array(-1) as string
		    dim s as string
		    For i1 as integer = 0 To columns.Ubound
		      s = columns(i1) + " = " + values(i1)
		      ReDim column_value_array(i1)
		      column_value_array(i1) = s
		      column_value_string = Join( column_value_array, ", " )
		    Next
		    
		    sql_string = "Update " + table_string + " Set " + column_value_string + condition_string + ";"
		    SQLExecute(sql_string)
		    If Error Then
		      dim err as new RuntimeException
		      err.Message = ErrorMessage
		      err_manage("local_db",ErrorMessage)
		      raise err
		    Else
		      'Sync back to the server
		      App.otis_db.SyncToServer(sql_string)
		    End If
		    
		    //Fill the tg_library.new_rs
		    sql = "Select * From " + table_string + condition_string + ";"
		    
		    tg_library.new_rs = SQLSelect(sql)
		    If Error Then
		      err_manage("local_db", ErrorMessage)
		    End If
		    
		    
		    // perform any after tasks
		    ' set up our tg_library
		    tg_library.when = "After"
		    tg_library.type = "Update"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		  Case "Delete"
		    // perform any before tasks
		    ' set up our tg_library
		    tg_library.when = "Before"
		    tg_library.type = "Delete"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		    'create our sql
		    sql_string = "Delete From " + table_string + condition_string + ";"
		    SQLExecute(sql_string)
		    If Error Then
		      dim err as new RuntimeException
		      err.Message = ErrorMessage
		      err_manage("local_db",ErrorMessage)
		      raise err
		    Else
		      'Sync back to the server
		      App.otis_db.SyncToServer(sql_string)
		    End If
		    
		    
		    // perform any after tasks
		    ' set up our tg_library
		    tg_library.when = "After"
		    tg_library.type = "Delete"
		    
		    ' execute triggers
		    If c_execute_triggers Then
		    End If
		    
		  End Select
		  
		  
		  exre1.TheRecordSet = rs
		  Return exre1
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function split_sql(script as string) As string()
		  dim start_pos, end_pos as integer
		  dim fin as Boolean
		  dim n1, n2, n3 as integer
		  dim statements(), s2, s3 as String
		  
		  
		  
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
		        Else
		          'there is no end; ?
		          'that would make no sense
		          err_manage
		        End If
		      Else
		        'no trigger funciton in subset
		        end_pos = n1
		      End If
		      
		    Else
		      'end of file
		      fin = True
		      exit
		    End If
		    
		    
		    
		    // now we need to do the work to pull our subset from the string
		    'get the length of the subset
		    n1 = end_pos - start_pos + 1
		    'put subset in string
		    s2 = Mid( script, start_pos, n1 )
		    'put string in array
		    statements.Append( s2 )
		    
		    'reset our start point
		    start_pos = end_pos + 1
		    end_pos = end_pos + 1
		    
		  Wend
		  
		  Return statements()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function version_matches() As boolean
		  dim resources_file as FolderItem
		  dim tis as TextInputStream
		  dim s1, s2 as string
		  dim lines() as string
		  dim parts() as string
		  dim db_version as string
		  dim db_version_parts() as string
		  dim app_version_parts() as integer
		  
		  
		  // Get the path to our resources_file
		  resources_file = get_filepath( "resources_file" )
		  
		  // Read the resources_file
		  If resources_file.Exists Then
		    tis = TextInputStream.Open( resources_file )
		    If tis <> Nil Then
		      'read file into a string variable
		      s1 = tis.ReadAll
		      tis.Close
		    Else
		      'could not read file
		      Return False
		    End If
		  Else 
		    Return False 
		  End If
		  
		  ' Seperate the string into each line
		  lines() = Split( s1, EndOfLine )
		  
		  // Loop through the lines, seperate into header and value, then check if its the line we need
		  For i1 as integer = 0 To lines.Ubound
		    parts() = Split( lines(i1), "=" )
		    If InStr( parts(0), "db_version" ) > 0 Then
		      'this is the line we want
		      db_version = parts(1)
		    End If
		  Next
		  
		  // Now that we have gotten the database version...
		  
		  'we can split it up into its individule parts
		  db_version_parts() = Split( db_version, "." )
		  app_version_parts() = Array( app.MajorVersion, app.MinorVersion, app.BugVersion )
		  
		  
		  'and now loop through each version part
		  For i1 as integer = 0 To db_version_parts.Ubound
		    'now check if the version part is greator or less than app version part
		    If val(db_version_parts(i1)) <> app_version_parts(i1) Then
		      Return False
		    End If
		    
		    'versions_match we can exit true
		    Return True
		    
		  Next
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		data_ready As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		initialized As boolean = False
	#tag EndProperty


	#tag Constant, Name = client_table_creation, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"-- ##################################\r\n-- ###### Create Otis Database ######\r\n-- ##################################\r\n\r\n\r\n\r\n-- User Tables\r\n    \r\n    -- events_\r\n    Create Table events_\r\n        (\r\n        pkid text\x2C\r\n        row_created_ timestamp\x2C\r\n        row_modified_ timestamp\x2C\r\n        row_username_ text\x2C\r\n        name_ text\x2C\r\n        start_time text\x2C\r\n        end_time text\x2C\r\n        loadin_time text\x2C\r\n        loadout_time text\x2C\r\n        start_date text\x2C\r\n        end_date text\x2C\r\n        loadin_date text\x2C\r\n        loadout_date text\x2C\r\n        details text\x2C\r\n        account_manager text\r\n        );\r\n\r\n    -- lineitems_\r\n    Create Table lineitems_ \r\n        (\r\n        pkid text\x2C\r\n        row_created_ timestamp\x2C\r\n        row_modified_ timestamp\x2C\r\n        row_username_ text\x2C\r\n        fkeipl_ text\x2C\r\n        fkinventory_ text\x2C\r\n        name_ text\x2C\r\n        manufacturer_ text\x2C\r\n        model_ text\x2C\r\n        department_ text\x2C\r\n        category_ text\x2C\r\n        subcategory_ text\x2C\r\n        description_ text\x2C -- from inventory\r\n        type_ text\x2C\r\n        price_  integer\x2C\r\n        note_ text\x2C --line item specific\r\n        rate_ text\x2C\r\n        discount_percent_ integer\x2C\r\n        discount_amount_ integer\x2C\r\n        total_ integer\x2C\r\n        time_ integer\x2C\r\n        taxable_ boolean\x2C\r\n        taxtotal_ integer\x2C\r\n        quantity_ double precision\x2C\r\n        ignore_price_discrepency boolean\r\n        );\r\n\r\n\r\n    -- inventory\r\n    CREATE TABLE inventory_ \r\n        (\r\n        pkid                       text\x2C\r\n        row_created_        timestamp\x2C\r\n        row_modified_    timestamp\x2C\r\n        row_username_    text\x2C\r\n        name_            text\x2C\r\n        manufacturer_   text\x2C\r\n        model_          text\x2C\r\n        department_     text\x2C\r\n        category_       text\x2C\r\n        subcategory_    text\x2C\r\n        description_    text\x2C\r\n        type_           text\x2C\r\n        quantity_       integer\x2C\r\n        price_          integer\x2C\r\n        owner_          text\x2C\r\n        taxable_        text\r\n        );\r\n\r\n\r\n    -- eipl_\r\n    Create Table eipl_ \r\n        (\r\n        pkid text\x2C\r\n        row_created_ timestamp\x2C\r\n        row_modified_ timestamp\x2C\r\n        row_username_ text\x2C\r\n        fkevents_ text\x2C\r\n        eipl_number_ integer\x2C\r\n        due_date_ text\x2C\r\n        type_ text\x2C\r\n        balance_ integer\x2C\r\n        grand_total_ integer\x2C\r\n        subtotal_ integer\x2C\r\n        totalpaid_ integer\x2C\r\n        discount_amount_ integer\x2C\r\n        discount_percent_ integer\x2C\r\n        shipping_method_ text\x2C\r\n        tax_total_ integer\x2C\r\n        discount_total_ integer\r\n        );\r\n\r\n\r\n    -- payments_\r\n    Create Table payments_ \r\n        (\r\n        pkid text\x2C\r\n        row_created_        timestamp\x2C\r\n        row_modified_       timestamp\x2C\r\n        row_username_       text\x2C\r\n        fkeipl_             text\x2C\r\n        payment_date        date\x2C\r\n        memo_               text\x2C\r\n        payment_amount      integer\x2C\r\n        payment_type        text\r\n        );\r\n\r\n\r\n    -- contact_venue_data\r\n    CREATE TABLE contact_venue_data \r\n        (\r\n        pkid                text\x2C\r\n        row_created_        timestamp\x2C\r\n        row_modified_       timestamp\x2C\r\n        row_username_       text\x2C\r\n        fkparent_table      text\x2C\r\n        parent_table        text\x2C\r\n        fkcontact_or_venue  text\x2C\r\n        contact_or_venue    text\x2C\r\n        primary_            boolean\r\n        );\r\n\r\n    -- contacts\r\n    CREATE TABLE contacts_ \r\n        (\r\n        pkid text\x2C\r\n        row_created_        timestamp\x2C\r\n        row_modified_       timestamp\x2C\r\n        row_username_       text\x2C\r\n        fkconven            text\x2C\r\n        primary_            text\x2C\r\n        name_first          text\x2C\r\n        name_last           text\x2C\r\n        job_title           text\x2C\r\n        company             text\x2C\r\n        email               text\x2C\r\n        phone_number        text\x2C\r\n        address_line1       text\x2C\r\n        address_line2       text\x2C\r\n        address_city        text\x2C\r\n        address_state       text\x2C\r\n        address_zip         text\x2C\r\n        address_country     text\r\n        );\r\n\r\n\r\n    -- venues\r\n    CREATE TABLE venues_ \r\n        (\r\n        pkid text\x2C\r\n        row_created_        timestamp\x2C\r\n        row_modified_       timestamp\x2C\r\n        row_username_       text\x2C\r\n        fkconven            text\x2C\r\n        primary_            text\x2C\r\n        name_               text\x2C\r\n        venue_type          text\x2C\r\n        company             text\x2C\r\n        email               text\x2C\r\n        phone_number        text\x2C\r\n        address_line1       text\x2C\r\n        address_line2       text\x2C\r\n        address_city        text\x2C\r\n        address_state       text\x2C\r\n        address_zip         text\x2C\r\n        address_country     text\r\n        );\r\n\r\n\r\n    -- discounts_\r\n    CREATE TABLE discounts_\r\n        (\r\n        pkid text\x2C\r\n        row_created_        timestamp\x2C\r\n        row_modified_       timestamp\x2C\r\n        row_username_       text\x2C\r\n        fkeipl_             text\x2C\r\n        department_         text\x2C\r\n        type_               text\x2C\r\n        amount_             integer\x2C\r\n        grand_total_        integer\x2C\r\n        subtotal            integer\x2C\r\n        discount_percent_   integer\x2C\r\n        discount_amount_    integer\r\n        );\r\n\r\n\r\n-- Utility Tables\r\n\r\n    -- trigger_log\r\n    CREATE TABLE trigger_log\r\n        (\r\n        pkid                text\x2C\r\n        row_created_        timestamp\x2C\r\n        table_name          text\x2C\r\n        new_variable        text\x2C \r\n        old_variable        text \x2C\r\n        statement_type text            \r\n\r\n        );\r\n\r\n    -- sql_log\r\n    Create Table sql_log\r\n        (\r\n            pkid text\x2C\r\n            row_created_ timestamp\x2C\r\n            sql_statement_ text\x2C\r\n            table_name text\x2C\r\n            columns_ text\x2C\r\n            row_checked boolean\r\n\r\n            );\r\n\r\n"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="DatabaseFile"
			Visible=true
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="data_ready"
			Group="Behavior"
			Type="boolean"
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
			Name="initialized"
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
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
