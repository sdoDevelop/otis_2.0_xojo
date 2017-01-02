#tag Window
Begin ContainerControl ccPageList
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   30
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub NewPage(lbl as String)
		  if lbl = "<<" then
		    RaiseEvent FirstPage
		  elseif lbl = ">>" then
		    RaiseEvent LastPage
		  else
		    RaiseEvent NewPage val(lbl)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPage(iCurrentPage as integer, iMaxPages as Integer)
		  miCurrentPage = iCurrentPage
		  miMax = iMaxPages
		  
		  Setup
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup()
		  dim oPage as ccPage
		  dim iLeft as integer = 0
		  //clear the array
		  for i as integer = maroPages.Ubound downto 0
		    maroPages(i).Visible = false
		    maroPages(i).close
		    maroPages.Remove i
		  next
		  
		  //Just in case
		  redim maroPages(-1)
		  
		  //Add our 'Beginning' one
		  dim bEnabled as boolean
		  bEnabled = miCurrentPage <> 1
		  oPage = new ccPage(self, "<<", false, bEnabled)
		  oPage.EmbedWithin self, iLeft, 0
		  maroPages.Append oPage
		  iLeft = iLeft + oPage.width + iSpacing
		  
		  //We have 10 spaces to use.
		  dim iStartCount as integer
		  dim iEndCount as integer
		  
		  //Get our starting and ending page counts
		  if miMax <= 10 then
		    //If we have 10 pages or less than no big deal.  Do them all.
		    iStartCount = 1
		    iEndCount = miMax
		  else
		    //If we have MORe than 10 pages then take the current page and make it the 3rd from the left
		    iStartCount = max(1, miCurrentPage - 3)
		    iEndCount = iStartCount + 9
		    if iEndCount > miMax then
		      iEndCount = miMax
		      iStartCount = iEndCount - 9
		    end
		  end
		  
		  for i as integer = iStartCount to iEndCount
		    dim bCurrentPage as boolean = (i = miCurrentPage)
		    oPage = new ccPage(self, cstr(i),bCurrentPage, true)
		    oPage.EmbedWithin self, iLeft, 0
		    maroPages.Append oPage
		    iLeft = iLeft + oPage.width + iSpacing
		  next
		  
		  //Add our 'End' One
		  bEnabled = miCurrentPage <> miMax
		  oPage = new ccPage(self, ">>", false, bEnabled)
		  oPage.EmbedWithin self, iLeft, 0
		  maroPages.Append oPage
		  iLeft = iLeft + oPage.width + iSpacing
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FirstPage()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LastPage()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NewPage(iNewPage as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		iSpacing As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		maroPages() As ccPage
	#tag EndProperty

	#tag Property, Flags = &h0
		miCurrentPage As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		miMax As Integer
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
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
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
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
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
		Name="iSpacing"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
		Name="miCurrentPage"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="miMax"
		Group="Behavior"
		Type="Integer"
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
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
