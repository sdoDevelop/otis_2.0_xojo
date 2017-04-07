#tag Module
Protected Module modGlobals
	#tag Method, Flags = &h0
		Sub AddRowAndTag(extends PM as PopupMenu, sText as string, vValue as variant)
		  'use this to add a row to a popup menu and set its rowtag property.
		  pm.AddRow sText
		  pm.RowTag(pm.ListCount-1) = vValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Alert(Type as AlertTypes, Title as string, msg as string, btn1txt as string, btn2txt as string, btn3txt as string, w as window = nil)
		  dim i as integer =  Alert(type, title, msg, btn1txt, btn2txt, btn3txt, w)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Alert(Type as AlertTypes, Title as string, msg as string, btn1txt as string, btn2txt as string, btn3txt as string, w as window = nil) As integer
		  Dim d as New MessageDialog  //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  
		  select case Type
		  case AlertTypes.kCaution
		    d.icon=MessageDialog.GraphicCaution   //display warning icon
		  case AlertTypes.kNote
		    d.icon = MessageDialog.GraphicNote
		  case AlertTypes.kStop
		    d.icon = MessageDialog.GraphicStop
		  case AlertTypes.kPlain
		    d.icon = MessageDialog.GraphicNone
		  case AlertTypes.kQuestion
		    d.icon = MessageDialog.GraphicQuestion
		  end
		  
		  
		  d.ActionButton.Caption= btn1txt
		  
		  if btn2txt <> "" then
		    d.CancelButton.Visible= True     //show the Cancel button
		    d.CancelButton.Caption = btn2txt
		  else
		    d.CancelButton.Visible = false
		  end
		  
		  if btn3txt <> "" then
		    d.AlternateActionButton.Visible= True   //show the "Don't Save" button
		    d.AlternateActionButton.Caption = btn3txt
		  else
		    d.AlternateActionButton.Visible = false
		  end
		  
		  d.Message = Title
		  d.Explanation = msg
		  if w = nil then
		    b=d.ShowModal    //display the dialog
		  else
		    b = d.ShowModalWithin( w )
		  end
		  
		  Select Case b //determine which button was pressed.
		  Case d.ActionButton
		    return 1
		  Case d.AlternateActionButton
		    return 3
		  Case d.CancelButton
		    return 2
		  End select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildEncoding(Extends s as string) As String
		  if Encoding(s)=nil then
		    return  DefineEncoding(s, Encodings.UTF8)
		  else
		    return  ConvertEncoding(s, Encodings.UTF8)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CBool(v as Variant) As boolean
		  if v.type = v.TypeString then 'string
		    Select case v.StringValue.Lowercase
		    case "t","true","y","yes","on","1"
		      Return true
		    case else
		      Return false
		    end Select
		    
		  elseif v.Type = v.TypeInteger then 'integer
		    if v <> 0 then
		      Return true
		    else
		      return False
		    end
		    
		  else
		    return v.BooleanValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends dict as Dictionary) As Dictionary
		  dim dictNew as New Dictionary
		  if dict = nil then return dictNew
		  
		  dim i as integer
		  dim s As String
		  dim v As Variant
		  
		  
		  for i=0 to dict.count-1
		    s= dict.Key(i) 'Get each key
		    v= dict.Value(s) 'Get the value of key (s)
		    
		    dictNew.Value(s)=v 'Add the value and key to the new dictionary
		  Next
		  
		  return dictNew
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID(extends lst as ListBox) As Integer
		  if lst.ListIndex = -1 then return 0
		  
		  if lst.RowTag(lst.ListIndex) isa DataFile.ActiveRecordBase then
		    dim id as integer = DataFile.ActiveRecordBase(lst.rowtag(lst.ListIndex)).id
		    return id
		  end if
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID(extends pm as PopupMenu) As Integer
		  if pm.ListIndex = -1 then return 0
		  
		  if pm.RowTag(pm.ListIndex) isa DataFile.ActiveRecordBase then
		    dim id as integer = DataFile.ActiveRecordBase(pm.rowtag(pm.ListIndex)).id
		    return id
		    
		  else
		    return pm.RowTag(pm.ListIndex).IntegerValue
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinSQL(extends ars() as string) As String
		  Return join(ars, " ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MessageBox(TitleStr as string, MsgStr as string, w as window = nil)
		  
		  Dim d as New MessageDialog  //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  
		  d.icon = MessageDialog.GraphicNote
		  
		  d.ActionButton.Caption= "OK"
		  
		  
		  d.Message = TitleStr
		  d.Explanation = MsgStr
		  
		  if w = nil then
		    b=d.ShowModal    //display the dialog
		  else
		    b = d.ShowModalWithin(w)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetID(extends lst as Listbox, id as integer)
		  if id < 1 then
		    lst.ListIndex = -1
		    return
		  end if
		  
		  for i as Integer = 0 to lst.ListCount - 1
		    if lst.RowTag(i) isa DataFile.ActiveRecordBase then
		      if DataFile.ActiveRecordBase(lst.RowTag(i)).id = id then
		        lst.ListIndex = i
		        return
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetID(extends lst as Listbox, assigns id as integer)
		  lst.SetID id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetID(extends pm as PopupMenu, id as integer)
		  if id < 1 then
		    pm.ListIndex = -1
		    return
		  end if
		  
		  for i as Integer = 0 to pm.ListCount - 1
		    
		    if pm.RowTag(i) isa DataFile.ActiveRecordBase then 'active record
		      if DataFile.ActiveRecordBase(pm.RowTag(i)).id = id then
		        pm.ListIndex = i
		        return
		      end if
		      
		    else 'not active record, integer
		      if pm.RowTag(i).IntegerValue = id then
		        pm.ListIndex = i
		        Return
		      end if
		      
		    end if
		    
		    
		  next
		  
		  'couldn't fin it
		  pm.ListIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetID(extends pm as PopupMenu, assigns id as integer)
		  pm.setid id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetText(extends pm as PopupMenu, assigns sValue as String)
		  for i as integer = 0 to pm.ListCount-1
		    if pm.list(i) = sValue then
		      pm.ListIndex = i
		      return
		    end
		  next
		  
		  pm.listindex = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends b as Boolean) As String
		  if b= true then
		    return "Yes"
		  else
		    Return "No"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends c as Currency) As String
		  return str(c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends d as Double) As String
		  return format(d, "#.0#")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends i as Int64) As String
		  return str(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends i as Integer) As String
		  return str(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TypeOfException(err as RuntimeException) As String
		  if err <> nil then
		    return Introspection.GetType(err).FullName
		  end
		End Function
	#tag EndMethod


	#tag Enum, Name = AlertTypes, Flags = &h0
		kCaution = 2
		  kNote = 1
		  kPlain = 3
		  kStop = 0
		kQuestion = 4
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
