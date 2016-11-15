#tag Class
Protected Class CalenderButton
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  
		  me.State = "Pressed"
		  
		  Refresh
		  
		  Return True
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  
		  
		  me.State = "Hover"
		  me.Refresh
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  
		  
		  me.State = "Normal"
		  me.Refresh
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  
		  
		  If X >= 0 And X <= me.Width And Y >= 0 And Y <= me.Height Then
		    
		    me.State = "Hover"
		    
		    Refresh
		    
		    LaunchCalenderPicker
		    
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  RaiseEvent Initialize
		  
		  State = "Normal"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  
		  
		  DrawCalender(g)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DrawCalender(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  Dim TheCalender as Picture
		  
		  
		  
		  Select Case me.State
		  Case "Normal"
		    TheCalender = Calender_Picture
		  Case "Hover"
		    TheCalender = Calender_Picture_Hover
		  Case "Pressed"
		    TheCalender = Calender_Picture_Pressed
		  Case "Disabled"
		    TheCalender = Calender_Picture_Disabled
		  End Select
		  
		  
		  g1.DrawPicture(TheCalender,0,0,me.Width,me.Height,0,0,TheCalender.Width,TheCalender.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LaunchCalenderPicker()
		  Dim TheDate as new date
		  Dim TheMonth, TheDay, TheYear as Integer
		  Dim cw1 as New CalendarWindow
		  
		  
		  TheMonth = val( PairedControl.Sections.Data(PairedControl.Sections.NameIndex("Month")).TheText )
		  TheDay = val( PairedControl.Sections.Data(PairedControl.Sections.NameIndex("Date")).TheText )
		  TheYear = val( PairedControl.Sections.Data(PairedControl.Sections.NameIndex("Year")).TheText )
		  
		  If TheMonth = 0 Or TheDay = 0 Or TheYear = 0 Then
		    
		  Else
		    TheDate.Month = TheMonth
		    TheDate.Day = TheDay
		    TheDate.Year = TheYear + 2000
		  End If
		  
		  
		  TheDate.TotalSeconds = cw1.GetDate(TheDate)
		  
		  PairedControl.EnterRawData(TheDate.SQLDate)
		  me.PairedControl.RaiseSave
		  
		  me.PairedControl.LoadFromDB
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Initialize()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SaveValue(TheDate as date)
	#tag EndHook


	#tag Property, Flags = &h0
		PairedControl As sdoLabel_Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private State As String
	#tag EndProperty


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
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
