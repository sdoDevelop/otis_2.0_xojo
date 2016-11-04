#tag Class
Protected Class sdoLabel_Time
Inherits sdoLabel
	#tag Event
		Sub BreakTextIntoParts()
		  Dim WT1 as String = me.LabelText
		  Dim WT1array() as String
		  
		  // We need to break apart the time text into its seperate sections so that they can be seperatly selectable
		  
		  // Hour Section
		  WT1array = Split(WT1,":")
		  Sections.Data(0).TheText = WT1array(0)
		  
		  // Colon Section
		  Sections.Data(1).TheText = ":"
		  
		  // Minute Section
		  WT1 = WT1array(1)
		  WT1array = Split(WT1," ")
		  Sections.Data(2).TheText = WT1array(0)
		  
		  // Space Section
		  Sections.Data(3).TheText = " "
		  
		  // Period Section
		  Sections.Data(4).TheText = WT1array(1)
		  
		End Sub
	#tag EndEvent

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
		Function LoadValues() As String()
		  Dim TheDate as New date
		  Dim TheReturn() as string
		  Dim TheHour,TheMinute,ThePeriod as string
		  
		  Dim WT1 as String = me.LabelText
		  Dim WT1array() as String
		  
		  // We need to break apart the time text into its seperate sections so that they can be seperatly selectable
		  
		  // Hour Section
		  WT1array = Split(WT1,":")
		  TheHour = WT1array(0)
		  
		  // Minute Section
		  WT1 = WT1array(1)
		  WT1array = Split(WT1," ")
		  TheMinute = WT1array(0)
		  
		  // Period Section
		  ThePeriod = WT1array(1)
		  
		  
		  
		  TheReturn = Array(TheHour,":",TheMinute," ",ThePeriod)
		  
		  Return TheReturn()
		End Function
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
			Name="LabelText"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
