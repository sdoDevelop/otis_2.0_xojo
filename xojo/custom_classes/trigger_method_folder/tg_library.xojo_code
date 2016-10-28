#tag Module
Protected Module tg_library
	#tag Property, Flags = &h1
		Protected column_names() As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected new_rs As recordSet
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected old_rs As recordSet
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected table_name As String
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			Select,Insert,Update,Delete
		#tag EndNote
		Protected type As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected values() As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected when As string
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
