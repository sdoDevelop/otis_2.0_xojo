#tag Module
Protected Module OtisErrorManagement
	#tag Method, Flags = &h0
		Sub err_manage()
		  MsgBox( "uh-oh, no error manager" )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub err_manage(faculty as string, error_number as integer, message as string)
		  dim logfile as FolderItem
		  dim f as FolderItem
		  dim tos as TextOutputStream
		  dim write_string as string
		  dim error_numbered as integer = 000000
		  
		  
		  
		  // Create the string that we will write
		  dim thedate as new date
		  write_string = "[" + thedate.SQLDateTime + "] {" + faculty + "}  - " + str(error_number) + " | " + message
		  
		  
		  // Set which log file we are writing to
		  Select Case faculty
		  Case "local_db"
		    f = get_filepath( "local_db_log_file" )
		  Else
		    f = get_filepath( "error_log_file" )
		  End Select
		  
		  
		  // Write to file
		  If f <> Nil Then
		    If Not f.Exists Then
		      tos = TextOutputStream.Create( f )
		    Else
		      tos = TextOutputStream.Append( f )
		    End If
		    tos.Write( write_string )
		    tos.Close
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub err_manage(faculty as string, message as string)
		  err_manage( faculty, 000000, message )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub err_print_seperator(faculty as string, message as string)
		  dim logfile as FolderItem
		  dim f as FolderItem
		  dim tos as TextOutputStream
		  dim write_string as string
		  
		  
		  
		  // Create the string that we will write
		  dim thedate as new date
		  write_string = message
		  
		  
		  // Set which log file we are writing to
		  Select Case faculty
		  Case "local_db"
		    f = get_filepath( "local_db_log_file" )
		  Else
		    f = get_filepath( "error_log_file" )
		  End Select
		  
		  
		  // Write to file
		  If f <> Nil Then
		    If Not f.Exists Then
		      tos = TextOutputStream.Create( f )
		    Else
		      tos = TextOutputStream.Append( f )
		    End If
		    tos.Write( write_string )
		    tos.Close
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
