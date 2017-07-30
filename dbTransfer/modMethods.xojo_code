#tag Module
Protected Module modMethods
	#tag Method, Flags = &h1
		Protected Function ConnectNew() As Boolean
		  dim db1 as New PostgreSQLDatabase
		  
		  db1.Host = "45.63.78.70"
		  db1.Port = 5432
		  db1.DatabaseName = "otis_data_transfer"
		  db1.UserName = "postgres"
		  db1.Password = "3agle5f0rL!fe"
		  
		  If Not db1.Connect Then
		    MsgBox( "Could not connect to old database" )
		    Return False
		  End If
		  
		  App.NewDB = db1
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ConnectOld() As Boolean
		  dim db1 as New PostgreSQLDatabase
		  
		  db1.Host = "24.196.52.102"
		  db1.Port = 5432
		  db1.DatabaseName = "otis_transfer"
		  db1.UserName = "serveradmin"
		  db1.Password = "3agle5f0rL!fe"
		  
		  If Not db1.Connect Then
		    MsgBox( "Could not connect to old database" )
		    Return False
		  End If
		  
		  App.OldDB = db1
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetNewPKID() As Integer
		  dim newDB as PostgreSQLDatabase = app.NewDB
		  
		  dim sql as string = "Select * From client_reg.fnc_get_id_block('transfer',1);"
		  
		  dim rs as RecordSet = newDB.SQLSelect(sql)
		  If newDB.Error Then
		    Break
		  End If
		  
		  dim sID as string = rs.Field("fnc_get_id_block").StringValue
		  dim sIDArray() as string = sID.Split(",")
		  dim iID as int64 = val( sIDArray(0) )
		  
		  
		  Return iID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetOldData() As Boolean
		  OldData = New Dictionary
		  dim db as PostgreSQLDatabase = App.OldDB
		  
		  dim sTableNames() as String = Array("contact_venue_data","contacts","discounts_","eipl","events_","inventory","lineitems","payments_","venues")
		  
		  For Each sTable as string In sTableNames()
		    
		    Window1.Listbox1.AddRow("Getting Data From: " + sTable )
		    
		    dim sql as string
		    sql = "Select * From " + sTable + ";"
		    
		    dim rs as RecordSet
		    rs = db.SQLSelect(sql)
		    If db.Error Then
		      Window1.Listbox1.AddRow("Error getting data from: " + sTable )
		      window1.Listbox1.addrow( db.ErrorMessage )
		    End If
		    
		    OldData.Value(sTable) = rs
		    
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InsertContactables()
		  dim db as PostgreSQLDatabase = App.NewDB
		  
		  dim rs as RecordSet = OldData.value("contacts")
		  
		  For i1 as integer = 1 To rs.RecordCount
		    
		    dim sql as string
		    sql = "Insert Into tbl_contactables ("_
		    + "pkid, row_created, row_modified, row_username, type, name_first, name_last,"_
		    + "job_title, company, address_line1, address_line2, address_city, address_state, address_zip, address_country) "_
		    + "Values($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15);"
		    dim ps as PostgreSQLPreparedStatement = db.Prepare(sql)
		    ps.Bind(0,GetNewPKID.ToText)
		    ps.Bind(1,rs.Field("row_created").StringValue)
		    ps.Bind( 2,rs.Field("row_modified").StringValue)
		    ps.Bind( 3,rs.Field("row_username").StringValue)
		    ps.Bind(4,"Contact")
		    ps.Bind(5, rs.Field("namefirst").StringValue)
		    ps.Bind(6,rs.Field("namelast").StringValue)
		    ps.Bind( 7,rs.Field("jobtitle").StringValue)
		    ps.Bind( 8, rs.Field("company").StringValue)
		    ps.Bind( 9,rs.Field("addressline1").StringValue)
		    ps.Bind(10,rs.Field("addressline2").StringValue)
		    ps.Bind(11,rs.Field("addresscity").StringValue)
		    ps.Bind(12, rs.Field("addressstate").StringValue)
		    ps.Bind(13,rs.Field("addresszip").StringValue)
		    ps.Bind(14,rs.Field("addresscountry").StringValue)
		    
		    ps.SQLExecute()
		    If db.Error Then
		      Break
		    End If
		    
		    rs.MoveNext
		    
		  Next
		  
		  Window1.Listbox1.AddRow("Done!")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InsertEvents()
		  dim db as PostgreSQLDatabase = App.NewDB
		  
		  dim rs as RecordSet = OldData.value("events_")
		  
		  For i1 as integer = 1 To rs.RecordCount
		    
		    dim sql as string
		    sql = "Insert Into tbl_events ("_
		    + "pkid, row_created, row_modified, row_username, "_
		    + "event_name, start_time, end_time, loadin_time, loadout_time, "_
		    + "start_date, end_date, loadin_date, loadout_date, "_
		    + "event_details, account_manager) "_
		    + "Values( $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15);"
		    dim ps as PostgreSQLPreparedStatement = db.Prepare(sql)
		    ps.Bind(0,GetNewPKID.ToText)
		    ps.Bind(1,rs.Field("row_created").StringValue)
		    ps.Bind( 2,rs.Field("row_modified").StringValue)
		    ps.Bind( 3,rs.Field("row_username").StringValue)
		    ps.Bind(4,rs.Field("name").StringValue)
		    ps.Bind(5, rs.Field("starttime_").StringValue)
		    ps.Bind(6,rs.Field("endtime_").StringValue)
		    ps.Bind( 7,rs.Field("loadintime_").StringValue)
		    ps.Bind( 8, rs.Field("loadouttime_").StringValue)
		    ps.Bind( 9,rs.Field("startdate_").StringValue)
		    ps.Bind(10,rs.Field("enddate_").StringValue)
		    ps.Bind(11,rs.Field("loadindate_").StringValue)
		    ps.Bind(12, rs.Field("loadoutdate_").StringValue)
		    ps.Bind(13,rs.Field("details").StringValue)
		    ps.Bind(14,rs.Field("acountmanager_").StringValue)
		    
		    ps.SQLExecute()
		    If db.Error Then
		      Break
		    End If
		    
		    rs.MoveNext
		    
		  Next
		  
		  Window1.Listbox1.AddRow("Done!")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InsertLineItems()
		  dim db as PostgreSQLDatabase = App.NewDB
		  
		  dim rs as RecordSet = OldData.value("lineitems")
		  
		  For i1 as integer = 1 To rs.RecordCount
		    
		    dim sql as string
		    sql = "Insert Into tbl_lineitems ("_
		    + "pkid, row_created, row_modified, row_username, "_
		    + "fkeipl, fkinventory, li_name, li_manufacturer, li_model, "_
		    + "li_department, li_category, li_subcategory, li_description, "_
		    + "li_price, li_rate, li_discount, li_time, li_taxable, li_quantity) "_
		    + "Values( $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19);"
		    dim ps as PostgreSQLPreparedStatement = db.Prepare(sql)
		    ps.Bind(0,GetNewPKID.ToText)
		    ps.Bind(1,rs.Field("row_created").StringValue)
		    ps.Bind( 2,rs.Field("row_modified").StringValue)
		    ps.Bind( 3,rs.Field("row_username").StringValue)
		    ps.Bind(4,rs.Field("fkeipl").StringValue)
		    ps.Bind(5, rs.Field("fkinventory").StringValue)
		    ps.Bind(6,rs.Field("name_").StringValue)
		    ps.Bind( 7,rs.Field("manufacturer").StringValue)
		    ps.Bind( 8, rs.Field("model").StringValue)
		    ps.Bind( 9,rs.Field("department").StringValue)
		    ps.Bind(10,rs.Field("category").StringValue)
		    ps.Bind(11,rs.Field("subcategory").StringValue)
		    ps.Bind(12, rs.Field("note_").StringValue)
		    ps.Bind(13, str( rs.Field("price").IntegerValue / 100) )
		    ps.Bind(14,rs.Field("rate_").StringValue)
		    ps.Bind(15, str( rs.Field("discountperc_").IntegerValue / 1000 ) + "%" )
		    ps.Bind(16, str( rs.Field("time_").DoubleValue ) )
		    ps.Bind(17, rs.Field("taxable_").BooleanValue )
		    ps.Bind(18, rs.Field("quantity_").StringValue ) 
		    
		    ps.SQLExecute()
		    If db.Error Then
		      Break
		    End If
		    
		    rs.MoveNext
		    
		  Next
		  
		  Window1.Listbox1.AddRow("Done!")
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected LastPKID As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldData As Dictionary
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
