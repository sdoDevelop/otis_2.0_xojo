#tag Window
Begin ContainerControl contEventContactablesList
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   224
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   338
   Begin entListbox lbContactables
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
      Height          =   224
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
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   338
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub methLoadMe()
		  dim db1 as SQLiteDatabase = app.db
		  
		  lbContactables.DeleteAllRows
		  
		  // First lets grab all of the records from the database that are related to this event
		  dim rs1 as RecordSet
		  dim sql1 as string
		  
		  sql1 = "Select c.pkid, c.name_first, c.name_last,c.type "_
		  + "From tbl_contactables as c "_
		  + "Inner Join tbl_internal_linking as il on ( c.pkid = il.fk_child ) "_
		  + "Inner Join tbl_events as e on ( il.fk_parent = e.pkid ) "_
		  + "Where e.pkid = " + EventID.ToText + ";"
		  
		  rs1 = db1.SQLSelect(sql1)
		  If db1.Error Then
		    System.DebugLog( "Cant get contacts related to event: " + db1.ErrorMessage )
		    Return
		  End If
		  
		  If rs1.RecordCount > 0 Then
		    
		    For iRecordIndex as integer = 1 To rs1.RecordCount
		      
		      lbContactables.AddRow( rs1.Field("name_first").StringValue, rs1.Field("name_last").StringValue, rs1.Field("type").StringValue )
		      
		      dim oRowTag as New lbRowTag
		      oRowTag.pkid = rs1.Field("pkid").Value
		      
		      lbContactables.RowTag(lbContactables.LastIndex) = oRowTag
		      
		      rs1.MoveNext
		      
		    Next
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub methRefresh()
		  
		  dim oUIState as lbUIState
		  oUIState = lbContactables.GetUIState
		  methLoadMe()
		  lbContactables.ResetUIState(oUIState)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		EventID As Int64
	#tag EndProperty


#tag EndWindowCode

#tag Events lbContactables
	#tag Event
		Sub Open()
		  
		  // Lets set up our headers
		  me.ColumnCount = 3
		  me.Heading = Array("Name"," ","Type")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  dim oRowTag as lbRowTag
		  
		  If lbContactables.ListIndex <> -1 Then
		    
		    oRowTag = lbContactables.RowTag( lbContactables.ListIndex )
		    
		    // load up a inventory item container
		    dim conInst as New contContactable
		    dim oTabPanel as PagePanel = app.MainWindow.tbMainWindow
		    
		    app.MainWindow.AddTab( lbContactables.Cell(lbContactables.ListIndex,0) )
		    
		    conInst.EmbedWithinPanel(oTabPanel,oTabPanel.PanelCount - 1 )
		    
		    conInst.LoadMe(oRowTag.pkid)
		    
		  End If
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
		Name="EventID"
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
