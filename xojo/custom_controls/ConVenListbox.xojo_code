#tag Class
Protected Class ConVenListbox
Inherits ListBox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  
		  Return DrawRowBackground(g,row)
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  
		  Return DrawRow(g,row)
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Dim TheRow,ThePart,TheRP() as integer
		  
		  
		  // Get the index of the part and row 
		  TheRP = DeterminePartByXY(x,y)
		  TheRow = TheRP(0)
		  ThePart = TheRP(1)
		  
		  // Save the index of the part clicked
		  MouseDownPart = ThePart
		  MouseDownRow = TheRow
		  
		  // Set the section state
		  Dim Sections as SectionsModule.SectionsArray = me.RowTag(TheRow)
		  Sections.Data(ThePart).State = "Pressed"
		  RedrawMe
		  
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Dim ThePart, TheRow, ThePR() as integer
		  Dim Sections as SectionsModule.SectionsArray
		  
		  
		  ZeroStatesSafe
		  
		  
		  RedrawMe
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim ThePart, TheRow, ThePR() as integer
		  Dim Sections as SectionsModule.SectionsArray
		  
		  
		  ZeroStatesSafe
		  
		  // Determine which part and row was clicked
		  ThePR = DeterminePartByXY(X,Y)
		  TheRow = ThePR(0)
		  ThePart = ThePR(1)
		  
		  
		  // Check if xy accually refers to any part
		  If TheRow = -1 Or ThePart = -1 Then
		    Return
		  End If
		  
		  // Grab the section class
		  Sections = me.RowTag(TheRow)
		  
		  // Set the part in the sections class to Hover
		  Sections.Data(ThePart).State = "Hover"
		  
		  // Redraw the listbox
		  RedrawMe
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  Dim TheRow,ThePart,TheRP() as integer
		  
		  
		  // Get the index of the part and row 
		  TheRP = DeterminePartByXY(x,y)
		  TheRow = TheRP(0)
		  ThePart = TheRP(1)
		  
		  // Check If the row and part of the mouse down event match the current row and part
		  If TheRow = MouseDownRow And ThePart = MouseDownPart Then
		    
		    // Mouse is still in same position as when it was clicked down
		    
		    'The only part we will be worried about for now is the primary box
		    If ThePart = 4 Then  'This is the primary box
		      
		      // Set the section state
		      Dim Sections as SectionsModule.SectionsArray = me.RowTag(TheRow)
		      Sections.Data(ThePart).State = "Hover"
		      RedrawMe
		      
		      // Raise the part clicked event 
		      'The particular instance will handle what to do when something is clicked
		      RaiseEvent PartClicked(TheRow,ThePart)
		      
		    End If
		    
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  OpenMethod
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DeterminePartByXY(X as integer, Y as integer) As integer()
		  Dim currY1,prevY1 as integer
		  Dim RowIndex as integer = -1
		  Dim SectionIndex as integer = -1
		  Dim Sections as SectionsModule.SectionsArray
		  
		  
		  // Determine which row was clicked
		  For i1 as integer = 1 To me.ListCount
		    
		    currY1 = prevY1 + RowHeight
		    
		    If Y >= prevY1 And Y <= currY1 Then
		      RowIndex = i1 - 1
		      Exit
		    End If
		    prevY1 = currY1
		  Next
		  
		  If RowIndex = -1 Then
		    'no row clicked Abort!
		    Return Array( -1,-1)
		  End If
		  
		  
		  
		  // Set up retlative x y coordinates relative to the boundries of the row clicked
		  Dim RelX, RelY as integer 
		  RelY = Y - RowIndex * RowHeight
		  RelX = X
		  
		  Sections = me.RowTag(RowIndex)
		  
		  // Loop through each section checking if we are in it
		  For i1 as integer = 0 To Sections.Data.Ubound
		    Dim TheLeft,TheRight,TheBottom,TheTop as integer
		    TheLeft = Sections.Data(i1).Left
		    TheRight = Sections.Data(i1).Right
		    TheTop = Sections.Data(i1).Top
		    TheBottom = Sections.Data(i1).Bottom
		    If RelX >= TheLeft And RelX <= TheRight And RelY >= TheTop And RelY <= TheBottom Then
		      SectionIndex = i1
		    End If
		  Next
		  
		  Return Array(RowIndex,SectionIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DrawRow(GraphicsObject as Graphics, row as integer) As Boolean
		  Dim g1 as Graphics = GraphicsObject
		  Dim SectionLeft,SectionRight,SectionTop,SectionBottom,SectionWidth,SectionHeight as integer
		  Dim TheText as String
		  Dim p1 as Picture
		  
		  
		  // Grab the sections variable from the row tag
		  Dim Sections as SectionsModule.SectionsArray = me.RowTag(row)
		  
		  // Send sections variable off to get coordinates set, and colors set
		  SetUpRowSections(Sections)
		  SetUpRowColors(Sections)
		  
		  
		  /////
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
		  
		  
		  /////
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
		  
		  
		  /////
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
		  
		  
		  /////
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
		  
		  
		  /////
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
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DrawRowBackground(GraphicsObject as graphics, row as integer) As Boolean
		  Dim g1 as Graphics = GraphicsObject
		  
		  
		  
		  
		  If row Mod 2 = 0 Then
		    
		    // Event Row
		    g1.ForeColor = get_color("Gray",5)
		    g1.FillRect(0,-1, g1.Width, g1.Height + 1)
		    
		  Else
		    
		    // Odd Row
		    g1.ForeColor = get_color("Gray",4)
		    g1.FillRect(0,-1, g1.Width, g1.Height + 1 )
		    
		  End If
		  
		  Return True
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertData(ThePKID as string, LinkingPKID as string, Line1 as string, Line2 as string, Line3 as string, ThePrimary as Boolean)
		  
		  
		  
		  Dim p1 as Picture = Calender_Picture
		  InsertData(ThePKID,LinkingPKID,Line1,Line2,Line3,ThePrimary,p1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertData(ThePKID as string, LinkingPKID as string, Line1 as string, Line2 as string, Line3 as string, ThePrimary as Boolean, ThePicture as Picture)
		  Dim Sections as SectionsModule.SectionsArray
		  
		  
		  
		  Sections = new SectionsModule.SectionsArray(4)
		  
		  Sections.Data(0).PictureValue = ThePicture
		  Sections.Data(1).TheText = Line1
		  Sections.Data(2).TheText = Line2
		  Sections.Data(3).TheText = Line3
		  Sections.Data(4).BooleanValue = ThePrimary
		  Sections.LinkingTablePKID = LinkingPKID
		  Sections.ThePKID = ThePKID
		  Sections.Data(0).State = "Normal"
		  Sections.Data(1).State = "Normal"
		  Sections.Data(2).State = "Normal"
		  Sections.Data(3).State = "Normal"
		  Sections.Data(4).State = "Normal"
		  
		  me.AddRow
		  me.RowTag(me.ListCount - 1) = Sections
		  SetUpRowColors(Sections)
		  InvalidateCell(-1,-1)
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadFromDB()
		  
		  
		  me.Enabled = True
		  
		  me.DeleteAllRows
		  
		  RaiseEvent LoadFromDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenMethod()
		  
		  
		  
		  RaiseEvent Initialize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawMe()
		  me.InvalidateCell(-1,-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetUpRowColors(TheSections as SectionsModule.SectionsArray)
		  
		  
		  For i1 as integer = 0 To TheSections.Data.Ubound
		    
		    // Put thedata into a variable
		    Dim TheData as SectionsModule.SectionClass = TheSections.Data(i1)
		    
		    Select Case i1
		    Case 0   'Picture
		      
		      Select Case TheSections.Data(i1).State
		      Case "Normal"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Hover"
		        
		        TheData.TextColor = get_color("Blue",4)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Pressed"
		        
		        TheData.TextColor = get_color("Gray",6)
		        TheData.BackgroundColor = get_color("Gray",4)
		        TheData.BackgroundEnabled = True
		        
		      Case "Disabled"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Edit"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      End Select
		      
		    Case 1   'Line1
		      
		      Select Case TheSections.Data(i1).State
		      Case "Normal"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Hover"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Pressed"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Disabled"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Edit"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      End Select
		      
		    Case 2   'Line2
		      
		      Select Case TheSections.Data(i1).State
		      Case "Normal"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Hover"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Pressed"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Disabled"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Edit"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      End Select
		      
		      
		    Case 3   'Line3
		      
		      Select Case TheSections.Data(i1).State
		      Case "Normal"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Hover"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Pressed"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Disabled"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      Case "Edit"
		        
		        TheData.TextColor = get_color("Text",0)
		        TheData.BackgroundColor = get_color("Gray",3)
		        TheData.BackgroundEnabled = True
		        
		      End Select
		      
		    Case 4   'PrimaryRectangle 
		      
		      If TheSections.Data(i1).BooleanValue Then
		        
		        Select Case TheSections.Data(i1).State
		        Case "Normal"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = rgb(0,255,0)
		          TheData.BackgroundEnabled = True
		          
		        Case "Hover"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = rgb(0,255,150)
		          TheData.BackgroundEnabled = True
		          
		        Case "Pressed"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = rgb(150,255,0)
		          TheData.BackgroundEnabled = True
		          
		        Case "Disabled"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = rgb(150,255,150)
		          TheData.BackgroundEnabled = True
		          
		        End Select
		        
		      Else
		        
		        Select Case TheSections.Data(i1).State
		        Case "Normal"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = get_color("Gray",4)
		          TheData.BackgroundEnabled = True
		          
		        Case "Hover"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = get_color("Gray",3)
		          TheData.BackgroundEnabled = True
		          
		        Case "Pressed"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = get_color("Gray",3)
		          TheData.BackgroundEnabled = True
		          
		        Case "Disabled"
		          
		          TheData.TextColor = get_color("Text",0)
		          TheData.BackgroundColor = get_color("Gray",3)
		          TheData.BackgroundEnabled = True
		          
		        End Select
		        
		      End If
		      
		    End Select
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetUpRowSections(TheSections as SectionsModule.SectionsArray)
		  Dim TheLeft,TheRight,TheTop,TheBottom,TheWidth,TheHeight as integer
		  Dim SectionLeft,SectionRight,SectionTop,SectionBottom,SectionWidth,SectionHeight as integer
		  Dim x1,DefaultBarWidth,PictureWidth as integer
		  Dim Sections as SectionsModule.SectionsArray = TheSections
		  
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
		    SectionHeight = Floor( RowHeight * 0.75 )
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
		    SectionWidth = Floor( me.Width * 0.25 )
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

	#tag Method, Flags = &h0
		Sub ZeroStates()
		  
		  
		  
		  For i1 as integer = 0 To me.ListCount - 1
		    
		    Dim Sections as SectionsModule.SectionsArray
		    
		    Sections = me.RowTag(i1)
		    
		    For i2 as integer = 0 To Sections.Data.Ubound
		      
		      Sections.Data(i2).State = "Normal"
		      
		    Next
		    
		    me.RowTag(i1) = Sections
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ZeroStatesSafe()
		  
		  
		  
		  For i1 as integer = 0 To me.ListCount - 1
		    
		    Dim Sections as SectionsModule.SectionsArray
		    
		    Sections = me.RowTag(i1)
		    
		    For i2 as integer = 0 To Sections.Data.Ubound
		      
		      If Sections.Data(i2).State <> "Edit" Then
		        Sections.Data(i2).State = "Normal"
		      End If
		      
		    Next
		    
		    me.RowTag(i1) = Sections
		    
		  Next
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Initialize()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LoadFromDB()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PartClicked(row as integer, part as integer)
	#tag EndHook


	#tag Property, Flags = &h0
		ContextualMenuRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MouseDownPart As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MouseDownRow As Integer
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
			Name="ContextualMenuRow"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
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
