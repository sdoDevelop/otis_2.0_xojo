#tag Class
Protected Class scripts_class
	#tag Method, Flags = &h0
		Function GetEvent_Index_ByPkid(pkid as string) As integer
		  Dim lb1 as Listbox = window_main.TheListbox
		  
		  
		  For i1 as integer = 0 To lb1.ListCount - 1
		    
		    Dim RowPKID as String
		    RowPKID = lb1.RowTag(i1)
		    
		    If RowPKID = pkid Then
		      Return i1
		    End If
		    
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function load_event() As boolean
		  dim db as otis_database_manager = app.otis_db
		  dim lb1 as Listbox = window_main.TheListbox
		  dim rs as RecordSet
		  Dim exre1 as New ExecuteReturn
		  
		  
		  If lb1.ListIndex <> -1 Then
		    
		    // First we need to update the window event_pkid 
		    Dim ThePKID as String
		    ThePKID = lb1.RowTag(lb1.ListIndex)
		    window_main.pkid_events_ = ThePKID
		    
		    // Load any extra controls
		    exre1 = db.execute("Select","events_",_
		    Split("name_,details",","),_
		    Array(""),_
		    Array("pkid = '" + ThePKID + "'") )
		    
		    'event name
		    dim TheEventName as string = exre1.TheRecordSet.Field("name_").StringValue
		    If TheEventName = "" Then
		      TheEventName = "Click Here To Change"
		    End If
		    window_main.EventName.Text = TheEventName
		    
		    'Acount Manager
		    window_main.AccountManager.LoadFromDB
		    
		    'Details
		    window_main.EventDetails.LoadFromDB
		    
		    // Load the event date time container
		    window_main.ContainerControl_EventDateTimes1.Enabled = True
		    window_main.ContainerControl_EventDateTimes1.StartDate.LoadFromDB
		    window_main.ContainerControl_EventDateTimes1.StartTime.LoadFromDB
		    window_main.ContainerControl_EventDateTimes1.EndTime.LoadFromDB
		    window_main.ContainerControl_EventDateTimes1.EndDate.LoadFromDB
		    window_main.ContainerControl_EventDateTimes1.LoadInTime.LoadFromDB
		    window_main.ContainerControl_EventDateTimes1.LoadInDate.LoadFromDB
		    window_main.ContainerControl_EventDateTimes1.LoadOutTime.LoadFromDB
		    window_main.ContainerControl_EventDateTimes1.LoadOutDate.LoadFromDB
		    
		    'Contacts and Venues
		    window_main.EventContactsAndVenues.LoadFromDB
		    window_main.NewContact.Enabled = True
		    window_main.NewVenue.Enabled = True
		    
		    
		    
		  End If
		  
		  
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub load_event_listbox()
		  dim rs as RecordSet
		  dim db as otis_database_manager = app.otis_db
		  dim lb as Listbox = window_main.TheListbox
		  Dim exre1 as New ExecuteReturn
		  
		  
		  
		  // Clear the listbox
		  lb.DeleteAllRows
		  
		  // Put the listbox together
		  lb.ColumnCount = 3
		  lb.ColumnWidths = "100%,0%,0%"
		  
		  
		  // Grab the event records
		  Try
		    exre1 = db.execute("Select","events_",Array("pkid","name_","start_date","start_time"),Array(""),Array(""))
		  Catch err as RuntimeException
		    MsgBox("Could not load event listbox")
		    Return
		  End Try
		  
		  If exre1 <> Nil Then
		    rs = exre1.TheRecordSet
		  End If
		  
		  If rs <> Nil Then
		    
		    //loop through all the records
		    For i1 as integer = 0 To rs.RecordCount
		      
		      dim name as string = rs.Field("name_").StringValue
		      dim start_date_ as string = rs.Field("start_date").StringValue
		      dim start_time_ as string = rs.Field("start_time").StringValue
		      
		      
		      If i1 = 0 Then
		        lb.AddRow("Name","","")
		      Else
		        lb.AddRow(Array(name,start_date_,start_time_))
		        lb.RowTag(i1) = rs.Field("pkid").StringValue
		        rs.MoveNext
		      End If
		      
		      
		    Next
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewContactVenue()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewContactVenue(ContactOrVenue as string, ParentTable as string, ParentTablePKID as string, Columns() as string, Values() as string)
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim TableName,TheColumns(),TheValues(),TheConditions() as String
		  Dim exre1 as ExecuteReturn
		  Dim COVpkid as String
		  
		  
		  // Loop through the columns and values and seperate them into appropriate tables
		  Dim ColumnsCV(),ColumnsCVD() as string
		  Dim ValuesCV(),ValuesCVD() as string
		  For i1 as integer = 0 To Columns.Ubound
		    If InStr(Columns(i1),"contact_venue_data") > 0 Then
		      ColumnsCVD.Append(Columns(i1))
		      ValuesCVD.Append(Values(i1))
		    Else
		      ColumnsCV.Append(Columns(i1))
		      ValuesCV.Append(Values(i1))
		    End If
		  Next
		  
		  // Create the New Contact Or Venue
		  
		  'Set TableName
		  Select Case ContactOrVenue
		  Case "Contact"
		    TableName = "contacts_"
		  Case "Venue"
		    TableName = "venues_"
		  End Select
		  
		  'Set Other values
		  TheColumns = ColumnsCV()
		  TheValues = ValuesCV()
		  TheConditions = Array("")
		  
		  'Execute on db to create the contact or venue
		  exre1 = db1.execute("Insert",TableName,ColumnsCV(),ValuesCV(),TheConditions() ) 
		  If exre1.ThePKID = "" Then
		    'error has occured contact was not made or no pkid was created exit out before we do any damage
		    err_manage("NewContactVenue", "Could not create the " + ContactOrVenue + " run for your life!")
		    Return
		  End If
		  
		  // Link the Contact Or Venue to the desired table
		  
		  'Lets start by filling in the information we already know
		  ColumnsCVD.Append("fkcontact_or_venue")
		  ColumnsCVD.Append("contact_or_venue")
		  ColumnsCVD.Append("fkparent_table")
		  ColumnsCVD.Append("parent_table")
		  ValuesCVD.Append(exre1.ThePKID)
		  ValuesCVD.Append(ContactOrVenue)
		  ValuesCVD.Append(ParentTablePKID)
		  ValuesCVD.Append(ParentTable)
		  
		  'Set Other values
		  TableName = "contact_venue_data"
		  TheColumns = ColumnsCVD()
		  TheValues = ValuesCVD()
		  TheConditions = Array("")
		  
		  'Execute on db to link tables
		  exre1 = db1.execute("Insert",TableName,ColumnsCVD(),ValuesCVD(),TheConditions() ) 
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub new_event()
		  dim rs as RecordSet
		  dim db as otis_database_manager = app.otis_db
		  dim lb as listbox = window_main.TheListbox
		  Dim exre1 as New ExecuteReturn
		  
		  
		  
		  Try
		    exre1 = db.execute("Insert","events_",Array(""),Array(""),Array(""))
		  Catch err as RuntimeException
		    MsgBox("Could not create an event")
		    Return
		  End Try
		  
		  If exre1 <> Nil Then
		    rs = exre1.TheRecordSet
		  End If
		  
		  dim thepkid as string = exre1.ThePKID
		  window_main.pkid_events_ = thepkid
		  
		  load_event_listbox
		  
		  
		  
		  
		  lb.ListIndex = GetEvent_Index_ByPkid(thepkid)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectEventByPKID(ThePKID as string)
		  Dim lb1 as Listbox = window_main.TheListbox
		  
		  
		  
		  For i1 as integer = 0 To lb1.ListCount - 1
		    
		    If lb1.RowTag(i1) = ThePKID Then
		      lb1.ListIndex = i1
		      Return
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub start_script()
		  // In this script we will be handling launcing all the necesarry methods to
		  // Connect to the local database and create its structure 
		  // Connect to the remote databse
		  
		  
		  // Check for update
		  ' ---tocome--
		  
		  
		  // Try to delete database file
		  dim f as new FolderItem 
		  f = resource_management.get_filepath("otis_db_file")
		  if f <> Nil Then
		    if f.Exists Then
		      f.Delete
		      if f.LastErrorCode <> 0 Then
		        'could not delete file
		        err_manage( "local_db", "Could not delete sqlite database file" )
		      end if
		    end if
		  end if
		  
		  // Perep triggers file
		  trigger_methods.c_CreateTriggerFile
		  
		  
		  // Attempt connection to local database
		  app.otis_db = new otis_database_manager
		  Try 
		    app.otis_db.connect_to_local
		  Catch err as RuntimeException
		    err_manage
		    Return
		  End Try
		  
		  // Check if the local database is initialized
		  If Not app.otis_db.local_db.initialized Then
		    
		    'database not initialized we need to do so
		    app.otis_db.initialize_local
		  end if
		  
		  
		  // Attempt Connection to remote database
		  Try
		    app.otis_db.connect_to_remote
		  Catch err as RuntimeException
		    err_manage( "remote_db", err.ErrorNumber, err.Message )
		  End Try
		  
		  // Check the state of the data
		  Select Case app.otis_db.data_state
		  Case "full_sync"
		    If app.otis_db.full_sync = 0 Then
		      app.otis_db.work_offline = False
		    Else
		      MsgBox( "Errors occurred while doing a full sync from remote to local database" )
		      app.otis_db.work_offline = False
		    End If
		  Case "half_sync"
		    
		  Case "offline"
		    app.otis_db.work_offline = True
		  Case "no_luck"
		    
		  End Select
		  
		  
		  
		  
		  
		  MsgBox( "running" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  
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
End Class
#tag EndClass
