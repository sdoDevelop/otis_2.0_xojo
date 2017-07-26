#tag Module
Protected Module ErrorManagement
	#tag Method, Flags = &h0
		Sub ErrManage(sFacility as string, sMessage as string)
		  dim rd1 as New ResourceDirectories
		  dim CurrentDate as New date
		  
		  // Assemble the error message
		  dim sErrorMessage as String
		  sErrorMessage = "{" + CurrentDate.SQLDateTime + "} [ " + sFacility + " ] - " + sMessage + EndOfLine
		  
		  // Get the error log filepath
		  dim fiErrorFile as FolderItem = rd1.error_log_file.FilePath
		  
		  // Open up a text output stream
		  If fiErrorFile <> Nil Then
		    If fiErrorFile.Exists Then
		      Try
		        dim tos as TextOutputStream = TextOutputStream.Append( fiErrorFile )
		        tos.Write( sErrorMessage )
		        tos.Close
		      Catch err as IOException
		        // well we are already in our error log...what else can we do
		      End Try
		      
		    Else
		      Try
		        dim tos as TextOutputStream = TextOutputStream.Create( fiErrorFile )
		        tos.Write( sErrorMessage )
		        tos.Close
		      Catch err as IOException
		        // well we are already in our error log...what else can we do
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
