#tag Module
Protected Module InitializationModule
	#tag Method, Flags = &h21
		Private Function CheckDatabase() As Boolean
		  Dim rd1 as New ResourceDirectories
		  
		  Return CheckDatabase( rd1.otis_data_file.FilePath, OtisDataCheckScript )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckDatabase(DatabaseFile as FolderItem, CreationScript as string) As Boolean
		  // RuntimeException
		  
		  Dim RD1 as new ResourceDirectories
		  Dim db1 as New SQLiteDatabase 
		  Dim ErrorCount as integer
		  Dim ErrorList() as string
		  Dim ReturnValue as Integer  ' 0=unchanged , 1=check failed , 2=check passed
		  
		  
		  // Connect To database file
		  db1.DatabaseFile = DatabaseFile
		  If Not db1.Connect Then
		    // No database file
		    Break
		    ReturnValue = 1
		    
		  Else
		    ' There is a database file
		    
		    // Create tables in database file
		    
		    ' Break sql into individual statements
		    Dim sql_statements() as string
		    sql_statements = Split( CreationScript, ";" )
		    
		    // Add ';' back to sql statements and execute
		    For i1 as integer = 0 To sql_statements.Ubound
		      
		      If InStr(sql_statements(i1),"Select") > 0 Then
		        ' Add ';' back in
		        sql_statements(i1) = sql_statements(i1) + " Where pkid = 0 ;"
		      Else
		        sql_statements.Remove(i1)
		        Continue
		      End If
		      
		      'extract just the fields
		      Dim s1,oFields() as string
		      s1 = Mid(sql_statements(i1),InStr(s1,"Select") + 7 )
		      s1 = Left(s1,s1.InStr("From") - 1)
		      oFields = Split(s1,",")
		      
		      'Execute sql
		      Dim rs1 as RecordSet
		      rs1 = db1.SQLSelect(sql_statements(i1))
		      If db1.Error Then
		        ErrorList.Append db1.ErrorMessage
		        ErrorCount = ErrorCount + 1
		      End If
		      
		      If rs1 <> Nil Then
		        // Check oFields total compared to rs1.FieldCount
		        If oFields.Ubound + 1 <> rs1.FieldCount Then
		          'Number of fields to not match 
		          Break
		          ReturnValue = 1
		          Exit
		        Else
		          If ReturnValue <> 1 Then
		            ReturnValue = 2
		          End If
		        End If
		      Else
		        Break
		        ReturnValue = 1
		      End If
		      
		      
		    Next
		    
		    // Check if there were any errors
		    If ErrorCount <> 0 Then
		      'errors occurred
		      break
		      ReturnValue = 1
		    Else
		      If ReturnValue <> 1 Then
		        ReturnValue = 2
		      End If
		      
		    End If
		    
		    Dim rs2 as RecordSet
		    // Now we check the count of tables
		    rs2 = db1.SQLSelect("Select count(*) From sqlite_master Where type = 'table';")
		    If db1.Error Then
		      break
		    End If
		    
		    dim n1 as integer
		    n1 = rs2.Field("count(*)").IntegerValue
		    If n1 <> sql_statements.Ubound + 1 Then
		      'table number mismatch
		      Break
		      ReturnValue = 1
		    Else
		      
		    End If
		    
		    
		  End If
		  
		  db1.Close
		  
		  Select Case ReturnValue
		  Case 0 or 1 
		    Return False
		  Case 2
		    Return True
		  End Select
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CheckDatabases() As Boolean
		  // Returns True if databases check out alright
		  // Returns False if databases do not check out alright
		  
		  
		  // Check if all of the tables are actually created correctly in the database
		  Dim bool1,bool2,bool3,bool4 as Boolean
		  Dim rd1 as New ResourceDirectories
		  
		  
		  bool1 = CheckDatabase(rd1.otis_data_file.FilePath,OtisDataCheckScript)
		  bool2 = CheckDatabase(rd1.utility_db_file.FilePath,UtilityDBCheckScript)
		  bool3 = CheckDatabase(rd1.sync_db_file.FilePath,SyncDBCheckScript)
		  bool4 = CheckDatabase(rd1.user_db_file.FilePath,UserDBCheckScript)
		  rd1 = nil
		  
		  If bool1 And bool2 And bool3 And bool4 Then
		    ' All tables are created correctly we can be pretty sure that we are ready to go
		    Return True
		  Else
		    ' Tables have not been created correctly, we must do a reset
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CheckInitializedFile() As Boolean
		  // Returns True if initialized file says true
		  // Returns False if Initialized file says false or doesn't exist
		  
		  
		  
		  Dim RD1 as New ResourceDirectories
		  
		  
		  // Open the folder
		  Dim InitializedFileValue as string
		  Dim f As FolderItem = RD1.initialized_file.FilePath
		  If f <> Nil Then
		    If f.Exists Then
		      // Be aware that TextInputStream.Open coud raise an exception
		      Dim t As TextInputStream
		      // Read the file
		      Try
		        t = TextInputStream.Open(f)
		        InitializedFileValue = t.ReadAll
		        t.Close
		      Catch e As IOException
		        Return False
		      End Try
		    End If
		  End If
		  
		  
		  If InitializedFileValue = "True" Then
		    Return True
		  Else
		    Return False
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateDatabase()
		  Dim rd1 as New ResourceDirectories
		  
		  CreateDatabase( rd1.otis_data_file.FilePath, OtisDataCreationScript )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateDatabase(DatabaseFile as FolderItem, CreationScript as String)
		  // RuntimeException
		  
		  Dim RD1 as new ResourceDirectories
		  Dim db1 as New SQLiteDatabase
		  Dim ErrorCount as integer
		  Dim ErrorList() as string
		  
		  
		  // Create the database file
		  db1.DatabaseFile = DatabaseFile
		  If Not db1.CreateDatabaseFile Then
		    db1.Close
		    Dim err as RuntimeException
		    err.Message = "Could not create database file"
		    Raise err
		  End If
		  
		  
		  // Create tables in database file
		  
		  ' Break sql into individual statements
		  Dim sql_statements() as string
		  sql_statements = Split( CreationScript, ";" )
		  
		  // Add ';' back to sql statements and execute
		  For i1 as integer = 0 To sql_statements.Ubound
		    
		    ' Add ';' back in
		    sql_statements(i1) = sql_statements(i1) + ";"
		    
		    'Execute sql
		    db1.SQLExecute(sql_statements(i1))
		    If db1.Error Then
		      ErrorCount = ErrorCount + 1
		      Redim ErrorList(ErrorCount - 1)
		      ErrorList( ErrorCount - 1 ) = db1.ErrorMessage
		      ErrManage( "dbCreation",db1.ErrorMessage )
		      break
		    End If
		    
		  Next
		  
		  db1.Close
		  
		  // Check if there were any errors
		  If ErrorCount <> 0 Then
		    Dim err as New RuntimeException
		    err.Message = "There were errors during database table creation"
		    Raise err
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateDatabases()
		  Dim rd1 as New ResourceDirectories
		  
		  
		  // Create the database and tables
		  InitializationModule.CreateDatabase
		  If Not InitializationModule.CheckDatabase Then
		    'Database creation did not work
		    dim err as New RuntimeException
		    err.Message = "Something wrong with database creation"
		    ErrManage( "InitializeClient",err.Message + " | " + Join(err.Stack,",") )
		    raise err
		  End If
		  
		  // Create the Utility database
		  CreateDatabase(RD1.utility_db_file.FilePath,UtilityDBCreationScript)
		  If Not CheckDatabase(rd1.utility_db_file.FilePath,UtilityDBCheckScript) Then
		    'Database creation did not work
		    dim err as New RuntimeException
		    err.Message = "Something wrong with utility database creation"
		    ErrManage( "InitializeClient",err.Message + " | " + Join(err.Stack,",") )
		    raise err
		  End If
		  
		  // Create the Sync database
		  CreateDatabase(RD1.sync_db_file.FilePath,SyncDBCreationScript)
		  If Not CheckDatabase(rd1.sync_db_file.FilePath,SyncDBCheckScript) Then
		    'Database creation did not work
		    dim err as New RuntimeException
		    err.Message = "Something wrong with utility database creation"
		    ErrManage( "InitializeClient",err.Message + " | " + Join(err.Stack,",") )
		    raise err
		  End If
		  
		  // Create the User database
		  CreateDatabase(RD1.user_db_file.FilePath,UserDBCreationScript)
		  If Not CheckDatabase(rd1.user_db_file.FilePath,UserDBCheckScript) Then
		    'Database creation did not work
		    dim err as New RuntimeException
		    err.Message = "Something wrong with utility database creation"
		    ErrManage( "InitializeClient",err.Message + " | " + Join(err.Stack,",") )
		    raise err
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteDatabases()
		  Dim rd1 as New ResourceDirectories
		  Dim f1() as FolderItem
		  
		  
		  f1.Append( rd1.otis_data_file.FilePath )
		  f1.Append( rd1.utility_db_file.FilePath )
		  f1.Append( rd1.sync_db_file.FilePath )
		  f1.Append( rd1.user_db_file.FilePath )
		  f1.Append( rd1.client_id_file.FilePath )
		  
		  For i1 as integer = 0 To f1.Ubound
		    
		    If f1(i1).Exists Then
		      f1(i1).Delete
		      If f1(i1).LastErrorCode > 0 Then
		        ErrManage("DeleteDatabases","Could Not delete database file. | " + i1.ToText )
		      End If
		    End If
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitialSetup()
		  
		  
		  // Delete the databases
		  DeleteDatabases
		  
		  // Create the databases
		  CreateDatabases
		  
		  
		  
		  
		  
		  
		  // Create the initialized file
		  Dim rd1 as New ResourceDirectories
		  If rd1.initialized_file.FilePath <> Nil Then
		    Try
		      Dim tos1 as TextOutputStream = TextOutputStream.Create(rd1.initialized_file.FilePath)
		      tos1.Write("True")
		      tos1 = Nil
		    Catch err as IOException
		      
		    End Try
		  End If
		  
		  
		  
		  
		  Exception err as RuntimeException
		    Raise err
		End Sub
	#tag EndMethod


	#tag Constant, Name = OtisDataCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Select \r\n    pkid                \x2C\r\n    row_created         \x2C\r\n    row_modified        \x2C\r\n    row_username        \x2C\r\n    event_name          \x2C\r\n    start_time          \x2C\r\n    end_time            \x2C\r\n    loadin_time         \x2C\r\n    loadout_time        \x2C\r\n    start_date          \x2C\r\n    end_date            \x2C\r\n    loadin_date         \x2C\r\n    loadout_date        \x2C\r\n    event_details       \x2C\r\n    account_manager     \x2C\r\n    hide\r\n    From tbl_events\r\n    ;\r\n\r\nSelect\r\n        pkid               \x2C\r\n        row_created        \x2C\r\n        row_modified       \x2C\r\n        row_username       \x2C\r\n        fk_parent          \x2C\r\n        fk_child           \x2C\r\n        fk_table_name      \x2C\r\n        link_type          \x2C\r\n        quantity           \r\n        From tbl_internal_linking\r\n        ;\r\n\r\nSelect\r\n    pkid                \x2C\r\n    row_created         \x2C\r\n    row_modified        \x2C\r\n    row_username        \x2C\r\n    fkevents_parent     \x2C\r\n    fkevents_child      \r\n    From tbl_events_link\r\n    ;\r\n\r\n-- lineitems_\r\nSelect\r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkeipl                      \x2C\r\n    fkinventory                 \x2C\r\n    li_name                     \x2C\r\n    li_manufacturer             \x2C\r\n    li_model                    \x2C\r\n    li_department               \x2C\r\n    li_category                 \x2C\r\n    li_subcategory              \x2C\r\n    li_description              \x2C \r\n    li_type                     \x2C\r\n    li_price                    \x2C\r\n    li_note                     \x2C \r\n    li_rate                     \x2C\r\n    discount_percent            \x2C\r\n    discount_amount             \x2C\r\n    li_total                    \x2C\r\n    li_time                     \x2C\r\n    li_taxable                  \x2C\r\n    li_taxtotal                 \x2C\r\n    li_quantity                  \x2C\r\n    ignore_price_discrepency    \r\n    From tbl_lineitems\r\n    ;\r\n\r\n\r\n-- inventory\r\nSelect \r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    item_name                   \x2C\r\n    item_manufacturer           \x2C\r\n    item_model                  \x2C\r\n    item_department             \x2C\r\n    item_category               \x2C\r\n    item_subcategory            \x2C\r\n    item_description            \x2C\r\n    item_status                 \x2C\r\n    show_items                  \x2C\r\n    show_items_discreetly       \x2C\r\n    item_quantity               \x2C\r\n    item_purchase_price_cost    \x2C\r\n    item_rental_price_cost      \x2C\r\n    item_sale_price_cost        \x2C\r\n    item_owner                  \x2C\r\n    item_taxable                \x2C\r\n    item_weight                 \x2C\r\n    item_height                 \x2C\r\n    item_depth                  \x2C\r\n    item_width                  \x2C\r\n    item_barcode                \x2C    \r\n    item_rfid_code              \x2C\r\n    item_serial_code            \x2C\r\n    item_type                   \x2C\r\n    physical_item               \x2C\r\n    hide                             \r\n    From tbl_inventory\r\n    ;\r\n\r\n-- firmware\r\nSelect\r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fk_inventory                \x2C\r\n    update_date                 \x2C\r\n    firmware_version            \x2C\r\n    update_comments             \r\n    From  tbl_firmware\r\n    ;\r\n\r\n-- inventory_link\r\nSelect \r\n    pkid                        \x2C         \r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkinventory_parent          \x2C\r\n    fkinventory_child           \x2C\r\n    link_type                   \x2C\r\n    quantity                    \r\n    From tbl_inventory_link\r\n    ;\r\n\r\n-- Maintenance Logs\r\nSelect \r\n    pkid\x2C                   \r\n    row_created\x2C                 \r\n    row_modified\x2C                \r\n    row_username\x2C               \r\n    fkinventory\x2C                \r\n    entry_date\x2C                  \r\n    exit_date\x2C                 \r\n    due_date\x2C                  \r\n    work_cost\x2C                  \r\n    work_summary\x2C                \r\n    work_description\x2C            \r\n    work_comments\x2C           \r\n    work_type   \x2C\r\n    work_done_by                \r\n    From tbl_maintenance_Logs\r\n    ;\r\n\r\n-- eipl_\r\nSelect \r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkevents                    \x2C\r\n    eipl_number                 \x2C\r\n    due_date                    \x2C\r\n    eipl_type                   \x2C\r\n    eipl_balance                \x2C\r\n    eipl_grand_total            \x2C\r\n    eipl_subtotal               \x2C\r\n    eipl_total_paid             \x2C\r\n    discount_amount             \x2C\r\n    discount_percent            \x2C\r\n    shipping_method             \x2C\r\n    tax_total                   \x2C\r\n    discount_total              \r\n    From tbl_eipl\r\n    ;\r\n\r\n\r\n-- payments_\r\nSelect  \r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkeipl                      \x2C\r\n    payment_date                \x2C\r\n    payment_memo                \x2C\r\n    payment_amount              \x2C\r\n    payment_type                \r\n    From tbl_payments\r\n    ;\r\n\r\n\r\n-- contact_venue_data\r\nSelect \r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkcontacts                  \x2C\r\n    fkvenues                    \x2C\r\n    fkevents                    \x2C\r\n    fkeipl                      \x2C\r\n    cvd_primary                 \r\n    From tbl_contact_venue_data\r\n    ;\r\n\r\n-- contactables\r\nSelect\r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    indv_bus_ven                \x2C\r\n    type                        \x2C\r\n    name_first                  \x2C\r\n    name_last                   \x2C\r\n    job_title                   \x2C\r\n    company                     \x2C\r\n    address_line1               \x2C\r\n    address_line2               \x2C\r\n    address_city                \x2C\r\n    address_state               \x2C\r\n    address_zip                 \x2C\r\n    address_country             \x2C\r\n    hide                        \r\n    From tbl_contactables\r\n    ;\r\n\r\nSelect\r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkcontactables_parent       \x2C\r\n    fkcontactables_child        \r\n    From tbl_contactables_link\r\n    ;\r\n\r\nSelect\r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkcontactables              \x2C\r\n    method                      \x2C\r\n    method_type                 \x2C\r\n    method_location             \x2C\r\n    primary_method              \x2C\r\n    hide\r\n    From tbl_contact_methods                     \r\n    ;\r\n\r\n-- tbl_departments\r\nSelect\r\n    pkid                        \x2C\r\n    row_created                 \x2C\r\n    row_modified                \x2C\r\n    row_username                \x2C\r\n    fkeipl                      \x2C\r\n    department                  \x2C\r\n    grand_total                 \x2C\r\n    discount_subtotal           \x2C\r\n    discount_percent            \x2C\r\n    discount_amount             \r\n    From tbl_departments\r\n    ;"
	#tag EndConstant

	#tag Constant, Name = OtisDataCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Create Table tbl_events\r\n        (\r\n        pkid                integer Primary Key\x2C\r\n        row_created         text\x2C\r\n        row_modified        text\x2C\r\n        row_username        text\x2C\r\n        event_name          text\x2C\r\n        start_time          text\x2C\r\n        end_time            text\x2C\r\n        loadin_time         text\x2C\r\n        loadout_time        text\x2C\r\n        start_date          text\x2C\r\n        end_date            text\x2C\r\n        loadin_date         text\x2C\r\n        loadout_date        text\x2C\r\n        event_details       text\x2C\r\n        account_manager     text\x2C\r\n        event_tags          text\x2C\r\n        hide                boolean\r\n        );\r\n\r\nCreate Table tbl_internal_linking\r\n        (\r\n        pkid                integer Primary Key\x2C\r\n        row_created         text\x2C\r\n        row_modified        text\x2C\r\n        row_username        text\x2C\r\n        fk_parent           integer\x2C\r\n        fk_child            integer\x2C\r\n        fk_table_name       text\x2C\r\n        link_type           text\x2C\r\n        quantity            integer\r\n        );\r\n\r\nCreate Table tbl_events_link\r\n        (\r\n        pkid                integer Primary Key\x2C\r\n        row_created         text\x2C\r\n        row_modified        text\x2C\r\n        row_username        text\x2C\r\n        fkevents_parent     integer\x2C\r\n        fkevents_child      integer\r\n        );\r\n\r\n    -- lineitems_\r\n    Create Table tbl_lineitems \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkeipl                      text\x2C\r\n        fkinventory                 text\x2C\r\n        li_name                     text\x2C\r\n        li_manufacturer             text\x2C\r\n        li_model                    text\x2C\r\n        li_department               text\x2C\r\n        li_category                 text\x2C\r\n        li_subcategory              text\x2C\r\n        li_description              text\x2C \r\n        li_type                     text\x2C\r\n        li_price                    integer\x2C\r\n        li_note                     text\x2C \r\n        li_rate                     text\x2C\r\n        discount_percent            integer\x2C\r\n        discount_amount             integer\x2C\r\n        li_total                    integer\x2C\r\n        li_time                     integer\x2C\r\n        li_taxable                  boolean\x2C\r\n        li_taxtotal                 integer\x2C\r\n        li_quantity                 double precision\x2C\r\n        ignore_price_discrepency    boolean\r\n        );\r\n\r\n\r\n    -- inventory\r\n    CREATE TABLE tbl_inventory \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        item_name                   text\x2C\r\n        item_manufacturer           text\x2C\r\n        item_model                  text\x2C\r\n        item_department             text\x2C\r\n        item_category               text\x2C\r\n        item_subcategory            text\x2C\r\n        item_description            text\x2C\r\n        item_status                 text\x2C\r\n        show_items                  boolean\x2C\r\n        show_items_discreetly       boolean\x2C\r\n        item_quantity               integer\x2C\r\n        item_purchase_price_cost    integer\x2C\r\n        item_rental_price_cost      integer\x2C\r\n        item_sale_price_cost        integer\x2C\r\n        item_owner                  text\x2C\r\n        item_taxable                boolean\x2C\r\n        item_weight                 text\x2C\r\n        item_height                 text\x2C\r\n        item_depth                  text\x2C\r\n        item_width                  text\x2C\r\n        item_barcode                text\x2C\r\n        item_rfid_code              text\x2C\r\n        item_serial_code            text\x2C\r\n        item_type                   text\x2C\r\n        physical_item               boolean\x2C\r\n        hide                        boolean\r\n        );\r\n\r\n    -- inventory link\r\n    Create Table tbl_inventory_link\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkinventory_parent          integer\x2C\r\n        fkinventory_child           integer\x2C\r\n        link_type                   text\x2C\r\n        quantity                    integer\r\n        );\r\n\r\n    -- firmware\r\n    Create Table tbl_firmware\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fk_inventory                integer\x2C\r\n        update_date                 text\x2C\r\n        firmware_version            text\x2C\r\n        update_comments             text\r\n        );\r\n\r\n    -- Maintenance Logs\r\n    Create Table tbl_maintenance_Logs\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkinventory                   integer\x2C\r\n        entry_date                  text\x2C\r\n        exit_date                   text\x2C\r\n        due_date                    text\x2C\r\n        work_cost                   integer\x2C\r\n        work_summary                text\x2C\r\n        work_description            text\x2C\r\n        work_comments               text\x2C\r\n        work_type                   text\x2C\r\n        work_done_by                text\r\n        );\r\n\r\n\r\n    -- eipl_\r\n    Create Table tbl_eipl \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkevents                    integer\x2C\r\n        eipl_number                 integer\x2C\r\n        due_date                    text\x2C\r\n        eipl_type                   text\x2C\r\n        eipl_balance                integer\x2C\r\n        eipl_grand_total            integer\x2C\r\n        eipl_subtotal               integer\x2C\r\n        eipl_total_paid             integer\x2C\r\n        discount_amount             integer\x2C\r\n        discount_percent            integer\x2C\r\n        shipping_method             text\x2C\r\n        tax_total                   integer\x2C\r\n        discount_total              integer\r\n        );\r\n\r\n\r\n    -- payments_\r\n    Create Table tbl_payments \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkeipl                      text\x2C\r\n        payment_date                date\x2C\r\n        payment_memo                text\x2C\r\n        payment_amount              integer\x2C\r\n        payment_type                text\r\n        );\r\n\r\n\r\n    -- contact_venue_data\r\n    CREATE TABLE tbl_contact_venue_data \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkcontacts                  text\x2C\r\n        fkvenues                    text\x2C\r\n        fkevents                    text\x2C\r\n        fkeipl                      text\x2C\r\n        cvd_primary                 boolean\r\n        );\r\n\r\n    -- contactables\r\n    CREATE TABLE tbl_contactables\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        indv_bus_ven                text\x2C\r\n        type                        text\x2C\r\n        name_first                  text\x2C\r\n        name_last                   text\x2C\r\n        job_title                   text\x2C\r\n        company                     text\x2C\r\n        address_line1               text\x2C\r\n        address_line2               text\x2C\r\n        address_city                text\x2C\r\n        address_state               text\x2C\r\n        address_zip                 text\x2C\r\n        address_country             text\x2C\r\n        hide                        boolean\r\n        );\r\n\r\n    -- contactables link\r\n    CREATE TABLE tbl_contactables_link\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkcontactables_parent       integer\x2C\r\n        fkcontactables_child        integer\r\n        );\r\n\r\n    CREATE TABLE tbl_contact_methods\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkcontactables              integer\x2C\r\n        method                      text\x2C\r\n        method_type                 text\x2C\r\n        method_location             text\x2C\r\n        primary_method              boolean\x2C\r\n        hide                        boolean\r\n        );\r\n\r\n    -- tbl_departments\r\n    CREATE TABLE tbl_departments\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 text\x2C\r\n        row_modified                text\x2C\r\n        row_username                text\x2C\r\n        fkeipl                      text\x2C\r\n        department                  text\x2C\r\n        grand_total                 integer\x2C\r\n        discount_subtotal           integer\x2C\r\n        discount_percent            integer\x2C\r\n        discount_amount             integer\r\n        );"
	#tag EndConstant

	#tag Constant, Name = SyncDBCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Select \r\tpkid\t\t\x2C\r\tjson_info\t\x2C\r\tpushed\t\t\rFrom\r\tchanges_raw\r\t;\r\rSelect \r\tpkid\t\t\x2C\r\tjson_info\t\x2C\r\tpushed \t\t\rFrom\r\tchanges_consolidated\r\t;"
	#tag EndConstant

	#tag Constant, Name = SyncDBCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Create Table changes_raw\r\t(\r\tpkid\t\tInteger\tPrimary Key\x2C\r\tjson_info\tText\t\x2C\r\tpushed\t\tBoolean\t\r\t\t);\r\rCreate Table changes_consolidated\r\t(\r\tpkid\t\tInteger\tPrimary Key\x2C\r\tjson_info\tText\t\x2C\r\tpushed\t\tBoolean\t\r\t\t);"
	#tag EndConstant

	#tag Constant, Name = UserDBCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Select \r\tpkid\t\t\x2C\r\tfkuser_info\r\tusername\t\x2C\r\tpassword\t\x2C\r\tauto_login\t\t\t\rFrom\r\tlogin_info\r\t;\r\rSelect \r\tpkid\t\t\x2C\r\tname_first\t\x2C\r\tname_last  \t\t\rFrom\r\tuser_info\r\t;"
	#tag EndConstant

	#tag Constant, Name = UserDBCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Create Table login_info\r\t(\r\tpkid\t\tInteger\tPrimary Key\x2C\r\tfkuser_info\tInteger \x2C\r\tusername\tText\t\x2C\r\tpassword\tText\t\x2C\r\tauto_login\tBoolean \r\t\t);\r\rCreate Table user_info\r\t(\r\tpkid\t\tInteger\tPrimary Key\x2C\r\tname_first\tText\t\x2C\r\tname_last\tText\t\r\t\t);"
	#tag EndConstant

	#tag Constant, Name = UtilityDBCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Select\r    \tpkid\r    \tFrom tbl_incrementing\r    \t;"
	#tag EndConstant

	#tag Constant, Name = UtilityDBCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"CREATE TABLE tbl_incrementing\r        (\r        pkid                        integer Primary Key\r        );"
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
