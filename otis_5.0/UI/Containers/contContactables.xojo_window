#tag Window
Begin ContainerControl contContactables
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   336
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
   Width           =   536
   Begin PushButton bAddItem
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Add Item"
      Default         =   False
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   80
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
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
      TabIndex        =   1
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
   Begin entListbox lbContactables
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
      Height          =   315
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
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
      Top             =   23
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   536
   End
   Begin SearchControl scSeach
      AutoDeactivate  =   True
      Enabled         =   True
      HasCancelButton =   True
      HasMenu         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   389
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   0
      Visible         =   True
      Width           =   147
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
      Left            =   295
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   1
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   90
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub BuildRowTag(ByRef oRowTag as lbRowTag)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLbAttributes(Assigns oAttributes as entLbAttributes)
		  dim s1,s2(), sRowType as String
		  dim n1, n2() as integer
		  
		  // Check if a attribute class was passed to us
		  If oAttributes <> Nil Then
		    oLbAttributes = oAttributes
		  End If
		  
		  // Initialize our listbox attribute class
		  oLbAttributes = New entLbAttributes
		  
		  // Set up standard attributes for contactables listbox
		  oLbAttributes.iColumnCount = 4
		  
		  
		  // Headers
		  s2() = Split("Name,,Phone,Email", ",")
		  oLbAttributes.sHeaders = s2()
		  
		  lbContactables.Heading = oLbAttributes.sHeaders
		  
		  
		  // Folders
		  sRowType = "Folder"
		  oLbAttributes.dictFieldNames.Value(sRowType) = Array("")
		  
		  ReDim n2(-1)
		  ReDim n2(oLbAttributes.iColumnCount - 1)
		  oLbAttributes.dictCellTypes.Value(sRowType) = n2()
		  
		  
		  // Contacts
		  sRowType = "Contact"
		  s2() = Split("name_first,name_last,tbl_phone_numbers.sphone_number,tbl_email_addresses.semail_address", ",")
		  oLbAttributes.dictFieldNames.Value(sRowType) = s2()
		  
		  ReDim n2(-1)
		  n2() = Array( 0, 0, 0, 0 )
		  oLbAttributes.dictCellTypes.Value(sRowType) = n2()
		  
		  
		  // Venues
		  sRowType = "Venue"
		  s2() = Split("name_first,|SKIP|,tbl_phone_numbers.sphone_number,tbl_email_addresses.semail_address", ",")
		  oLbAttributes.dictFieldNames.Value(sRowType) = s2()
		  
		  ReDim n2(-1)
		  n2() = Array( 0, 0, 0, 0 )
		  oLbAttributes.dictCellTypes.Value(sRowType) = n2()
		  
		  
		  // Businesses
		  sRowType = "Business"
		  s2() = Split("name_first,|SKIP|,tbl_phone_numbers.sphone_number,tbl_email_addresses.semail_address", ",")
		  oLbAttributes.dictFieldNames.Value(sRowType) = s2()
		  
		  ReDim n2(-1)
		  n2() = Array( 0, 0, 0, 0 )
		  oLbAttributes.dictCellTypes.Value(sRowType) = n2()
		  
		  
		  // Link Type Folder
		  sRowType = "LinkTypeFolder"
		  s2() = Array("")
		  oLbAttributes.dictFieldNames.Value(sRowType) = s2()
		  
		  ReDim n2(-1)
		  ReDim n2(oLbAttributes.iColumnCount - 1)
		  oLbAttributes.dictCellTypes.Value(sRowType) = n2()
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bJustChildren As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		iJustChildrenOf As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		oLbAttributes As entLbAttributes
	#tag EndProperty


#tag EndWindowCode

#tag Events bAddItem
	#tag Event
		Sub Action()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bRefresh
	#tag Event
		Sub Action()
		  
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
		Name="iJustChildrenOf"
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
