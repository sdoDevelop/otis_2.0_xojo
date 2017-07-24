#tag Module
Protected Module Methods
	#tag Method, Flags = &h1
		Protected Sub AddEIPLtoNumberGetList(EIPLPKID as Int64)
		  dim FileContents as string
		  
		  dim rd1 as New ResourceDirectories
		  dim f1 as FolderItem = rd1.eipl_numbers_to_get_file.FilePath
		  
		  If f1 <> Nil Then
		    If f1.Exists Then
		      
		      dim tis1 as TextInputStream
		      Try
		        tis1 = TextInputStream.Open(f1)
		        FileContents = tis1.ReadAll
		      Catch e as IOException
		        dim s as string
		      End Try
		      
		    End If
		  End If
		  
		  dim NumberArray() as string = FileContents.Split(",")
		  
		  NumberArray.Append(EIPLPKID.ToText)
		  FileContents = Join( NumberArray, "," )
		  
		  If f1 <> Nil Then
		    Try
		      Dim tos1 as TextOutputStream = TextOutputStream.Create(f1)
		      tos1.Write( FileContents )
		      tos1 = Nil
		    Catch e as IOException
		      dim s as string
		    End Try
		    
		  End If
		End Sub
	#tag EndMethod

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
		    'Return New contInventoryExpanded
		  Else
		    // No container by this name
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateNumbersForOfflineEIPLs()
		  dim oEIPLS() as DataFile.tbl_eipl
		  
		  dim FileContents as string
		  
		  dim rd1 as New ResourceDirectories
		  dim f1 as FolderItem = rd1.eipl_numbers_to_get_file.FilePath
		  
		  If f1 <> Nil Then
		    If f1.Exists Then
		      
		      dim tis1 as TextInputStream
		      Try
		        tis1 = TextInputStream.Open(f1)
		        FileContents = tis1.ReadAll
		      Catch e as IOException
		        dim s as string
		      End Try
		      
		    End If
		  End If
		  
		  dim NumberArray() as string = FileContents.Split(",")
		  
		  If NumberArray.Ubound <> -1 Then
		    For Each sPKID as string In NumberArray()
		      dim iPKID as Int64 = val( sPKID )
		      
		      dim oEIPL as DataFile.tbl_eipl = DataFile.tbl_eipl.FindByID(iPKID)
		      
		      If oEIPL <> Nil Then
		        dim iNewNumber as Integer = GetNextEIPLNumber(0)
		        If iNewNumber <> 0 Then
		          oEIPL.ieipl_number = iNewNumber
		          oEIPL.Save
		        End If
		      End If
		    Next
		    
		    OSM.RunSync
		    
		  End If
		End Sub
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
		Protected Function GetNextEIPLNumber(EIPLPkid as Int64) As Integer
		  dim db1 as PostgreSQLDatabase = app.RegDB
		  dim EIPLNumber as integer
		  
		  
		  If db1 <> Nil And Login.State = "Online" Then
		    // we are online
		    
		    dim sql1 as string = "Select nextval('utility.seq_eipl_numbers');"
		    dim rs1 as RecordSet = db1.SQLSelect(sql1)
		    If db1.Error Then
		      System.DebugLog( "Could not get next eipl_number from server: " + db1.ErrorMessage )
		      If EIPLPkid <> 0 Then
		        AddEIPLtoNumberGetList(EIPLPkid)
		        Return 0
		      End If
		    End If
		    
		    If rs1.RecordCount <> 0 Then
		      EIPLNumber = rs1.Field( "nextval" ).IntegerValue
		      Return EIPLNumber
		    End If
		    
		  Else
		    // we are offline
		    
		    If EIPLPkid <> 0 Then
		      AddEIPLtoNumberGetList(EIPLPkid)
		      
		      Return 0
		    End If
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub IncreaseQuantity_with_NewItem(fkInventory as integer,iAmount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StripNonDigitsDecimals(sString as String) As String
		  
		  
		  dim re as new RegEx
		  re.SearchPattern = "[^\d.]"
		  re.ReplacementPattern = ""
		  re.Options.ReplaceAllMatches = True
		  
		  Return re.Replace(sString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateItemQuantity(fkInventory as int64)
		  // Figure out how many inventory expanded items there are related to our inventory item
		  dim qty as integer
		  qty = DataFile.tbl_internal_linking.ListCount("fk_parent = " + fkInventory.ToText + " And link_type = 'version'" )
		  
		  // Change the quantity of said inventory item
		  dim oItem as DataFile.tbl_inventory
		  oItem = DataFile.tbl_inventory.FindByID(fkInventory)
		  If oItem <> Nil Then 
		    oItem.sitem_quantity = str(qty)
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
