#tag Class
Protected Class ContactVenueListbox
Inherits ListBox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  
		  me.DrawBackground(g,row)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  
		  
		  
		  If me.RowTag(row) <> Nil Then
		    
		    DetermineSectionCoordinates
		    DetermineSectionColors
		    DrawMe(g)
		    
		  End If
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  
		  
		  
		  Sections = new SectionsModule.SectionsArray(4)
		  'ReDim Sections.Data(4)
		  'For i1 as integer = 0 To Sections.Data.Ubound
		  'Sections.Data(i1) = new SectionsModule.SectionClass
		  'Next
		  
		  RaiseEvent Initialize
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DetermineSectionColors()
		  
		  
		  
		  For x1 as integer = 0 To Sections.Data.Ubound
		    
		    Select Case x1
		    Case 0
		      
		      Sections.Data(x1).BackgroundColor = get_color("Gray",3)
		      
		    Case 1 To 3
		      
		      Sections.Data(x1).TextColor = get_color("Text",0)
		      Sections.Data(x1).BackgroundColor = get_color("Gray",3)
		      
		    Case 4
		      
		      If Sections.Data(x1).BooleanValue Then
		        Sections.Data(x1).BackgroundColor = RGB(0,255,0)
		        Sections.Data(x1).BackgroundColor = get_color("Gray",3)
		      End If
		      
		    End Select
		    
		  Next
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DetermineSectionCoordinates()
		  Dim TheLeft,TheRight,TheTop,TheBottom,TheWidth,TheHeight as integer
		  Dim SectionLeft,SectionRight,SectionTop,SectionBottom,SectionWidth,SectionHeight as integer
		  Dim x1,DefaultBarWidth,PictureWidth as integer
		  
		  
		  TheWidth = me.Width
		  TheHeight = me.Height
		  
		  // Sections
		  'Section1 = Picture
		  'Section2 = Line1
		  'Section3 = Line2
		  'Section4 = Line3
		  'Section5 = DefaultBar
		  
		  ReDim Sections.Data(4)
		  Sections.Data(0).Name = "Section1"
		  Sections.Data(1).Name = "Section2"
		  Sections.Data(2).Name = "Section3"
		  Sections.Data(3).Name = "Section4"
		  Sections.Data(4).Name = "Section5"
		  
		  
		  // Seciton1 the picture
		  If 1=1 then
		    x1 = 0
		    SectionHeight = RowHeight
		    SectionWidth = SectionHeight
		    SectionLeft = 0
		    SectionTop = 0
		    SectionRight = SectionLeft + SectionWidth
		    SectionBottom = SectionTop + SectionHeight
		    
		    Sections.Data(x1).Height = SectionHeight
		    Sections.Data(x1).Width = SectionWidth
		    Sections.Data(x1).Left = SectionLeft
		    Sections.Data(x1).Right = SectionRight
		    Sections.Data(x1).Top = SectionTop
		    Sections.Data(x1).Bottom = SectionBottom
		    
		    PictureWidth = SectionWidth
		  End If
		  
		  // Section5 default bar
		  If 1=1 then
		    x1 = 4
		    SectionHeight = RowHeight
		    SectionWidth = Floor( me.Width * 0.06 )
		    SectionLeft = me.Width - SectionWidth
		    SectionTop = 0
		    SectionRight = SectionLeft + SectionWidth
		    SectionBottom = SectionTop + SectionHeight
		    
		    Sections.Data(x1).Height = SectionHeight
		    Sections.Data(x1).Width = SectionWidth
		    Sections.Data(x1).Left = SectionLeft
		    Sections.Data(x1).Right = SectionRight
		    Sections.Data(x1).Top = SectionTop
		    Sections.Data(x1).Bottom = SectionBottom
		    
		    DefaultBarWidth = SectionWidth
		  End If
		  
		  // Seciton2 Line1
		  If 1=1 then
		    x1 = 1
		    SectionHeight = Floor( RowHeight / 3 )
		    SectionWidth = me.Width - PictureWidth - DefaultBarWidth
		    SectionLeft = PictureWidth
		    SectionTop = 0
		    SectionRight = SectionLeft + SectionWidth
		    SectionBottom = SectionTop + SectionHeight
		    
		    Sections.Data(x1).Height = SectionHeight
		    Sections.Data(x1).Width = SectionWidth
		    Sections.Data(x1).Left = SectionLeft
		    Sections.Data(x1).Right = SectionRight
		    Sections.Data(x1).Top = SectionTop
		    Sections.Data(x1).Bottom = SectionBottom
		  End If
		  
		  // Section3 Line2
		  If 1=1 then
		    x1 = 2
		    SectionHeight = Floor( RowHeight / 3 )
		    SectionWidth = me.Width - PictureWidth - DefaultBarWidth
		    SectionLeft = PictureWidth
		    SectionTop = SectionHeight
		    SectionRight = SectionLeft + SectionWidth
		    SectionBottom = SectionTop + SectionHeight
		    
		    Sections.Data(x1).Height = SectionHeight
		    Sections.Data(x1).Width = SectionWidth
		    Sections.Data(x1).Left = SectionLeft
		    Sections.Data(x1).Right = SectionRight
		    Sections.Data(x1).Top = SectionTop
		    Sections.Data(x1).Bottom = SectionBottom
		  End If
		  
		  // Section4 Line3
		  If 1=1 then
		    x1 = 3
		    SectionHeight = Floor( RowHeight / 3 )
		    SectionWidth = me.Width - PictureWidth - DefaultBarWidth
		    SectionLeft = PictureWidth
		    SectionTop = SectionHeight * 2
		    SectionRight = SectionLeft + SectionWidth
		    SectionBottom = SectionTop + SectionHeight
		    
		    Sections.Data(x1).Height = SectionHeight
		    Sections.Data(x1).Width = SectionWidth
		    Sections.Data(x1).Left = SectionLeft
		    Sections.Data(x1).Right = SectionRight
		    Sections.Data(x1).Top = SectionTop
		    Sections.Data(x1).Bottom = SectionBottom
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawBackground(GraphicsObject as Graphics, row as integer)
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  
		  If row = me.ListIndex Then
		    
		    // Selected Row
		    g1.ForeColor = get_color("Blue",4)
		    g1.FillRect(0,-1,g1.Width,g1.Height + 1)
		    
		  ElseIf row Mod 2 = 0 Then
		    
		    // Event Row
		    g1.ForeColor = get_color("Gray",5)
		    g1.FillRect(0,-1, g1.Width, g1.Height + 1)
		    
		  Else
		    
		    // Odd Row
		    g1.ForeColor = get_color("Gray",4)
		    g1.FillRect(0,-1, g1.Width, g1.Height + 1 )
		    
		  End If
		  
		  'Return True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawMe(GraphicsObject as Graphics)
		  Dim g1 as Graphics = GraphicsObject
		  Dim SectionLeft,SectionRight,SectionTop,SectionBottom,SectionWidth,SectionHeight as integer
		  Dim TheText as String
		  Dim p1 as Picture
		  
		  
		  
		  
		  // First We draw the Picture
		  Dim x1 as integer
		  x1 = 0
		  SectionLeft = Sections.Data(x1).Left
		  SectionRight = Sections.Data(x1).Right
		  SectionTop = Sections.Data(x1).Top
		  SectionBottom = Sections.Data(x1).Bottom
		  SectionWidth = Sections.Data(x1).Width
		  SectionHeight = Sections.Data(x1).Height
		  
		  'Background
		  If Sections.Data(x1).BackgroundEnabled Then
		    g1.ForeColor = Sections.Data(x1).BackgroundColor
		    g1.FillRect(SectionLeft,SectionTop,SectionWidth,SectionHeight)
		  End If
		  
		  'Picture
		  p1 = Sections.Data(x1).PictureValue
		  If p1 <> Nil Then
		    g1.DrawPicture(p1,SectionLeft,SectionTop,SectionWidth,SectionHeight,0,0,p1.Width,p1.Height)
		  End If
		  
		  
		  // Then Line1
		  x1 = 1
		  SectionLeft = Sections.Data(x1).Left
		  SectionRight = Sections.Data(x1).Right
		  SectionTop = Sections.Data(x1).Top
		  SectionBottom = Sections.Data(x1).Bottom
		  SectionWidth = Sections.Data(x1).Width
		  SectionHeight = Sections.Data(x1).Height
		  
		  'Background
		  If Sections.Data(x1).BackgroundEnabled Then
		    g1.ForeColor = Sections.Data(x1).BackgroundColor
		    g1.FillRect(SectionLeft,SectionTop,SectionWidth,SectionHeight)
		  End If
		  
		  'Text
		  g1.ForeColor = Sections.Data(x1).TextColor
		  TheText = Sections.Data(x1).TheText
		  g1.DrawString(TheText,SectionLeft,SectionBottom - 1)
		  
		  // Then Line2
		  x1 = 2
		  SectionLeft = Sections.Data(x1).Left
		  SectionRight = Sections.Data(x1).Right
		  SectionTop = Sections.Data(x1).Top
		  SectionBottom = Sections.Data(x1).Bottom
		  SectionWidth = Sections.Data(x1).Width
		  SectionHeight = Sections.Data(x1).Height
		  
		  'Background
		  If Sections.Data(x1).BackgroundEnabled Then
		    g1.ForeColor = Sections.Data(x1).BackgroundColor
		    g1.FillRect(SectionLeft,SectionTop,SectionWidth,SectionHeight)
		  End If
		  
		  'Text
		  g1.ForeColor = Sections.Data(x1).TextColor
		  TheText = Sections.Data(x1).TheText
		  g1.DrawString(TheText,SectionLeft,SectionBottom - 1)
		  
		  // Then Line3
		  x1 = 3
		  SectionLeft = Sections.Data(x1).Left
		  SectionRight = Sections.Data(x1).Right
		  SectionTop = Sections.Data(x1).Top
		  SectionBottom = Sections.Data(x1).Bottom
		  SectionWidth = Sections.Data(x1).Width
		  SectionHeight = Sections.Data(x1).Height
		  
		  'Background
		  If Sections.Data(x1).BackgroundEnabled Then
		    g1.ForeColor = Sections.Data(x1).BackgroundColor
		    g1.FillRect(SectionLeft,SectionTop,SectionWidth,SectionHeight)
		  End If
		  
		  'Text
		  g1.ForeColor = Sections.Data(x1).TextColor
		  TheText = Sections.Data(x1).TheText
		  g1.DrawString(TheText,SectionLeft,SectionBottom - 1)
		  
		  // Then The Default rectangle
		  x1 = 4
		  SectionLeft = Sections.Data(x1).Left
		  SectionRight = Sections.Data(x1).Right
		  SectionTop = Sections.Data(x1).Top
		  SectionBottom = Sections.Data(x1).Bottom
		  SectionWidth = Sections.Data(x1).Width
		  SectionHeight = Sections.Data(x1).Height
		  
		  g1.ForeColor = Sections.Data(x1).BackgroundColor
		  g1.FillRect(SectionLeft,SectionTop,SectionWidth,SectionHeight)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertData(ThePicture as Picture, Line1 as string, Line2 as string, Line3 as String, TheDefault as Boolean)
		  
		  
		  
		  
		  Sections = new SectionsModule.SectionsArray(4)
		  
		  Sections.Data(0).PictureValue = ThePicture
		  Sections.Data(1).TheText = Line1
		  Sections.Data(2).TheText = Line2
		  Sections.Data(3).TheText = Line3
		  Sections.Data(4).BooleanValue = TheDefault
		  
		  
		  me.AddRow
		  me.RowTag(me.ListCount - 1) = Sections
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertData(Line1 as string, Line2 as string, Line3 as String, TheDefault as Boolean)
		  Dim p1 as picture
		  
		  
		  
		  InsertData(p1,Line1,Line2,Line3,TheDefault)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadFromDB()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  
		  me.Enabled = True
		  
		  me.DeleteAllRows
		  
		  RaiseEvent LoadFromDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewRecord(ContactOrVenue as String)
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Initialize()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LoadFromDB()
	#tag EndHook


	#tag Property, Flags = &h0
		Sections As SectionsModule.SectionsArray
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="200"
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
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
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
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
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
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
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
			InitialValue="300"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
