#tag Window
Begin ContainerControl contEventList
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
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
   Width           =   498
   Begin entListbox lbEvents
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
      Height          =   279
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
      Top             =   21
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   498
   End
   Begin SearchControl scEventSearch
      AutoDeactivate  =   True
      Enabled         =   True
      HasCancelButton =   True
      HasMenu         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   363
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      Top             =   0
      Visible         =   True
      Width           =   135
   End
   Begin PushButton pbRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   True
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
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin PushButton pbAddEvent
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "AddEvent"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   134
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
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin PushButton pbSortBy
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Sort By"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   75
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   59
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub BuildRowTag(ByRef aRowTag as lbRowTag)
		  
		  
		  aRowTag.iCellTypes = dictCellTypes.Value(aRowTag.sRowType)
		  aRowTag.sFieldNames = dictFieldNames.Value(aRowTag.sRowType)
		  
		  If aRowTag.sRowType = "Folder" Then
		    
		    aRowTag.isFolder = True
		    
		  ElseIf aRowTag.sRowType = "GrandParent" or aRowTag.sRowType = "Child" Then
		    
		    dim oEvent as DataFile.tbl_events
		    oEvent = aRowTag.vtblRecord
		    
		    dim jsFieldValues as JSONItem
		    jsFieldValues = oEvent.GetMyFieldValues(True)
		    
		    // extract the keys
		    dim sKeys() as string
		    sKeys = jsFieldValues.Names
		    
		    // Determine Column Values
		    For Each sFieldName as string In aRowTag.sFieldNames()
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
		        aRowTag.vColumnValues.Append(sFormattedValue)
		        
		      End If
		      
		    Next
		    
		    
		  End If
		  
		  If aRowTag.sRowType = "GrandParent" Then
		    
		    // check for children 
		    
		    
		    
		    
		    
		    
		    
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildRowTags(dictEvents as Dictionary) As lbRowTag()
		  dim dictEventsKeys() as Variant
		  dim oRowTags() as lbRowTag
		  
		  
		  dictEventsKeys() = dictEvents.Keys
		  
		  If dictEvents.Count > 0 Then
		    If dictEventsKeys(0) = "All" Then
		      ' The events are grouped as one group, no folders needed
		      
		      // Loop through each Event and create rowtag for it
		      dim events() as DataFile.tbl_events
		      events() = dictEvents.Value(dictEventsKeys(0))
		      For Each oEvent as DataFile.tbl_events In events()
		        
		        dim aRowTag as New lbRowTag
		        aRowTag.isFolder = False
		        aRowTag.iFolderLevel = 0
		        aRowTag.sRowType = "GrandParent"
		        aRowTag.vtblRecord = oEvent
		        
		        BuildRowTag(aRowTag)
		        
		        oRowTags.Append(aRowTag)
		        
		      Next
		      
		    Else
		      ' The events are grouped
		      
		      For Each GroupKey as Variant In dictEventsKeys
		        
		        dim FolderRowTag1 as New lbRowTag
		        FolderRowTag1.isFolder = True
		        FolderRowTag1.iFolderLevel = 0
		        FolderRowTag1.sRowType = "Folder"
		        FolderRowTag1.vColumnValues.Append(str(GroupKey))
		        BuildRowTag(FolderRowTag1)
		        
		        If not dictEvents.Value(GroupKey) IsA Dictionary Then
		          ' No more subdivisions we are on events now
		          
		          dim GroupEvents() as DataFile.tbl_events
		          GroupEvents = dictEvents.Value(GroupKey)
		          
		          // Loop through each event
		          For Each oEvent as DataFile.tbl_events In GroupEvents
		            
		            dim EventRowTag as New lbRowTag
		            EventRowTag.sRowType = "GrandParent"
		            EventRowTag.iFolderLevel = 1
		            EventRowTag.vtblRecord = oEvent
		            BuildRowTag(EventRowTag)
		            
		            FolderRowTag1.aroChildren.Append(EventRowTag)
		            
		          Next
		          
		        Else
		          ' this one is subdivided further
		          
		          dim dictFolder1Contents as Dictionary
		          dim dictFolder1Keys() as Variant
		          dictFolder1Contents = dictEvents.Value(GroupKey)
		          dictFolder1Keys = dictFolder1Contents.Keys
		          
		          For Each GroupKey2 as Variant in dictFolder1Keys()
		            
		            dim FolderRowTag2 as New lbRowTag
		            FolderRowTag2.isFolder = True
		            FolderRowTag2.iFolderLevel = 1
		            FolderRowTag2.sRowType = "Folder"
		            FolderRowTag2.vColumnValues.Append(str(GroupKey2))
		            BuildRowTag(FolderRowTag2)
		            
		            If not dictEvents.Value(GroupKey2) IsA Dictionary Then
		              ' No more subdivisions we are on events now
		              
		              dim GroupEvents2() as DataFile.tbl_events
		              GroupEvents2 = dictFolder1Contents.Value(GroupKey2)
		              
		              For Each oEvent as DataFile.tbl_events in GroupEvents2
		                
		                dim EventRowTag as New lbRowTag
		                EventRowTag.sRowType = "GrandParent"
		                EventRowTag.iFolderLevel = 2
		                EventRowTag.vtblRecord = oEvent
		                BuildRowTag(EventRowTag)
		                
		                FolderRowTag2.aroChildren.Append(EventRowTag)
		                
		              Next
		              
		            Else 'this on is subdivided further
		              
		              dim dictFolder2Contenets as Dictionary
		              dim dictFolder2Keys() as Variant
		              dictFolder2Contenets = dictFolder1Contents.Value(GroupKey2)
		              dictFolder2Keys() = dictFolder2Contenets.Keys
		              
		              For Each GroupKey3 as Variant in dictFolder2Keys()
		                
		                dim FolderRowTag3 as New lbRowTag
		                FolderRowTag3.isFolder = True
		                FolderRowTag3.iFolderLevel = 2
		                FolderRowTag3.sRowType = "Folder"
		                FolderRowTag3.vColumnValues.Append(str(GroupKey3))
		                BuildRowTag(FolderRowTag3)
		                
		                If not dictEvents.Value(GroupKey3) IsA Dictionary Then
		                  ' No more subdivisions we are on events now
		                  
		                  dim GroupEvents3() as DataFile.tbl_events
		                  GroupEvents3 = dictFolder2Contenets.Value(GroupKey3)
		                  
		                  For  Each oEvent as DataFile.tbl_events in GroupEvents3
		                    
		                    dim EventRowTag as new lbRowTag
		                    EventRowTag.sRowType = "GrandParent"
		                    EventRowTag.iFolderLevel = 2
		                    EventRowTag.vtblRecord = oEvent
		                    BuildRowTag(EventRowTag)
		                    
		                    FolderRowTag3.aroChildren.Append(EventRowTag)
		                    
		                  Next
		                  
		                Else
		                  ' we dont suppor tthis many folders
		                  MsgBox("UH-OH")
		                End If
		                
		                FolderRowTag2.aroChildren.Append(FolderRowTag3)
		                
		              Next
		            End If
		            
		            FolderRowTag1.aroChildren.Append(FolderRowTag2)
		            
		          Next
		          
		        End If
		        
		        oRowTags.Append(FolderRowTag1)
		        
		      Next
		      
		    End If
		    
		  End If
		  
		  Return oRowTags
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(bWithButtons as Boolean = True)
		  
		  
		  If bWithButtons Then
		    
		  Else
		    
		    pbAddEvent.Enabled = False
		    pbAddEvent.Visible = False
		    
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleExpandRow(row as integer)
		  dim lbItems as entListbox = lbEvents
		  
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
		Sub LoadEvents(sConditionpar as String = "")
		  
		  
		  // Delete all the rows in the listbox
		  lbEvents.DeleteAllRows
		  
		  // Get the Events from the Database grouped in whichever way the master desires
		  dim orray as Dictionary
		  dim vKeys() as Variant
		  orray = DataFile.tbl_events.listGrouped("", "event_name", "event_name")
		  vKeys = orray.Keys
		  
		  dim oRowTags() as lbRowTag = BuildRowTags(orray)
		  
		  For Each oRowTag as lbRowTag in oRowTags()
		    
		    // add a new lb row
		    lbEvents.AddRow("")
		    
		    dim i1 as integer = lbEvents.LastIndex
		    
		    LoadRow(i1, oRowTag)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(RowIndex as integer, oRowTag as lbRowTag)
		  dim lbItems as entListbox = lbEvents
		  
		  
		  
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


	#tag Property, Flags = &h0
		dictCellTypes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dictFieldNames As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeaders() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		sSortBy As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events lbEvents
	#tag Event
		Sub Open()
		  
		  
		  
		  If dictFieldNames = Nil And dictCellTypes = Nil Then
		    
		    dim s1,s2() as string
		    
		    dim sRowType as string
		    
		    // Set Column Count
		    dim iColCount as integer = 4
		    lbEvents.ColumnCount = iColCount
		    
		    // Initialize dictionaries
		    dictFieldNames = New Dictionary
		    dictCellTypes = New Dictionary
		    
		    // Set header names
		    s1 = "Name,Start Date,End Date,Account Manager"
		    s2() = Split(s1,",")
		    sHeaders = s2
		    lbEvents.Heading = s2()
		    
		    
		    // **********
		    // Set up the cell types and field names for each type of row
		    
		    // Group Folders
		    sRowType = "Folder"
		    'field names
		    dictFieldNames.Value(sRowType) = Array("")
		    
		    'cell types
		    dim iCellTypes() as integer
		    ReDim iCellTypes(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes
		    
		    
		    // GrandParent
		    sRowType = "GrandParent"
		    'field names
		    s1 = "event_name,start_date,end_date,account_manager"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes2() as integer
		    ReDim iCellTypes2(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes2
		    
		    
		    // Linking Type Folder
		    sRowType = "Child"
		    'field names
		    dictFieldNames.Value(sRowType) = Array("event_name,start_date,end_date,account_manager")
		    
		    'cell types
		    dim iCellTypes3() as integer
		    ReDim iCellTypes3(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes3
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(Row as integer)
		  
		  HandleExpandRow(Row)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbRefresh
	#tag Event
		Sub Action()
		  
		  LoadEvents
		  break
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAddEvent
	#tag Event
		Sub Action()
		  
		  
		  dim oNewEvent as New DataFile.tbl_events
		  oNewEvent.sevent_name = "testingtesting"
		  oNewEvent.Save
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbSortBy
	#tag Event
		Sub Action()
		  
		  
		  // ===============================
		  // Define menu extries
		  // ===============================
		  dim base as new MenuItem
		  base.Append( new MenuItem( "Client" ) )  '0
		  base.Append( new MenuItem( "None" ) )  '1
		  dim MI1 as New MenuItem( "Venue" )
		  MI1.Enabled = True
		  base.Append( MI1 )  '2
		  dim MI2 as New MenuItem( "Year" )
		  MI2.Enabled = True
		  base.Append( new MenuItem( MI2 ) )  '3
		  dim MI3 as New MenuItem( "Year/Month" )
		  MI3.Enabled = True
		  base.Append( new MenuItem( MI3 ) )  '4
		  // ===============================
		  // Set the enabled status
		  // ===============================
		  
		  
		  // ===============================
		  // Carry out actions
		  // ===============================
		  dim hitItem as MenuItem
		  hitItem = base.PopUp
		  
		  Select Case hitItem.Text
		  Case "None"
		    
		  Case "Client"
		    
		  Case "Venue"
		    
		  Case "Year"
		    
		  Case "Year/Month"
		    
		  End Select
		  
		  
		  
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
		Name="sSortBy"
		Group="Behavior"
		Type="Integer"
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
