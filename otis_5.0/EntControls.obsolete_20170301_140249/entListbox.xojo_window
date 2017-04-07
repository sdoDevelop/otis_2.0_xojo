#tag Window
Begin ContainerControl entListbox
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   398
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   686
   Begin Listbox oListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   398
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   686
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AddFolder(text as string)
		  oListbox.AddFolder(text)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow()
		  oListbox.AddRow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(Items() as String)
		  oListbox.AddRow( Items() )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(ParamArray Item as String)
		  oListbox.AddRow(Item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cell(row as integer, column as integer) As String
		  
		  
		  Return oListbox.Cell(row,column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cell(row as integer, column as integer,assigns sValue as string)
		  
		  
		  oListbox.Cell(row,column) = sValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellEdit(row as integer, column as integer)
		  
		  oListbox.EditCell(row,column)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellPos(LB as entListBox, Row as Integer, Column as Integer) As Integer()
		  Dim Result(1), X, Y as Integer
		  If Row < LB.ScrollPosition then 
		    Result(0) = -1
		    Result(1) = -1
		    return Result
		  else
		    Y = lb.Top
		    For X = 0 to LB.trueWindow.width
		      system.DebugLog str(LB.ColumnFromXY(X + lb.Left,Y + lb.Top))
		      if LB.ColumnFromXY(X,Y) = Column then 
		        Result(0) = X
		        exit
		      end if
		    next
		    For Y = 0 to LB.TrueWindow.Height
		      if LB.RowFromXY(X,Y) = Row then 
		        Result(1) = Y
		        exit
		      end if
		    next
		  end if
		  
		  dim n2, n3 as integer
		  
		  Result(0) = Result(0) + app.MainWindow.tbMainWindow.Left + lb.left + lb.Window.Left
		  Result(1) = Result(1) + lb.top + lb.oListbox.TrueWindow.Top + lb.Window.Top + lb.RowHeight
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellState(row as integer, column as integer) As CheckBox.CheckedStates
		  Return oListbox.CellState(row,column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellState(row as integer, column as integer, assigns oState as CheckBox.CheckedStates)
		  
		  oListbox.CellState(row,column) = oState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellTag(row as integer, column as integer) As Variant
		  
		  Return oListbox.CellTag(row,column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellTag(row as integer, column as integer, assigns vNewValue as Variant)
		  
		  oListbox.CellTag(row,column) = vNewValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellType(row as integer, col as integer) As integer
		  
		  return oListbox.CellType(row,col)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellType(row as integer, col as integer, assigns newIntegerValue as integer)
		  
		  oListbox.CellType(row,col) = newIntegerValue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnCount() As Integer
		  dim n1 as integer
		  
		  n1 = oListbox.ColumnCount
		  Return n1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnCount(assigns iCount as integer)
		  
		  oListbox.ColumnCount = iCount
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnFromXY(x as integer, y as integer) As integer
		  Return oListbox.ColumnFromXY(x,y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnType(assigns TypeInteger() as integer)
		  
		  For i1 as integer = 0 To TypeInteger.Ubound
		    
		    ColumnType(i1) = TypeInteger(i1)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnType(ColumnNumber as integer) As integer
		  
		  Return oListbox.ColumnType(ColumnNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnType(ColumnNumber as integer, assigns TypeInteger as integer)
		  
		  oListbox.ColumnType(ColumnNumber) = TypeInteger
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRows()
		  
		  oListbox.DeleteAllRows
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expanded(row as integer) As Boolean
		  return oListbox.Expanded(row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Expanded(row as integer, assigns NewbooleanValue as Boolean)
		  oListbox.Expanded(row) = NewbooleanValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByPKID(iPKID as int64) As integer
		  
		  For i1 as integer = 0 To oListbox.ListCount - 1
		    
		    dim oRowTag as lbRowTag = oListbox.RowTag(i1)
		    If oRowTag <> Nil Then
		      If oRowTag.pkid = iPKID Then
		        Return i1
		      End If
		    End If
		    
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOpenedFolders() As lbRowTag()
		  dim OpenFolderRowTags() as lbRowTag
		  
		  
		  For i1 as integer = 0 To oListbox.ListCount - 1
		    
		    If oListbox.RowIsFolder(i1) Then
		      
		      If oListbox.Expanded(i1) Then
		        
		        dim oRowTag as lbRowTag
		        oRowTag = oListbox.RowTag(i1)
		        OpenFolderRowTags.Append(oRowTag)
		        
		      End If
		      
		    End If
		    
		  Next
		  
		  Return OpenFolderRowTags()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSelectedRows() As lbRowTag()
		  dim oSelectedRows() as lbRowTag
		  
		  dim i1 as integer
		  While i1 < oListbox.ListCount
		    
		    // Check if row is selected
		    If oListbox.Selected(i1) Then
		      
		      dim oRowTag as lbRowTag
		      oRowTag = oListbox.RowTag(i1)
		      
		      If oListbox.ListIndex = i1 Then
		        oSelectedRows.Insert(0,oRowTag)
		      Else
		        oSelectedRows.Append(oRowTag)
		      End If
		      
		    End If
		    
		    i1 = i1 + 1 
		    
		  Wend
		  
		  Return oSelectedRows
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUIState() As lbUIState
		  dim oUIState as New lbUIState
		  
		  oUIState.oOpenFolders = GetOpenedFolders
		  oUIState.oSelectedRows = GetSelectedRows
		  
		  Return oUIState
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GridLinesHorizontal() As integer
		  
		  Return oListbox.GridLinesHorizontal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GridLinesHorizontal(assigns iValue as integer)
		  
		  oListbox.GridLinesHorizontal = iValue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GridLinesVertical() As integer
		  
		  Return oListbox.GridLinesVertical
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GridLinesVertical(assigns iValue as integer)
		  
		  oListbox.GridLinesVertical = iValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleTabInList(list as listbox, row as integer, column as integer, key as String) As Boolean
		  // Handle tab character in Listbox.CellKeyDown event
		  
		  Select case asc(key)
		  case 9
		    if Keyboard.AsyncShiftKey then
		      // back
		      
		      // look for column left
		      for i as integer = column-1 downto 0
		        if list.ColumnType(i) >= list.TypeEditable then
		          list.EditCell(row, i)
		          Return true
		        elseif me.CustomTypes(i) = 1 Then  'Popup menu
		          'PopupMenuColActivated(row,i)
		          'Return true
		        end if
		      next
		      
		      // not found, so look in row before
		      row = row - 1
		      if row >= 0 then
		        for i as integer = list.ColumnCount-1 downto 0
		          if list.ColumnType(i) >= list.TypeEditable then
		            list.EditCell(row, i)
		            Return true
		          elseif me.CustomTypes(i) = 1 Then  'Popup menu
		            'PopupMenuColActivated(row,i)
		            'Return true
		          end if
		        next
		      end if
		    else
		      // forward
		      
		      // look for column right
		      for i as integer = column+1 to list.ColumnCount-1
		        if list.ColumnType(i) >= list.TypeEditable then
		          list.EditCell(row, i)
		          Return true
		        elseif me.CustomTypes(i) = 1 Then  'Popup menu
		          'PopupMenuColActivated(row,i)
		          'Return true
		        end if
		      next
		      
		      // not found, so look in row below
		      row = row + 1
		      if row < list.ListCount then
		        for i as integer = 0 to list.ColumnCount-1
		          if list.ColumnType(i) >= list.TypeEditable then
		            list.EditCell(row, i)
		            Return true
		          elseif me.CustomTypes(i) = 1 Then  'Popup menu
		            'PopupMenuColActivated(row,i)
		            'Return true
		          end if
		        next
		      end if
		    end if
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Heading(assigns sValues() as string)
		  
		  For i1 as integer = 0 To sValues.Ubound
		    Heading(i1) = sValues(i1)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Heading(index As integer) As String
		  dim s1 as String
		  
		  s1 = oListbox.Heading(index)
		  Return s1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Heading(index as integer, assigns NewValue As String)
		  
		  oListbox.Heading(index) = NewValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(row as integer, stext as string = "", indent as integer = 0)
		  
		  oListbox.InsertRow(row,stext,indent)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastIndex() As integer
		  return oListbox.LastIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListCount() As Integer
		  
		  Return oListbox.ListCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListIndex() As integer
		  
		  Return oListbox.ListIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListIndex(assigns iIndex as integer)
		  
		  oListbox.ListIndex = iIndex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRow(index as integer)
		  
		  oListbox.RemoveRow(index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reopenFolders(reopenThese() as lbRowTag)
		  dim i1 as integer
		  
		  While i1 <> oListbox.ListCount 
		    
		    If oListbox.RowIsFolder(i1) Then
		      
		      // Check if the folder array has naything
		      If reopenThese.Ubound = -1 Then
		        ' Nil array
		        If oListbox.Expanded(i1) Then
		          oListbox.Expanded(i1) = False
		        End If
		        
		      Else
		        
		        // Grab the rowtag
		        dim oRowTag as lbRowTag
		        oRowTag = oListbox.RowTag(i1)
		        
		        // Loop through all rowtags we want opened
		        For Each oWantOpen as lbRowTag In reopenThese
		          
		          If oRowTag.vColumnValues(0) = oWantOpen.vColumnValues(0) And oRowTag.iFolderLevel = oWantOpen.iFolderLevel Then
		            oListbox.Expanded(i1) = True
		            Continue
		          ElseIf oRowTag.pkid <> 0 And oRowTag.pkid = oWantOpen.pkid And oRowTag.iFolderLevel = oWantOpen.iFolderLevel Then
		            oListbox.Expanded(i1) = True
		            Continue
		          End If
		          
		        Next
		        
		      End If
		      
		    End If
		    
		    i1 = i1 + 1
		    
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetSelectedRows(oSelectedRows() as lbRowTag)
		  
		  dim i1 as integer
		  While i1 < oListbox.ListCount
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = oListbox.RowTag(i1)
		    
		    // Loop through all rowtags we want selected
		    dim i2 as integer
		    For Each oWantSelected as lbRowTag In oSelectedRows
		      
		      dim bSelected as Boolean
		      If oRowTag.vColumnValues(0) = oWantSelected.vColumnValues(0) And oRowTag.iFolderLevel = oWantSelected.iFolderLevel Then
		        bSelected = True
		      ElseIf oRowTag.pkid <> 0 And oRowTag.pkid = oWantSelected.pkid And oRowTag.iFolderLevel = oWantSelected.iFolderLevel Then
		        bSelected = True
		      End If
		      
		      If bSelected Then
		        If i2 = 0 Then
		          oListbox.ListIndex = (i1)
		        End If
		        oListbox.Selected(i1) = bSelected
		      End If
		      
		      i2 = i2 + 1
		      
		    Next
		    
		    i1 = i1 + 1
		    
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUIState(oUIState as lbUIState)
		  
		  
		  If oUIState <> Nil then
		    
		    If oUIState.oOpenFolders <> Nil Then
		      If oUIState.oOpenFolders.Ubound <> -1 Then
		        ReopenFolders(oUIState.oOpenFolders)
		      Else
		        
		      End If
		    End If
		    
		    
		    'If oUIState.oSelectedRows <> Nil Then
		    If oUIState.oSelectedRows.Ubound <> -1 Then
		      ResetSelectedRows(oUIState.oSelectedRows)
		    Else
		      
		    End If
		    
		  End If
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowFromXY(x as integer, y as integer) As integer
		  Return oListbox.RowFromXY(x,y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowHeight() As integer
		  
		  Return oListbox.RowHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowIsFolder(row as integer) As Boolean
		  
		  Return oListbox.RowIsFolder(row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowisFolder(row as integer, assigns NewValue as Boolean)
		  
		  oListbox.RowIsFolder(row) = NewValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTag(row as integer) As Variant
		  
		  Return oListbox.RowTag(row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowTag(row as integer, assigns vValue as Variant)
		  
		  oListbox.RowTag(row) = vValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScrollPosition() As integer
		  return oListbox.ScrollPosition
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollPosition(assigns integerValue as integer)
		  
		  oListbox.ScrollPosition = integerValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Selected(v as integer) As Boolean
		  Return oListbox.Selected(v)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Selected(v as integer, assigns newvalue as Boolean)
		  oListbox.Selected(v) = newvalue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function width() As integer
		  Return oListbox.Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub width(assigns newwidth as integer)
		  
		  oListbox.Width = newwidth
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CellAction(row as integer, column as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellBackgroundPaint(g as Graphics,row as integer, column as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellLostFocus(row as integer, col as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellTextPaint(g as Graphics, row as integer, column as integer, x as integer, y as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoubleClick()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event entConstructContextualMenu(base as menuitem, x as integer, y as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event entContextualMenuAction(hitItem as MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event entMouseDown(x as integer, y as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event entMouseUp(x as integer, y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ExpandRow(Row as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PopupMenuColActivated(row as integer, column as integer)
	#tag EndHook


	#tag Property, Flags = &h0
		CellBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			0 - no type
			1 - popup
		#tag EndNote
		CustomTypes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		GridLinesColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		HasHeading As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events oListbox
	#tag Event
		Sub ExpandRow(row As Integer)
		  ExpandRow(row)
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  CellAction(row,column)
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  Return CellBackgroundPaint(g,row,column)
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  Return CellTextPaint(g,row,column,x,y)
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  Change
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  DoubleClick
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Return entConstructContextualMenu(base,x,y)
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Return entContextualMenuAction(hitItem)
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  
		  if IsContextualClick then return true
		  
		  Return entMouseDown(x,y)
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  entMouseUp(x,y)
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellLostFocus(row as Integer, column as Integer)
		  CellLostFocus(row,column)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CellBackColor"
		Visible=true
		Group="Behavior"
		InitialValue="&cffffff"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="GridLinesColor"
		Visible=true
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasHeading"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
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
		EditorType="Boolean"
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
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
