#tag Window
Begin ContainerControl ContainerControl_EventDateTimes Implements LoadFromDB
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   162
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
   Width           =   278
   Begin sdoLabel_Date StartDate
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   50
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin RubberViews RubberView1
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   20
      HelpTag         =   ""
      Ignore          =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      KeepRatios      =   ""
      Left            =   -114
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      NoContentResizes=   ""
      Scope           =   2
      sizGood         =   False
      sizKeepRatio    =   False
      sizNoContentResize=   False
      sizWin          =   "0"
      StretchWindowBackdrop=   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   104
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   20
   End
   Begin CalenderButton StartCalender
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   14
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   119
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   52
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   14
   End
   Begin sdoLabel_Time StartTime
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   30
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin Label Start_Label
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Event Start"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin sdoLabel_Date EndDate
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   50
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin CalenderButton EndCalender
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   14
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   52
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   14
   End
   Begin sdoLabel_Time EndTime
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   30
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin Label End_Label
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
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Event End"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin sdoLabel_Date LoadInDate
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   122
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin CalenderButton LoadInCalender
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   14
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   119
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   124
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   14
   End
   Begin sdoLabel_Time LoadInTime
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   102
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin Label LoadIn_Label
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Load In"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   82
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin sdoLabel_Date LoadOutDate
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   122
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin CalenderButton LoadOutCalender
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   14
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   124
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   14
   End
   Begin sdoLabel_Time LoadOutTime
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   &c00000000
      BorderColor     =   &c00000000
      Borders         =   False
      CornerArc       =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      JustificationHorizontal=   0
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   102
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin Label LoadOut_Label
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
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Load Out"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   82
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  
		  RubberView1.Init(Self) 
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  
		  
		  
		  
		  
		  RubberView1.StretchWindowBackdrop = True
		  RubberView1.SizAll(self, false, False)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  
		  
		  RubberView1.StretchWindowBackdrop = True
		  
		  RubberView1.SizAll(Self,False, False)
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events StartDate
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  Dim FieldName as string = "start_date"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as string = "start_date"
		  
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLDate = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Day = 1
		        StoredDBValue.Month = 1
		        StoredDBValue.Year = 1900
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortDate <> EnteredValue.ShortDate Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLDate + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartCalender
	#tag Event
		Sub Initialize()
		  
		  
		  me.PairedControl = StartDate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartTime
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  
		  Dim FieldName as string = "start_time"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as String = "start_time"
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLTime = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Hour = 1
		        StoredDBValue.Minute = 1
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortTime <> EnteredValue.ShortTime Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLTime + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Start_Label
	#tag Event
		Sub Open()
		  
		  
		  
		  
		  
		  me.TextColor = get_color("Text",0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EndDate
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  Dim FieldName as string = "end_date"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as string = "end_date"
		  
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLDate = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Day = 1
		        StoredDBValue.Month = 1
		        StoredDBValue.Year = 1900
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortDate <> EnteredValue.ShortDate Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLDate + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EndCalender
	#tag Event
		Sub Initialize()
		  
		  
		  me.PairedControl = EndDate
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EndTime
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  
		  Dim FieldName as string = "end_time"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as String = "end_time"
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLTime = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Hour = 1
		        StoredDBValue.Minute = 1
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortTime <> EnteredValue.ShortTime Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLTime + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events End_Label
	#tag Event
		Sub Open()
		  
		  
		  
		  
		  
		  me.TextColor = get_color("Text",0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadInDate
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  Dim FieldName as string = "loadin_date"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as string = "loadin_date"
		  
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLDate = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Day = 1
		        StoredDBValue.Month = 1
		        StoredDBValue.Year = 1900
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortDate <> EnteredValue.ShortDate Or me.RawData = "" Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLDate + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadInCalender
	#tag Event
		Sub Initialize()
		  
		  
		  me.PairedControl = LoadInDate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadInTime
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  
		  Dim FieldName as string = "loadin_time"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as String = "loadin_time"
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLTime = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Hour = 1
		        StoredDBValue.Minute = 1
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortTime <> EnteredValue.ShortTime Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLTime + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadIn_Label
	#tag Event
		Sub Open()
		  
		  
		  
		  
		  
		  me.TextColor = get_color("Text",0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadOutDate
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  Dim FieldName as string = "loadout_date"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as string = "loadout_date"
		  
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLDate = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Day = 1
		        StoredDBValue.Month = 1
		        StoredDBValue.Year = 1900
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortDate <> EnteredValue.ShortDate Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLDate + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadOutCalender
	#tag Event
		Sub Initialize()
		  
		  
		  me.PairedControl = LoadOutDate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadOutTime
	#tag Event
		Sub Initialize()
		  
		  
		  
		  // Set up background
		  me.BackgroundColor = get_color("Gray",1)
		  me.CornerArc = 4
		  me.BorderColor = get_color("Gray",3)
		  me.Borders = True
		  
		  // Set up Text
		  me.JustificationHorizontal = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function LoadFromDB() As Variant
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim exr1 as ExecuteReturn
		  dim rs1 as RecordSet
		  Dim ReturnValue as String
		  
		  
		  
		  Dim FieldName as string = "loadout_time"
		  
		  exr1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'"))
		  If exr1 <> Nil Then
		    rs1 = exr1.TheRecordSet
		    
		    
		    ReturnValue = rs1.Field(FieldName).StringValue
		    
		    
		  End If
		  
		  
		  Return ReturnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub SaveEvent()
		  Dim db1 as otis_database_manager = app.otis_db
		  Dim er1 as ExecuteReturn
		  Dim rs1 as RecordSet
		  Dim StoredDBValue as New OtisDate
		  Dim EnteredValue as New OtisDate
		  
		  
		  
		  Dim FieldName as String = "loadout_time"
		  
		  // save this mothafucking shit
		  
		  
		  // First we need to grab the currently stored value in the local database
		  er1 = db1.execute("Select","events_",Array(FieldName),Array(""),Array("pkid = '" + window_main.pkid_events_ + "'") )
		  rs1 = er1.TheRecordSet
		  If rs1 <> Nil Then
		    If rs1.RecordCount > 0 Then
		      
		      If rs1.Field(FieldName).StringValue <> "" Then
		        StoredDBValue.SQLDate = rs1.Field(FieldName).StringValue
		      Else
		        StoredDBValue.Hour = 1
		        StoredDBValue.Minute = 1
		      End If
		    End If
		  End If
		  
		  // Get the control in otisdate form
		  EnteredValue = me.GetOtisDateForm
		  
		  // Now we check to see if the StoredDBValue and our new value are different
		  If StoredDBValue.ShortTime <> EnteredValue.ShortTime Then
		    'The values are different
		    'we should continue on with saving
		    
		    Dim TheValue as string
		    
		    If me.RawData = "" Then
		      TheValue = "''"
		    Else
		      TheValue = "'" + EnteredValue.SQLTime + "'"
		    End If
		    db1.execute("Update","events_",Array(FieldName),Array(TheValue),Array("pkid = '" + window_main.pkid_events_ + "'") )
		    
		  Else 
		    'The values are the same
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadOut_Label
	#tag Event
		Sub Open()
		  
		  
		  
		  
		  
		  me.TextColor = get_color("Text",0)
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
