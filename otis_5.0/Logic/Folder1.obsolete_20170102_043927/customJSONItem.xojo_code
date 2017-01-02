#tag Class
Protected Class customJSONItem
Inherits JSONItem
	#tag Method, Flags = &h1
		Protected Function ToPythonString() As String
		  Dim s1,rString as String
		  
		  // Of course xojo and python don't like each other...
		  //   Python JSON looks like so: { 'Field':'Value','Field':{'Field':'Value'} }
		  //   Xojo JSON looks like so: {\"Field":\"Value",\"Field":{\"Field":\"Value"} }
		  // So we want to take all of this \" and change it to just a double quote 
		  // Then we take all the double quotes and change them to single quotes
		  
		  // Put the string into a variable
		  s1 = me.ToString
		  
		  // Relplace \"
		  's1 = ReplaceAll( "\""", """")
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Compact"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DecimalFormat"
			Group="Behavior"
			InitialValue="-0.0##############"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EscapeSlashes"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentSpacing"
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="ToString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_RenderAsJavascript"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
