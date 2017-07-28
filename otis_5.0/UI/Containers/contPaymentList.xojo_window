#tag Window
Begin ContainerControl contPaymentList
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   238
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
   Width           =   338
   Begin PushButton pbRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      Height          =   22
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
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   3
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbAddPayment
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Add"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   84
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
      Top             =   3
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin entListbox lbPayments
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
      Height          =   206
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   29
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   331
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub methAddPayment()
		  
		  If oEIPLRecord <> Nil Then
		    dim oNewPayment as New DataFile.tbl_payments
		    oNewPayment.ifkeipl = oEIPLRecord.ipkid
		    oNewPayment.Save
		    
		    dim instPayment as New contPayment
		    dim instFlWindow as New winFloatingWindow
		    
		    instFlWindow.Width = instPayment.Width
		    instFlWindow.Height = instPayment.Height
		    
		    instPayment.oCurrentRecord = oNewPayment
		    instPayment.EmbedWithin(instFlWindow)
		    instPayment.methLoadMe
		    
		    instFlWindow.Top = MouseY
		    instFlWindow.Left = MouseX
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methLoadMe()
		  
		  lbPayments.DeleteAllRows
		  
		  If oEIPLRecord <> Nil Then 
		    
		    // Get all the payments that are related to this eipl
		    dim oPayments() as DataFile.tbl_payments = DataFile.tbl_payments.List("fkeipl = " + oEIPLRecord.ipkid.ToText )
		    
		    For Each oPayment as DataFile.tbl_payments In oPayments()
		      
		      dim sType, sDate, sAmount as String
		      sType = str( oPayment.spayment_type, modFieldFormatting.tbl_payments.payment_type )
		      sDate = str( oPayment.spayment_date, modFieldFormatting.tbl_payments.payment_date )
		      sAmount = str( oPayment.spayment_amount, modFieldFormatting.tbl_payments.payment_amount )
		      dim vValues() as Variant
		      vValues.Append(sType)
		      vValues.Append(sDate)
		      vValues.Append(sAmount)
		      
		      // Build a rowtag for this record
		      dim oRowTag as New lbRowTag
		      oRowTag.pkid = oPayment.ipkid
		      oRowTag.vtblRecord = oPayment
		      oRowTag.vColumnValues = vValues
		      
		      // Add the row
		      lbPayments.AddRow( oRowTag.vColumnValues ) 'sType, sDate, sAmount )
		      lbPayments.RowTag( lbPayments.LastIndex ) = oRowTag
		      
		    Next
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methRefresh()
		  
		  dim oUIState as lbUIState
		  oUIState = lbPayments.GetUIState
		  methLoadMe()
		  lbPayments.ResetUIState(oUIState)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		oEIPLRecord As DataFile.tbl_eipl
	#tag EndProperty


#tag EndWindowCode

#tag Events pbRefresh
	#tag Event
		Sub Action()
		  methRefresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAddPayment
	#tag Event
		Sub Action()
		  methAddPayment
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbPayments
	#tag Event
		Sub Open()
		  
		  // Lets set up our headers
		  me.ColumnCount = 3
		  me.Heading = Array("Type","Date","Amount")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  
		  
		  If lbPayments.ListIndex <> -1 Then
		    
		    dim oRowTag as lbRowTag = lbPayments.RowTag( lbPayments.ListIndex )
		    
		    If oRowTag <> Nil Then
		      
		      If oRowTag.vtblRecord <> Nil THen
		        
		        dim oPayment as DataFile.tbl_payments = oRowTag.vtblRecord
		        
		        dim instPayment as New contPayment
		        dim instFlWindow as New winFloatingWindow
		        
		        instFlWindow.Width = instPayment.Width
		        instFlWindow.Height = instPayment.Height
		        
		        instPayment.oCurrentRecord = oPayment
		        instPayment.EmbedWithin(instFlWindow)
		        instPayment.methLoadMe
		        
		        instFlWindow.Top = MouseY
		        instFlWindow.Left = MouseX
		        
		      End If
		      
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function entConstructContextualMenu(base as menuitem, x as integer, y as integer) As Boolean
		  
		  dim mi1 as New MenuItem("Delete")
		  mi1.Enabled = True
		  base.Append( mi1 )
		End Function
	#tag EndEvent
	#tag Event
		Function entContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  
		  Select Case hitItem.Text
		  Case "Delete"
		    
		    
		    dim oRowTags() as lbRowTag
		    oRowTags = lbPayments.GetSelectedRows
		    
		    // Goal is to delete all selected rows allowing the user an option to apply their choice of whether or not to delete an item to all items
		    
		    dim sYesOrNoToAll as String
		    
		    // Loop through each row
		    For Each oRowTag as lbRowTag in oRowTags
		      
		      // Get the table record out of the rowtag
		      dim oRecord as DataFile.tbl_payments
		      If oRowTag.vtblRecord <> Nil Then
		        oRecord = oRowTag.vtblRecord
		      Else
		        Continue
		      End If
		      
		      dim bDelete as Boolean
		      
		      If sYesOrNoToAll = "" Then
		        
		        // Prepare the prompt window
		        dim contDeletePromt as New contDeleteBreakPrompt
		        dim winWindow as New winFloatingWindow
		        winWindow.Width = contDeletePromt.Width
		        winWindow.Height = contDeletePromt.Height
		        
		        contDeletePromt.EmbedWithin(winWindow)
		        contDeletePromt.labMesgTop.Text = "Are you sure you want to delete the " + oRecord.spayment_type + " payment of "_
		        + str( oRecord.spayment_amount, modFieldFormatting.tbl_payments.payment_amount )
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
		    
		  End Select
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
