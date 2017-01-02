#tag Module
Protected Module Methods
	#tag Method, Flags = &h1
		Protected Function GetNewPKID() As Int64
		  Dim d1 as new date
		  Dim clientID as integer
		  Dim theTicks as integer
		  Dim rd1 as new ResourceDirectories
		  Dim NewPKID as Int64
		  
		  // Get the clientID
		  clientID = UserInfo.ClientID
		  
		  If clientID = 0 Then
		    'something is wrong no client id
		    dim err as RuntimeException
		    err.Message = "ClientID Missing could not create new pkid"
		    ErrManage( "CreateNewPKID", err.Message + " | " + Join(err.Stack,","))
		    raise err
		  End If
		  
		  
		  'Get the next auto incremeting
		  'Dim PKIDTHE as New DataFile.tbl_incrementing
		  Dim n1 as integer
		  'n1 = PKIDTHE.ID
		  
		  
		  Dim db1 as New SQLiteDatabase
		  db1.DatabaseFile = rd1.utility_db_file.FilePath
		  If db1.Connect Then
		    db1.SQLExecute("Insert Into tbl_incrementing Default Values;")
		    If db1.Error Then
		      dim err as new RuntimeException
		      err.Message = db1.ErrorMessage
		    End If
		    n1 = db1.LastRowID
		    db1 = Nil
		  End If
		  
		  NewPKID = val( clientID.ToText + n1.ToText )
		  
		  Return NewPKID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub IncreaseQuantity(fkInventory as integer,iAmount as integer)
		  
		  
		  For i1 as integer = 1 To iAmount
		    
		    // First we create a new inventory expanded item 
		    dim oItem as New DataFile.tbl_inv_ex
		    oItem.ifkinventory = fkInventory
		    oItem.Save
		    
		  Next
		  
		  // Figure out how many inventory expanded items there are related to our inventory item
		  dim qty as integer
		  qty = DataFile.tbl_inv_ex.ListCount("fkInventory = " + fkInventory.ToText )
		  
		  // Change the quantity of said inventory item
		  dim oItem as DataFile.tbl_inventory
		  oItem = DataFile.tbl_inventory.FindByID(fkInventory)
		  If oItem <> Nil Then 
		    oItem.iitem_quantity = qty
		    oItem.Save
		  End If
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