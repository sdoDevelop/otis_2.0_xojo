#tag Module
Protected Module ValueRef
	#tag Constant, Name = EIPLTypes, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Estimate\x2CInvoice\x2CPack List"
	#tag EndConstant

	#tag Constant, Name = ItemTypes, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Item\x2CPackage\x2CLabor"
	#tag EndConstant

	#tag Constant, Name = Item_Status, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Ready\x2CIn Maintenance\x2CSold"
	#tag EndConstant

	#tag Constant, Name = PaymentTypes, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Check\x2CCash\x2CDeposit"
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
