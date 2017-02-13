#tag Window
Begin ContainerControl contKitsPackages
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   283
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
   Width           =   238
   Begin entListbox lbKitItems
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
      Height          =   283
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   57
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   183
   End
   Begin PushButton pbAddKitItem
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Add"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -1
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
      Width           =   58
   End
   Begin PushButton pbRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      Height          =   22
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
      Top             =   21
      Underline       =   False
      Visible         =   True
      Width           =   58
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItem()
		  
		  // We need to pop up a window with the inventory listed  and get which one was selected 
		  // then create a new kit record and put in keys
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem()
		  dim iListIndex as integer = lbKitItems.ListIndex
		  
		  If lbKitItems.ListIndex <> -1 Then
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag = lbKitItems.RowTag(iListIndex)
		    
		    // Grab the table record
		    dim oRecord as DataFile.tbl_kits_packages
		    oRecord = oRowTag.vtblRecord
		    
		    dim s1 as string
		    s1 = lbKitItems.Cell(iListIndex,0)
		    
		    dim n1 as integer = MsgBox("Are you sure you want to delete " + s1, 4)
		    Select Case n1
		    Case 6  'Yes pressed
		      oRecord.Delete
		    Case 7  'No Pressed
		      
		    End Select
		  End If
		  
		  LoadMe(iParentInventoryPKID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadMe(ifkInventory as Int64)
		  
		  iParentInventoryPKID = ifkInventory
		  
		  // Grab the records from the database
		  oKitPackage = DataFile.tbl_kits_packages.List("fkinventory_parent = " + ifkInventory.ToText)
		  
		  // Delete all of the rows in the listbox
		  lbKitItems.DeleteAllRows
		  
		  // Loop through each record
		  For i1 as integer = 0 To oKitPackage.Ubound
		    dim oRecord as DataFile.tbl_kits_packages
		    dim oRowTag as New lbRowTag
		    dim oInventoryItem as DataFile.tbl_inventory
		    
		    // Load the associated child inventory Item for this record
		    oRecord = oKitPackage(i1)
		    dim fkInventoryChild as Int64 = oRecord.ifkinventory_child
		    dim jsChildFieldValues as JSONItem
		    oInventoryItem = DataFile.tbl_inventory.FindByID(fkInventoryChild)
		    jsChildFieldValues = oInventoryItem.GetMyFieldValues(True)
		    
		    lbKitItems.AddRow("")
		    
		    // Add the pkid to the rowtag and the record variable 
		    oRowTag.pkid = oRecord.ipkid
		    oRowTag.vtblRecord = oRecord
		    
		    // Extract Field names and values as a json item
		    dim jsFieldValues as JSONItem
		    jsFieldValues = oRecord.GetMyFieldValues(True)
		    
		    // Lets extract the keys into arrays
		    dim sParentKeys() as String = jsFieldValues.Names
		    dim sChildKeys() as String = jsChildFieldValues.Names
		    
		    // Loop through each column
		    For i2 as integer = 0 To sFieldNames.Ubound
		      
		      If sParentKeys.IndexOf( sFieldNames(i2) ) <> -1 Then
		        ReDim oRowTag.vColumnValues(i2)
		        
		        oRowTag.vColumnValues(i2) = jsFieldValues.Value(sFieldNames(i2))
		        
		      ElseIf sChildKeys.IndexOf( sFieldNames(i2) ) <> -1 Then
		        ReDim oRowTag.vColumnValues(i2)
		        
		        oRowTag.vColumnValues(i2) = jsChildFieldValues.Value(sFieldNames(i2))
		        
		      End If
		      
		    Next
		    
		    
		    LoadRow(lbKitItems.LastIndex,oRowTag)
		    
		    
		    
		  Next
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(row as integer, oRowTag as lbRowTag)
		  
		  lbKitItems.RowTag(row) = oRowTag
		  
		  For i1 as integer = 0 To sFieldNames.Ubound
		    
		    Select Case lbKitItems.ColumnType(i1) 
		    Case 2  'Checkbox
		      
		      If oRowTag.vColumnValues(i1) = True Then
		        lbKitItems.CellState(row,i1) = CheckBox.CheckedStates.Checked
		      Else
		        lbKitItems.CellState(row,i1) = CheckBox.CheckedStates.Unchecked
		      End If
		    Else
		      lbKitItems.Cell(row,i1) = oRowTag.vColumnValues(i1)
		    End Select
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue(row as integer, column as integer)
		  dim oRowTag as lbRowTag
		  dim oRecord as DataFile.tbl_kits_packages
		  dim sFieldName as String = sFieldNames(column)
		  
		  // Grab the Rowtag for this 
		  oRowTag = lbKitItems.RowTag(row)
		  
		  // Grab the Record from the rowtag
		  oRecord = oRowTag.vtblRecord
		  
		  // Check what type of column it is
		  Select Case lbKitItems.ColumnType(column)
		  Case 2  'Checkbox
		    Select Case lbKitItems.CellState(row,column) 
		    Case CheckBox.CheckedStates.Checked
		      oRecord.ChangeMySavedValue(sFieldName,True)
		    Case CheckBox.CheckedStates.Unchecked
		      oRecord.ChangeMySavedValue(sFieldName,False)
		    End Select
		  Case 3  'Normal text editalbe
		    oRecord.ChangeMySavedValue(sFieldName,lbKitItems.Cell(row,column))
		  End Select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		iColumnTypes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iParentInventoryPKID As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		oKitPackage() As DataFile.tbl_kits_packages
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeaders() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events lbKitItems
	#tag Event
		Sub Open()
		  dim s1,s2() as string
		  
		  lbKitItems.ColumnCount = 2
		  
		  s1 = "item_name,kit_item_quantity"
		  s2 = s1.Split(",")
		  sFieldNames = s2
		  
		  s1 = "Item, "
		  s2 = s1.Split(",")
		  sHeaders = s2
		  lbKitItems.Heading = sHeaders()
		  
		  lbKitItems.ColumnType = Array(0,3)
		  
		  
		  LoadMe(iParentInventoryPKID)
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  base.Append( New MenuItem("Delete") )
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  
		  Select Case hitItem.Text
		  Case "Delete"
		    DeleteItem
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row as integer, column as integer)
		  
		  Select Case lbKitItems.ColumnType(column) 
		  Case 2
		    SaveValue(row,column)
		  Case 3
		    SaveValue(row,column)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAddKitItem
	#tag Event
		Sub Action()
		  
		  // Launch a window with the inventory listed allowing the user to pick one
		  dim winPicker as New winInventoryPicker
		  winPicker.ShowModal
		  
		  // Grab the selected pkid from the window
		  dim iSelectedPKID as Int64
		  iSelectedPKID = winPicker.iSelectedItemPKID
		  
		  If iSelectedPKID <> 0 Then
		    // Create a New Kit item
		    dim oNewKitItem as New DataFile.tbl_kits_packages
		    oNewKitItem.ifkinventory_parent = iParentInventoryPKID
		    oNewKitItem.ifkinventory_child = iSelectedPKID
		    oNewKitItem.Save
		    
		    // Reload the kits listbox
		    LoadMe(iParentInventoryPKID)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbRefresh
	#tag Event
		Sub Action()
		  
		  
		  // Reload the kits listbox
		  LoadMe(iParentInventoryPKID)
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
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="iParentInventoryPKID"
		Group="Behavior"
		Type="Int64"
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
