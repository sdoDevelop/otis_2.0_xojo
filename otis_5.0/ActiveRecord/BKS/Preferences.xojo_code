#tag Module
Protected Module Preferences
	#tag Method, Flags = &h1
		Protected Function BooleanValue(Key As String, Default As Boolean = False) As Boolean
		  if dictPref.haskey(key) and dictPref.value(key).type = TransportManager.kTransportableBoolean then
		    return TransportableBoolean(dictPref.value(key)).Value
		  else
		    return default
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub BooleanValue(Key As String, Assigns TheValue As Boolean)
		  dictPref.value(key) = new TransportableBoolean(thevalue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorValue(Key As String, Default As Color = &c000000) As Color
		  if dictPref.haskey(key) and dictPref.value(key).type = TransportManager.kTransportableColor then
		    return TransportableColor(dictPref.value(key)).Value
		  else
		    return Default
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ColorValue(Key As String, Assigns TheValue As Color)
		  dictPref.value(key) = new TransportableColor(thevalue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoubleValue(Key As String, Default As Double = 0) As Double
		  if dictPref.haskey(key) and dictPref.value(key).type = TransportManager.kTransportableDouble then
		    return TransportableDouble(dictPref.value(key)).Value
		  else
		    return Default
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoubleValue(Key As String, Assigns TheValue As Double)
		  dictPref.value(key) = new TransportableDouble(thevalue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FileName(sBase as string) As String
		  return sBase + "." + FileExtension
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderItemValue(Key As String, Default As FolderItem = Nil) As FolderItem
		  if dictPref.haskey(key) and dictPref.value(key).type = TransportManager.kTransportableFolderItem then
		    return TransportableFolderItem(dictPref.value(key)).Value
		  else
		    return Default
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FolderItemValue(Key As String, Assigns TheFolderItem As FolderItem)
		  dictPref.value(key) = new TransportableFolderItem(TheFolderItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetBackupPreferenceFile() As FolderItem
		  dim f as FolderItem
		  
		  f = SpecialFolder.Preferences.Child(mConfig.kBundleIdentifier)
		  if f.Exists = false then
		    f.CreateAsFolder
		    f.RaiseExceptionOnError
		  end
		  
		  dim sName as string = FileName(mConfig.kBundleIdentifier + ".bak")
		  return f.Child(sName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetPreferenceFile() As FolderItem
		  dim f as FolderItem
		  
		  f = SpecialFolder.Preferences.Child(mConfig.kBundleIdentifier)
		  if f.Exists = false then
		    f.CreateAsFolder
		    f.RaiseExceptionOnError
		  end
		  
		  dim sName as string = FileName(mConfig.kBundleIdentifier)
		  return f.Child(sName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTempPreferenceFile() As FolderItem
		  dim f as FolderItem
		  
		  f = SpecialFolder.Preferences.Child(mConfig.kBundleIdentifier)
		  if f.Exists = false then
		    f.CreateAsFolder
		    f.RaiseExceptionOnError
		  end
		  
		  dim sName as string = FileName(mConfig.kBundleIdentifier+"_temp")
		  return f.Child(sName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IntegerValue(Key As String, Default As Integer = 0) As Integer
		  if dictPref.haskey(key) and dictPref.value(key).type = TransportManager.kTransportableInteger then
		    return TransportableInteger(dictPref.value(key)).Value
		  else
		    return Default
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub IntegerValue(Key As String, Assigns TheValue As Integer)
		  dictPref.value(key) = new TransportableInteger(thevalue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LastError() As Integer
		  return pLastError
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Load()
		  dim f as folderitem
		  dim t as textinputstream
		  dim s as string
		  
		  
		  f = GetPreferenceFile
		  
		  if f.exists then
		    t = TextInputStream.Open(f)
		    if t = nil then
		      MessageBox "Error Opening Preferences File", _
		      "There was an error opening the preferences file.  Attempting to remove the old one.  This will reset all preferences.  Sorry for the inconvience."
		      f.Delete
		      pLastError = -2
		    else
		      s = t.readall(encodings.utf8)
		      t.close
		      dictPref = TransportableDictionary(DecodeTransportableItem(new xmldocument(s)))
		    end
		  else
		    plasterror = -1
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ObjectValue(Key As String) As TransportableItem
		  if dictPref.haskey(key) then
		    return dictPref.value(key)
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ObjectValue(Key As String, Assigns TheValue As TransportableItem)
		  dictPref.value(key) = thevalue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Save()
		  dim s as string
		  if dictPref <> nil then
		    
		    //Create temporary file.
		    dim fTemporary as FolderItem = GetTempPreferenceFile
		    
		    s = dictPref.Save
		    
		    //Write Temporary file.
		    dim t as textoutputstream = TextOutputStream.create(fTemporary)
		    BKS_Debug.Assert t <> nil, CurrentMethodName + "-cannot create text output stream"
		    if t = nil then
		      //do we need to error out?
		      return
		    end
		    t.write s
		    
		    if t.LastErrorCode = 0 then
		      t.close
		      
		      //Get Original Prefs file.
		      dim fOriginal as folderitem = GetPreferenceFile
		      dim fBackup as folderitem = GetBackupPreferenceFile
		      //rename the current file
		      if fOriginal.Exists then
		        fOriginal.Name = fBackup.Name
		      end
		      if fOriginal.LastErrorCode = 0 then
		        
		        //No errors.  Rename the temp file
		        dim fNew as folderitem = GetPreferenceFile
		        fTemporary.name = fNew.Name
		        
		        //Cleanup old backup and Temporary files.
		        fBackup = GetBackupPreferenceFile
		        if fBackup.exists = true then fBackup.Delete
		        
		        fTemporary = GetTempPreferenceFile
		        if fTemporary.exists then fTemporary.delete
		      else
		        t.close
		      end
		      return
		    end
		    
		    
		    pLastError = 0
		    
		    
		  else
		    pLastError = -1
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StringValue(Key As String, Default As String = "") As String
		  if dictPref.haskey(key) and dictPref.value(key).type = TransportManager.kTransportableString then
		    return TransportableString(dictPref.value(key)).Value
		  else
		    return Default
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StringValue(Key As String, Assigns TheValue As String)
		  dictPref.value(key) = new transportablestring(thevalue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WindowValue(Key as string, assigns win as window)
		  dim sTemp as string = cstr(win.left) + ";" + cstr(win.top) + ";" + cstr(win.Height) + ";" + cstr(win.Width)
		  
		  #if TargetWin32
		    'if win.IsMinimized then Return //Don't save the settings if the window is minimized
		  #Endif
		  
		  StringValue(key) = sTemp
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WindowValue(Key as string, w as window) As string
		  dim sTemp as string
		  
		  if w <> nil then
		    sTemp = cstr(w.left) + ";" + cstr(w.top) + ";" + cstr(w.Height) + ";" + cstr(w.Width)
		  end
		  
		  return StringValue(key, sTemp)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if mdictPref = nil then
			    mdictPref = new transportabledictionary
			  end
			  
			  return mdictPref
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdictPref = value
			End Set
		#tag EndSetter
		Private dictPref As TransportableDictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mdictPref As TransportableDictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pLastError As Integer
	#tag EndProperty


	#tag Constant, Name = FileExtension, Type = String, Dynamic = False, Default = \"plist", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"xml"
	#tag EndConstant

	#tag Constant, Name = kCheckUpdatesAtStartup, Type = String, Dynamic = False, Default = \"kCheckUpdatesAtStartup", Scope = Public
	#tag EndConstant


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
