#tag Module
Protected Module uuid_gen_v1
	#tag Method, Flags = &h0
		Function NewUUID() As String
		  dim uuid_string as string
		  dim date_time as new date
		  dim random_string() as string
		  
		  
		  random_string.Append(RandomStr(6,6,True,True,True,True) + str(date_time.Hour))
		  random_string.Append(RandomStr(6,6,True,True,True,True) + str(date_time.Minute))
		  random_string.Append(RandomStr(6,6,True,True,True,True) + str(date_time.Second))
		  random_string.Append(RandomStr(6,6,True,True,True,True) + str(date_time.Day))
		  random_string.Append(RandomStr(6,6,True,True,True,True) + str(date_time.Month))
		  random_string.Append(RandomStr(6,6,True,True,True,True) + str(date_time.Year))
		  
		  random_string.Shuffle
		  
		  uuid_string = Join(random_string, "-")
		  
		  Return uuid_string
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomStr(minLen As Integer, maxLen As Integer, lowerc As Boolean, upperc As Boolean, numeric As Boolean, symbols As Boolean) As String
		  // Select Characters to pick from
		  Dim sGrabBag As String
		  If lowerc Then sGrabBag = sGrabBag + "abcdefghijklmnopqrstuvwxyz"
		  If upperc Then sGrabBag = sGrabBag + "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		  If numeric Then sGrabBag = sGrabBag + "1234567890"
		  If symbols Then sGrabBag = sGrabBag + "!@#$%^&*()+"
		  
		  // How many do we have?
		  Dim iBagChars, iRandChar As Integer
		  iBagChars = Len(sGrabBag)
		  
		  // Init rnd
		  Dim oRand As New Random
		  
		  // Pick Length
		  Dim iLength As Integer
		  oRand.RandomizeSeed
		  iLength = oRand.InRange(minLen, maxLen)
		  
		  // Pick iLength characters
		  Dim sResult, sChar As String
		  For i As Integer = 1 To iLength
		    oRand.RandomizeSeed
		    iRandChar = oRand.InRange(1, iBagChars)
		    sChar = Mid(sGrabBag, iRandChar, 1)
		    sResult = sResult + sChar
		  Next i
		  
		  Return sResult
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
