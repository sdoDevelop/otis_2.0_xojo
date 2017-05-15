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
      BackColor       =   &cFFFF00FF
      Backdrop        =   0
      CellBackColor   =   &cFFFF00FF
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
      Left            =   264
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   1
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  sGroupByFields = "event_name"
		  
		  If bWithButtons Then
		    
		  Else
		    
		    pbAddEvent.Enabled = False
		    pbAddEvent.Visible = False
		    
		    
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddEvent()
		  
		  dim oNewEvent as New DataFile.tbl_events
		  oNewEvent.sevent_name = "-"
		  
		  
		  dim NewCont as New contEvent
		  
		  app.MainWindow.AddTab("New Event")
		  
		  NewCont.EmbedWithinPanel(app.MainWindow.tbMainWindow, app.MainWindow.tbMainWindow.PanelCount - 1)
		  
		  NewCont.LoadEvent(oNewEvent)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildRowTag(ByRef aRowTag as lbRowTag)
		  
		  
		  aRowTag.iCellTypes = dictCellTypes.Value(aRowTag.sRowType)
		  aRowTag.sFieldNames = dictFieldNames.Value(aRowTag.sRowType)
		  
		  If aRowTag.sRowType = "Folder" Then
		    
		    aRowTag.isFolder = True
		    
		  ElseIf aRowTag.sRowType = "GrandParent" or aRowTag.sRowType = "Child" Then
		    
		    dim oEvent as DataFile.tbl_events
		    oEvent = aRowTag.vtblRecord
		    
		    aRowTag.pkid = oEvent.ipkid
		    
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
		    
		    
		    
		    If aRowTag.sRowType = "GrandParent" Then
		      
		      // check for children 
		      dim n1 as integer
		      if oEvent.ipkid <> 0 Then
		        n1 = DataFile.tbl_events_link.ListCount("fkevents_parent = " + oEvent.ipkid.ToText )
		        
		        If n1 > 0 Then
		          ' this event has children
		          
		          // Get all of the link records related to this event
		          dim oChildLinkEvents() as DataFile.tbl_events_link
		          oChildLinkEvents() = DataFile.tbl_events_link.List("fkevents_parent = " + oEvent.ipkid.ToText)
		          
		          For Each oChild as DataFile.tbl_events_link In oChildLinkEvents()
		            
		            dim ChildRowTag as New lbRowTag
		            
		            If oChild.ifkevents_child <> 0 Then
		              // Get the child event record
		              dim oChildEvent as DataFile.tbl_events
		              oChildEvent = DataFile.tbl_events.FindByID(oChild.ifkevents_child)
		              
		              If oChildEvent <> Nil Then
		                dim oChildRowTag as New lbRowTag
		                ChildRowTag.isFolder = False
		                ChildRowTag.iFolderLevel = aRowTag.iFolderLevel + 1
		                ChildRowTag.vLinkTable = oChild
		                ChildRowTag.vtblRecord = oChildEvent
		                ChildRowTag.iCellTypes = dictCellTypes.Value("Child")
		                ChildRowTag.sFieldNames = dictFieldNames.Value("Child")
		                ChildRowTag.pkid = oChildEvent.ipkid
		                
		                dim jsFieldValuesChild as JSONItem
		                jsFieldValuesChild = oChildEvent.GetMyFieldValues(True)
		                
		                dim sKeysChild() as string
		                sKeysChild = jsFieldValuesChild.Names
		                
		                For Each sFieldName as String In ChildRowTag.sFieldNames
		                  
		                  If sKeysChild.IndexOf(sFieldName) > -1 Then
		                    ChildRowTag.vColumnValues.Append(jsFieldValuesChild.Value(sFieldName))
		                  Else
		                    ChildRowTag.vColumnValues.Append("")
		                  End If
		                Next
		                
		              End If
		              
		            End If
		            
		            aRowTag.aroChildren.Append(ChildRowTag)
		            
		          Next
		          
		          
		        End If
		        
		      End If
		      
		      
		      
		      
		      
		      
		      
		    End If
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
		Sub Constructor(bButtons as Boolean = True)
		  bWithButtons = bButtons
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandAllRows(JustTopLevel as Boolean = True)
		  dim lbItems as entListbox = lbEvents
		  
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
		Sub LoadEvents(oJustChildrenOf as Int64)
		  
		  
		  lbEvents.DeleteAllRows
		  
		  If oJustChildrenOf <> 0 Then
		    
		    bJustChildren = True
		    iParentID = oJustChildrenOf
		    
		    SetLbInfo
		    
		    dim oParentEvent as DataFile.tbl_events
		    oParentEvent = DataFile.tbl_events.FindByID(oJustChildrenOf)
		    
		    // Lets build a rowtag based off the parent
		    dim oParentRowtag as New lbRowTag
		    oParentRowtag.sRowType = "GrandParent"
		    oParentRowtag.vtblRecord = oParentEvent
		    BuildRowTag(oParentRowtag)
		    
		    // Loop through all of the children of the parent
		    For Each oChild as lbRowTag In oParentRowtag.aroChildren
		      
		      // Add a new Row
		      lbEvents.AddRow("")
		      dim iLastIndex as integer = lbEvents.LastIndex
		      
		      If iLastIndex <> -1 Then
		        LoadRow(iLastIndex, oChild)
		      End If
		      
		    Next
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadEvents(sConditionpar as String = "")
		  
		  sCondition = sConditionpar
		  
		  // Delete all the rows in the listbox
		  lbEvents.DeleteAllRows
		  
		  // Grab the search vlaue
		  dim sSeachValue as String = scEventSearch.Text
		  dim sSearchCondition, sCondition, sExcludeHiddenItemsCondition, sOrder as String
		  
		  // Set up the search condition
		  If sSeachValue = "" Then
		    sSearchCondition = ""
		  Else
		    sSearchCondition = "item_name Like '%" + sSeachValue + "%'"
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
		  
		  sOrder = sGroupByFields
		  
		  // Get the Events from the Database grouped in whichever way the master desires
		  dim orray as Dictionary
		  dim vKeys() as Variant
		  orray = DataFile.tbl_events.listGrouped(sCondition, sOrder, sGroupByFields)
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

	#tag Method, Flags = &h0
		Sub RefreshListbox()
		  dim oUIState as lbUIState
		  
		  oUIState = lbEvents.GetUIState
		  If bJustChildren Then
		    LoadEvents(iParentID)
		  Else
		    LoadEvents(sCondition)
		  End If
		  
		  lbEvents.ResetUIState(oUIState)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLbInfo()
		  
		  
		  
		  
		  dim s1,s2() as string
		  
		  dim sRowType as string
		  
		  // Set Column Count
		  dim iColCount as integer = 4
		  lbEvents.ColumnCount = iColCount
		  
		  // Initialize dictionaries
		  dictFieldNames = New Dictionary
		  dictCellTypes = New Dictionary
		  
		  if bJustChildren Then
		    s1 = "Name,Start Date,End Date,Hide"
		    s2 = Split(s1,",")
		    sHeaders = s2
		    lbEvents.Heading = s2()
		  else
		    // Set header names
		    s1 = "Name,Start Date,End Date,Account Manager"
		    s2() = Split(s1,",")
		    sHeaders = s2
		    lbEvents.Heading = s2()
		  end if
		  
		  
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
		  
		  If bJustChildren Then
		    // Linking Type Folder
		    sRowType = "Child"
		    s1 = "event_name,start_date,end_date,hide"
		    s2() = s1.Split(",")
		    'field names
		    dictFieldNames.Value(sRowType) = s2()
		    
		    'cell types
		    dim iCellTypes3() as integer = Array(3, 0, 0, 2)
		    'ReDim iCellTypes3(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes3
		    
		  Else
		    // Linking Type Folder
		    sRowType = "Child"
		    s1 = "event_name,start_date,end_date,account_manager"
		    s2() = s1.Split(",")
		    'field names
		    dictFieldNames.Value(sRowType) = s2()
		    
		    'cell types
		    dim iCellTypes3() as integer = Array(0, 0, 0, 0)
		    'ReDim iCellTypes3(iColCount - 1) 
		    dictCellTypes.Value(sRowType) = iCellTypes3
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event entDoubleClick() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event entOpen()
	#tag EndHook


	#tag Property, Flags = &h0
		bJustChildren As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bWithButtons As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		dictCellTypes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dictFieldNames As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		iParentID As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		LastSearchValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastUIState As lbUIState
	#tag EndProperty

	#tag Property, Flags = &h0
		sCondition As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sGroupByFields As String = "event_name"
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
		    SetLbInfo
		  End If
		  
		  entOpen
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(Row as integer)
		  
		  HandleExpandRow(Row)
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
		Sub DoubleClick()
		  dim lbItems as entListbox = lbEvents
		  
		  
		  If entDoubleClick Then
		    
		    // the event was handled and we do not want to do anything else
		    
		  Else
		    
		    
		    dim oRowTag as lbRowTag
		    
		    If lbItems.ListIndex <> -1 Then
		      
		      oRowTag = lbItems.RowTag(lbItems.ListIndex)
		      
		      If oRowTag.vtblRecord <> Nil Then
		        
		        // Get the Event name
		        // Get the item name
		        dim oRecord as DataFile.tbl_events
		        oRecord = oRowTag.vtblRecord
		        dim sEventName as string
		        sEventName = oRecord.sevent_name
		        
		        If oRowTag.pkid <> 0 Then
		          
		          // load up a inventory item container
		          dim conEventInst as New contEvent
		          dim oTabPanel as PagePanel = app.MainWindow.tbMainWindow
		          
		          app.MainWindow.AddTab(sEventName)
		          
		          conEventInst.EmbedWithinPanel(oTabPanel,oTabPanel.PanelCount - 1 )
		          
		          conEventInst.LoadEvent(oRowTag.pkid)
		          
		        End If
		        
		      End If
		      
		    End If
		    
		    
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function entContextualMenuAction(hitItem as MenuItem) As Boolean
		  dim lbItems as entListbox = lbEvents
		  
		  Select Case hitItem.Text
		  Case "Open"
		    
		    If lbItems.ListIndex <> -1 Then
		      
		      // Grab the rowtag
		      dim oRowTag as lbRowTag
		      oRowTag = lbItems.RowTag(lbItems.ListIndex)
		      
		      // Get the item name
		      dim oRecord as DataFile.tbl_events
		      oRecord = oRowTag.vtblRecord
		      dim sItemName as string
		      sItemName = oRecord.sevent_name
		      
		      If oRowTag.pkid <> 0 Then
		        
		        // load up a inventory item container
		        dim conEventInst as New contEvent
		        dim oTabPanel as PagePanel = app.MainWindow.tbMainWindow
		        
		        app.MainWindow.AddTab(sItemName)
		        
		        conEventInst.EmbedWithinPanel(oTabPanel,oTabPanel.PanelCount - 1 )
		        
		        conEventInst.LoadEvent(oRowTag.pkid)
		      End If
		    End If
		    
		  Case "Break Link"
		    // STILLL INVETORY BASED
		    Return False
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
		        
		        
		        
		        RefreshListbox
		        
		      End If
		      
		    Next
		    
		  Case "Delete Item"
		    
		    dim oRowTags() as lbRowTag
		    oRowTags = lbItems.GetSelectedRows
		    
		    For  Each oRowTag as lbRowTag In oRowTags()
		      
		      If oRowTag.vtblRecord <> Nil Then
		        
		        dim oItemRecord as DataFile.tbl_events
		        oItemRecord = oRowTag.vtblRecord
		        'dim oLinkRecord as DataFile.tbl_inventory_link
		        'If oRowTag.vLinkTable <> Nil Then
		        'oLinkRecord = oRowTag.vLinkTable
		        'End If
		        
		        Select Case MsgBox("Are you sure you want to delete the event: " + oItemRecord.sevent_name + "?",4)
		        Case 6 ' yes pressed
		          
		        Case 7 ' No pressed
		          Return False
		        End Select
		        
		        oItemRecord.Delete
		        
		        'If oLinkRecord <> Nil Then
		        'oLinkRecord.Delete
		        
		        'Methods.UpdateItemQuantity(oLinkRecord.ifkinventory_parent)
		        'End If
		        
		        
		        
		        RefreshListbox
		        
		      End If
		      
		    Next
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function entConstructContextualMenu(base as menuitem, x as integer, y as integer) As Boolean
		  dim lbItems as entListbox = lbEvents
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = lbItems.RowTag(lbItems.ListIndex)
		    
		    If oRowTag.vtblRecord <> Nil Then
		      
		      base.Append( New MenuItem("Open") )
		      base.Append( New MenuItem(MenuItem.TextSeparator) )
		      
		      If oRowTag.vLinkTable <> Nil Then
		        dim mi1 as New MenuItem("Break Link")
		        mi1.Enabled = False
		        base.Append( mi1 )
		      End If
		      
		      base.Append( New MenuItem("Delete Item") )
		      
		    End If
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row as integer, column as integer)
		  dim lbItems as entListbox = lbEvents
		  
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
		      
		      dim oRecord as DataFile.tbl_events 
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
		  dim lbItems as entListbox = lbEvents
		  
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
		        
		        dim oRecord as DataFile.tbl_events
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
		      
		      // Here just just because I think it might be useful in the future
		      
		      
		      
		      // Check if there is a record here
		      If oRowTag.vLinkTable <> Nil Then
		        
		        dim oRecord as DataFile.tbl_events_link
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
#tag Events scEventSearch
	#tag Event
		Sub Search()
		  dim sSearchValue as string
		  dim lbItems as entListbox = lbEvents
		  
		  sSearchValue = scEventSearch.Text
		  
		  If len(sSearchValue) <> 0 Then
		    ' there is something to be searched
		    
		    // Check if there used is a previous search value
		    If len(LastSearchValue) = 0 Then
		      ' Nothing was last searched
		      
		      // Get UIState
		      dim oUIState as lbUIState
		      oUIState = lbItems.GetUIState
		      LastUIState = oUIState
		      
		    End If
		    
		  End If
		  
		  // Populate listbox with filterd inventory
		  If bJustChildren Then
		    
		  Else
		    LoadEvents(sCondition)
		  End If
		  
		  
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
#tag Events pbRefresh
	#tag Event
		Sub Action()
		  RefreshListbox
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAddEvent
	#tag Event
		Sub Action()
		  AddEvent
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
#tag Events chbShowHidden
	#tag Event
		Sub Action()
		  
		  dim oUIState as lbUIState
		  oUIState = lbEvents.GetUIState
		  LoadEvents
		  lbEvents.ResetUIState(oUIState)
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
		Name="bJustChildren"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="bWithButtons"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Name="iParentID"
		Group="Behavior"
		Type="Int64"
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
		Name="sCondition"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="sGroupByFields"
		Group="Behavior"
		InitialValue="""""event_name"""""
		Type="String"
		EditorType="MultiLineEditor"
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
