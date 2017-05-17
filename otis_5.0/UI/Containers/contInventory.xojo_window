#tag Window
Begin ContainerControl contInventory
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   440
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
      BackColor       =   &cFFFF00FF
      Backdrop        =   0
      CellBackColor   =   &cFFFF00FF
      Enabled         =   True
      EraseBackground =   True
      GridLinesColor  =   &c00000000
      HasBackColor    =   False
      HasHeading      =   True
      Height          =   415
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   24
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   700
   End
   Begin PushButton bAddItem
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Add Item"
      Default         =   False
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   80
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
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   81
   End
   Begin PushButton bRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Refresh"
      Default         =   True
      Enabled         =   True
      Height          =   24
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
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   81
   End
   Begin SearchControl scSearchInventory
      AutoDeactivate  =   True
      Enabled         =   True
      HasCancelButton =   False
      HasMenu         =   False
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   540
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacBorderStyle  =   0
      PlaceHolderText =   ""
      Scope           =   0
      SendSearchStringImmediately=   False
      SendWholeSearchString=   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      Top             =   2
      Visible         =   True
      Width           =   32
   End
   Begin CheckBox chbShowHidden
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show Hidden"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   437
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   2
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub BuildRowTag(ByRef oRowTag as lbRowTag, iFolderLevel as integer = 0)
		  dim sRowType as string
		  dim oItem as DataFile.tbl_inventory
		  
		  
		  sRowType = oRowTag.sRowType
		  
		  // Check if we want only the top level, grandparents
		  If bTopLevelOnly Then
		    
		    If sRowType = "GrandParent" Or sRowType = "GroupFolder" Then
		    Else
		      sRowType = ""
		    End If
		  End If
		  
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
		    
		    If Not bTopLevelOnly Then
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
		Sub CreateRowTags(vRecords as Dictionary)
		  // vRecords will either be 
		  // an array of ActiveRecordBase objects
		  //      or
		  // a Dictionary or grouped records
		  
		  // Check if vRecords is grouped or not
		  Select Case vRecords
		  Case IsA DataFile.ActiveRecordBase
		    //Problem!!! should be in other form of method
		    Return
		  Case IsA Dictionary
		    
		    
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRowTags(vRecords() as Variant)
		  // vRecords will either be 
		  // an array of ActiveRecordBase objects
		  //      or
		  // a Dictionary or grouped records
		  
		  // Check if vRecords is grouped or not
		  Select Case vRecords
		  Case IsA Dictionary
		    //Problem!!! should be in other form of method
		    Return
		  Case IsA DataFile.ActiveRecordBase
		    
		    // Loop through each record
		    For Each oRecord as DataFile.tbl_inventory In vRecords
		      
		      // Set up some basic things for the rowtag that we know already
		      dim oCurrentRowtag as New lbRowTag
		      'put the record we are on into the rowtag
		      oCurrentRowtag.vtblRecord = oRecord
		      
		      
		      // This shit needs to go into the build rowtag step so we can self reciprocate it
		      
		      
		      // Check to see if this record has any children
		      dim arLinkArray() as DataFile.tbl_inventory_link
		      dim arChildRecords() as DataFile.tbl_inventory
		      arLinkArray = DataFile.tbl_inventory_link.List( "fkinventory_parent = " + oRecord.ipkid )
		      
		      // Loop through each link child
		      If arLinkArray.Ubound <> -1 Then
		        For Each oLinkRecord as DataFile.tbl_inventory_link
		          
		          // Get the child record
		          dim oChild as DataFile.tbl_inventory = DataFile.tbl_inventory.FindByID( GetChildID(oLinkRecord) )
		          If oChild <> Nil Then
		            arChildRecords.Append(  oChild )
		          End If
		          
		          
		          
		        Next
		      End If
		      
		      
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroLevelRowTags(sConditionpar as string = "", sGroupByField as String = "item_department")
		  dim dictGroupedItems as Dictionary
		  
		  // Delete all rows in listbox
		  lbItems.DeleteAllRows
		  
		  // Grab the search value
		  dim sSearchValue as String
		  sSearchValue = scSearchInventory.Text
		  
		  // Get the inventory items from the database grouped by sGroupByField
		  dim sSearchCondition,sExcludeHiddenItemsCondition as String
		  dim sCondition,sOrder as String
		  
		  // Set up the search condition
		  If sSearchValue = "" Then
		    sSearchCondition = ""
		  Else
		    sSearchCondition = "item_name Like '%" + sSearchValue + "%'"
		  End If
		  
		  // Set up Hidden Condition
		  dim HiddenValue as Boolean
		  HiddenValue = chbShowHidden.Value
		  If HiddenValue Then
		    sExcludeHiddenItemsCondition = ""
		  Else
		    sExcludeHiddenItemsCondition = "(hide <> 1 Or hide Is Null)"
		  End If
		  
		  // Set up the condition
		  If sSearchCondition <> "" Then
		    sCondition = sSearchCondition
		    If sExcludeHiddenItemsCondition <> "" Then
		      sCondition = sCondition + " And "
		    End If
		  End If
		  If  sExcludeHiddenItemsCondition <> "" Then
		    sCondition = sCondition + sExcludeHiddenItemsCondition
		    If sConditionpar <> "" Then
		      sCondition = sCondition + " And " 
		    End If
		  End If 
		  If sConditionpar <> "" Then
		    sCondition = sCondition + sConditionpar
		  End If
		  sOrder = sGroupByField
		  dictGroupedItems = DataFile.tbl_inventory.ListGrouped(sCondition,sOrder,sGroupByField)
		  
		  // Pull the name of the groups into an array
		  dim sGroupNames() as String
		  For Each vGroupName as variant In dictGroupedItems.Keys
		    sGroupNames.Append(str(vGroupName))
		  Next
		  
		  // Loop through each group
		  For Each sGroupName as String In sGroupNames
		    
		    // Create a new row as a folder
		    lbItems.AddRow(sGroupName)
		    dim oGroupRowTag as New lbRowTag
		    oGroupRowTag.sRowType = "GroupFolder"
		    oGroupRowTag.vColumnValues.Append(sGroupName)
		    
		    // Extract the array of records in this group
		    dim oGroupItems() as DataFile.tbl_inventory
		    oGroupItems = dictGroupedItems.Value(sGroupName)
		    
		    // loop through the children and build their rowtags here
		    For Each oItem as DataFile.tbl_inventory In oGroupItems
		      
		      dim oChildRowTag as New lbRowTag
		      oChildRowTag.vtblRecord = oItem
		      oChildRowTag.sRowType = "GrandParent"
		      BuildRowTag(oChildRowTag,1)
		      
		      // Append the child rowtag to our parent
		      oGroupRowTag.aroChildren.Append(oChildRowTag)
		      
		    Next
		    
		    // Finish building the rowtag
		    BuildRowTag(oGroupRowTag)
		    
		    LoadRow(lbItems.LastIndex,oGroupRowTag)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandAllRows(JustTopLevel as Boolean = True)
		  
		  
		  // Loop through all the rows
		  dim i1 as integer
		  While i1 < lbItems.ListCount 
		    
		    dim oRowTag as lbRowTag
		    
		    // extract the rowtag
		    oRowTag = lbItems.RowTag(i1)
		    
		    // Chgeck if its a folder
		    If lbItems.RowIsFolder(i1) Then
		      
		      // Check if its a top level folder
		      Select Case oRowTag.iFolderLevel
		      Case 0 
		        lbItems.Expanded(i1) = True
		      Else
		        If Not JustTopLevel Then
		          lbItems.Expanded(i1) = True
		        End If
		      End Select
		      
		    End If
		    
		    i1 = i1 + 1
		    
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetChildID(vLinkTableRecord as Variant) As int64
		  dim vReturnArray() as Variant
		  
		  Select Case vTableRecord
		  Case IsA DataFile.tbl_inventory_link Then
		    dim oRecord as DataFile.tbl_inventory_link = vTableRecord
		    Return oRecord.ifkinventory_child
		    
		  Case IsA DataFile.tbl_events Then
		    
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRecordList() As Dictionary
		  dim dictGroupedItems as Dictionary
		  
		  // Delete all rows in listbox
		  lbItems.DeleteAllRows
		  
		  // Grab the search value
		  dim sSearchValue as String
		  sSearchValue = scSearchInventory.Text
		  
		  // Get the inventory items from the database grouped by sGroupByField
		  dim sSearchCondition,sExcludeHiddenItemsCondition as String
		  dim sCondition,sOrder as String
		  
		  // Set up the search condition
		  If sSearchValue = "" Then
		    sSearchCondition = ""
		  Else
		    sSearchCondition = "item_name Like '%" + sSearchValue + "%'"
		  End If
		  
		  // Set up Hidden Condition
		  dim HiddenValue as Boolean
		  HiddenValue = chbShowHidden.Value
		  If HiddenValue Then
		    sExcludeHiddenItemsCondition = ""
		  Else
		    sExcludeHiddenItemsCondition = "(hide <> 1 Or hide Is Null)"
		  End If
		  
		  // Set up the condition
		  If sSearchCondition <> "" Then
		    sCondition = sSearchCondition
		    If sExcludeHiddenItemsCondition <> "" Then
		      sCondition = sCondition + " And "
		    End If
		  End If
		  If  sExcludeHiddenItemsCondition <> "" Then
		    sCondition = sCondition + sExcludeHiddenItemsCondition
		    If sConditionpar <> "" Then
		      sCondition = sCondition + " And " 
		    End If
		  End If 
		  If sConditionpar <> "" Then
		    sCondition = sCondition + sConditionpar
		  End If
		  sOrder = sGroupByField
		  dictGroupedItems = DataFile.tbl_inventory.ListGrouped(sCondition,sOrder,sGroupByField)
		  
		  Return dictGroupedItems
		End Function
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
		Event entDoubleClick() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetColumnInformation(lbItems as entListbox, ByRef dictCellTypes as Dictionary, ByRef dictFieldNames as Dictionary)
	#tag EndHook


	#tag Property, Flags = &h0
		bTopLevelOnly As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		dictCellTypes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dictFieldNames As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		LastOpenFolders() As lbRowTag
	#tag EndProperty

	#tag Property, Flags = &h0
		LastSearchValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastUIState As lbUIState
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeaders() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events lbItems
	#tag Event
		Sub Open()
		  
		  
		  SetColumnInformation(lbItems,dictCellTypes,dictFieldNames)
		  
		  If dictFieldNames = Nil And dictCellTypes = Nil Then
		    
		    dim s1,s2() as string
		    
		    dim sRowType as string
		    
		    // Set Column Count
		    dim iColCount as integer = 10
		    lbItems.ColumnCount = iColCount
		    
		    // Initialize dictionaries
		    dictFieldNames = New Dictionary
		    dictCellTypes = New Dictionary
		    
		    // Set header names
		    s1 = "Name,Manufacturer,Model,Department,Category,SubCat,Description,Qty,Price,Owner"
		    s2() = Split(s1,",")
		    sHeaders = s2
		    lbItems.Heading = s2()
		    
		    
		    // **********
		    // Set up the cell types and field names for each type of row
		    
		    // Group Folders
		    sRowType = "GroupFolder"
		    'field names
		    dictFieldNames.Value(sRowType) = Array("")
		    
		    'cell types
		    dim iCellTypes() as integer
		    ReDim iCellTypes(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes
		    
		    
		    // GrandParent
		    sRowType = "GrandParent"
		    'field names
		    s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,item_quantity,item_rental_price_cost,item_owner"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes2() as integer
		    ReDim iCellTypes2(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes2
		    
		    
		    // Linking Type Folder
		    sRowType = "LinkingTypeFolder"
		    'field names
		    dictFieldNames.Value(sRowType) = Array("")
		    
		    'cell types
		    dim iCellTypes3() as integer
		    ReDim iCellTypes3(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes3
		    
		    
		    // LinkedItem - Version
		    sRowType = "LinkedItem - version"
		    'field names
		    s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,item_quantity,|SKIP|,item_owner"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes4() as integer = Array(0,0,0,0,0,0,0,3,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes4
		    
		    
		    // LinkedItem - Contained
		    sRowType = "LinkedItem - contained"
		    'field names
		    s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,tbl_inventory_link.-.quantity,|SKIP|,item_owner"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes5() as integer = Array(0,0,0,0,0,0,0,3,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes5
		    
		    // LinkedItem - Contained
		    sRowType = "LinkedItem - kit"
		    'field names
		    s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,tbl_inventory_link.-.quantity,|SKIP|,item_owner"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes6() as integer = Array(0,0,0,0,0,0,0,3,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes6
		    
		    // LinkedItem - Contained
		    sRowType = "LinkedItem - package"
		    'field names
		    s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,tbl_inventory_link.-.quantity,|SKIP|,item_owner"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes7() as integer = Array(0,0,0,0,0,0,0,3,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes7
		    
		  End If
		  
		  
		  
		  // Populate the listbox
		  CreateZeroLevelRowTags()'"hide <> 1 Or hide IS Null")
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
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
		  
		  HandleExpandRow(row)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  
		  If entDoubleClick Then
		    
		    // the event was handled and we do not want to do anything else
		    
		  Else
		    
		    
		    dim oRowTag as lbRowTag
		    
		    If lbItems.ListIndex <> -1 Then
		      
		      oRowTag = lbItems.RowTag(lbItems.ListIndex)
		      
		      If oRowTag.vtblRecord <> Nil Then
		        
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
		      
		    End If
		    
		    
		  End If
		End Sub
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
		        
		        Methods.UpdateItemQuantity(oLinkRecord.ifkinventory_parent)
		        
		        
		        
		        dim oOpenFolders() as lbRowTag
		        oOpenFolders = lbItems.GetOpenedFolders
		        CreateZeroLevelRowTags
		        lbItems.reopenFolders(oOpenFolders)
		        
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
		        If oRowTag.vLinkTable <> Nil Then
		          oLinkRecord = oRowTag.vLinkTable
		        End If
		        
		        Select Case MsgBox("Are you sure you want to delete the item: " + oItemRecord.sitem_name + "?",4)
		        Case 6 ' yes pressed
		          
		        Case 7 ' No pressed
		          Return False
		        End Select
		        
		        oItemRecord.Delete
		        
		        If oLinkRecord <> Nil Then
		          oLinkRecord.Delete
		          
		          Methods.UpdateItemQuantity(oLinkRecord.ifkinventory_parent)
		        End If
		        
		        
		        
		        
		        dim oOpenFolders() as lbRowTag
		        oOpenFolders = lbItems.GetOpenedFolders
		        CreateZeroLevelRowTags
		        lbItems.reopenFolders(oOpenFolders)
		        
		      End If
		      
		    Next
		    
		  Case "Maintenance Logs"
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = lbItems.RowTag(lbItems.ListIndex)
		    
		    dim oItem as DataFile.tbl_inventory
		    oItem = oRowTag.vtblRecord
		    
		    dim cont1 as New contMaintenenceLog
		    
		    app.MainWindow.AddTab("Maintenance Log")
		    
		    cont1.EmbedWithinPanel(app.MainWindow.tbMainWindow,app.MainWindow.tbMainWindow.PanelCount - 1)
		    cont1.LoadUniversalInfo(oItem.ipkid)
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function entConstructContextualMenu(base as menuitem, x as integer, y as integer) As Boolean
		  
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = lbItems.RowTag(lbItems.ListIndex)
		    
		    If oRowTag.vtblRecord <> Nil Then
		      
		      base.Append( New MenuItem("Open") )
		      base.Append( New MenuItem("Maintenance Logs") )
		      base.Append( New MenuItem(MenuItem.TextSeparator) )
		      
		      If oRowTag.vLinkTable <> Nil Then
		        base.Append( New MenuItem("Break Link") )
		      End If
		      
		      base.Append( New MenuItem("Delete Item") )
		      
		    End If
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events bAddItem
	#tag Event
		Sub Action()
		  
		  dim oNewItem as New DataFile.tbl_inventory
		  oNewItem.sitem_name = "-"
		  oNewItem.iitem_quantity = 0
		  
		  
		  dim NewCont as New contInventoryItem
		  
		  app.MainWindow.AddTab("New Item")
		  
		  NewCont.EmbedWithinPanel(app.MainWindow.tbMainWindow, app.MainWindow.tbMainWindow.PanelCount - 1)
		  
		  NewCont.LoadItem(oNewItem)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bRefresh
	#tag Event
		Sub Action()
		  
		  dim oUIState as lbUIState
		  oUIState = lbItems.GetUIState
		  CreateZeroLevelRowTags()'"hide <> 1 Or hide Is Null")
		  lbItems.ResetUIState(oUIState)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scSearchInventory
	#tag Event
		Sub Search()
		  dim sSearchValue as string
		  
		  sSearchValue = scSearchInventory.Text
		  
		  If len(sSearchValue) <> 0 Then
		    ' there is something to be searched
		    
		    // Check if there used is a previous search value
		    If len(LastSearchValue) = 0 Then
		      ' Nothing was last searched
		      
		      // Get UIState
		      dim oUIState as lbUIState
		      oUIState = lbItems.GetUIState
		      LastUIState = oUIState
		      
		      '// Get which folders are open and store them
		      'dim oOpenFolders() as lbRowTag
		      'oOpenFolders = lbItems.GetOpenedFolders
		      'LastOpenFolders = oOpenFolders
		      
		    End If
		    
		  End If
		  
		  // Populate listbox with filterd inventory
		  CreateZeroLevelRowTags
		  
		  
		  If len(sSearchValue) = 0 Then
		    ' There is nothing in the search field
		    
		    If len(LastSearchValue) <> 0 Then
		      ' there is a previous search value
		      
		      // Close all the folders by passing a nil array
		      dim nilarray() as lbRowTag
		      lbItems.reopenFolders(nilarray)
		      
		      If LastUIState <> Nil Then
		        lbItems.ResetUIState(LastUIState)
		        LastUIState = Nil 
		      Else
		        
		      End If
		      
		      'If LastOpenFolders.Ubound <> -1 Then
		      ' There are recored previously open folders
		      
		      'lbItems.reopenFolders(LastOpenFolders)
		      'Redim LastOpenFolders(-1)
		      
		      'End If
		      
		    End If
		    
		  Else
		    '  there is something in the search field
		    
		    // Open all the top level folders
		    ExpandAllRows(True)
		    
		    
		  End If
		  
		  
		  
		  
		  LastSearchValue = sSearchValue
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chbShowHidden
	#tag Event
		Sub Action()
		  
		  dim oUIState as lbUIState
		  oUIState = lbItems.GetUIState
		  CreateZeroLevelRowTags
		  lbItems.ResetUIState(oUIState)
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
		Name="bTopLevelOnly"
		Group="Behavior"
		Type="Boolean"
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
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LastSearchValue"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
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
