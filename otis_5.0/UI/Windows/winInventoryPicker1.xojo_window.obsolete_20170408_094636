#tag Window
Begin Window winInventoryPicker1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   2
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   448
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   ""
   Visible         =   True
   Width           =   433
   Begin entOkCancel entOkCancel
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFF00FF
      Backdrop        =   0
      CancelButtonText=   "Cancel"
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   30
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   253
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      OkButtonText    =   "Ok"
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   418
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   176
   End
   Begin contInventory contItems
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      bTopLevelOnly   =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   418
      HelpTag         =   ""
      InitialParent   =   ""
      LastSearchValue =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   433
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadItems(sConditionpar as string = "", sGroupBy as string = "item_department")
		  
		  contItems.CreateZeroLevelRowTags(sConditionpar,"item_department")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MyShowModal(iExcludePKID as int64) As Int64()
		  
		  
		  // Load the items into the listbox
		  me.LoadItems("pkid <> " + iExcludePKID.ToText)
		  
		  // Show the window
		  me.ShowModal
		  
		  // Get the selected pkids from the window
		  Return iSelectedItemPKIDs
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		iSelectedItemPKIDs() As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldNames() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events entOkCancel
	#tag Event
		Sub CancelAction()
		  
		  Redim iSelectedItemPKIDs(-1)
		  me.Window.Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  dim lbItems as entListbox
		  
		  // Clear the selected pkids
		  Redim iSelectedItemPKIDs(-1)
		  lbItems = contItems.lbItems
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    dim SelectedRowtags() as lbRowTag
		    SelectedRowtags = lbItems.GetSelectedRows
		    
		    For Each oRowTag as lbRowTag In SelectedRowtags()
		      
		      If oRowTag.pkid <> 0 Then
		        iSelectedItemPKIDs.Append(oRowTag.pkid)
		      End If
		      
		    Next
		    
		  End If
		  
		  me.Window.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events contItems
	#tag Event
		Sub SetColumnInformation(lbItems as entListbox, ByRef dictCellTypes as Dictionary, ByRef dictFieldNames as Dictionary)
		  
		  dim s1,s2() as string
		  
		  dim sRowType as string
		  
		  // Set Column Count
		  dim iColCount as integer = 4
		  lbItems.ColumnCount = iColCount
		  
		  // Initialize dictionaries
		  dictFieldNames = New Dictionary
		  dictCellTypes = New Dictionary
		  
		  // Set header names
		  s1 = "Name,Category,SubCat,Qty"
		  s2() = Split(s1,",")
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
		  s1 = "item_name,item_category,item_subcategory,item_quantity"
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
		  s1 = "item_name,item_category,item_subcategory,item_quantity"
		  s2() = Split(s1,",")
		  dictFieldNames.Value(sRowType) = s2
		  
		  'cell types
		  dim iCellTypes4() as integer = Array(0,0,0,0)
		  dictCellTypes.Value(sRowType) = iCellTypes4
		  
		  
		  // LinkedItem - Contained
		  sRowType = "LinkedItem - contained"
		  'field names
		  s1 = "item_name,item_category,item_subcategory,tbl_inventory_link.-.quantity"
		  s2() = Split(s1,",")
		  dictFieldNames.Value(sRowType) = s2
		  
		  'cell types
		  dim iCellTypes5() as integer = Array(0,0,0,0)
		  dictCellTypes.Value(sRowType) = iCellTypes5
		  
		  // LinkedItem - kit
		  sRowType = "LinkedItem - kit"
		  'field names
		  s1 = "item_name,item_category,item_subcategory,tbl_inventory_link.-.quantity"
		  s2() = Split(s1,",")
		  dictFieldNames.Value(sRowType) = s2
		  
		  'cell types
		  dim iCellTypes6() as integer = Array(0,0,0,0)
		  dictCellTypes.Value(sRowType) = iCellTypes6
		  
		  // LinkedItem - package
		  sRowType = "LinkedItem - package"
		  'field names
		  s1 = "item_name,item_category,item_subcategory,tbl_inventory_link.-.quantity"
		  s2() = Split(s1,",")
		  dictFieldNames.Value(sRowType) = s2
		  
		  'cell types
		  dim iCellTypes7() as integer = Array(0,0,0,0)
		  dictCellTypes.Value(sRowType) = iCellTypes7
		End Sub
	#tag EndEvent
	#tag Event
		Function entDoubleClick() As Boolean
		  
		  
		  // stops the inventory listbox from opening the inventory item in a new tab
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
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
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
