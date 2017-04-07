#tag Module
Protected Module ErrorManagement
	#tag Method, Flags = &h0
		Sub ErrManage(Facility as string, Message as string)
		  Dim tos1 as TextOutputStream
		  Dim rd1 as New ResourceDirectories
		  Dim f1 as FolderItem
		  Dim LogLine as String
		  
		  
		  f1 = rd1.error_log_file.FilePath
		  
		  LogLine = "<" + Facility + " | " + Message + ">"
		  
		  If f1 <> Nil Then
		    If f1.Exists Then
		      
		      Try
		        tos1 = TextOutputStream.Append(f1)
		        tos1.WriteLine( LogLine )
		        tos1.Close
		      Catch err As IOException
		        
		      End Try
		      
		    Else
		      
		      'File Does Not exist yet
		      Try
		        tos1 = TextOutputStream.Create(f1)
		        tos1.WriteLine( LogLine )
		        tos1.Close
		      Catch err As IOException
		        
		      End Try
		      
		    End If
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
