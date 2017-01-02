#tag Class
Protected Class cEvent
	#tag Method, Flags = &h0
		Sub LoadContacts()
		  
		  
		  //Grab a list of all the contacts that are related to this event
		  aroContacts() = DataFile.tbl_contacts.List("fkevents = " + pkid.ToString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDetails()
		  
		  
		  
		  // Instansiate the variable as a new events record
		  oDetails = New DataFile.tbl_events
		  
		  // Load the event
		  If oDetails.Load(pkid) Then
		    'Load Succsessful
		    
		    
		  Else
		    ' Load Not succsessful
		    
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadEipls()
		  
		  
		  
		  //Grab a list of all the eipls that are related to this event
		  aroEipls() = DataFile.tbl_eipl.List("fkevents = " + pkid.ToString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadMe(ipkid as int64)
		  
		  
		  // Put the pkid passed to us into a variable
		  pkid = ipkid
		  
		  LoadDetails
		  LoadContacts
		  LoadVenues
		  LoadEipls
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadVenues()
		  
		  
		  
		  //Grab a list of all the Venues that are related to this event
		  aroVenues() = DataFile.tbl_venues.List("fkevents = " + pkid.ToString)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aroContacts() As DataFile.tbl_contacts
	#tag EndProperty

	#tag Property, Flags = &h0
		aroEipls() As DataFile.tbl_eipl
	#tag EndProperty

	#tag Property, Flags = &h0
		aroVenues() As DataFile.tbl_venues
	#tag EndProperty

	#tag Property, Flags = &h0
		oDetails As DataFile.tbl_events
	#tag EndProperty

	#tag Property, Flags = &h0
		pkid As int64
	#tag EndProperty


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
End Class
#tag EndClass
