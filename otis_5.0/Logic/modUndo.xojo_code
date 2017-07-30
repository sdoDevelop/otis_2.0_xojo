#tag Module
Protected Module modUndo
	#tag Method, Flags = &h1
		Protected Sub AddUndoStep(oRecord as DataFile.ActiveRecordBase)
		  
		  // Append the record to oRecords
		  oRecords.Append(oRecord)
		  
		  // Change the cursor to the last added undo step
		  iCursor = oRecords.Ubound
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Redo()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Undo()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private iCursor As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oRecords() As DataFile.ActiveRecordBase
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
			Name="oRecords()"
			Group="Behavior"
			Type="Integer"
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
