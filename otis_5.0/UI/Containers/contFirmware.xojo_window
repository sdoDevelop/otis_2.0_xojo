#tag Window
Begin ContainerControl contFirmware
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   250
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
   Width           =   552
   Begin entListbox lbLogs
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
      Height          =   220
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   30
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   217
   End
   Begin PushButton pbAddLog
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "+"
      Default         =   True
      Enabled         =   True
      Height          =   32
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin PushButton pbRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Ref"
      Default         =   False
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   37
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
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   34
   End
   Begin Label labUpdateDate
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
      Left            =   229
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
      TabStop         =   True
      Text            =   "Update Date"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   58
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin DateControl dcUpdateDate
      AutoDeactivate  =   "True"
      Checked         =   "False"
      DateFormat      =   "0"
      Day             =   "0"
      DropDownIcon    =   "0"
      DropDownIconRetina=   "0"
      EmptyDates      =   "True"
      Enabled         =   False
      Height          =   "23"
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   "325"
      LinuxDropDownMode=   "True"
      LinuxFontBold   =   "False"
      LinuxTextFont   =   "System"
      LinuxTextSize   =   "0.0"
      LinuxTextUnit   =   "0"
      LockBottom      =   "False"
      LockedInPosition=   False
      LockLeft        =   "True"
      LockRight       =   "False"
      LockTop         =   "True"
      MacFontBold     =   "False"
      MacTextFont     =   "System"
      MacTextSize     =   "0.0"
      Month           =   "0"
      OSXDropDownMode =   "True"
      Scope           =   0
      TabIndex        =   "6"
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   "58"
      Visible         =   True
      Width           =   "115"
      WinFontBold     =   "False"
      WinTextFont     =   "System"
      WinTextSize     =   "0.0"
      WinTextUnit     =   "0"
      Year            =   "0"
   End
   Begin Label labItemName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   229
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Item Name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   20.0
      TextUnit        =   0
      Top             =   -2
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   362
   End
   Begin Label labSerialLabel
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
      Left            =   229
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Serial #: "
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   26
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   45
   End
   Begin Label labSerial
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
      Left            =   276
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "--"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   26
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label labFirmwareVersion
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
      Left            =   229
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Version"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   91
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin TextField tfFirmwareVersion
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFF00FF
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   324
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   90
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   116
   End
   Begin Label labFirmwareComments
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
      Left            =   229
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Comments"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   124
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin TextArea taFirmwareComments
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFF00FF
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   80
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   324
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   123
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   215
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AddLog()
		  
		  // Create a new Log record
		  tfFirmwareVersion.SetFocus
		  dim oNewLog as New DataFile.tbl_firmware
		  oCurrentLog = oNewLog
		  ClearFields
		  
		  oCurrentLog.ifk_inventory = ifkInventory
		  EnableDisableLogFields(True)
		  tfFirmwareVersion.Text = "0.0.0"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildRowTag(oLog as DataFile.tbl_firmware) As lbRowTag
		  dim oRowTag as New lbRowTag
		  
		  
		  oRowTag.pkid = oLog.ipkid
		  oRowTag.vtblRecord = oLog
		  
		  dim jsFieldValues as JSONItem = oLog.GetMyFieldValues(True)
		  
		  For i1 as Integer = 0 To sFieldNames.Ubound
		    oRowTag.vColumnValues.Append(jsFieldValues.Value(sFieldNames(i1)))
		  Next
		  
		  Return oRowTag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearFields()
		  
		  
		  dcUpdateDate.DateValue = Nil
		  tfFirmwareVersion.Text = ""
		  taFirmwareComments.Text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem(iPKID as int64)
		  
		  
		  
		  If MsgBox("Are you sure you want to delete " + lbLogs.Cell(lbLogs.ListIndex,0), 4) = 6 Then
		    
		    dim otblObject as DataFile.tbl_firmware = DataFile.tbl_firmware.FindByID(iPKID)
		    
		    otblObject.Delete
		    
		    dim n1 as integer = lbLogs.FindByPKID(iPKID)
		    If  n1 <> -1 Then
		      lbLogs.RemoveRow(n1)
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableDisableLogFields(EnabledState as Boolean)
		  
		  
		  dcUpdateDate.Enabled = EnabledState
		  tfFirmwareVersion.Enabled = EnabledState
		  taFirmwareComments.Enabled = EnabledState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadLog(iPKID as int64)
		  dim oLog as DataFile.tbl_firmware
		  
		  oLog = DataFile.tbl_firmware.FindByID(iPKID)
		  oCurrentLog = oLog
		  
		  
		  If oLog.supdate_date <> "" Then
		    dim d1 as New date 
		    d1.SQLDate = oLog.supdate_date
		    dcUpdateDate.DateValue = d1
		  Else
		    dim d1 as date
		    dcUpdateDate.DateValue = d1
		  End If
		  
		  tfFirmwareVersion.Text = oLog.sfirmware_version
		  taFirmwareComments.Text = oLog.supdate_comments
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(row as integer, oRowTag as lbRowTag)
		  
		  lbLogs.RowTag(row) = oRowTag
		  
		  // Populate cells
		  For i1 as integer = 0 To sFieldNames.ubound
		    lbLogs.Cell(row,i1) = oRowTag.vColumnValues(i1)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadUniversalInfo(iInventoryPKID as int64)
		  
		  
		  
		  'ifkInventory = iInventoryPKID
		  if iInventoryPKID = 0 Then ifkInventory = -1 Else ifkInventory = iInventoryPKID
		  
		  // populate the log list
		  oLogList() = DataFile.tbl_firmware.List("fk_inventory = " + iInventoryPKID.ToText )
		  
		  lbLogs.DeleteAllRows
		  
		  // Loop through the list 
		  For Each oLog as DataFile.tbl_firmware In oLogList()
		    
		    // Add a row for the log
		    lbLogs.AddRow("")
		    
		    // Build the rowtag
		    dim oRowTag as lbRowTag
		    oRowTag = BuildRowTag(oLog)
		    
		    // Load the row
		    LoadRow(lbLogs.LastIndex,oRowTag)
		    
		  Next
		  
		  // Load the Inventory Item 
		  oInventoryRecord = DataFile.tbl_inventory.FindByID(iInventoryPKID)
		  
		  // Load rows realted to the inventory item 
		  labItemName.Text = oInventoryRecord.sitem_name
		  labSerial.Text = oInventoryRecord.sitem_serial_code
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshLogList()
		  dim iSelectedPKID as int64
		  
		  If lbLogs.ListIndex <> -1 Then
		    dim oRowTag as lbRowTag
		    oRowTag = lbLogs.RowTag(lbLogs.ListIndex)
		    iSelectedPKID = oRowTag.pkid
		  End If
		  
		  LoadUniversalInfo(ifkInventory)
		  
		  If iSelectedPKID <> 0 Then
		    
		    dim n1 as integer = lbLogs.FindByPKID(oCurrentLog.ipkid)
		    If n1 <> -1 Then
		      lbLogs.ListIndex = n1
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveLog()
		  
		  If oCurrentLog <> Nil Then
		    oCurrentLog.Save
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		iColumnTypes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iCurrentLogPKID As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		ifkInventory As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		oCurrentLog As DataFile.tbl_firmware
	#tag EndProperty

	#tag Property, Flags = &h0
		oInventoryRecord As DataFile.tbl_inventory
	#tag EndProperty

	#tag Property, Flags = &h0
		oLogList() As DataFile.tbl_firmware
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeaders() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events lbLogs
	#tag Event
		Sub Open()
		  dim s1, s2() as string
		  
		  me.ColumnCount = 2
		  
		  For i1 as integer = 0 To me.ColumnCount - 1
		    me.ColumnType(i1) = 0
		  Next
		  
		  // Set header names
		  s1 = "Date,Version"
		  s2 = Split(s1,",")
		  sHeaders = s2
		  me.Heading = s2
		  
		  // Set Field Names 
		  s1 = "update_date,firmware_version"
		  s2 = Split(s1,",")
		  sFieldNames = s2
		  
		  dim n1,n2() as integer
		  n2 = Array(0)
		  iColumnTypes = n2
		  me.ColumnType = n2
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  If lbLogs.ListIndex <> -1 Then
		    
		    dim oRowTag as lbRowTag
		    oRowTag = lbLogs.RowTag(lbLogs.ListIndex)
		    
		    LoadLog(oRowTag.pkid)
		    
		    EnableDisableLogFields(True)
		    
		  Else
		    EnableDisableLogFields(False)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  
		  base.Append( New MenuItem( "Delete" ) )
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  Select Case hitItem.Text
		  Case "Delete"
		    
		    If lbLogs.ListIndex <> -1 Then
		      
		      // Get the rowtag
		      dim oRowTag as lbRowTag
		      oRowTag = lbLogs.RowTag(lbLogs.ListIndex)
		      
		      // Extract the table record
		      dim oRecord as DataFile.tbl_firmware
		      oRecord = oRowTag.vtblRecord
		      
		      dim n1 as integer 
		      n1 = MsgBox("Are you sure you want to delete the log from: " + oRecord.supdate_date,4 )
		      
		      Select Case n1
		      Case 6
		        'yes
		        oRecord.Delete
		        lbLogs.RemoveRow(lbLogs.ListIndex)
		      Case 7
		        'no
		        Return True
		      End Select
		      
		      
		    End If
		    
		  End Select
		  
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pbAddLog
	#tag Event
		Sub Action()
		  AddLog
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbRefresh
	#tag Event
		Sub Action()
		  RefreshLogList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events dcUpdateDate
	#tag Event
		Sub LostFocus()
		  
		  If me.Checked Then
		    oCurrentLog.supdate_date = me.DateValue.SQLDate
		  Else
		    oCurrentLog.supdate_date = ""
		  End If
		  
		  SaveLog
		  
		  
		  RefreshLogList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfFirmwareVersion
	#tag Event
		Sub LostFocus()
		  
		  oCurrentLog.sfirmware_version = me.Text
		  SaveLog
		  
		  RefreshLogList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events taFirmwareComments
	#tag Event
		Sub LostFocus()
		  
		  oCurrentLog.supdate_comments = me.Text
		  SaveLog
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
		Name="iCurrentLogPKID"
		Group="Behavior"
		Type="Int64"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ifkInventory"
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
