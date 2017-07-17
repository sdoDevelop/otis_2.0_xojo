#tag Window
Begin ContainerControl contLineItems
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
      Height          =   412
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
      Top             =   27
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   700
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
   Begin SearchControl scSearchField
      AutoDeactivate  =   True
      Enabled         =   True
      HasCancelButton =   False
      HasMenu         =   False
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   540
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      Top             =   2
      Visible         =   True
      Width           =   160
   End
   Begin CheckBox chbShowItems
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show Items"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   93
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   2
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   81
   End
   Begin CheckBox chbShowLabor
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show Labor"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   174
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   2
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   81
   End
   Begin CheckBox chbShowPackages
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show Packages"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   256
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   2
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   102
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, DeltaX as Integer, DeltaY as Integer) As Boolean
		  
		  Return methHandleMouseWheel(X,Y,DeltaX,DeltaY)
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  methListboxSettings
		  
		  evdefOpen
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub methBuildRowTag(ByRef oRowTag as lbRowTag)
		  dim otblRecord as DataFile.tbl_lineitems  '!@! Table Dependent !@!
		  dim iPKID as Int64
		  
		  // Check  to see what kind of row this will be based on varying conditions
		  If oRowTag.vtblRecord IsA DataFile.tbl_lineitems Then  '!@! Table Dependent !@!
		    'there is a table record and it is our primary table
		    
		    // Put the table record into a variable
		    otblRecord = oRowTag.vtblRecord
		    
		    // Pull the table name into a variable
		    dim sTableName as String = otblRecord.GetTableName
		    
		    // FIll in some rowtag info that we know already
		    iPKID = otblRecord.ipkid
		    If iPKID <> 0 Then
		      oRowTag.pkid = iPKID
		    End If
		    If oRowTag.sRowType = "Grandparent" Then
		      'grandparent level row
		      oRowTag.sFieldNames = dictFieldNames.Value("GrandParent")
		      oRowTag.iCellTypes = dictCellTypes.Value("GrandParent")
		    Else
		      dim sRowType as String = oRowTag.sRowType
		      oRowTag.sFieldNames = dictFieldNames.Value(sRowType)
		      oRowTag.iCellTypes = dictCellTypes.Value(oRowTag.sRowType)
		    End If
		    
		    // Populate the Column values for this row
		    For Each sFieldName as String In oRowTag.sFieldNames
		      
		      // Get the field names and values as a json item from the database record
		      dim jsFieldValues as JSONItem = otblRecord.GetMyFieldValues(True)
		      dim sKeys() as string = jsFieldValues.Names
		      
		      // Check to make sure that the field we are looking for really exists
		      If sKeys.IndexOf(sFieldName) <> -1 Then
		        
		        // Format the value for display
		        dim sUnFormattedValue as String = jsFieldValues.value(sFieldName)
		        dim sFormattedValue as String
		        If sFieldName.InStr(".") = 0 Then
		          sFormattedValue = FormatValue_ForDisplay(sTableName + "." + sFieldName, sUnFormattedValue)
		        Else
		          sFormattedValue = FormatValue_ForDisplay(sFieldName, sUnFormattedValue)
		        End If
		        
		        // append this value to the rowtag array
		        oRowTag.vColumnValues.Append(sFormattedValue)
		        
		      End If
		    Next
		    
		    // Check to see if this record has any children
		    dim arLinkArray() as DataFile.tbl_internal_linking
		    dim dictChildRecords as New Dictionary
		    arLinkArray = DataFile.tbl_internal_linking.List( "fk_parent = " + otblRecord.ipkid.ToText )
		    
		    // Loop through each link child
		    If arLinkArray.Ubound <> -1 Then
		      
		      // This Rowtag is a folder
		      oRowTag.isFolder = True
		      
		      For Each oLinkRecord as DataFile.tbl_internal_linking In arLinkArray
		        
		        // Get the child record
		        dim oChild as DataFile.tbl_lineitems = DataFile.tbl_lineitems.FindByID( oLinkRecord.ifk_child )  '!@! Table Dependent !@!
		        If oChild <> Nil Then
		          
		          dim dictvKeys() as Variant
		          dim dictKeys() as String
		          dim sLinkType as string
		          sLinkType = oLinkRecord.slink_type
		          dictvKeys() = dictChildRecords.Keys
		          For Each vKey as Variant In dictvKeys
		            dictKeys.Append(str(vKey))
		          Next
		          If sLinkType = "" Then
		            sLinkType = "NoType"
		          End If
		          
		          dim aroSubChildren() as lbRowTag
		          
		          // Create new rowtag for this child
		          dim oSubRowtag as New lbRowTag
		          oSubRowtag.vtblRecord = otblRecord
		          oSubRowtag.iFolderLevel = oRowTag.iFolderLevel + 1
		          oSubRowtag.vtblRecord = oChild
		          oSubRowtag.vLinkTable = oLinkRecord
		          oSubRowtag.sRowType = "Linked - " + sLinkType
		          
		          dim vLinkType as Variant = sLinkType
		          If dictKeys.IndexOf(sLinkType) >=0 Then
		            ' there is already a dictionary entry for this link type
		            // Pull its fellow rowtags out of Dictionary
		            aroSubChildren() = dictChildRecords.Value(sLinkType)
		            
		          Else
		            'there is no dictionary entry for this link type
		          End If
		          
		          // Feed this rowtag back into our build rowtag method to build it out
		          methBuildRowTag(oSubRowtag)
		          
		          // Add our current child rowtag to the array and then back into the dictionary
		          aroSubChildren.Append(oSubRowtag)
		          dictChildRecords.Value(sLinkType) = aroSubChildren
		          
		        End If
		        
		      Next
		      
		      // Loop through each of the categories in dictChildRecords
		      dim dictKeys() as Variant = dictChildRecords.Keys
		      For Each key as Variant In dictKeys
		        
		        // Pull all of the child rowtags out of this category
		        dim aroChildRecords() as lbRowTag = dictChildRecords.Value(key)
		        
		        // Check to see if there is a link type that would force us to create a sub folder to contain sub reacord
		        If key = "NoType" Then
		          
		          // Loop through each child rowtag
		          For Each Child as lbRowTag In aroChildRecords
		            oRowTag.aroChildren.Append(Child)
		          Next
		          
		        Else
		          
		          // Create a link folder rowtag
		          dim oLinkRowtag as New lbRowTag
		          oLinkRowtag.aroChildren() = aroChildRecords()
		          oLinkRowtag.iCellTypes = dictCellTypes.Value("LinkingTypeFolder")
		          oLinkRowtag.iFolderLevel = oRowTag.iFolderLevel + 1
		          oLinkRowtag.isFolder = True
		          oLinkRowtag.sFieldNames = dictFieldNames.Value("LinkingTypeFolder")
		          oLinkRowtag.sRowType = "LinkingTypeFolder"
		          oLinkRowtag.vColumnValues = Array(key)
		          
		          oRowTag.aroChildren.Append(oLinkRowtag)
		          
		        End If
		        
		      Next
		      
		    End If
		    
		    
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function methCreateRowTags(vRecords() as DataFile.tbl_lineitems) As lbRowTag()
		  '!@! Table Dependent In Parameters !@!
		  
		  // vRecords will either be 
		  // an array of ActiveRecordBase objects
		  //      or
		  // a Dictionary or grouped records
		  
		  dim oReturnRowtags() as lbRowTag 
		  
		  // Check if vRecords is grouped or not
		  If vRecords.Ubound = -1 Then
		    Return Nil
		  End If
		  
		  Select Case vRecords(0)
		  Case IsA Dictionary
		    //Problem!!! should be in other form of method
		    Return Array(new lbRowTag)
		  Case IsA DataFile.ActiveRecordBase
		    
		    // Loop through each record
		    For Each oRecord as DataFile.tbl_lineitems In vRecords  '!@! Table Dependent !@!
		      
		      // Set up some basic things for the rowtag that we know already
		      dim oCurrentRowtag as New lbRowTag
		      'put the record we are on into the rowtag
		      oCurrentRowtag.vtblRecord = oRecord
		      oCurrentRowtag.iFolderLevel = 1
		      oCurrentRowtag.sRowType = "GrandParent"
		      
		      // Build that damn rowtag
		      methBuildRowTag(oCurrentRowtag)
		      
		      oReturnRowtags.Append( oCurrentRowtag )
		      
		    Next
		    
		    
		    
		  End Select
		  
		  Return oReturnRowtags
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function methCreateRowTags_dict(dictRecords as Dictionary, iFolderLevel as integer = 0) As lbRowTag()
		  // vRecords will either be 
		  // an array of ActiveRecordBase objects
		  //      or
		  // a Dictionary or grouped records
		  
		  // Check if vRecords is grouped or not
		  Select Case dictRecords
		  Case IsA DataFile.ActiveRecordBase
		    //Problem!!! should be in other form of method
		    Return Array(New lbRowTag)
		  Case IsA Dictionary
		    
		    dim aroGroupRowtags() as lbRowTag
		    
		    // Loop through all of the groups
		    For Each vGroupName as Variant In dictRecords.Keys
		      
		      If dictRecords.Value(vGroupName) IsA Dictionary Then
		        // we need to go deeper with the grouping before we can create the item rowtags
		        
		        // relaunch this method to dig deeper into the grouping
		        dim aroChildRowTags() as lbRowTag
		        aroChildRowTags = methCreateRowTags_dict(dictRecords.Value(vGroupName), iFolderLevel + 1)
		        
		        dim oGroupRowtag as New lbRowTag
		        oGroupRowtag.aroChildren() = aroChildRowTags
		        oGroupRowtag.iCellTypes = dictCellTypes.Value("GroupFolder")
		        oGroupRowtag.iFolderLevel = iFolderLevel
		        oGroupRowtag.isFolder = True
		        oGroupRowtag.sFieldNames = dictFieldNames.Value("GroupFolder")
		        oGroupRowtag.sRowType = "GroupFolder"
		        oGroupRowtag.vColumnValues = Array( vGroupName )
		        
		        aroGroupRowtags.Append(oGroupRowtag)
		        
		      Else
		        // Create the rowtags for this groups children
		        dim aroChildRowTags() as lbRowTag
		        aroChildRowTags() = methCreateRowTags(dictRecords.Value(vGroupName))
		        
		        // Create a New Rowtag for the Group
		        dim oGroupRowtag as New lbRowTag
		        oGroupRowtag.aroChildren() = aroChildRowTags()
		        oGroupRowtag.iCellTypes = dictCellTypes.Value("GroupFolder")
		        oGroupRowtag.iFolderLevel = iFolderLevel
		        oGroupRowtag.isFolder = True
		        oGroupRowtag.sFieldNames = dictFieldNames.Value("GroupFolder")
		        oGroupRowtag.sRowType = "GroupFolder"
		        oGroupRowtag.vColumnValues = Array( vGroupname )
		        
		        aroGroupRowtags.Append(oGroupRowtag)
		      End If
		      
		    Next
		    
		    Return aroGroupRowtags()
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methCreateTopLevelRows(aroRowtags() As lbRowTag)
		  dim lb1 as entListbox = lbItems  '!@! Table Dependent !@!
		  
		  // Clear the listbox
		  lb1.DeleteAllRows
		  
		  
		  // Loop through each rowtag
		  For Each oRowtag as lbRowTag In aroRowtags()
		    
		    // Create a row for this rowtag
		    lb1.AddRow("")
		    
		    // Load the Row
		    methLoadRow(lb1.LastIndex, oRowtag)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methExpandAllRows(JustTopLevel as Boolean = True)
		  dim lb1 As entListbox = lbItems  '!@! Table Dependent !@!
		  
		  // Loop through all the rows
		  dim i1 as integer
		  While i1 < lb1.ListCount 
		    
		    dim oRowTag as lbRowTag
		    
		    // extract the rowtag
		    oRowTag = lb1.RowTag(i1)
		    
		    // Chgeck if its a folder
		    If lb1.RowIsFolder(i1) Then
		      
		      // Check if its a top level folder
		      Select Case oRowTag.iFolderLevel
		      Case 0 
		        lb1.Expanded(i1) = True
		      Else
		        If Not JustTopLevel Then
		          lb1.Expanded(i1) = True
		        End If
		      End Select
		      
		    End If
		    
		    i1 = i1 + 1
		    
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function methGetRecordList_Grouped(sGroupByField as string, sConditionpar as string) As Dictionary
		  dim dictGroupedItems as Dictionary
		  
		  // Grab the search value
		  dim sSearchValue as String
		  sSearchValue = scSearchField.Text  
		  
		  // Get the inventory items from the database grouped by sGroupByField
		  dim sSearchCondition,sExcludeHiddenItemsCondition as String
		  dim sCondition,sOrder as String
		  
		  dim arsConditions() as String
		  
		  If oEIPLRecord <> Nil Then arsConditions.Append( "fkeipl = " + oEIPLRecord.ipkid.ToText )
		  
		  If sSearchValue <> "" Then arsConditions.Append( "li_name Like '%" + sSearchValue + "%'" )
		  If sConditionpar <> "" Then arsConditions.Append( sConditionpar )
		  
		  // Add in filters for item type
		  dim arsShowConditions() as string
		  dim sShowConditions as string
		  
		  If chbShowItems.Value Then arsShowConditions.Append( "'Item'" )
		  If chbShowPackages.Value Then arsShowConditions.Append( "'Package'" )
		  If chbShowLabor.Value Then arsShowConditions.Append( "'Labor'" )
		  
		  If arsShowConditions.Ubound <> -1 Then
		    arsShowConditions.Append( "''" )
		    sShowConditions = Join(arsShowConditions, ", ")
		  End If
		  If sShowConditions <> ""  Then sShowConditions = "( li_type In ( " + sShowConditions + " ) Or li_type Is Null ) "
		  If sShowConditions <> "" Then arsConditions.Append( sShowConditions )
		  
		  // Combine everthing together
		  If arsConditions.Ubound <> -1 Then sCondition = Join( arsConditions, " And " )
		  
		  
		  sOrder = sGroupByField
		  dictGroupedItems = DataFile.tbl_lineitems.ListGrouped(sCondition,sOrder,sGroupByField)  '!@! Table Dependent !@!
		  
		  Return dictGroupedItems
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function methGetRecordList_UnGrouped(sOrderByFields as string, sConditionpar as string) As DataFile.tbl_lineitems()
		  '!@! Table Dependent In Return Type !@!
		  
		  dim aroRecords() as DataFile.tbl_lineitems  '!@! Table Dependent !@!
		  
		  // Grab the search value
		  dim sSearchValue as String
		  sSearchValue = scSearchField.Text  
		  
		  // Get the inventory items from the database grouped by sGroupByField
		  dim sSearchCondition,sExcludeHiddenItemsCondition as String
		  dim sCondition,sOrder as String
		  
		  dim arsConditions() as String
		  
		  If sSearchValue <> "" Then arsConditions.Append( "li_name Like '%" + sSearchValue + "%'" )
		  If sConditionpar <> "" Then arsConditions.Append( sConditionpar )
		  
		  // Add in filters for item type
		  dim arsShowConditions() as string
		  dim sShowConditions as string
		  
		  If chbShowItems.Value Then arsShowConditions.Append( "'Item'" )
		  If chbShowPackages.Value Then arsShowConditions.Append( "'Package'" )
		  If chbShowLabor.Value Then arsShowConditions.Append( "'Labor'" )
		  
		  If arsShowConditions.Ubound <> -1 Then
		    arsShowConditions.Append( "''" )
		    sShowConditions = Join(arsShowConditions, ", ")
		  End If
		  If sShowConditions <> ""  Then sShowConditions = "( li_type In ( " + sShowConditions + " ) Or li_type Is Null ) "
		  If sShowConditions <> "" Then arsConditions.Append( sShowConditions )
		  
		  // Combine everthing together
		  If arsConditions.Ubound <> -1 Then sCondition = Join( arsConditions, " And " )
		  
		  aroRecords = DataFile.tbl_lineitems.List(sCondition,sOrderByFields)  '!@! Table Dependent !@!
		  
		  Return aroRecords
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methHandleExpandRow(row as integer)
		  dim lb1 as entListbox = lbItems  '!@! Table Dependent !@!
		  
		  // Extract the rowtag out of the parent
		  dim oParentRowTag as lbRowTag
		  oParentRowTag = lb1.RowTag(row)
		  
		  // Grab all the children
		  dim aroChildrenRowTag() as lbRowTag
		  aroChildrenRowTag() = oParentRowTag.aroChildren
		  
		  For Each oChild as lbRowTag In aroChildrenRowTag
		    
		    // Add a row
		    lb1.AddRow("")
		    
		    // Load the rowtag into the row
		    lb1.RowTag(lb1.LastIndex) = oChild
		    
		    // Load the row
		    methLoadRow(lb1.LastIndex,oChild)
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function methHandleMouseWheel(X As Integer, Y As Integer, DeltaX as Integer, DeltaY as Integer) As Boolean
		  _
		  
		  me.top = me.Top - DeltaY 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methListboxSettings()
		  _
		  
		  
		  // Set up some basic stuff
		  
		  // trigger event to allow me to set information externally
		  evdefListboxSettings(lbItems,dictCellTypes,dictFieldNames)
		  
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
		    s1 = "Name,Category,Description,Time,Rate,Qty,Price,Discount,Total,Tax"
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
		    s1 = "li_name,li_category,li_description,li_time,li_rate,li_quantity,li_price_cost,discount_amount_cost,li_total_cost,li_taxable"
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
		    sRowType = "Linked - version"
		    'field names
		    s1 = "li_name,li_category,li_description,li_time,li_rate,li_quantity,li_price_cost,discount_amount_cost,li_total_cost,li_taxable"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes4() as integer = Array(0,0,0,0,0,0,0,0,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes4
		    
		    
		    // LinkedItem - Contained
		    sRowType = "Linked - contained"
		    'field names
		    s1 = "li_name,li_category,li_description,li_time,li_rate,li_quantity,li_price_cost,discount_amount_cost,li_total_cost,li_taxable"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes5() as integer = Array(0,0,0,0,0,0,0,0,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes5
		    
		    // LinkedItem - Contained
		    sRowType = "Linked - kit"
		    'field names
		    s1 = "li_name,li_category,li_description,li_time,li_rate,li_quantity,li_price_cost,discount_amount_cost,li_total_cost,li_taxable"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes6() as integer = Array(0,0,0,0,0,0,0,0,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes6
		    
		    // LinkedItem - Contained
		    sRowType = "Linked - package"
		    'field names
		    s1 = "li_name,li_category,li_description,li_time,li_rate,li_quantity,li_price_cost,discount_amount_cost,li_total_cost,li_taxable"
		    s2() = Split(s1,",")
		    dictFieldNames.Value(sRowType) = s2
		    
		    'cell types
		    dim iCellTypes7() as integer = Array(0,0,0,0,0,0,0,0,0,0)
		    dictCellTypes.Value(sRowType) = iCellTypes7
		    
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methLoadMe()
		  dim IsGrouped as Boolean = bDisplayGrouped
		  
		  If oParentRecord <> Nil Then
		    methLoadMe_ExpandSingleRecord(oParentRecord)
		    Return
		  End If
		  
		  //UnGrouped
		  If Not IsGrouped Then
		    
		    // Get the records
		    dim records() as DataFile.tbl_lineitems = methGetRecordList_UnGrouped("li_department","fkeipl = " + oEIPLRecord.ipkid.ToText )    '!@! Table Dependent !@!
		    
		    // Build the rowtags
		    dim theRowtags() as lbRowTag
		    theRowtags = methCreateRowTags(records)
		    
		    methCreateTopLevelRows(theRowtags)
		    
		    //Grouped
		  ElseIf IsGrouped Then
		    
		    // Get the Records
		    dim dictRecords as Dictionary = methGetRecordList_Grouped("li_department", "fkeipl = " + oEIPLRecord.ipkid.ToText )    '!@! Table Dependent !@!
		    
		    dim theRowtagsGrouped() as lbRowTag
		    theRowtagsGrouped = methCreateRowTags_dict(dictRecords)
		    
		    methCreateTopLevelRows(theRowtagsGrouped)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methLoadMe_ExpandSingleRecord(oRecord as DataFile.tbl_lineitems)
		  '!@! Table Dependent In Parameters !@!
		  
		  If oRecord <> Nil Then
		    
		    oParentRecord = oRecord
		    
		    dim aroRecords() as DataFile.tbl_lineitems     '!@! Table Dependent !@!
		    aroRecords.Append(oRecord)
		    
		    // Create rowtags based of the record we want to expand
		    dim oRowTags() as lbRowTag
		    'oRowTags = methCreateRowTags(aroRecords)
		    
		    methCreateTopLevelRows(oRowTags(0).aroChildren)
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methLoadRow(RowIndex as integer, oRowTag as lbRowTag)
		  dim lb1 as entListbox = lbItems    '!@! Table Dependent !@!
		  
		  
		  
		  dim i1 as integer 
		  For Each vValue as Variant In oRowTag.vColumnValues
		    
		    lb1.CellType(RowIndex,i1) = oRowTag.iCellTypes(i1)
		    
		    Select Case lb1.CellType(RowIndex,i1)
		    Case 0 'default
		      lb1.Cell(RowIndex,i1) = vValue
		    Case 1 'text
		      lb1.Cell(RowIndex,i1) = vValue
		    Case 2 'CheckBox
		      If vValue = True then
		        lb1.CellState(RowIndex,i1) = CheckBox.CheckedStates.Checked
		      Else
		        lb1.CellState(RowIndex,i1) = CheckBox.CheckedStates.Unchecked
		      End If
		    Case 3 'edit text
		      lb1.Cell(RowIndex,i1) = vValue
		    Else
		      lb1.Cell(RowIndex,i1) = vValue
		    End Select
		    
		    i1 = i1 + 1
		  Next
		  
		  lb1.RowTag(RowIndex) = oRowTag
		  
		  // Make it a folder if neccessary
		  If oRowTag.isFolder Then
		    lb1.RowisFolder(RowIndex) = True
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event evdefConstructContextualMenu(base as MenuItem, x as integer, y as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event evdefContextualMenuAction(hitItem as MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event evdefDoubleClick() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event evdefListboxSettings(lbItems as entListbox, ByRef dictCellTypes as Dictionary, ByRef dictFieldNames as Dictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event evdefOpen()
	#tag EndHook


	#tag Property, Flags = &h0
		bDisplayGrouped As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bPickerMode As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		dictCellTypes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dictFieldNames As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		iStartingTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LastSearchValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastUIState As lbUIState
	#tag EndProperty

	#tag Property, Flags = &h0
		oEIPLRecord As DataFile.tbl_eipl
	#tag EndProperty

	#tag Property, Flags = &h0
		oParentRecord As DataFile.tbl_lineitems
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
		  
		  methHandleExpandRow(row)
		End Sub
	#tag EndEvent
	#tag Event
		Function entContextualMenuAction(hitItem as MenuItem) As Boolean
		  '!@! Table Dependent !@!
		  
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
		    
		    // Goal is to delete all selected rows allowing the user an option to apply their choice of whether or not to delete an item to all items
		    
		    dim sYesOrNoToAll as String
		    
		    // Loop through each row
		    For Each oRowTag as lbRowTag in oRowTags
		      
		      // Get the table record out of the rowtag
		      dim oRecord as DataFile.tbl_lineitems
		      If oRowTag.vtblRecord <> Nil Then
		        oRecord = oRowTag.vtblRecord
		      Else
		        Continue
		      End If
		      dim oLinkRecord as DataFile.tbl_internal_linking
		      If oRowTag.vLinkTable <> Nil Then
		        oLinkRecord = oRowTag.vLinkTable
		      Else
		        Continue
		      End If
		      
		      // Get the name of the item
		      dim sName as string
		      sName = oRecord.sli_name
		      
		      dim bDelete as Boolean
		      
		      If sYesOrNoToAll = "" Then
		        
		        // Prepare the prompt window
		        dim contDeletePromt as New contDeleteBreakPrompt
		        dim winWindow as New winFloatingWindow
		        winWindow.Width = contDeletePromt.Width
		        winWindow.Height = contDeletePromt.Height
		        
		        contDeletePromt.EmbedWithin(winWindow)
		        contDeletePromt.labMesgTop.Text = "Are you sure you want to break link to " + sName + "."
		        contDeletePromt.labMesgBottom.Text = ""
		        
		        // Display the window to the user
		        winWindow.ShowModal
		        
		        // Chekc the users response
		        bDelete = contDeletePromt.UserResponse
		        If contDeletePromt.propApplyToAll Then
		          If bDelete Then
		            sYesOrNoToAll = "Yes"
		          Else
		            sYesOrNoToAll = "No"
		          End If
		        End If
		        
		      ElseIf sYesOrNoToAll = "Yes" Then
		        bDelete = True
		      ElseIf sYesOrNoToAll = "No" Then
		        bDelete = False
		      End If
		      
		      // Carry out the users request
		      If bDelete Then
		        oLinkRecord.Delete
		      End If
		    Next
		    
		  Case "Delete Item"
		    
		    dim oRowTags() as lbRowTag
		    oRowTags = lbItems.GetSelectedRows
		    
		    // Goal is to delete all selected rows allowing the user an option to apply their choice of whether or not to delete an item to all items
		    
		    dim sYesOrNoToAll as String
		    
		    // Loop through each row
		    For Each oRowTag as lbRowTag in oRowTags
		      
		      // Get the table record out of the rowtag
		      dim oRecord as DataFile.tbl_lineitems
		      If oRowTag.vtblRecord <> Nil Then
		        oRecord = oRowTag.vtblRecord
		      Else
		        Continue
		      End If
		      
		      // Get the name of the item
		      dim sName as string
		      sName = oRecord.sli_name
		      
		      dim bDelete as Boolean
		      
		      If sYesOrNoToAll = "" Then
		        
		        // Prepare the prompt window
		        dim contDeletePromt as New contDeleteBreakPrompt
		        dim winWindow as New winFloatingWindow
		        winWindow.Width = contDeletePromt.Width
		        winWindow.Height = contDeletePromt.Height
		        
		        contDeletePromt.EmbedWithin(winWindow)
		        contDeletePromt.labMesgTop.Text = "Are you sure you want to delete " + sName + "."
		        contDeletePromt.labMesgBottom.Text = ""
		        
		        // Display the window to the user
		        winWindow.ShowModal
		        
		        // Chekc the users response
		        bDelete = contDeletePromt.UserResponse
		        If contDeletePromt.propApplyToAll Then
		          If bDelete Then
		            sYesOrNoToAll = "Yes"
		          Else
		            sYesOrNoToAll = "No"
		          End If
		        End If
		        
		      ElseIf sYesOrNoToAll = "Yes" Then
		        bDelete = True
		      ElseIf sYesOrNoToAll = "No" Then
		        bDelete = False
		      End If
		      
		      // Carry out the users request
		      If bDelete Then
		        oRecord.Delete
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
		  
		  dim boo as Boolean
		  boo = evdefContextualMenuAction(hitItem)
		End Function
	#tag EndEvent
	#tag Event
		Function entConstructContextualMenu(base as menuitem, x as integer, y as integer) As Boolean
		  '!@! Table Dependent !@!
		  
		  If lbItems.ListIndex <> -1 Then
		    
		    // Grab the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = lbItems.RowTag(lbItems.ListIndex)
		    
		    If oRowTag.vtblRecord <> Nil Then
		      
		      'base.Append( New MenuItem("Open") )
		      'base.Append( New MenuItem("Maintenance Logs") )
		      'base.Append( New MenuItem(MenuItem.TextSeparator) )
		      
		      If oRowTag.vLinkTable <> Nil Then
		        base.Append( New MenuItem("Break Link") )
		      End If
		      
		      base.Append( New MenuItem("Delete Item") )
		      
		    End If
		    
		    dim boo as Boolean
		    boo = evdefConstructContextualMenu(base, x, y)
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function evdefMouseWheel(X As Integer, Y As Integer, DeltaX as Integer, DeltaY as Integer) As Boolean
		  
		  Return methHandleMouseWheel(X,Y,DeltaX,DeltaY)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events bRefresh
	#tag Event
		Sub Action()
		  
		  dim oUIState as lbUIState
		  oUIState = lbItems.GetUIState
		  methLoadMe()
		  lbItems.ResetUIState(oUIState)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scSearchField
	#tag Event
		Sub Search()
		  dim sSearchValue as string
		  dim lb1 as entListbox = lbItems
		  
		  sSearchValue = scSearchField.Text
		  
		  If len(sSearchValue) <> 0 Then
		    ' there is something to be searched
		    
		    // Check if there used is a previous search value
		    If len(LastSearchValue) = 0 Then
		      ' Nothing was last searched
		      
		      // Get UIState
		      dim oUIState as lbUIState
		      oUIState = lb1.GetUIState
		      LastUIState = oUIState
		      
		    End If
		    
		  End If
		  
		  // Populate listbox with filterd inventory
		  methLoadMe()
		  
		  
		  If len(sSearchValue) = 0 Then
		    ' There is nothing in the search field
		    
		    If len(LastSearchValue) <> 0 Then
		      ' there is a previous search value
		      
		      // Close all the folders by passing a nil array
		      dim nilarray() as lbRowTag
		      lb1.reopenFolders(nilarray)
		      
		      If LastUIState <> Nil Then
		        lb1.ResetUIState(LastUIState)
		        LastUIState = Nil 
		      Else
		        
		      End If
		      
		    End If
		    
		  Else
		    '  there is something in the search field
		    
		    // Open all the top level folders
		    methExpandAllRows(True)
		    
		  End If
		  
		  
		  
		  
		  LastSearchValue = sSearchValue
		  
		  
		  
		  
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
		Name="bDisplayGrouped"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="bPickerMode"
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
		Name="iStartingTop"
		Group="Behavior"
		Type="Integer"
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
