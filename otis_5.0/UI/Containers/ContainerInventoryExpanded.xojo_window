#tag Window
Begin ContainerControl ContainerInventoryExpanded
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
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      CellBackColor   =   &cFFFFFF00
      Enabled         =   True
      EraseBackground =   True
      GridLinesColor  =   &c00000000
      HasBackColor    =   False
      HasHeading      =   True
      Height          =   181
      HelpTag         =   ""
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
		Sub Constructor(contParent as contInventory, ifkInventory as Int64)
		  
		  // Set references to the parent container
		  ParentContainer = contParent
		  fkInventory = ifkInventory
		  
		  // Load the expanded inventory for the requested Item
		  ParentContainer.oItems.LoadExpanded(fkInventory)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem(oRowTag as lbrowtag, IdentifyingName as String)
		  break
		  
		  
		  If MsgBox("Are you sure you want to delete " + IdentifyingName, 4) = 6 Then
		    
		    dim otblObject as DataFile.tbl_inv_ex = oRowTag.vtblRecord
		    
		    dim iPKID as integer = oRowTag.pkid
		    
		    otblObject.Delete
		    
		    dim n1 as integer = lbItems.FindByPKID(iPKID)
		    If  n1 <> -1 Then
		      lbItems.RemoveRow(n1)
		    End If
		    
		    // Update inventory item quantity
		    Methods.UpdateItemQuantity(fkInventory)
		    dim parentlistboxindex as integer
		    dim parentlistboxrowtag as lbRowTag = ParentContainer.lbItems.RowTag(parentlistboxindex)
		    parentlistboxindex = lbItems.FindByPKID(fkInventory)
		    ParentContainer.LoadRow(parentlistboxindex,parentlistboxrowtag.vtblRecord)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadItemsIntoListbox()
		  
		  // Delete all current rows in listbox
		  lbItems.DeleteAllRows
		  
		  
		  // Grab the expanded inventory list From the Parent Container
		  dim oExpandedList() as DataFile.tbl_inv_ex = ParentContainer.oItems.aroItemsExpanded.Value(fkInventory)
		  
		  For i1 as integer = 0 To oExpandedList.Ubound
		    dim item as DataFile.tbl_inv_ex = oExpandedList(i1)
		    dim oRowTag as New lbRowTag
		    
		    // Add the pkid to the rowtag
		    oRowTag.pkid = item.ipkid
		    oRowTag.vtblRecord = item
		    
		    lbItems.AddRow("")
		    
		    // Extract the field names and values as json item
		    dim jsFieldValues as JSONItem
		    jsFieldValues = item.GetMyFieldValues(True)
		    
		    // Extract field names and values as json item from our parent
		    dim jsParentFieldValues as JSONItem
		    dim oParentRowTag as lbRowTag
		    dim oParentTableRecord as DataFile.tbl_inventory
		    oParentRowTag = ParentContainer.lbItems.RowTag(ParentContainer.lbItems.FindByPKID(fkInventory))
		    oParentTableRecord = oParentRowTag.vtblRecord
		    jsParentFieldValues = oParentTableRecord.GetMyFieldValues(True)
		    
		    For i2 as integer = 0 To sFieldNames.Ubound
		      
		      dim sKeys() as String
		      dim sParentKeys() as String
		      sKeys = jsFieldValues.Names
		      sParentKeys = jsParentFieldValues.Names
		      
		      If sKeys.IndexOf(sFieldNames(i2)) <> -1 Then
		        'Try 
		        // Try to get the value for this field from our item variable
		        ReDim oRowTag.vColumnValues(i2)
		        oRowTag.vColumnValues(i2) = jsFieldValues.Value(sFieldNames(i2))
		        'Catch e as KeyNotFoundException
		      ElseIf sParentKeys.IndexOf(sFieldNames(i2)) <> -1 Then
		        // Try to get the value for this field from our parent item 
		        ReDim oRowTag.vColumnValues(i2)
		        oRowTag.vColumnValues(i2) = jsParentFieldValues.Value(sFieldNames(i2))
		        'End Try
		      End If
		      
		    Next
		    
		    lbItems.RowTag(lbItems.LastIndex) = oRowTag
		    dim n2 as integer = lbItems.LastIndex
		    LoadRow(n2,oRowTag)
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(row as integer, oRowTag as lbRowTag)
		  
		  'dim oRowTag as New lbRowTag(oRecord,sFieldNames)
		  
		  'lbItems.RowTag(row) = oRowTag
		  
		  // Populate cells
		  For i1 as integer = 0 To sFieldNames.ubound
		    lbItems.Cell(row,i1) = oRowTag.vColumnValues(i1)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue(row as integer, column as integer)
		  dim oRowTag as lbRowTag
		  dim otblObject as DataFile.tbl_inv_ex
		  
		  oRowTag = lbItems.RowTag(row)
		  otblObject = oRowTag.vtblRecord
		  
		  otblObject.ChangeMySavedValue( sFieldNames(column), lbItems.Cell(row,column) )
		  
		  oRowTag.pkid = otblObject.ipkid
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		fkInventory As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		iColumnTypes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ParentContainer As contInventory
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
		Sub CellAction(row as integer, column as integer)
		  
		  If Not lbItems.RowIsFolder(row) Then
		    SaveValue(row,column)
		  End If
		End Sub
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
		Sub Open()
		  dim s1, s2() as string
		  
		  me.ColumnCount = 4
		  
		  For i1 as integer = 0 To me.ColumnCount - 1
		    me.ColumnType(i1) = 3
		  Next
		  
		  // Set header names
		  s1 = "Name,Barcode,RFID,Serial"
		  s2 = Split(s1,",")
		  sHeaders = s2
		  me.Heading = s2
		  
		  // Set Field Names 
		  s1 = "item_name,item_barcode,item_rfid_code,item_serial_code"
		  s2 = Split(s1,",")
		  sFieldNames = s2
		  
		  dim n1,n2() as integer
		  n2 = Array(0,3,3,3)
		  iColumnTypes = n2
		  me.ColumnType = n2
		  
		  
		  LoadItemsIntoListbox
		End Sub
	#tag EndEvent
	#tag Event
		Function entConstructContextualMenu(base as menuitem, x as integer, y as integer) As Boolean
		  
		  base.Append( New MenuItem("Maintenance Logs") )
		  base.Append( New MenuItem("Delete") )
		  
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function entContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  If hitItem <> Nil Then
		    
		    Select Case hitItem.Text
		    Case "Delete"
		      
		      If lbItems.ListIndex <> -1 Then
		        If Not lbItems.RowIsFolder(lbItems.ListIndex) Then
		          
		          dim oRowTag as lbRowTag = lbItems.RowTag(lbItems.ListIndex)
		          DeleteItem(oRowTag,lbItems.Cell(lbItems.ListIndex,3).ToText)
		          
		        End If
		      End If
		      
		    Case "Maintenance Logs"
		      
		      
		      If lbItems.ListIndex <> -1 Then
		        
		        
		        dim oRowTag as lbRowTag = lbItems.RowTag(lbItems.ListIndex)
		        
		        // Create a new Maintenance Log container
		        dim ml1 as New contMaintenenceLog(self.ParentContainer,oRowTag.pkid,fkInventory)
		        
		        self.Window.Close
		        
		        App.MainWindow.tbMainWindow.Append("Maintenance Log")
		        
		        ml1.EmbedWithinPanel(App.MainWindow.tbMainWindow,app.MainWindow.tbMainWindow.PanelCount - 1,0,30)
		        
		      End If
		      
		    End Select
		  End If
		End Function
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
		Name="fkInventory"
		Group="Behavior"
		Type="Int64"
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
