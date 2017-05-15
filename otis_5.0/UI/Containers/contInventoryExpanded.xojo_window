#tag Window
Begin ContainerControl contInventoryExpanded
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &c40004000
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   190
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
   Width           =   360
   Begin entListbox lbItems
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFF00FF
      Backdrop        =   0
      CellBackColor   =   &cFFFF00FF
      Enabled         =   True
      EraseBackground =   True
      GridLinesColor  =   &c00000000
      HasBackColor    =   False
      HasHeading      =   True
      Height          =   181
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   6
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   5
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   349
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub BuildRowTag(ByRef oRowTag as lbRowTag,iFolderLevel as integer = 0)
		  dim sRowType as string
		  dim oItem as DataFile.tbl_inventory
		  
		  
		  sRowType = oRowTag.sRowType
		  
		  Select Case sRowType
		  Case ""
		    
		  Case "GroupFolder"
		    
		    // Set Cell types and field names
		    oRowTag.iCellTypes() = dictCellTypes.Value(sRowType)
		    oRowTag.sFieldNames() = dictFieldNames.Value(sRowType)
		    oRowTag.isFolder = True
		    
		    // Set the Folder Level
		    oRowTag.iFolderLevel = 0
		    
		    // Set the pkid
		    oRowTag.pkid = 0
		    
		  Case "GrandParent"
		    
		    // Set Cell types and field names
		    oRowTag.iCellTypes() = dictCellTypes.Value(sRowType)
		    oRowTag.sFieldNames() = dictFieldNames.Value(sRowType)
		    
		    // Set the Folder Level
		    oRowTag.iFolderLevel = 1
		    
		    // Extract tablerecord
		    oItem = oRowTag.vtblRecord
		    
		    // Set the pkid
		    oRowTag.pkid = oItem.ipkid
		    
		    // Pull the field values our of the record
		    dim jsFieldValues as JSONItem
		    jsFieldValues = oItem.GetMyFieldValues(True)
		    
		    // Extract keys out of JSONItem
		    dim sKeys() as string
		    sKeys = jsFieldValues.Names
		    
		    // Determine Column Values
		    For Each sFieldName as string In oRowTag.sFieldNames()
		      dim sField as string = sFieldName
		      
		      // Check if the field name exists as a key in the json item to avoid KeyNotFoundException
		      dim n1 as integer
		      n1 = sKeys.IndexOf(sField)
		      If n1 <> -1 Then
		        'the key exists
		        
		        dim sRawValue as String
		        sRawValue = jsFieldValues.Value(sField)
		        
		        // Format the value
		        dim sFormattedValue as String
		        If sField.InStr("_cost") <> 0 Then
		          sFormattedValue = ConvertCentsString_To_DollarString(sRawValue)
		        Else 
		          sFormattedValue = sRawValue
		        End If
		        
		        // Append the formatted value to the rowtag
		        oRowTag.vColumnValues.Append(sFormattedValue)
		        
		      End If
		      
		    Next
		    
		    // Check for children 
		    
		    // Grab the children from inventory
		    ' we get it grouped by the rowtype
		    dim dictLinkChildren as Dictionary
		    dim sCondition,sOrder as string
		    sCondition = "fkinventory_parent = " + oRowTag.pkid.ToText
		    sOrder = "link_type"
		    dictLinkChildren = DataFile.tbl_inventory_link.ListGrouped(sCondition,sOrder)
		    
		    // Extract the varient keys from dictionary
		    dim vSubSetNames() as Variant
		    vSubSetNames() = dictLinkChildren.Keys
		    
		    // Loop through each Subset of linked items
		    For Each vSubSetName as Variant In vSubSetNames()
		      
		      // Convert the subset name to string
		      dim sSubSetName as string
		      sSubSetName = str(vSubSetName)
		      
		      // Pull the records from the current subset
		      dim oLinkRecords() as DataFile.tbl_inventory_link
		      oLinkRecords() = dictLinkChildren.Value(vSubSetName)
		      
		      // Create a rowtag for this subset folder
		      dim oSubSetRowTag as New lbRowTag
		      oSubSetRowTag.iFolderLevel = oRowTag.iFolderLevel + 1
		      oSubSetRowTag.sRowType = "LinkingTypeFolder"
		      oSubSetRowTag.sSubRowType = sSubSetName
		      oSubSetRowTag.vtblRecord = oRowTag.vtblRecord
		      oSubSetRowTag.vColumnValues.Append(sSubSetName)
		      
		      // Loop through each child listed in the array
		      For Each oLinkRecord as DataFile.tbl_inventory_link In oLinkRecords()
		        
		        // Create a rowtag for this link record
		        dim oChildRowTag as new lbRowTag
		        oChildRowTag.iFolderLevel = oSubSetRowTag.iFolderLevel + 1
		        oChildRowTag.sRowType = "LinkedItem"
		        oChildRowTag.sSubRowType = sSubSetName
		        oChildRowTag.vLinkTable = oLinkRecord
		        
		        // Finish building the child rowtag
		        BuildRowTag(oChildRowTag)
		        
		        // Append the child to the sub set rowtag
		        oSubSetRowTag.aroChildren.Append(oChildRowTag)
		        
		      Next
		      
		      // FInish building the subset rowtag
		      BuildRowTag(oSubSetRowTag)
		      
		      // append the subset rowtag to the children array of the parent rowtag
		      oRowTag.aroChildren.Append(oSubSetRowTag)
		      
		    Next
		    
		    // Check if we need to make this row a folder
		    If oRowTag.aroChildren.Ubound <> -1 Then
		      oRowTag.isFolder = True
		    End If
		    
		  Case "LinkingTypeFolder"
		    
		    oRowTag.iCellTypes = dictCellTypes.value(sRowType)
		    oRowTag.pkid = 0
		    oRowTag.sFieldNames() = dictFieldNames.Value(sRowType)
		    oRowTag.isFolder = True
		    
		    
		  Case "LinkedItem"
		    
		    // Extract the link table record
		    dim oLinkItem as DataFile.tbl_inventory_link
		    oLinkItem = oRowTag.vLinkTable
		    
		    sRowType = sRowType + " - " + oLinkItem.slink_type
		    
		    // Set Cell types and field names
		    oRowTag.iCellTypes() = dictCellTypes.Value(sRowType)
		    oRowTag.sFieldNames() = dictFieldNames.Value(sRowType)
		    
		    // Extract tablerecord from database
		    oItem = DataFile.tbl_inventory.FindByID(oLinkItem.ifkinventory_child)
		    oRowTag.vtblRecord = oItem
		    
		    // Set the pkid
		    oRowTag.pkid = oItem.ipkid
		    
		    // Pull the field values our of the record
		    dim jsFieldValues as JSONItem
		    jsFieldValues = oItem.GetMyFieldValues(True)
		    dim jsLinkFieldValues as JSONItem
		    jsLinkFieldValues = oLinkItem.GetMyFieldValues(True)
		    
		    // Extract keys out of JSONItem
		    dim sKeys() as string
		    sKeys = jsFieldValues.Names
		    dim sLinkKeys() as string
		    sLinkKeys = jsLinkFieldValues.Names
		    
		    // Determine Column Values
		    For Each sFieldName as string In oRowTag.sFieldNames()
		      dim sField as string = sFieldName
		      dim sTable as string
		      
		      // Split the sFieldName into sField and sTable
		      dim n2 as integer
		      n2 = InStr(sField,".-.")
		      If n2 <> 0 Then
		        sTable = Left(sField,n2 - 1)
		        sField = Mid(sField,n2 + 3)
		      End If
		      
		      // Check which table it is apart of
		      dim sRawValue as String
		      Select Case sTable
		      Case "tbl_inventory_link"
		        If sLinkKeys.IndexOf(sField) <> -1 Then
		          sRawValue = jsLinkFieldValues.Value(sField)
		        End If
		      Case ""
		        If sKeys.IndexOf(sField) <> -1 Then
		          sRawValue = jsFieldValues.Value(sField)
		        End If
		      End Select
		      
		      // Format the value
		      dim sFormattedValue as String
		      If sField.InStr("_cost") <> 0 Then
		        sFormattedValue = ConvertCentsString_To_DollarString(sRawValue)
		      Else 
		        sFormattedValue = sRawValue
		      End If
		      
		      // Append the formatted value to the rowtag
		      oRowTag.vColumnValues.Append(sFormattedValue)
		      
		      
		    Next
		    
		    // Check for children 
		    
		    // Grab the children from inventory
		    ' we get it grouped by the rowtype
		    dim dictLinkChildren as Dictionary
		    dim sCondition,sOrder as string
		    sCondition = "fkinventory_parent = " + oRowTag.pkid.ToText
		    sOrder = "link_type"
		    dictLinkChildren = DataFile.tbl_inventory_link.ListGrouped(sCondition,sOrder)
		    
		    // Extract the varient keys from dictionary
		    dim vSubSetNames() as Variant
		    vSubSetNames() = dictLinkChildren.Keys
		    
		    // Loop through each Subset of linked items
		    For Each vSubSetName as Variant In vSubSetNames()
		      
		      // Convert the subset name to string
		      dim sSubSetName as string
		      sSubSetName = str(vSubSetName)
		      
		      // Pull the records from the current subset
		      dim oLinkRecords() as DataFile.tbl_inventory_link
		      oLinkRecords() = dictLinkChildren.Value(vSubSetName)
		      
		      // Create a rowtag for this subset folder
		      dim oSubSetRowTag as New lbRowTag
		      oSubSetRowTag.iFolderLevel = oRowTag.iFolderLevel + 1
		      oSubSetRowTag.sRowType = "LinkingTypeFolder"
		      oSubSetRowTag.sSubRowType = sSubSetName
		      oSubSetRowTag.vtblRecord = oRowTag.vtblRecord
		      oSubSetRowTag.vColumnValues.Append(sSubSetName)
		      
		      // Loop through each child listed in the array
		      For Each oLinkRecord as DataFile.tbl_inventory_link In oLinkRecords()
		        
		        // Set the Parent inventory item as folder
		        oRowTag.isFolder = True
		        
		        // Create a rowtag for this link record
		        dim oChildRowTag as new lbRowTag
		        oChildRowTag.iFolderLevel = oSubSetRowTag.iFolderLevel + 1
		        oChildRowTag.sRowType = "LinkedItem"
		        oChildRowTag.sSubRowType = sSubSetName
		        oChildRowTag.vLinkTable = oLinkRecord
		        
		        // Finish building the child rowtag
		        BuildRowTag(oChildRowTag)
		        
		        // Append the child to the sub set rowtag
		        oSubSetRowTag.aroChildren.Append(oChildRowTag)
		        
		      Next
		      
		      // FInish building the subset rowtag
		      BuildRowTag(oSubSetRowTag)
		      
		      // append the subset rowtag to the children array of the parent rowtag
		      oRowTag.aroChildren.Append(oSubSetRowTag)
		      
		    Next
		    
		    // Check if we need to make this row a folder
		    If oRowTag.aroChildren.Ubound <> -1 Then
		      oRowTag.isFolder = True
		    End If
		    
		  End Select
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleExpandRow(row as integer)
		  
		  
		  // Extract the rowtag out of the parent
		  dim oParentRowTag as lbRowTag
		  oParentRowTag = lbItems.RowTag(row)
		  
		  // Grab all the children
		  dim aroChildrenRowTag() as lbRowTag
		  aroChildrenRowTag() = oParentRowTag.aroChildren
		  
		  For Each oChild as lbRowTag In aroChildrenRowTag
		    
		    // Add a row
		    lbItems.AddRow("")
		    
		    // Load the rowtag into the row
		    lbItems.RowTag(lbItems.LastIndex) = oChild
		    
		    // Load the row
		    LoadRow(lbItems.LastIndex,oChild)
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadItems(fkInventory as int64)
		  
		  // Delete all the rows in the listbox
		  lbItems.DeleteAllRows
		  
		  // Put the inventory parent id into a parameter
		  ifkinventory_parent = fkInventory
		  
		  // Pull the item from the database
		  dim oItem as DataFile.tbl_inventory
		  oItem = DataFile.tbl_inventory.FindByID(fkInventory)
		  
		  // Start creating a rowtag for it
		  dim oParentRowTag as New lbRowTag
		  oParentRowTag.sRowType = "GrandParent"
		  oParentRowTag.iFolderLevel = -1
		  oParentRowTag.vtblRecord = oItem
		  
		  // Finish building the rowtag
		  BuildRowTag(oParentRowTag)
		  
		  // Loop through each child of the parent
		  For Each oChild as lbRowTag In oParentRowTag.aroChildren()
		    
		    lbItems.AddRow("")
		    LoadRow(lbItems.LastIndex,oChild)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(RowIndex as integer, oRowTag as lbRowTag)
		  
		  
		  
		  
		  dim i1 as integer 
		  For Each vValue as Variant In oRowTag.vColumnValues
		    
		    lbItems.CellType(RowIndex,i1) = oRowTag.iCellTypes(i1)
		    
		    Select Case lbItems.CellType(RowIndex,i1)
		    Case 0 'default
		      lbItems.Cell(RowIndex,i1) = vValue
		    Case 1 'text
		      lbItems.Cell(RowIndex,i1) = vValue
		    Case 2 'CheckBox
		      If vValue = True then
		        lbItems.CellState(RowIndex,i1) = CheckBox.CheckedStates.Checked
		      Else
		        lbItems.CellState(RowIndex,i1) = CheckBox.CheckedStates.Unchecked
		      End If
		    Case 3 'edit text
		      lbItems.Cell(RowIndex,i1) = vValue
		    Else
		      lbItems.Cell(RowIndex,i1) = vValue
		    End Select
		    
		    
		    i1 = i1 + 1
		  Next
		  
		  lbItems.RowTag(RowIndex) = oRowTag
		  
		  // Make it a folder if neccessary
		  If oRowTag.isFolder Then
		    lbItems.RowisFolder(RowIndex) = True
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AfterDelete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event entConstructContextualMenu(base as MenuItem, x as integer, y as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event entContextualMenuAction(hititem as MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetColumnInformation(lbItems as entListbox, ByRef dictCellTypes as Dictionary, ByRef dictFieldNames as Dictionary)
	#tag EndHook


	#tag Property, Flags = &h0
		dictCellTypes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dictFieldNames As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ifkinventory_parent As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeaders() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events lbItems
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
		  HandleExpandRow(row)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  SetColumnInformation(lbItems,dictCellTypes,dictFieldNames)
		End Sub
	#tag EndEvent
	#tag Event
		Function entConstructContextualMenu(base as menuitem, x as integer, y as integer) As Boolean
		  
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = lbItems.RowTag(lbItems.ListIndex)
		    
		    If oRowTag.vtblRecord <> Nil Then
		      
		      base.Append( New MenuItem("Open") )
		      base.Append( New MenuItem( MenuItem.TextSeparator) )
		      If entConstructContextualMenu(base,x,y) Then
		      End If
		      'base.Append( New MenuItem("Push Values") )
		      base.Append( New MenuItem(MenuItem.TextSeparator) )
		      base.Append( New MenuItem("Break Link") )
		      base.Append( New MenuItem("Delete Item") )
		      
		    End If
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function entContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  
		  Select Case hitItem.Text
		  Case "Open"
		    
		    If lbItems.ListIndex <> -1 Then
		      
		      // Grab the rowtag
		      dim oRowTag as lbRowTag
		      oRowTag = lbItems.RowTag(lbItems.ListIndex)
		      
		      // Get the item name
		      dim oRecord as DataFile.tbl_inventory
		      oRecord = oRowTag.vtblRecord
		      dim sItemName as string
		      sItemName = oRecord.sitem_name
		      
		      If oRowTag.pkid <> 0 Then
		        
		        // load up a inventory item container
		        dim conItem as New contInventoryItem
		        dim oTabPanel as PagePanel = app.MainWindow.tbMainWindow
		        
		        app.MainWindow.AddTab(sItemName)
		        
		        conItem.EmbedWithinPanel(oTabPanel,oTabPanel.PanelCount - 1 )
		        
		        conItem.LoadItem(oRowTag.pkid)
		      End If
		    End If
		    
		  Case "Push Values"
		    
		    If entContextualMenuAction(hititem) Then
		    End If
		    
		    
		  Case "Break Link"
		    
		    dim oRowTags() as lbRowTag
		    oRowTags = lbItems.GetSelectedRows
		    
		    For  Each oRowTag as lbRowTag In oRowTags()
		      
		      If oRowTag.vLinkTable <> Nil Then
		        
		        dim oItemRecord as DataFile.tbl_inventory
		        oItemRecord = oRowTag.vtblRecord
		        dim oLinkRecord as DataFile.tbl_inventory_link
		        oLinkRecord = oRowTag.vLinkTable
		        
		        Select Case MsgBox("Are you sure you want to break the link to the item: " + oItemRecord.sitem_name + "?",4)
		        Case 6 ' yes pressed
		          
		        Case 7 ' No pressed
		          Return False
		        End Select
		        
		        oLinkRecord.Delete
		        
		        Methods.UpdateItemQuantity(ifkinventory_parent)
		        
		        AfterDelete
		        
		      End If
		      
		    Next
		    
		  Case "Delete Item"
		    
		    dim oRowTags() as lbRowTag
		    oRowTags = lbItems.GetSelectedRows
		    
		    For  Each oRowTag as lbRowTag In oRowTags()
		      
		      
		      If oRowTag.vtblRecord <> Nil Then
		        
		        dim oItemRecord as DataFile.tbl_inventory
		        oItemRecord = oRowTag.vtblRecord
		        dim oLinkRecord as DataFile.tbl_inventory_link
		        oLinkRecord = oRowTag.vLinkTable
		        
		        Select Case MsgBox("Are you sure you want to delete the item: " + oItemRecord.sitem_name + "?",4)
		        Case 6 ' yes pressed
		          
		        Case 7 ' No pressed
		          Return False
		        End Select
		        
		        oLinkRecord.Delete
		        
		        
		        
		        oItemRecord.Delete
		        
		        Methods.UpdateItemQuantity(ifkinventory_parent)
		        
		        AfterDelete
		        
		      End If
		      
		    Next
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row as integer, column as integer)
		  
		  If lbItems.CellType(row,column) = 2 Then
		    'its a checkbox
		    
		    // Get the state of the checkbox
		    dim CheckBoxState as CheckBox.CheckedStates
		    CheckBoxState = lbItems.CellState(row,column)
		    
		    // Pull the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = lbItems.RowTag(row)
		    
		    // Check if there is a record here
		    If oRowTag.vtblRecord <> Nil Then
		      
		      dim oRecord as DataFile.tbl_inventory
		      oRecord = oRowTag.vtblRecord
		      
		      dim bValue as Boolean
		      Select Case CheckBoxState
		      Case CheckBox.CheckedStates.Checked
		        bValue = True
		      Else
		        bValue = False
		      End Select
		      
		      oRecord.ChangeMySavedValue(oRowTag.sFieldNames(column),bValue)
		      
		    End If
		    
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellLostFocus(row as integer, col as integer)
		  
		  If lbItems.CellType(row,col) = 3 Then
		    ' its a text edit
		    
		    
		    
		    // Pull the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = lbItems.RowTag(row)
		    
		    dim sFieldName as string
		    dim sTableName as string
		    dim n2 as integer
		    dim s3 as string
		    s3 = oRowTag.sFieldNames(col)
		    n2 = s3.InStr(".-.")
		    if n2 <> 0 Then
		      sTableName = Left(s3,n2 - 1)
		      n2 = n2 + 3
		    Else
		      sTableName = ""
		    End If
		    sFieldName = Mid(s3,n2)
		    
		    dim v1 as Variant
		    
		    Select Case sTableName
		    Case ""
		      
		      // Check if there is a record here
		      If oRowTag.vtblRecord <> Nil Then
		        
		        dim oRecord as DataFile.tbl_inventory
		        oRecord = oRowTag.vtblRecord
		        
		        dim vValue as Variant
		        vValue = lbItems.cell(row,col)
		        
		        dim jsFieldValues as JSONItem
		        
		        jsFieldValues = oRecord.GetMyFieldValues(True)
		        
		        // Pull the keys out of the json item
		        dim sKeys() as string
		        sKeys = jsFieldValues.Names
		        
		        v1 = jsFieldValues.Value(sFieldName)
		        
		        dim n1 as integer
		        n1 = VarType(v1)
		        Select Case n1
		        Case 2 'int32
		          vValue = val(vValue)
		        Case 3 'int64
		          vValue = val(vValue)
		        Case 8 'string
		        Case 37 'text
		        End Select
		        
		        oRecord.ChangeMySavedValue(sFieldName,vValue)
		        
		      End If
		      
		    Case "tbl_inventory_link"
		      
		      // Check if there is a record here
		      If oRowTag.vLinkTable <> Nil Then
		        
		        dim oRecord as DataFile.tbl_inventory_link
		        oRecord = oRowTag.vLinkTable
		        
		        dim vValue as Variant
		        vValue = lbItems.cell(row,col)
		        
		        dim jsFieldValues as JSONItem
		        
		        jsFieldValues = oRecord.GetMyFieldValues(True)
		        
		        // Pull the keys out of the json item
		        dim sLinkKeys() as string
		        sLinkKeys = jsFieldValues.Names
		        
		        v1 = jsFieldValues.Value(sFieldName)
		        
		        dim n1 as integer
		        n1 = VarType(v1)
		        Select Case n1
		        Case 2 'int32
		          vValue = val(vValue)
		        Case 3 'int64
		          vValue = val(vValue)
		        Case 8 'string
		        Case 37 'text
		        End Select
		        
		        oRecord.ChangeMySavedValue(sFieldName,vValue)
		        
		      End If
		    End Select
		    
		    
		    
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
		Name="ifkinventory_parent"
		Group="Behavior"
		Type="Int64"
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
