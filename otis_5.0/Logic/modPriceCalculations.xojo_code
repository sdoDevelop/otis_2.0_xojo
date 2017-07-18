#tag Module
Protected Module modPriceCalculations
	#tag Method, Flags = &h0
		Function CalculateGroupTotal(aroLIRecords() as DataFile.tbl_lineitems, oEIPlRecord as DataFile.tbl_eipl, sGroupName as String) As String
		  dim iRunningSum as Double
		  
		  For Each oLIRecord as DataFile.tbl_lineitems In aroLIRecords
		    
		    iRunningSum = iRunningSum + val( CalculateLineItemPrices( oLIRecord, oEIPlRecord, "Total" ) )
		    
		  Next
		  
		  dim iSubTotal as Double
		  
		  iSubTotal = iRunningSum
		  
		  // Get all the discounts for this eipl from the database that match the group name
		  dim aroDiscounts() as DataFile.tbl_group_discounts = DataFile.tbl_group_discounts.List( "fkeipl = " + oEIPlRecord.ipkid.ToText + " And group_name = '" + sGroupName + "'" )
		  
		  If aroDiscounts.Ubound <> -1 Then
		    
		    For Each oDiscount as DataFile.tbl_group_discounts In aroDiscounts()
		      
		      dim sDiscount as String = oDiscount.sgroup_discount
		      dim iDiscount as Double = val( Methods.StripNonDigitsDecimals(sDiscount) )
		      
		      If InStr(sDiscount, "%" ) > 0 Then
		        ' discount is a percent
		        iSubTotal = iSubTotal - ( ( iDiscount / 100) * iSubTotal )
		      ElseIf InStr(sDiscount, "$" ) > 0 Then
		        ' discount is a dollar ammount
		        iSubTotal = iSubTotal - iDiscount
		      End If
		      
		    Next
		    
		  End If
		  
		  Return iSubTotal.ToText
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateLineItemPrices(oLIRecord as Datafile.tbl_lineitems, oEIRecord as datafile.tbl_eipl ,sPart as String) As String
		  dim d1 as Double
		  
		  '_________________|---------SubTotal----------|-----------------After DIscount--------|
		  // Calculation is: ( (Price * Quantity * Time) If %: * (discount/100) If $: - discount ) * ( Tax / 100 ) = Total
		  
		  dim iPrice, iQuantity, iTime, iDiscount, iTax, iSubTotal, iAfterDiscount, iTotal as Double
		  
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
		  Elseif InStr( oLIRecord.sli_discount, "$" ) > 0 Then
		    // the discount is an amount
		    iAfterDiscount = iSubTotal - iDiscount
		  End If
		  
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
		  
		  
		  
		  Select Case sPart
		  Case "SubTotal"
		    Return iSubTotal.ToText
		  Case "After Discount"
		    Return iAfterDiscount.ToText
		  Case "Total"
		    Return iTotal.ToText
		  End Select
		  
		  
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
