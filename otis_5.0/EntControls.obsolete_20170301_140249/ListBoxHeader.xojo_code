#tag Class
Protected Class ListBoxHeader
Inherits Canvas
	#tag Event
		Sub Close()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return false
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  return false
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim i as integer
		  dim x as integer
		  dim xp as integer
		  dim yp as integer
		  dim w as integer
		  dim cint as single
		  dim clr as single
		  dim c1 as single=&hff
		  dim c2 as single=&he0
		  
		  if xParent=nil then exit sub
		  
		  left=xParent.left
		  width=xParent.width
		  height=xParent.rowheight
		  top=xParent.top-height+1
		  g.TextFont=xParent.TextFont
		  g.TextSize=xParent.TextSize
		  cint=(c1-c2)/(g.height\2)
		  'msgbox str(cint)
		  g.ForeColor=&ce8e8e8
		  g.fillrect 0,0,g.width,g.height
		  clr=c1
		  for i=0 to g.height
		    g.ForeColor=rgb(clr,clr,clr)
		    g.drawline 0,i,g.width,i
		    if i=floor(g.height/2) then cint=-cint
		    clr=clr-cint
		  next i
		  g.ForeColor=&cc3c3c3
		  g.drawrect 0,0,g.width,g.height
		  
		  x=0
		  
		  yp=((g.height-g.TextHeight)/2)+g.TextAscent
		  for i=0 to xParent.ColumnCount-1
		    w=xParent.Column(i).WidthActual
		    if x>0 then g.drawline x,0,x,g.height
		    if i<=xHeader.ubound then 
		      xp=x+(w-g.StringWidth(xHeader(i)))/2
		      g.ForeColor=&c000000
		      g.drawstring xheader(i),xp,yp,w,True
		    end if
		    g.ForeColor=&cc3c3c3
		    x=x+w
		  next i
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add_Header(s as string)
		  xheader.append s
		  refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add_Header(s as string,index as integer)
		  while index<xHeader.ubound
		    Add_Header ""
		  wend
		  add_header s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Attach_to_Listbox(lb as listbox)
		  xparent=lb
		  refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Header(index as integer) As string
		  if index<=xHeader.ubound then 
		    return xHeader(index)
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Header(index as integer,assigns newvalue as string)
		  if index<=xHeader.ubound then 
		    xheader(index)=newvalue
		    refresh
		  else
		    Add_Header newvalue,index
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove_Header(index as integer)
		  if index>=0 and index<=xheader.Ubound then 
		    xHeader.remove index
		    refresh
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private xHeader(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xParent As Listbox
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
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
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
