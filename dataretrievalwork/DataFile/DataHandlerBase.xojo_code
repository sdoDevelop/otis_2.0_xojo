#tag Class
Protected Class DataHandlerBase
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  dim db1 as SQLiteDatabase
		  
		  db1 = GetDatabase
		  
		  If db1 <> Nil Then
		    db1.SQLExecute("Begin Transaction")
		  Else
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommitTransaction()
		  dim db1 as SQLiteDatabase
		  
		  db1 = GetDatabase
		  
		  If db1 <> Nil Then
		    db1.SQLExecute("Commit Transaction")
		  Else
		    
		  End If
		  
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
		    ErrManage(0, "Could not get database from app variable")
		    Return Nil
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RollbackTransaction()
		  dim db1 as SQLiteDatabase
		  
		  db1 = GetDatabase
		  
		  If db1 <> Nil Then
		    db1.SQLExecute("Rollback Transaction")
		  Else
		    
		  End If
		  
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
