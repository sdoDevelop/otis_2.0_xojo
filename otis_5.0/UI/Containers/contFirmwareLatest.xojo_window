#tag Window
Begin ContainerControl contFirmwareLatest
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   52
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
   Width           =   198
   Begin DateControl dcUpdateDate
      AutoDeactivate  =   True
      Checked         =   False
      DateFormat      =   0
      Day             =   0
      DropDownIcon    =   0
      DropDownIconRetina=   0
      EmptyDates      =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   83
      LinuxDropDownMode=   True
      LinuxFontBold   =   False
      LinuxTextFont   =   "System"
      LinuxTextSize   =   0.0
      LinuxTextUnit   =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacFontBold     =   False
      MacTextFont     =   "System"
      MacTextSize     =   0.0
      Month           =   0
      OSXDropDownMode =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   115
      WinFontBold     =   False
      WinTextFont     =   "System"
      WinTextSize     =   0.0
      WinTextUnit     =   0
      Year            =   0
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
      Left            =   -14
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Updated On"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   85
   End
   Begin Label labVersion
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
      Left            =   -14
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Version"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   26
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   85
   End
   Begin TextField tfVersion
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
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   83
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   25
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   115
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  base.Append( New MenuItem("Open Firmware Page") )
		  base.Append( New MenuItem( MenuItem.TextSeparator ) ) 
		  base.Append( New MenuItem("Add Firmware Update") )
		  
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  
		  Select Case hitItem.Text
		  Case "Open Firmware Page"
		    
		    dim contFirmware1 as New contFirmware
		    
		    app.MainWindow.AddTab("Firmware")
		    contFirmware1.EmbedWithinPanel(app.MainWindow.tbMainWindow, app.MainWindow.tbMainWindow.PanelCount - 1)
		    
		    contFirmware1.LoadUniversalInfo( ifkInventory )
		    
		  Case "Add Firmware Update"
		    
		    dim contFirmware1 as New contFirmware
		    
		    app.MainWindow.AddTab("Firmware")
		    contFirmware1.EmbedWithinPanel(app.MainWindow.tbMainWindow, app.MainWindow.tbMainWindow.PanelCount - 1)
		    
		    contFirmware1.LoadUniversalInfo( ifkInventory )
		    contFirmware1.AddLog
		    
		  End Select
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub EnableDisableLogFields(EnabledState as Boolean)
		  
		  
		  dcUpdateDate.Enabled = EnabledState
		  labUpdateDate.Enabled = EnabledState
		  labVersion.Enabled = EnabledState
		  tfVersion.Enabled = EnabledState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadMe(iInventoryPKID as Int64)
		  
		  'ifkInventory = iInventoryPKID
		  if iInventoryPKID = 0 Then ifkInventory = -1 Else ifkInventory = iInventoryPKID
		  
		  // Check for any firmware update records
		  dim oFirmwareRecords() as DataFile.tbl_firmware
		  dim sCondition,sOrder as string
		  sCondition = "fk_inventory = " + ifkInventory.ToText
		  sOrder = "date(update_date)"
		  oFirmwareRecords() = DataFile.tbl_firmware.List(sCondition,sOrder)
		  
		  If oFirmwareRecords.Ubound = -1 Then
		    
		    EnableDisableLogFields(False)
		    
		  Else
		    ' there are logs
		    
		    oFirmwareRecord = oFirmwareRecords(oFirmwareRecords.Ubound)
		    
		    EnableDisableLogFields(True)
		    
		    
		    tfVersion.Text = oFirmwareRecord.sfirmware_version
		    
		    If oFirmwareRecord.supdate_date = "" Then
		      dim d1 as date
		      dcUpdateDate.DateValue = d1
		    Else
		      dim d1 as New date
		      d1.SQLDate = oFirmwareRecord.supdate_date
		      dcUpdateDate.DateValue = d1
		    End If
		    
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ifkInventory As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		oFirmwareRecord As DataFile.tbl_firmware
	#tag EndProperty


#tag EndWindowCode

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
