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
   Height          =   416
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
   Width           =   704
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
      Height          =   410
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
      Width           =   549
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
		  dim n1 as integer
		  
		  n1 = oItems.aroItems.Ubound + 1
		  
		  dim oInventoryItem as New DataFile.tbl_inventory
		  
		  
		  oItems.aroItems.Insert(0,oInventoryItem)
		  
		  LoadItemsIntoListbox
		  
		  lbItems.ListIndex = 0
		  lbItems.CellEdit(0,0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  oItems = new cInventory
		  oItems.LoadMe
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem(index as integer,IdentifyingName as String)
		  
		  If MsgBox("Are you sure you want to delete " + IdentifyingName, 4) = 6 Then
		    
		    oItems.aroItems(index).Delete
		    RefreshInventory
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadItemsIntoListbox()
		  dim oTheItems() as DataFile.tbl_inventory = oItems.aroItems
		  
		  lbItems.DeleteAllRows
		  
		  For i1 as integer = 0 To oTheItems.Ubound
		    
		    dim currItem as DataFile.tbl_inventory
		    currItem = oTheItems(i1)
		    
		    dim jsFieldVals as JSONItem
		    jsFieldVals = currItem.GetMyFieldValues(True)
		    
		    // Add a new row to the listbox
		    lbItems.AddRow("")
		    lbItems.RowTag(i1) = i1
		    
		    // Loop through each column 
		    For i2 as integer = 0 To lbItems.ColumnCount - 1
		      
		      dim currValue as string = jsFieldVals.Value(sFieldNames(i2))
		      lbItems.Cell(i1,i2) = currValue
		      
		    Next
		    
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshInventory()
		  
		  
		  oItems.LoadMe
		  LoadItemsIntoListbox
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue(row as integer, column as integer)
		  
		  
		  oItems.aroItems(row).ChangeMySavedValue( sFieldNames(column), lbItems.Cell(row,column) )
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
		  s1 = "item_name,item_manufacturer,item_model,item_department,item_category,item_subcategory,item_description,item_type,item_quantity,item_price,item_owner,item_taxable"
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
		  
		  SaveValue(row,column)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  dim iIndex as integer
		  
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    bDeleteItem.Enabled = True
		    bIncreaseQuantity.Enabled = True
		    
		    // Find the index of the selected row
		    iIndex = lbItems.RowTag(lbItems.ListIndex)
		    
		    contItemInfo.LoadLabels(oItems.aroItems(iIndex) )
		    
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
		  
		  RefreshInventory
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bDeleteItem
	#tag Event
		Sub Action()
		  
		  If lbItems.ListIndex <> -1 then
		    
		    DeleteItem(lbItems.ListIndex,lbItems.Cell(lbItems.ListIndex,0) )
		    
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
		    
		    // Get the index that the record is stored in
		    dim iIndex as integer = lbItems.RowTag(iListIndex)
		    
		    // Pull the pkid from the record
		    dim iThePKID as integer = oItems.aroItems(iIndex).ipkid
		    
		    If iThePKID <> 0 Then
		      
		      dim oSpecifiedAmount as integer
		      
		      If oSpecifiedAmount = 0 Then
		        oSpecifiedAmount = 1
		      End If
		      
		      // Increase the quantity
		      Methods.IncreaseQuantity(iThePKID,oSpecifiedAmount)
		      
		      // Reload the inventory
		      oItems.LoadMe
		      LoadItemsIntoListbox
		      lbItems.SetFocus
		      lbItems.ListIndex = iListIndex
		      
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
