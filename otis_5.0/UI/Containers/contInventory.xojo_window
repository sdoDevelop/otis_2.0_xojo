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
      Left            =   134
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
      Width           =   563
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
      Top             =   53
      Underline       =   False
      Visible         =   True
      Width           =   131
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
      Top             =   24
      Underline       =   False
      Visible         =   True
      Width           =   131
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
      Top             =   82
      Underline       =   False
      Visible         =   True
      Width           =   131
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
      Top             =   111
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin PopupMenu pmPackageFilter
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   169
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin Label labTypeFilter
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Type Filter"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   151
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin SearchControl scSearchInventory
      AutoDeactivate  =   True
      Enabled         =   True
      HasCancelButton =   True
      HasMenu         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   536
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacBorderStyle  =   0
      PlaceHolderText =   ""
      Scope           =   0
      SendSearchStringImmediately=   False
      SendWholeSearchString=   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      Top             =   1
      Visible         =   True
      Width           =   160
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
		  oInventoryItem.Save
		  lbItems.InsertRow(0)
		  
		  LoadRow(0,oInventoryItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildRowTag(oRecord as Variant = Nil) As Variant
		  dim oRowTag as New lbRowTag
		  dim sFieldNames() as String
		  dim oKitRecord as DataFile.tbl_kits_packages
		  dim oItemRecord as DataFile.tbl_inventory
		  dim oChildInventoryRecord as DataFile.tbl_inventory
		  dim jsParentFieldValues, jsChildFieldValues as JSONItem
		  
		  
		  // Determine if this is a folder not attatched to a record
		  If oRecord = Nil Then
		    ' No record attached
		    
		    oRowTag.isFolder = True
		    
		  Else
		    ' A record is attached
		    
		    // Add the record to the rowtag
		    oRowTag.vtblRecord = oRecord
		    
		    // check what kind of record is attached
		    If oRecord IsA DataFile.tbl_inventory Then
		      
		      // Put the record into a variable
		      oItemRecord = oRecord
		      
		      // Add the pkid to the rowtag
		      oRowTag.pkid = oItemRecord.ipkid
		      
		      // Grab the correct field names
		      sFieldNames = sItemRow_FieldNames
		      
		      // Get the field value pairs as json from the reocrd
		      jsParentFieldValues = oItemRecord.GetMyFieldValues(True)
		      
		    ElseIf oRecord IsA DataFile.tbl_kits_packages Then
		      
		      // Put the record into a variable
		      oKitRecord = oRecord
		      
		      // Add the pkid to the rowtag
		      oRowTag.pkid = oKitRecord.ipkid
		      
		      // Grab the correct field names
		      sFieldNames = sKitItemRow_FieldNames
		      
		      // Grab the child inventory item related to this kit item
		      oChildInventoryRecord = DataFile.tbl_inventory.FindByID(oKitRecord.ifkinventory_child)
		      
		      // Get the field value pairs as json from the reocrds
		      jsParentFieldValues = oKitRecord.GetMyFieldValues(True)
		      jsChildFieldValues = oChildInventoryRecord.GetMyFieldValues(True)
		      
		    End If
		    
		    // Loop through each field name 
		    For i1 as integer = 0 To sFieldNames.Ubound
		      
		      // Put the current field name into a varialbe
		      dim sCurrentFieldName as String = sFieldNames(i1)
		      If sCurrentFieldName = "|SKIP|" Then
		        Continue
		      End If
		      
		      // Pull the keys out of each field value pairs
		      dim jsTheRecordFieldValues as JSONItem
		      dim sParentKeys(), sChildKeys() as String
		      sParentKeys = jsParentFieldValues.Names
		      If jsChildFieldValues <> Nil Then
		        sChildKeys = jsChildFieldValues.Names
		      End If
		      
		      // Check which Record has the field we need
		      If sParentKeys.IndexOf(sCurrentFieldName) <> -1 Then
		        ' Parent record has the field
		        jsTheRecordFieldValues = jsParentFieldValues
		      ElseIf sChildKeys.Ubound <> -1 Then
		        If sChildKeys.IndexOf(sCurrentFieldName) <> -1 Then
		          ' Child Record has the field
		          jsTheRecordFieldValues = jsChildFieldValues
		        End If
		      Else
		        ' Neither has our field 
		        dim err as new RuntimeException
		        err.Message = "No record has the field: " + sCurrentFieldName
		        raise err
		      End If
		      
		      // Format the value
		      dim s1 as string
		      s1 = jsTheRecordFieldValues.Value(sCurrentFieldName)
		      If sCurrentFieldName.InStr("_cost") <> 0 Then
		        s1 = ConvertCentsString_To_DollarString(s1)
		      ElseIf sCurrentFieldName = "|SKIP|" Then
		        s1 = ""
		      End If
		      
		      // Append to the column values
		      oRowTag.vColumnValues.Append(s1)
		      
		    Next
		    
		  End If
		  
		  
		  Return oRowTag
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
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
		Sub DeleteItem(iIndex as integer)
		  
		  If lbItems.ListIndex <> -1 then
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag = lbItems.RowTag(lbItems.ListIndex)
		    
		    If oRowTag.iFolderLevel = 0 Then
		      'This is an entire department
		      
		    Else
		      'This is not an entire department
		      
		      dim iPKID as integer
		      
		      If MsgBox("Are you sure you want to delete " + lbItems.Cell(iIndex,0), 4) = 6 Then
		        
		        If oRowTag.vtblRecord IsA DataFile.tbl_inventory Then
		          dim otblObject as DataFile.tbl_inventory = oRowTag.vtblRecord
		          
		          iPKID = oRowTag.pkid
		          
		          otblObject.Delete
		          
		        ElseIf oRowTag.vtblRecord IsA DataFile.tbl_kits_packages Then
		          dim otblObject as DataFile.tbl_kits_packages = oRowTag.vtblRecord
		          
		          iPKID = oRowTag.pkid
		          
		          otblObject.Delete
		          
		        End If
		        
		        dim n1 as integer = lbItems.FindByPKID(iPKID)
		        If  n1 <> -1 Then
		          lbItems.RemoveRow(n1)
		        End If
		        
		        
		        
		      End If
		      
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadItemsIntoListbox()
		  dim oItemDict as Dictionary
		  dim oFullItemList() as DataFile.tbl_inventory
		  
		  
		  // Delete all rows in listbox
		  lbItems.DeleteAllRows
		  
		  // Load the Grouped inventory 
		  'oItemDict = DataFile.tbl_inventory.ListGrouped("","item_department,item_name")
		  dim s1 as string
		  dim s2 as string =  pmPackageFilter.Text
		  Select Case s2
		  Case "All"
		    oItemDict = DataFile.tbl_inventory.ListGrouped("","item_department,item_name")
		  Case "Item"
		    s1 = "item_type = 'Item'"
		    oItemDict = DataFile.tbl_inventory.ListGrouped(s1,"item_department,item_name")
		  Case "Labor"
		    s1 = "item_type = 'Labor'"
		    oItemDict = DataFile.tbl_inventory.ListGrouped(s1,"item_department,item_name")
		  Case "Item Package"
		    s1 = "item_type = 'Item Package'"
		    oItemDict = DataFile.tbl_inventory.ListGrouped(s1,"item_department,item_name")
		  Case "Labor Package"
		    s1 = "item_type = 'Labor Package'"
		    oItemDict = DataFile.tbl_inventory.ListGrouped(s1,"item_department,item_name")
		  Else
		    oItemDict = DataFile.tbl_inventory.ListGrouped("","item_department,item_name")
		  End Select
		  
		  // Load the full inventory
		  oFullItemList() = DataFile.tbl_inventory.List()
		  
		  // Get all the group names from the group Dictionary
		  dim sGroupNames() as String
		  For Each key as Variant In oItemDict.Keys
		    sGroupNames.Append(str(key))
		  Next
		  
		  // Loop through groups
		  For Each sGroup as String In sGroupNames
		    
		    // Set up a folder rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = BuildRowTag
		    oRowTag.iFolderLevel = 0
		    
		    // Add the label for the folder
		    dim FolderValuesIndex as integer = oRowTag.sFolderValues.Ubound + 1
		    ReDim oRowTag.sFolderValues(FolderValuesIndex)
		    oRowTag.sFolderValues(FolderValuesIndex) = sGroup
		    
		    // Load the current group into a variable
		    dim oGroup() as DataFile.tbl_inventory
		    oGroup = oItemDict.Value(sGroup)
		    
		    // Loop through all records in group to make rowtags for each
		    For Each oRecord as DataFile.tbl_inventory In oGroup
		      
		      dim oRecordRowTag as lbRowTag
		      oRecordRowTag = BuildRowTag(oRecord)
		      oRecordRowTag.iFolderLevel = 1
		      
		      // Check if there are any kit items
		      dim n1 as integer
		      dim sCondition as string = "fkinventory_parent = " + oRecordRowTag.pkid.ToText
		      n1 = DataFile.tbl_kits_packages.ListCount(sCondition)
		      If n1 > 0 Then
		        ' There are kit items for this inventory item
		        
		        // Set the current item to a folder
		        oRecordRowTag.isFolder = True
		        
		        // Grab all of the kit items for this record
		        dim oKitRecords() as DataFile.tbl_kits_packages
		        oKitRecords() = DataFile.tbl_kits_packages.List(sCondition)
		        
		        // Loop through each oKitRecord
		        For each oKitRecord as DataFile.tbl_kits_packages In oKitRecords
		          
		          // Grab the pkid of the child kit item
		          dim kititempkid as int64
		          kititempkid = oKitRecord.ifkinventory_child
		          
		          // Get the kit item record
		          dim KitItemRecord as DataFile.tbl_inventory
		          KitItemRecord = DataFile.tbl_inventory.FindByID(kititempkid)
		          
		          // Create the rowtag
		          dim oKitRowTag as lbRowTag
		          oKitRowTag = BuildRowTag(oKitRecord)
		          oKitRowTag.iFolderLevel = 2
		          
		          // Append kit rowtag to children array of parent inventory item
		          oRecordRowTag.aroChildren.Append(oKitRowTag)
		          
		        Next
		        
		      End If
		      
		      // Append the Inventory item to the child array of the parent group
		      oRowTag.aroChildren.Append(oRecordRowTag)
		      
		    Next
		    
		    lbItems.AddFolder(oRowTag.sFolderValues(0))
		    lbItems.RowTag(lbItems.LastIndex) = oRowTag
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(row as integer, oRecord as DataFile.tbl_inventory)
		  
		  dim oRowTag as lbRowTag
		  oRowTag = BuildRowTag(oRecord)
		  
		  lbItems.RowTag(row) = oRowTag
		  
		  PopulateCells(row,oRowTag)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeTypePopup(x as integer, y as integer, isRowCol as Boolean = False)
		  dim row as integer
		  dim col as integer
		  
		  If Not isRowCol Then
		    row = lbItems.RowFromXY(x,y)
		    col = lbItems.ColumnFromXY(x,y)
		  Else
		    row = x
		    col = y
		  End If
		  
		  dim n1 aS Integer =  lbItems.CustomTypes(col)
		  Select Case n1
		  Case 1  'Type popup menu
		    
		    lbItems.ListIndex = row
		    lbItems.Selected(row) = True
		    
		    Dim base as New MenuItem
		    
		    dim s1() as string = InventoryTypes.Split(",")
		    For each sType as string In s1()
		      base.Append(New MenuItem(sType))
		    Next
		    'base.Append(New MenuItem("Item"))
		    'base.Append(New MenuItem("Labor"))
		    'base.Append(New MenuItem("Item Package"))
		    'base.Append(New MenuItem("Labor Package"))
		    
		    
		    Dim selectedMenu As MenuItem
		    dim xy() as integer = lbItems.CellPos(lbItems,row,col)
		    selectedMenu = base.PopUp(xy(0),xy(1))
		    
		    If selectedMenu <> Nil Then
		      
		      // Get the rowtag
		      dim oRowTag as lbRowTag
		      oRowTag = lbItems.RowTag(row)
		      dim oInventoryRecord as DataFile.tbl_inventory
		      
		      // Pull the record out of the rowtag
		      If oRowTag.vtblRecord IsA DataFile.tbl_inventory Then
		        dim oRecord as DataFile.tbl_inventory = oRowTag.vtblRecord
		        oInventoryRecord = oRecord
		        
		        // Change the value for type
		        oInventoryRecord.sitem_type = selectedMenu.Text
		        oInventoryRecord.save
		        
		        LoadRow(row,oInventoryRecord)
		        
		      ElseIf oRowTag.vtblRecord IsA DataFile.tbl_kits_packages Then
		        dim oRecord as DataFile.tbl_kits_packages = oRowTag.vtblRecord
		        
		        // Get the real inventory item
		        oInventoryRecord = DataFile.tbl_inventory.FindByID(oRecord.ifkinventory_child)
		        
		        // Change the value for type
		        oInventoryRecord.sitem_type = selectedMenu.Text
		        oInventoryRecord.save
		        
		        PopulateCells(row,BuildRowTag(oRecord))
		        
		      End If
		      
		    End If
		    
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateCells(row as integer, oRowTag as lbRowTag)
		  
		  // Populate cells
		  For i1 as integer = row To lbItems.ColumnCount - 1
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
		  
		  'oItems.LoadMe
		  LoadItemsIntoListbox
		  
		  dim openThese() as integer
		  if bMaintainUIState And lbItems.ListCount <> 0 Then
		    
		    'For i1 as integer = 0 To lbItems.ListCount - 1
		    dim iIndex as integer
		    While iIndex <> lbItems.listcount - 1 
		      dim i1 as integer = iIndex
		      If lbItems.RowIsFolder(i1) THen
		        
		        If sOpenFolders.IndexOf(lbItems.Cell(i1,0) ) <> -1 Then
		          lbItems.Expanded(i1) = True
		        End If
		      End If
		      iIndex = iIndex + 1
		    Wend
		    'Next
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue(row as integer, column as integer)
		  dim oRowTag as lbRowTag
		  dim jsFieldValues as JSONItem
		  dim sParentKeys(), sChildKeys() as String
		  dim sCurrentFieldName as String 
		  
		  
		  oRowTag = lbItems.RowTag(row)
		  
		  dim s1 as string = lbItems.Cell(row,column)
		  dim v1 as Variant
		  
		  
		  If oRowTag.vtblRecord IsA DataFile.tbl_inventory Then
		    dim otblObject as DataFile.tbl_inventory
		    otblObject = oRowTag.vtblRecord
		    
		    // Grab the names of the fields
		    jsFieldValues = otblObject.GetMyFieldValues(True)
		    sParentKeys() = jsFieldValues.Names
		    
		    // Formatting
		    sCurrentFieldName = sItemRow_FieldNames(column)
		    If sCurrentFieldName.InStr("_cost") <> 0 Then
		      s1 = ConvertDollarString_To_CentsString(s1)
		      v1 = s1
		    else 
		      v1 = s1
		    End If
		    
		    // Saving
		    otblObject.ChangeMySavedValue(sCurrentFieldName,v1)
		    
		    oRowTag.pkid = otblObject.ipkid
		    
		  ElseIf oRowTag.vtblRecord IsA DataFile.tbl_kits_packages Then
		    dim otblObject as DataFile.tbl_kits_packages
		    otblObject = oRowTag.vtblRecord
		    
		    // Get the child inventory item
		    dim oChildItem as DataFile.tbl_inventory
		    oChildItem = DataFile.tbl_inventory.FindByID(otblObject.ifkinventory_child)
		    
		    // Grab the names of the fields
		    jsFieldValues = otblObject.GetMyFieldValues(True)
		    sParentKeys() = jsFieldValues.Names
		    jsFieldValues = oChildItem.GetMyFieldValues(True)
		    sChildKeys() = jsFieldValues.Names
		    
		    // Formatting
		    sCurrentFieldName = sItemRow_FieldNames(column)
		    If sCurrentFieldName.InStr("_cost") <> 0 Then
		      s1 = ConvertDollarString_To_CentsString(s1)
		      v1 = s1
		    End If
		    
		    If sParentKeys.IndexOf(sCurrentFieldName) <> -1 Then
		      otblObject.ChangeMySavedValue(sCurrentFieldName,v1)
		    ElseIf sChildKeys.IndexOf(sCurrentFieldName) <> -1 Then
		      oChildItem.ChangeMySavedValue(sCurrentFieldName,v1)
		    End If
		    
		    oRowTag.pkid = otblObject.ipkid 
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchInventory(IncludeGroups as Boolean = False, IncludeKitItems as Boolean = False)
		  dim sSearchString as String
		  dim iSearchColumn as integer
		  
		  // Grab the search string from the search field
		  sSearchString = scSearchInventory.Text
		  
		  // Loop through the listbox
		  For i1 as integer = 0 To lbItems.ListCount - 1
		    
		    // Grab the rowtag from the current row if it is a folder
		    dim oGroupRowTag as lbRowTag
		    If lbItems.RowIsFolder(i1) Then
		      oGroupRowTag = lbItems.RowTag(i1)
		    Else
		      // We don't want to worry about non group rows yet
		      oGroupRowTag = Nil
		      Continue
		    End If
		    
		    // Check if this folder is a group folder
		    If oGroupRowTag.iFolderLevel = 0 Then
		      ' it is a group folder
		    Else
		      ' it is not a group folder
		      oGroupRowTag = Nil
		      Continue
		    End If
		    
		    // Loop through each of it's children
		    For each oChildRowTag as lbRowTag In oGroupRowTag.aroChildren
		      
		      // Check if the current search column contains the string
		      dim sSearchee as string
		      sSearchee = str( oChildRowTag.vColumnValues(iSearchColumn) )
		      If sSearchee.InStr(sSearchString) <> 0 Then
		        ' it is contained!
		        
		        //***************************
		        
		        // Make sure the parent folder is expanded
		        If Not lbItems.Expanded(i1) Then
		          lbItems.Expanded(i1) = True
		        End If
		        
		        // Search the listbox by pkid
		        dim n1 as integer = -1
		        n1 = lbItems.FindByPKID(oChildRowTag.pkid)
		        
		        If n1 <> -1 Then
		          lbItems.ListIndex = n1
		        End If
		        
		        //***************************
		        
		      Else 
		        'Not contained here
		      End If
		      
		    Next
		  Next
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectRowByPKID(iPKID as int64)
		  
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
		sHeaders() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sItemRow_FieldNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sKitItemRow_FieldNames() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events lbItems
	#tag Event
		Sub Open()
		  dim s1, s2() as string
		  
		  me.ColumnCount = 11
		  
		  For i1 as integer = 0 To me.ColumnCount - 1
		    me.ColumnType(i1) = 3
		  Next
		  
		  // Set header names
		  s1 = "Name,Manufacturer,Model,Department,Category,SubCat,Description,Type,Qty,Price,Owner"
		  s2 = Split(s1,",")
		  sHeaders = s2
		  me.Heading = s2
		  
		  // Set Field Names 
		  s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,item_type,item_quantity,item_price_cost,item_owner"
		  s2 = Split(s1,",")
		  sItemRow_FieldNames = s2
		  s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,item_type,kit_item_quantity,|SKIP|,item_owner"
		  s2 = Split(s1,",")
		  sKitItemRow_FieldNames = s2
		  
		  dim n1,n2() as integer
		  n2 = Array(3,3,3,3,3,3,3,1,1,3,3)
		  iColumnTypes = n2
		  me.ColumnType = n2
		  
		  For i1 as integer = 0 To iColumnTypes.Ubound
		    
		    Select Case i1
		    Case 7  'item type popup menu
		      me.CustomTypes.Append(1)
		    Else
		      me.CustomTypes.Append(0)
		    End Select
		    
		  Next
		  
		  
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
		  
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    dim oRowTag as lbRowTag = lbItems.RowTag(lbItems.ListIndex)
		    
		    If oRowTag.iFolderLevel = 0 Then
		      ' This row is a folder
		      
		    Else 
		      ' This row is not a folder
		      
		      // Enable controls
		      bDeleteItem.Enabled = True
		      
		      If oRowTag.vtblRecord IsA DataFile.tbl_inventory Then
		        bIncreaseQuantity.Enabled = True
		      Else
		        bIncreaseQuantity.Enabled = False
		      End If
		      
		      
		    End If
		    
		  Else
		    
		    bDeleteItem.Enabled = False
		    bIncreaseQuantity.Enabled = False
		    
		    'contItemInfo.LoadLabels()
		    
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
		    
		    // Check if we have a normal row or a folder
		    If oCurrRowTag.isFolder Then
		      lbItems.AddFolder("")
		    Else
		      lbItems.AddRow("")
		    End If
		    
		    // Populate row cells
		    For i2 as integer = 0 To rowvalues.Ubound
		      dim sValue as string = rowvalues(i2)
		      lbItems.Cell(lbItems.LastIndex,i2) = sValue
		    Next
		    
		    // Add the rowtag to the row
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
		      
		      dim contExpanded as New ContainerInventoryExpanded(iPKID)
		      
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
		    
		    // Deprecated ************
		    
		    If iListIndex <> -1 Then
		      
		      If Not lbItems.RowIsFolder(iListIndex) Then
		        dim iPKID as int64
		        dim oRowTag as lbRowTag
		        
		        oRowTag = lbItems.RowTag(iListIndex)
		        If oRowTag <> Nil Then
		          iPKID = oRowTag.pkid
		        End If
		        
		        dim contExpanded as New ContainerInventoryExpanded(iPKID)
		        
		        dim wWindow as new Window2
		        wWindow.Top = MouseY
		        wWindow.Left = MouseX
		        contExpanded.EmbedWithin(wWindow,0,20)
		        
		        
		      End If
		    End If
		    
		    // \Deprecated ************
		    
		  Case "Details"
		    
		    If iListIndex <> -1 Then
		      
		      dim oRowTag as lbRowTag
		      oRowTag = lbItems.RowTag(iListIndex)
		      
		      If oRowTag.IsItem Then
		        dim iPKID as int64
		        
		        If oRowTag <> Nil Then
		          iPKID = oRowTag.pkid
		        End If
		        
		        dim contItem as New contInventoryItem(iPKID)
		        
		        dim tbPanel as PagePanel = app.MainWindow.tbMainWindow
		        app.MainWindow.AddTab("Details")
		        dim n1 as integer = tbPanel.PanelCount - 1
		        
		        contItem.EmbedWithinPanel(tbPanel,n1,0,20)
		        contItem.LoadItem(iPKID)
		        
		      End If
		    End If
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g as Graphics, row as integer, column as integer, x as integer, y as integer) As Boolean
		  
		  Select Case column
		  Case 7 // PopupMenu
		    // Draw an arrow to indicate that clicking this field will
		    // display a menu
		    g.ForeColor = &c000000
		    
		    // Points for a triangle on the right side of the cell
		    Dim points(6) As Integer
		    points(1) = g.Width-10
		    points(2) = 1
		    points(3) = g.Width
		    points(4) = 1
		    points(5) = g.Width-5
		    points(6) = 10
		    
		    g.FillPolygon(points)
		    
		    
		    
		    
		  End Select
		  
		  dim oRowTag as lbRowTag
		  
		  oRowTag = lbItems.RowTag(row)
		  
		  If oRowTag.vtblRecord = Nil Then
		    'Top level folder
		    g.ForeColor = rgb(0,0,0)
		  Else
		    dim otblRecord as Variant
		    otblRecord = oRowTag.vtblRecord
		    
		    If otblRecord IsA DataFile.tbl_inventory Then
		      g.ForeColor = rgb(50,50,50)
		    ElseIf otblRecord IsA DataFile.tbl_kits_packages Then
		      g.ForeColor = RGB(100,100,100)
		    End If
		    
		  End If
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function entMouseDown(x as integer, y as integer) As Boolean
		  
		  MakeTypePopup(x,y)
		End Function
	#tag EndEvent
	#tag Event
		Sub entMouseUp(x as integer, y as integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub PopupMenuColActivated(row as integer, column as integer)
		  
		  
		  MakeTypePopup(row,column,True)
		End Sub
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
		  
		  
		  DeleteItem(lbItems.ListIndex) 
		  
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
#tag Events pmPackageFilter
	#tag Event
		Sub Open()
		  dim s1() as string
		  
		  s1 = InventoryTypes.Split(",")
		  
		  me.AddRow("All")
		  'me.AddRow("Item")
		  'me.AddRow("Labor")
		  'me.AddRow("Item Package")
		  'me.AddRow("Labor Package")
		  
		  For each sType as String In s1()
		    me.AddRow(sType)
		  Next
		  
		  me.ListIndex = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  RefreshInventory(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scSearchInventory
	#tag Event
		Sub Search()
		  SearchInventory
		  'Break
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
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
