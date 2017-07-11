#tag Class
Protected Class DataHandlerBase
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommitTransaction()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDatabase() As SQLiteDatabase
		  
		  
		  If App.db <> Nil Then
		    Return App.db
		  Else
		    ErrManage(0, "Could not get database")
		    Return Nil
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RollbackTransaction()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AfterCreate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AfterDelete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AfterUpdate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BeforeCreate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BeforeDelete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BeforeUpdate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PopulateProperties()
	#tag EndHook


End Class
#tag EndClass
