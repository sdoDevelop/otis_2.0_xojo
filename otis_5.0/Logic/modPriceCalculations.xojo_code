#tag Module
Protected Module modPriceCalculations
	#tag Method, Flags = &h0
		Function CalculateLineItemPrices(oLIRecord as Datafile.tbl_lineitems, oEIRecord as datafile.tbl_eipl ,sPart as String) As Integer
		  dim d1 as Double
		  
		  '_________________|---------SubTotal----------|-----------------After DIscount--------|
		  // Calculation is: ( (Price * Quantity * Time) If %: * (discount/100) If $: - discount ) * ( Tax / 100 ) = Total
		  
		  dim iPrice, iQuantity, iTime, iDiscount, iTax, iSubTotal, iAfterDiscount, iTotal as Double
		  
		  iPrice = oLIRecord .ili_price_cost
		  iQuantity = val( oLIRecord .sli_quantity )
		  iTime = oLIRecord .ili_time
		  iDiscount = val( Methods.methStripNonDigits( oLIRecord.sli_discount ) )
		  iTax = val( Methods.methStripNonDigits( oEIRecord.seipl_tax_rate ) ) / 100
		  
		  
		  // Calculate the subtotal
		  iSubTotal = iPrice * iQuantity * iTime
		  If iDiscount = 0 Then
		    iAfterDiscount = iSubTotal
		  ElseIf InStr( oLIRecord.sli_discount, "%") > 0 Then
		    // the discount is a percent
		    iAfterDiscount = iSubTotal * ( iDiscount / 100 )
		  Elseif InStr( oLIRecord.sli_discount, "$" ) > 0 Then
		    // the discount is an amount
		    iAfterDiscount = iSubTotal - ( iDiscount / 100 )
		  End If
		  
		  If iTax <> 0 Then
		    iTotal = iAfterDiscount * ( (iTax / 100) + 1 ) 
		  Else
		    iTotal = iAfterDiscount
		  End If
		  
		  
		  
		  Select Case sPart
		  Case "SubTotal"
		    Return Floor( iSubTotal )
		  Case "After Discount"
		    Return Floor( iAfterDiscount )
		  Case "Total"
		    Return Floor( iTotal )
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
