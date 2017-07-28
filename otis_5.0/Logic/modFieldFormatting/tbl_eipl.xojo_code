#tag Module
Protected Module tbl_eipl
	#tag Constant, Name = discount, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"\\$###\x2C###\x2C###\x2C###.00"
	#tag EndConstant

	#tag Constant, Name = eipl_tax_rate, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"###\x2C#.0000\\%"
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
