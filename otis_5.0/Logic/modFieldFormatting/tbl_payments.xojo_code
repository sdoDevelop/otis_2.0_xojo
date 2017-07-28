#tag Module
Protected Module tbl_payments
	#tag Constant, Name = payment_amount, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"\\$###\x2C###\x2C###\x2C###.00"
	#tag EndConstant

	#tag Constant, Name = payment_date, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \""
	#tag EndConstant

	#tag Constant, Name = payment_memo, Type = String, Dynamic = False, Default = \"", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = payment_type, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \""
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
