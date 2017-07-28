#tag Window
Begin ContainerControl contPayment
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   104
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
   Width           =   250
   Begin Label labPaymentType
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
      Left            =   3
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Payment Type"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   3
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu pmPaymentType
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   108
      ListIndex       =   0
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
      Top             =   2
      Underline       =   False
      Visible         =   True
      Width           =   139
   End
   Begin Label labPaymentDate
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
      Left            =   3
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Payment Date"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   28
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin DateControl dcPaymentDate
      AutoDeactivate  =   True
      Checked         =   True
      DateFormat      =   0
      Day             =   0
      DropDownIcon    =   0
      DropDownIconRetina=   0
      EmptyDates      =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   108
      LinuxDropDownMode=   True
      LinuxFontBold   =   False
      LinuxTextFont   =   "System"
      LinuxTextSize   =   0.0
      LinuxTextUnit   =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacFontBold     =   False
      MacTextFont     =   "System"
      MacTextSize     =   0.0
      Month           =   0
      OSXDropDownMode =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   28
      Visible         =   True
      Width           =   139
      WinFontBold     =   False
      WinTextFont     =   "System"
      WinTextSize     =   0.0
      WinTextUnit     =   0
      Year            =   0
   End
   Begin Label labPaymentAmount
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
      Left            =   3
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Payment Amount"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField tfPaymentAmount
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
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
      Left            =   108
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   139
   End
   Begin Label labPaymentMemo
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
      Left            =   3
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
      Text            =   "Payment Memo"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField tfPaymentMemo
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
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
      Left            =   108
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
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   77
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   139
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub methLoadControls()
		  
		  
		  If oCurrentRecord <> Nil Then
		    
		    dim sType as string = oCurrentRecord.spayment_type
		    For i1 as integer = 0 To pmPaymentType.ListCount - 1
		      If pmPaymentType.List(i1) = sType Then
		        pmPaymentType.ListIndex = i1
		        exit
		      End If
		    Next
		    
		    // Dates Times
		    dim dt1 as New Date
		    dim dtString, timeString as string
		    If oCurrentRecord.spayment_date = "" Then
		      dtString = dt1.SQLDate
		      dcPaymentDate.DateValue = Nil
		    Else
		      dtString = oCurrentRecord.spayment_date
		      dim dat1 as Date = CreateZeroOffsetDate
		      dat1.SQLDateTime = dtString + " 11:11:11"
		      dcPaymentDate.DateValue = dat1
		    End If
		    
		    tfPaymentAmount.Text = str( oCurrentRecord.spayment_amount, modFieldFormatting.tbl_payments.payment_amount )
		    
		    tfPaymentMemo.Text = str( oCurrentRecord.spayment_memo, modFieldFormatting.tbl_payments.payment_memo )
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methLoadMe()
		  
		  methLoadControls
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		oCurrentRecord As DataFile.tbl_payments
	#tag EndProperty


#tag EndWindowCode

#tag Events pmPaymentType
	#tag Event
		Sub Open()
		  
		  dim s1() as string = ValueRef.PaymentTypes.Split(",")
		  For Each sType as string In s1()
		    pmPaymentType.AddRow(sType)
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  
		  dim s1 as string
		  
		  s1 = me.Text
		  
		  oCurrentRecord.spayment_type = s1
		  oCurrentRecord.Save
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events dcPaymentDate
	#tag Event
		Sub LostFocus()
		  dim d1 as Date
		  dim s1 as string
		  
		  If me.Checked Then
		    d1 = me.DateValue
		    s1 = d1.SQLDate
		  Else 
		    s1 = ""
		  End If
		  
		  oCurrentRecord.spayment_date = s1
		  oCurrentRecord.Save
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfPaymentAmount
	#tag Event
		Sub LostFocus()
		  
		  dim s1 as string = methods.StripNonDigitsDecimals( me.Text )
		  
		  oCurrentRecord.spayment_amount = s1
		  oCurrentRecord.Save
		  
		  me.Text = str( oCurrentRecord.spayment_amount, modFieldFormatting.tbl_payments.payment_amount )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfPaymentMemo
	#tag Event
		Sub LostFocus()
		  
		  oCurrentRecord.spayment_memo = me.Text
		  oCurrentRecord.Save
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
