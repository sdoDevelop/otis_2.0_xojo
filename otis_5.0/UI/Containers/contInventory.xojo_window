#tag Window
Begin ContainerControl contInventory
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   420
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
   Width           =   700
   Begin entListbox lbItems
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      CellBackColor   =   &cFFFFFF00
      Enabled         =   True
      EraseBackground =   True
      GridLinesColor  =   &c00000000
      HasBackColor    =   False
      HasHeading      =   True
      Height          =   414
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   152
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   3
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   545
   End
   Begin PushButton bAddItem
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Add Item"
      Default         =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   33
      Underline       =   False
      Visible         =   True
      Width           =   151
   End
   Begin PushButton bRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Refresh"
      Default         =   True
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   4
      Underline       =   False
      Visible         =   True
      Width           =   151
   End
   Begin PushButton bDeleteItem
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Delete Item"
      Default         =   False
      Enabled         =   False
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   62
      Underline       =   False
      Visible         =   True
      Width           =   151
   End
   Begin contInventorySingleInfoOnly contItemInfo
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   246
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   3
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   170
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   148
   End
   Begin PushButton bIncreaseQuantity
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Increase Quantity"
      Default         =   False
      Enabled         =   False
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   91
      Underline       =   False
      Visible         =   True
      Width           =   151
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  me.HasBackColor = False
		  me.BackColor = UiColors.Background
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItem()
		  dim oInventoryItem as New DataFile.tbl_inventory
		  lbItems.InsertRow(0)
		  
		  LoadRow(0,oInventoryItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  oItems = new cInventory
		  oItems.bGrouped = True
		  oItems.sGroupBy = "item_department"
		  oItems.LoadMe
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteDepartment()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem(oRowTag as lbrowtag, IdentifyingName as String)
		  break
		  
		  
		  If MsgBox("Are you sure you want to delete " + IdentifyingName, 4) = 6 Then
		    
		    dim otblObject as DataFile.tbl_inventory = oRowTag.vtblRecord
		    
		    dim iPKID as integer = oRowTag.pkid
		    
		    otblObject.Delete
		    
		    dim n1 as integer = lbItems.FindByPKID(iPKID)
		    If  n1 <> -1 Then
		      lbItems.RemoveRow(n1)
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadItemsIntoListbox()
		  
		  // Delete all current rows in listbox
		  lbItems.DeleteAllRows
		  
		  dim sKeys() as Variant
		  sKeys = oItems.jsGroupedItems.Keys
		  
		  // Loop through all the groups and create folders with rowtags filled with children
		  For i1 as integer = 0 To sKeys.Ubound
		    dim oRowTag as New lbRowTag
		    oRowTag.isFolder = True
		    dim n1 as integer = oRowTag.sFolderValues.Ubound + 1
		    Redim oRowTag.sFolderValues(n1)
		    oRowTag.sFolderValues(n1) = sKeys(i1)
		    
		    Dim oSingleGroup() as DataFile.tbl_inventory
		    oSingleGroup = oItems.jsGroupedItems.Value(sKeys(i1))
		    
		    // Loop through all reacords in group to create children rowtags
		    For i2 as integer = 0 To oSingleGroup.Ubound
		      dim currentRecord as DataFile.tbl_inventory
		      currentRecord = oSingleGroup(i2)
		      dim oRecordRowTag as New lbRowTag( currentRecord,sFieldNames)
		      
		      oRowTag.aroChildren.Append(oRecordRowTag)
		    Next
		    
		    lbItems.AddFolder(oRowTag.sFolderValues(0))
		    lbItems.RowTag(lbItems.LastIndex) = oRowTag
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(row as integer, oRecord as DataFile.tbl_inventory)
		  
		  dim oRowTag as New lbRowTag(oRecord,sFieldNames)
		  
		  lbItems.RowTag(row) = oRowTag
		  
		  // Populate cells
		  For i1 as integer = row To sFieldNames.ubound
		    lbItems.Cell(row,i1) = oRowTag.vColumnValues(i1)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshInventory(bMaintainUIState as Boolean = False)
		  dim sOpenFolders() as string
		  
		  If bMaintainUIState Then
		    
		    // Loop through each row in the listbox 
		    For i1 as integer = 0 To lbItems.ListCount - 1
		      
		      // save the state of this group
		      If lbItems.RowIsFolder(i1) Then
		        
		        If lbItems.Expanded(i1) Then
		          sOpenFolders.Append( lbItems.Cell(i1,0) )
		          
		        End If
		      End If
		    Next
		  End If
		  
		  oItems.LoadMe
		  LoadItemsIntoListbox
		  
		  dim openThese() as integer
		  if bMaintainUIState Then
		    
		    For i1 as integer = 0 To lbItems.ListCount - 1
		      
		      If lbItems.RowIsFolder(i1) THen
		        
		        If sOpenFolders.IndexOf(lbItems.Cell(i1,0) ) <> -1 Then
		          openThese.Append(i1)
		        End If
		      End If
		    Next
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue(row as integer, column as integer)
		  dim oRowTag as lbRowTag
		  dim otblObject as DataFile.tbl_inventory
		  
		  oRowTag = lbItems.RowTag(row)
		  otblObject = oRowTag.vtblRecord
		  
		  dim s1 as string = lbItems.Cell(row,column)
		  dim v1 as Variant
		  If InStr( sFieldNames(column),"_cost") <> 0 Then
		    Break
		    s1 = ConvertDollarString_To_CentsString(s1)
		    v1 = val(s1)
		  Else
		    v1 = s1
		  End If
		  
		  otblObject.ChangeMySavedValue( sFieldNames(column), v1 )
		  
		  oRowTag.pkid = otblObject.ipkid
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		iColumnTypes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		IncreaseQuantityValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		oItems As cInventory
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeaders() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events lbItems
	#tag Event
		Sub Open()
		  dim s1, s2() as string
		  
		  me.ColumnCount = 12
		  
		  For i1 as integer = 0 To me.ColumnCount - 1
		    me.ColumnType(i1) = 3
		  Next
		  
		  // Set header names
		  s1 = "Name,Manufacturer,Model,Department,Category,SubCat,Description,Type,Qty,Price,Owner,Taxable"
		  s2 = Split(s1,",")
		  sHeaders = s2
		  me.Heading = s2
		  
		  // Set Field Names 
		  s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,item_type,item_quantity,item_price_cost,item_owner,item_taxable"
		  s2 = Split(s1,",")
		  sFieldNames = s2
		  
		  dim n1,n2() as integer
		  n2 = Array(3,3,3,3,3,3,3,3,1,3,3,3)
		  iColumnTypes = n2
		  me.ColumnType = n2
		  
		  
		  LoadItemsIntoListbox
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row as integer, column as integer)
		  
		  If Not lbItems.RowIsFolder(row) Then
		    SaveValue(row,column)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  dim oRowTag as lbRowTag
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    If lbItems.RowIsFolder(lbItems.ListIndex) Then
		      ' This row is a folder
		      
		    Else 
		      ' This row is not a folder
		      
		      // Enable controls
		      bDeleteItem.Enabled = True
		      bIncreaseQuantity.Enabled = True
		      
		      // Aquire the rowtag of said row
		      oRowTag = lbItems.RowTag(lbItems.ListIndex)
		      
		      // Pull the tbl_inventory object out of the rowtag
		      dim otblObject as DataFile.tbl_inventory
		      otblObject = oRowTag.vtblRecord
		      
		      // Fill the labels
		      contItemInfo.LoadLabels(otblObject )
		      
		    End If
		    
		  Else
		    
		    bDeleteItem.Enabled = False
		    bIncreaseQuantity.Enabled = False
		    
		    contItemInfo.LoadLabels()
		    
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g as Graphics,row as integer, column as integer) As Boolean
		  
		  If row Mod 2 = 0 Then
		    g.ForeColor = UiColors.ListboxRowEven
		  Else
		    g.ForeColor = UiColors.ListboxRowOdd
		  End If
		  
		  g.FillRect(0,0,g.Width,g.Height)
		End Function
	#tag EndEvent
	#tag Event
		Sub ExpandRow(Row as integer)
		  Dim oFolderRowTag as lbRowTag
		  
		  // Grab the rowtag of the folder
		  oFolderRowTag = lbItems.RowTag(row)
		  
		  // Loop through each child
		  For i1 as integer = 0 To oFolderRowTag.aroChildren.Ubound
		    
		    Dim oCurrRowTag as lbRowTag
		    oCurrRowTag = oFolderRowTag.aroChildren(i1)
		    
		    dim rowvalues() as string
		    
		    
		    for i2 as integer = 0 To oCurrRowTag.vColumnValues.Ubound
		      
		      rowvalues.Append( str(oCurrRowTag.vColumnValues(i2)))
		      
		    Next
		    
		    lbItems.AddRow(rowvalues)
		    lbItems.RowTag(lbItems.LastIndex) = oCurrRowTag
		    
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  dim iListIndex as integer
		  
		  
		  iListIndex = lbItems.ListIndex
		  
		  If iListIndex <> -1 Then
		    
		    If Not lbItems.RowIsFolder(iListIndex) Then
		      dim iPKID as int64
		      dim oRowTag as lbRowTag
		      
		      oRowTag = lbItems.RowTag(iListIndex)
		      If oRowTag <> Nil Then
		        iPKID = oRowTag.pkid
		      End If
		      
		      dim contExpanded as New ContainerInventoryExpanded(self,iPKID)
		      
		      dim wWindow as new Window2
		      wWindow.Top = MouseY
		      wWindow.Left = MouseX
		      contExpanded.EmbedWithin(wWindow,0,20)
		      
		      
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  base.Append( New MenuItem("Individual Items") )
		  base.Append( New MenuItem("Details") )
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  
		  dim iListIndex as integer
		  iListIndex = lbItems.ListIndex
		  
		  Select Case hitItem.Text 
		  Case "Individual Items"
		    
		    If iListIndex <> -1 Then
		      
		      If Not lbItems.RowIsFolder(iListIndex) Then
		        dim iPKID as int64
		        dim oRowTag as lbRowTag
		        
		        oRowTag = lbItems.RowTag(iListIndex)
		        If oRowTag <> Nil Then
		          iPKID = oRowTag.pkid
		        End If
		        
		        dim contExpanded as New ContainerInventoryExpanded(self,iPKID)
		        
		        dim wWindow as new Window2
		        wWindow.Top = MouseY
		        wWindow.Left = MouseX
		        contExpanded.EmbedWithin(wWindow,0,20)
		        
		        
		      End If
		    End If
		    
		  Case "Details"
		    
		    If iListIndex <> -1 Then
		      
		      If Not lbItems.RowIsFolder(iListIndex) Then
		        dim iPKID as int64
		        dim oRowTag as lbRowTag
		        
		        oRowTag = lbItems.RowTag(iListIndex)
		        If oRowTag <> Nil Then
		          iPKID = oRowTag.pkid
		        End If
		        
		        dim contItem as New contInventoryItem(oRowTag.vtblRecord)
		        
		        dim tbPanel as TabPanel = app.MainWindow.tbMainWindow
		        tbPanel.Append("Details")
		        dim n1 as integer = tbPanel.PanelCount - 1
		        
		        contItem.EmbedWithinPanel(tbPanel,n1,0,20)
		        
		      End If
		    End If
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events bAddItem
	#tag Event
		Sub Action()
		  
		  AddItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bRefresh
	#tag Event
		Sub Action()
		  
		  RefreshInventory(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bDeleteItem
	#tag Event
		Sub Action()
		  
		  If lbItems.ListIndex <> -1 then
		    
		    If lbItems.RowIsFolder(lbItems.ListIndex) Then
		      'This is an entire department
		      
		    Else
		      'This is not an entire department
		      
		      dim oRowTag as lbRowTag = lbItems.RowTag(lbItems.ListIndex)
		      
		      DeleteItem(oRowTag,lbItems.Cell(lbItems.ListIndex,0) )
		      
		    End If
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events contItemInfo
	#tag Event
		Sub Open()
		  
		  me.sHeaders() = sHeaders
		  me.sFieldNames() = sFieldNames
		  me.LoadLabels
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bIncreaseQuantity
	#tag Event
		Sub Action()
		  
		  If lbItems.ListIndex <> -1 then
		    
		    dim iListIndex as integer = lbItems.ListIndex
		    
		    // Grab the RowTag
		    dim oRowTag as lbRowTag = lbItems.RowTag(iListIndex)
		    
		    // Extract the record
		    dim oRecordOriginal as DataFile.tbl_inventory
		    oRecordOriginal = oRowTag.vtblRecord
		    
		    // Pull the pkid from the Record
		    dim iThePKID as Int64 = oRecordOriginal.ipkid
		    ' And put it into a more easily accessable place...the row tag
		    oRowTag.pkid = iThePKID
		    
		    If iThePKID <> 0 Then
		      
		      dim oSpecifiedAmount as integer
		      
		      If oSpecifiedAmount = 0 Then
		        oSpecifiedAmount = 1
		      End If
		      
		      // Increase the quantity
		      Methods.IncreaseQuantity(iThePKID,oSpecifiedAmount)
		      
		      // Reload the row
		      dim oRecord as DataFile.tbl_inventory = DataFile.tbl_inventory.FindByID(iThePKID)
		      dim iRecordIndex as integer = lbItems.FindByPKID(iThePKID)
		      LoadRow(iRecordIndex,oRecord)
		      
		    Else
		      Break
		    End If
		    
		    
		  End If
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
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
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
		Name="IncreaseQuantityValue"
		Group="Behavior"
		Type="Integer"
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
