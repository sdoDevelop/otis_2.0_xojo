#tag Module
Protected Module modPriceCalculations
	#tag Method, Flags = &h0
		Function CalculateEIPLTotal(oRecords() as datafile.tbl_lineitems, oEIPLRecord as DataFile.tbl_eipl) As Dictionary
		  dim iSubTotal, iAfterDiscount, iAfterTax, iDiscountSum, iTaxSum, iDiscount as Currency
		  
		  // get the total of the groups
		  dim retDict as Dictionary = CalculateGroupTotal( oRecords, oEIPLRecord, "" )
		  iSubTotal = retDict.Value("Total")
		  iDiscountSum = retDict.Value("DiscountSum")
		  iTaxSum = retDict.Value("TaxSum")
		  
		  // Calculate the after discount price
		  iDiscount = val( Methods.StripNonDigitsDecimals( oEIPLRecord.sdiscount ) )
		  If iDiscount = 0 Then
		    iAfterDiscount = iSubTotal
		  ElseIf InStr( oEIPLRecord.sdiscount, "%") > 0 Then
		    // the discount is a percent
		    iAfterDiscount = iSubTotal - ( ( iDiscount / 100 ) * iSubTotal )
		  Else
		    // the discount is an amount
		    iAfterDiscount = iSubTotal - iDiscount
		  End If
		  
		  // Calculate discount sum
		  iDiscountSum = iDiscountSum + ( iSubTotal - iAfterDiscount )
		  
		  // Calculate the after tax amount
		  iAfterTax = iAfterDiscount + iTaxSum
		  
		  // Round things
		  iSubTotal = round(iSubTotal*100)/100
		  iAfterDiscount = round(iAfterDiscount*100)/100
		  iAfterTax = round(iAfterTax*100)/100
		  iDiscountSum = round(iDiscountSum*100)/100
		  iTaxSum = round(iTaxSum*100)/100
		  
		  dim retDictionary as New Dictionary
		  retDictionary.Value("SubTotal") = iSubTotal
		  retDictionary.Value("AfterDiscount") = iAfterDiscount
		  retDictionary.Value("Total") = iAfterTax
		  retDictionary.Value("DiscountSum") = iDiscountSum
		  retDictionary.Value("TaxSum") = iTaxSum
		  
		  Return retDictionary
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateEIPLTotal(dictGroups as Dictionary, oEIPLRecord as DataFile.tbl_eipl) As Dictionary
		  dim iSubTotal, iAfterDiscount, iAfterTax, iDiscountSum, iTaxSum, iDiscount as Currency
		  
		  // get the total of the groups
		  dim retDict as Dictionary = CalculateGroupofGroupTotal( dictGroups, oEIPLRecord, "" )
		  iSubTotal = retDict.Value("Total")
		  iDiscountSum = retDict.Value("DiscountSum")
		  iTaxSum = retDict.Value("TaxSum")
		  
		  // Calculate the after discount price
		  iDiscount = val( Methods.StripNonDigitsDecimals( oEIPLRecord.sdiscount ) )
		  If iDiscount = 0 Then
		    iAfterDiscount = iSubTotal
		  ElseIf InStr( oEIPLRecord.sdiscount, "%") > 0 Then
		    // the discount is a percent
		    iAfterDiscount = iSubTotal - ( ( iDiscount / 100 ) * iSubTotal )
		  Else
		    // the discount is an amount
		    iAfterDiscount = iSubTotal - iDiscount
		  End If
		  
		  // Calculate discount sum
		  iDiscountSum = iDiscountSum + ( iSubTotal - iAfterDiscount )
		  
		  // Calculate the after tax amount
		  iAfterTax = iAfterDiscount + iTaxSum
		  
		  // Round things
		  iSubTotal = round(iSubTotal*100)/100
		  iAfterDiscount = round(iAfterDiscount*100)/100
		  iAfterTax = round(iAfterTax*100)/100
		  iDiscountSum = round(iDiscountSum*100)/100
		  iTaxSum = round(iTaxSum*100)/100
		  
		  dim retDictionary as New Dictionary
		  retDictionary.Value("SubTotal") = iSubTotal
		  retDictionary.Value("AfterDiscount") = iAfterDiscount
		  retDictionary.Value("Total") = iAfterTax
		  retDictionary.Value("DiscountSum") = iDiscountSum
		  retDictionary.Value("TaxSum") = iTaxSum
		  
		  Return retDictionary
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateGroupofGroupTotal(dictGroups as Dictionary, oEIPLRecord as DataFile.tbl_eipl, sGroupStructure as string) As Dictionary
		  dim iPreDiscount, iAfterDiscount, iTotal, iDiscountSum, iTaxSum as currency
		  
		  
		  // Loop through each group in the dictionary
		  For Each vKey as Variant In dictGroups.Keys
		    dim sInnerGroupStructure as string
		    
		    If dictGroups.Value( vKey ) IsA Dictionary then
		      // This value is a group of more groups so we 
		      'increase the group struccture 
		      If sGroupStructure <> "" Then
		        sInnerGroupStructure = sGroupStructure + "." + str( vKey )
		      Else
		        sInnerGroupStructure = str( vKey )
		      End If
		      
		      'recipricate this method to dig deeper into groups
		      dim retDictionary as Dictionary
		      retDictionary = CalculateGroupofGroupTotal( dictGroups.Value( vKey ), oEIPLRecord, sInnerGroupStructure )
		      
		      // Add up totals
		      iPreDiscount = iPreDiscount + retDictionary.Value("Total")
		      iDiscountSum = iDiscountSum + retDictionary.Value("DiscountSum")
		      iTaxSum = iTaxSum + retDictionary.Value("TaxSum")
		      
		    Else
		      // THis value is an array of records
		      
		      'increase the group struccture 
		      If sGroupStructure <> "" Then
		        sInnerGroupStructure = sGroupStructure + "." + str( vKey )
		      Else
		        sInnerGroupStructure = str( vKey )
		      End If
		      
		      // Send this group to CalculateGroupTotal
		      dim retDictionary as Dictionary
		      retDictionary = CalculateGroupTotal( dictGroups.Value( vKey ), oEIPLRecord, sInnerGroupStructure )
		      
		      // Add up totals
		      iPreDiscount = iPreDiscount + retDictionary.Value("Total")
		      iDiscountSum = iDiscountSum + retDictionary.Value("DiscountSum")
		      iTaxSum = iTaxSum + retDictionary.Value("TaxSum")
		      
		    End If
		    
		    
		  Next
		  
		  // Now we can determine discounts
		  iAfterDiscount = iPreDiscount
		  
		  'grab discounts relating to this group structure and eipl
		  dim aroDiscounts() as DataFile.tbl_group_discounts
		  aroDiscounts = DataFile.tbl_group_discounts.List( " fkeipl = " + oEIPLRecord.ipkid.ToText + " And group_name = '" + sGroupStructure + "'" )
		  
		  For Each oDiscount as DataFile.tbl_group_discounts In aroDiscounts()
		    
		    // Put the group discount into a number variable
		    dim iDiscount as Double = val( Methods.StripNonDigitsDecimals( oDiscount.sgroup_discount ) )
		    
		    If InStr( oDiscount.sgroup_discount, "%" ) > 0 Then
		      // the discount is a percent
		      iAfterDiscount = iAfterDiscount - ( ( iDiscount / 100 ) * iAfterDiscount )
		    Else 
		      // the discount is a dollar sum
		      iAfterDiscount = iAfterDiscount - iDiscount
		    End If
		    
		  Next
		  
		  iDiscountSum = iDiscountSum + ( iPreDiscount - iAfterDiscount )
		  
		  iAfterDiscount = round(iAfterDiscount*100)/100
		  iPreDiscount = round(iPreDiscount*100)/100
		  iDiscountSum = round(iDiscountSum*100)/100
		  iTaxSum = round(iTaxSum*100)/100
		  
		  dim retDictionary as New Dictionary
		  retDictionary.Value( "Total" ) = iAfterDiscount
		  retDictionary.Value( "PreDiscount" ) = iPreDiscount
		  retDictionary.Value( "DiscountSum" ) = iDiscountSum
		  retDictionary.Value( "TaxSum" ) = iTaxSum
		  
		  Return retDictionary
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateGroupTotal(aroLIRecords() as DataFile.tbl_lineitems, oEIPlRecord as DataFile.tbl_eipl, sGroupName as String) As Dictionary
		  dim iPreDiscount, iAfterDiscount, iDiscountSum, iTaxSum as Currency
		  
		  // Loop through each Line item record
		  For Each oLIRecord as DataFile.tbl_lineitems In aroLIRecords()
		    dim retDictionary as Dictionary
		    retDictionary = CalculateLineItemPrices( oLIRecord, oEIPlRecord )
		    iPreDiscount = iPreDiscount + retDictionary.Value("AfterDiscount")
		    iTaxSum = iTaxSum + retDictionary.Value( "TaxSum" )
		    iDiscountSum = iDiscountSum + retDictionary.Value("DiscountSum")
		  Next
		  
		  // Now we can apply the discounts that are related to this particular group
		  
		  // Get any discount records relating to this group and eipl
		  dim aroDiscountRecords() as DataFile.tbl_group_discounts
		  aroDiscountRecords() = DataFile.tbl_group_discounts.List( "fkeipl = " + oEIPlRecord.ipkid.ToText + " And group_name = '" + sGroupName + "'" )
		  
		  iAfterDiscount = iPreDiscount
		  
		  For Each oDiscount as DataFile.tbl_group_discounts In aroDiscountRecords()
		    
		    // Put the group discount into a number variable
		    dim iDiscount as double = val( Methods.StripNonDigitsDecimals( oDiscount.sgroup_discount ) )
		    
		    If InStr( oDiscount.sgroup_discount, "%" ) > 0 Then
		      // the discount is a percent
		      iAfterDiscount = iAfterDiscount - ( ( iDiscount / 100 ) * iAfterDiscount )
		    Else 
		      // the discount is a dollar sum
		      iAfterDiscount = iAfterDiscount - iDiscount
		    End If
		    
		  Next
		  
		  iDiscountSum = iDiscountSum + ( iPreDiscount - iAfterDiscount )
		  
		  iAfterDiscount = round(iAfterDiscount*100)/100
		  iPreDiscount = round(iPreDiscount*100)/100
		  iDiscountSum = round(iDiscountSum*100)/100
		  iTaxSum = round(iTaxSum*100)/100
		  
		  dim retDictionary as New Dictionary
		  retDictionary.Value("Total") = iAfterDiscount
		  retDictionary.Value("PreDiscount") = iPreDiscount
		  retDictionary.Value("DiscountSum") = iDiscountSum
		  retDictionary.Value("TaxSum") = iTaxSum
		  
		  Return retDictionary
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateLineItemPrices(oLIRecord as Datafile.tbl_lineitems, oEIRecord as datafile.tbl_eipl) As Dictionary
		  dim d1 as Currency
		  
		  '_________________|---------SubTotal----------|-----------------After DIscount--------|
		  // Calculation is: ( (Price * Quantity * Time) If %: * (discount/100) If $: - discount ) * ( Tax / 100 ) = Total
		  
		  dim iPrice, iQuantity, iTime, iTax, iSubTotal, iAfterDiscount, iTotal, iDiscountSum, iTaxSum as Currency
		  dim iDiscount as Double
		  
		  iPrice = val( Methods.StripNonDigitsDecimals( oLIRecord.sli_price ) )
		  iQuantity = val( Methods.StripNonDigitsDecimals( oLIRecord.sli_quantity ) )
		  iTime = val( Methods.StripNonDigitsDecimals(  oLIRecord.sli_time ) )
		  iDiscount = val( Methods.StripNonDigitsDecimals( oLIRecord.sli_discount ) )
		  iTax = val( Methods.StripNonDigitsDecimals( oEIRecord.seipl_tax_rate ) )
		  
		  
		  // Calculate the subtotal
		  iSubTotal = iPrice * iQuantity * iTime
		  
		  // Calculate the after discount price
		  If iDiscount = 0 Then
		    iAfterDiscount = iSubTotal
		  ElseIf InStr( oLIRecord.sli_discount, "%") > 0 Then
		    // the discount is a percent
		    iAfterDiscount = iSubTotal - ( ( iDiscount / 100 ) * iSubTotal )
		  Else
		    // the discount is an amount
		    iAfterDiscount = iSubTotal - iDiscount
		  End If
		  
		  iDiscountSum = iSubTotal - iAfterDiscount
		  
		  // Calculate total
		  If oLIRecord.bli_taxable Then
		    If iTax <> 0 Then
		      iTotal = iAfterDiscount * ( (iTax / 100) + 1 ) 
		    Else
		      iTotal = iAfterDiscount
		    End If
		  Else
		    iTotal = iAfterDiscount
		  End If
		  
		  // Calculate amount of tax applied
		  iTaxSum = iTotal - iAfterDiscount
		  
		  // round things
		  iSubTotal = round(iSubTotal*100)/100
		  iAfterDiscount = round(iAfterDiscount*100)/100
		  iTotal = round( iTotal*100)/100
		  iDiscountSum = round(iDiscountSum*100)/100
		  iTaxSum = round( iTaxSum*100)/100
		  
		  
		  dim retDictionary as New Dictionary
		  retDictionary.Value("SubTotal") = iSubTotal
		  retDictionary.Value("AfterDiscount") = iAfterDiscount
		  retDictionary.Value("TaxSum") = iTaxSum
		  retDictionary.Value("Total") = iTotal
		  retDictionary.Value("DiscountSum") = iDiscountSum
		  
		  Return retDictionary
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
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
