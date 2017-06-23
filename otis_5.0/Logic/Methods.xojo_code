#tag Module
Protected Module Methods
	#tag Method, Flags = &h0
		Function ConvertCentsString_To_DollarString(sCentsString as String) As String
		  dim s1 as string
		  
		  If val(sCentsString) <100 And val(sCentsString) > 9  Then
		    s1 = "$" + "0" + "." + sCentsString
		  ElseIf val(sCentsString) < 10 And val(sCentsString) > 0 Then
		    s1 = "$" + "0" + ".0" + sCentsString
		  ElseIf val(sCentsString) = 0 Then
		    s1 = "$0.00"
		  Else
		    s1 = "$" + Left(sCentsString,Len(sCentsString) - 2) + "." + Right(sCentsString,2)
		  End If
		  
		  Return s1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertDollarString_To_CentsString(DollarString as String) As String
		  
		  dim s1 as string
		  s1 = ReplaceAll(DollarString,"$","")
		  s1 = ReplaceAll(s1,".","")
		  
		  Return s1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyDictionary(d as Dictionary) As Dictionary
		  dim r as new Dictionary
		  for each key as Variant in d.keys
		    r.Value(key) = d.Value(key)
		  next
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateNewContainerByName(sContainerName as String) As Variant
		  
		  Select Case sContainerName
		  Case "contInventoryExpanded"
		    Return New contInventoryExpanded
		  Else
		    // No container by this name
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateZeroOffsetDate() As Date
		  
		  dim d1 as new date
		  d1.GMTOffset = 0
		  Return d1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatValue_ForDb(sFieldName as string, sValue as String) As String
		  
		  
		  Return sValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatValue_ForDisplay(sFieldName as string, sValue as String) As String
		  
		  
		  Return sValue
		End Function
	#tag EndMethod

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
		Protected Sub IncreaseQuantity_with_NewItem(fkInventory as integer,iAmount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateItemQuantity(fkInventory as int64)
		  // Figure out how many inventory expanded items there are related to our inventory item
		  dim qty as integer
		  qty = DataFile.tbl_inventory_link.ListCount("fkInventory_parent = " + fkInventory.ToText + " And link_type = 'version'" )
		  
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
