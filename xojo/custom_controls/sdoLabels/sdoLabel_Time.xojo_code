#tag Class
Protected Class sdoLabel_Time
Inherits sdoLabel
	#tag Event
		Function CheckSectionValue(TheSection as integer) As Boolean
		  Dim TheValue as String
		  Dim ReturnValue as Boolean
		  
		  TheValue = Sections.Data(TheSection).TheText
		  
		  Select Case Sections.Data(TheSection).Name
		  Case "Hour"
		    If val(TheValue) >= 1 And val(TheValue) <= 12 Then
		      ReturnValue = True
		    End If
		  Case "Minute"
		    If val(TheValue) >= 1 And val(TheValue) <= 59 Then
		      ReturnValue = True
		    End If
		  Case "Period"
		    If TheValue = "am" Or TheValue = "pm" Then
		      ReturnValue = True
		    End If
		  End Select
		  
		  Return ReturnValue
		End Function
	#tag EndEvent

	#tag Event
		Function CheckValueDef() As Boolean
		  Dim ADate1 as New OtisDate
		  Dim SectionIndex as integer
		  Dim ReturnValue as Boolean
		  
		  SectionIndex = Sections.NameIndex("Hour")
		  Dim TheHour as integer = val( Sections.Data(SectionIndex).TheText )
		  SectionIndex = Sections.NameIndex("Minute")
		  Dim TheMinute as integer = val( Sections.Data(SectionIndex).TheText )
		  SectionIndex = Sections.NameIndex("Period")
		  Dim ThePeriod as string = Sections.Data(SectionIndex).TheText 
		  
		  
		  If TheHour >= 1 And TheHour <= 12 Then
		    'hour is valid
		    If TheMinute >= 1 And TheMinute <= 59 Then
		      'Minute is valid
		      If ThePeriod = "am" Or ThePeriod = "pm" Then
		        'Period is valid
		        ReturnValue = True
		      Else
		        'Period is not valid
		        ReturnValue = False
		      End If
		    Else
		      'Minute is not valid
		      ReturnValue = False
		    End If
		  Else
		    'Hour is not valid
		    ReturnValue = False
		  End If
		  
		  
		  
		  Return ReturnValue
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub CreateTextFromRaw()
		  Dim TheDate as New otisdate
		  Dim TheReturn() as string
		  Dim TheHour,TheMinute,ThePeriod as string
		  Dim ForSlash1,ForSlash2 as string
		  
		  
		  
		  If me.RawData <> "" Then
		    // Take the raw data...should be an in sqltime format...and turn it into desired text
		    TheDate.SQLTime = me.RawData
		    me.LabelText = TheDate.ShortTime
		    
		    
		    Dim anarray() as string
		    // Month Section
		    anarray = Split(me.LabelText,":")
		    TheHour = anarray(0)
		    
		    // Date Section
		    TheMinute = TheDate.Minute.ToText
		    If val( TheMinute ) >=0 And val( TheMinute ) <= 9 Then
		      TheMinute = "0" + TheMinute
		    End If
		    
		    // Year Section
		    
		    anarray = Split(me.LabelText," ")
		    ThePeriod = anarray(1)
		    
		    ForSlash1 = ":"
		    ForSlash2 = " "
		    
		  Else
		    
		    
		  End If
		  
		  // Return an array of the sections values
		  TheReturn = Array(TheHour,ForSlash1,TheMinute,ForSlash2,ThePeriod)
		  
		  me.EnterValueArrayIntoSections( TheReturn() )
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PropogateOpen()
		  
		  
		  
		  
		  
		  
		  Sections = New SectionsModule.SectionsArray(4)
		  
		  Sections.Data(0).Name = "Hour"
		  Sections.Data(0).AcceptedCharacters = Split("0,1,2,3,4,5,6,7,8,9",",")
		  Sections.Data(0).MaxCharacters = 2
		  Sections.Data(1).Name = "Colon"
		  Sections.Data(1).Skip = True
		  Sections.Data(2).Name = "Minute"
		  Sections.Data(2).AcceptedCharacters = Split("0,1,2,3,4,5,6,7,8,9",",")
		  Sections.Data(2).MaxCharacters = 2
		  Sections.Data(3).Name = "Space"
		  Sections.Data(3).Skip = True
		  Sections.Data(4).Name = "Period"
		  Sections.Data(4).AcceptedCharacters = Split("a,m,p",",")
		  Sections.Data(4).MaxCharacters = 2
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetOtisDateForm() As OtisDate
		  Dim ADate1 as New OtisDate
		  Dim SectionIndex as integer
		  Dim ReturnValue as Boolean
		  
		  SectionIndex = Sections.NameIndex("Hour")
		  Dim TheHour as integer = val( Sections.Data(SectionIndex).TheText )
		  SectionIndex = Sections.NameIndex("Minute")
		  Dim TheMinute as integer = val( Sections.Data(SectionIndex).TheText )
		  SectionIndex = Sections.NameIndex("Period")
		  Dim ThePeriod as string = Sections.Data(SectionIndex).TheText 
		  
		  // Put everything into a date
		  ADate1.Hour = TheHour
		  ADate1.Minute = TheMinute
		  ADate1.Period = ThePeriod
		  
		  
		  Return ADate1
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Borders"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CornerArc"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="JustificationHorizontal"
			Group="Behavior"
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
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
