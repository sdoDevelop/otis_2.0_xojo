#tag Window
Begin Window CalendarWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   229
   ImplicitInstance=   False
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Choose a Date"
   Visible         =   True
   Width           =   213
   Begin PopupMenu MonthPopup
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "January\rFebruary\rMarch\rApril\rMay\rJune\rJuly\rAugust\rSeptember\rOctober\rNovember\rDecember"
      Italic          =   False
      Left            =   14
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   13
      Underline       =   False
      Visible         =   True
      Width           =   102
   End
   Begin PopupMenu YearPopup
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "2013\n2012\n2011"
      Italic          =   False
      Left            =   121
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   13
      Underline       =   False
      Visible         =   True
      Width           =   79
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   61
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   61
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   67
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   61
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   94
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   61
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   61
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   148
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   61
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   61
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   7
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   84
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   8
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   84
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   9
      InitialParent   =   ""
      Italic          =   False
      Left            =   67
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   84
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   10
      InitialParent   =   ""
      Italic          =   False
      Left            =   94
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   84
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   11
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   84
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   12
      InitialParent   =   ""
      Italic          =   False
      Left            =   148
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   84
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   13
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   84
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   14
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   107
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   15
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   107
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   16
      InitialParent   =   ""
      Italic          =   False
      Left            =   67
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   107
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   17
      InitialParent   =   ""
      Italic          =   False
      Left            =   94
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   107
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   18
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   107
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   19
      InitialParent   =   ""
      Italic          =   False
      Left            =   148
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   107
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   20
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   107
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   21
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   22
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   23
      InitialParent   =   ""
      Italic          =   False
      Left            =   67
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   24
      InitialParent   =   ""
      Italic          =   False
      Left            =   94
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   25
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   26
      InitialParent   =   ""
      Italic          =   False
      Left            =   148
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   27
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   130
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   28
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   153
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   29
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   153
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   30
      InitialParent   =   ""
      Italic          =   False
      Left            =   67
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   153
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   31
      InitialParent   =   ""
      Italic          =   False
      Left            =   94
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   153
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   32
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   153
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   33
      InitialParent   =   ""
      Italic          =   False
      Left            =   148
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   153
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   34
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   153
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   35
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   176
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   36
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   176
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin PushButton NextMonthButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   ">"
      Default         =   False
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   127
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   39
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   200
      Underline       =   False
      Visible         =   True
      Width           =   26
   End
   Begin PushButton PreviousMonthButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "<"
      Default         =   False
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   61
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   200
      Underline       =   False
      Visible         =   True
      Width           =   26
   End
   Begin PushButton CurrentMonthButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "-"
      Default         =   False
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   94
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   200
      Underline       =   False
      Visible         =   True
      Width           =   26
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   42
      TabPanelIndex   =   0
      Text            =   "S"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   43
      TabPanelIndex   =   0
      Text            =   "M"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   67
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   44
      TabPanelIndex   =   0
      Text            =   "T"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   94
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   45
      TabPanelIndex   =   0
      Text            =   "W"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   46
      TabPanelIndex   =   0
      Text            =   "T"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   148
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   47
      TabPanelIndex   =   0
      Text            =   "F"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   48
      TabPanelIndex   =   0
      Text            =   "S"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // Initialize PopUpYear for all possible years
		  StartYear = kDefaultStartYear
		  EndYear = kDefaultEndYear
		  
		  LoadYearPopup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetDate(d As Date, x as integer = -1, y as integer = -1) As Double
		  //Call this from another window to allow user to select a date
		  //format:  myDate.totalSeconds = Calendar.GetDate(CurrentDate)
		  //CurrentDate will be month displayed to start with, can be same as myDate
		  
		  //Take the date given and set the day to one to prevent
		  //errors when a user advances a month with Jan31 for example
		  //then update window
		  mSelectedDate = New Date
		  mSelectedDate.TotalSeconds = d.Totalseconds
		  
		  mSelectedDate.Day = 1
		  Update
		  
		  // Set window position
		  If x <> -1 then
		    Self.Left = x
		  end if
		  If y <> -1 then
		    Self.Top = y
		  end if
		  //Stop code execution of this window until user chooses a date
		  Self.ShowModal
		  
		  //User has picked a date, window is closing, return the new value
		  Return mSelectedDate.TotalSeconds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadYearPopup()
		  YearPopup.DeleteAllRows
		  For i As Integer = StartYear To EndYear
		    YearPopup.AddRow(Str(i))
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update()
		  MonthPopup.ListIndex = mSelectedDate.Month-1
		  
		  If mSelectedDate.Year >= StartYear And mSelectedDate.Year <= EndYear Then
		    YearPopup.ListIndex = mSelectedDate.Year-StartYear
		  ElseIf mSelectedDate.Year > EndYear Then
		    YearPopup.ListIndex = YearPopup.ListCount-1
		  Else
		    YearPopup.ListIndex = 0
		  End If
		  
		  //find how many days in this month
		  Dim monthDays As Integer
		  
		  Select Case mSelectedDate.Month
		  Case 1, 3, 5, 7, 8, 10, 12
		    monthDays = 31
		  Case 4, 6, 9, 11
		    monthDays = 30
		  Case Else
		    // Calculate February
		    If (mSelectedDate.Year / 4.0) = Floor(mSelectedDate.Year / 4.0) Then
		      monthDays = 29 // Leap year
		    Else
		      monthDays = 28
		    End If
		  End Select
		  
		  // Update all the captions of the buttons and hide as appropriate
		  Dim dayOfWeek As Integer
		  dayOfWeek = mSelectedDate.DayOfWeek
		  
		  Dim dayNum As Integer
		  For calendarButton As Integer = 0 To 36
		    DayNum = calendarButton + 2 - dayOfWeek
		    If dayNum > 0 And dayNum <= monthDays Then
		      CalendarDateButton(calendarButton).Caption = Str(dayNum)
		      CalendarDateButton(calendarButton).Visible = True
		    Else
		      CalendarDateButton(calendarButton).Visible = False
		    End If
		  Next
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEndYear
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEndYear = value
			  
			  LoadYearPopup
			End Set
		#tag EndSetter
		EndYear As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEndYear As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedDate As Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartYear As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mStartYear
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStartYear = value
			  
			  LoadYearPopup
			End Set
		#tag EndSetter
		StartYear As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kDefaultEndYear, Type = Double, Dynamic = False, Default = \"2080", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDefaultStartYear, Type = Double, Dynamic = False, Default = \"1904", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events MonthPopup
	#tag Event
		Sub Change()
		  //User has changed month
		  //Update mSelectedDate and update window
		  
		  mSelectedDate.Month = Me.ListIndex + 1
		  
		  Update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events YearPopup
	#tag Event
		Sub Change()
		  //User has changed year
		  //Update mSelectedDate and update window
		  
		  mSelectedDate.Year = Val(Me.Text)
		  Update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CalendarDateButton
	#tag Event
		Sub Action(index as Integer)
		  #Pragma Unused Index
		  
		  //day has been chosen
		  //update mSelectedDate and close window
		  
		  mSelectedDate.Day = Val(Me.Caption)
		  
		  Self.Close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextMonthButton
	#tag Event
		Sub Action()
		  //User wants to advance a month
		  //If not at limits of dates(dec,2039) then do it
		  
		  Dim m, y As Integer
		  
		  m = MonthPopup.ListIndex + 1
		  y = Val(YearPopup.Text)
		  
		  If m = 12 And y < EndYear Then
		    YearPopup.ListIndex = YearPopup.ListIndex + 1
		    MonthPopup.ListIndex = 0
		  ElseIf m < 12 Then
		    MonthPopup.ListIndex = MonthPopup.ListIndex + 1
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PreviousMonthButton
	#tag Event
		Sub Action()
		  //User wants to back up a month
		  //If not at limits of dates(Jan,1904) then do it
		  
		  Dim m,y As Integer
		  
		  m = MonthPopup.ListIndex + 1
		  y = Val(YearPopup.Text)
		  
		  If m = 1 And y > StartYear Then
		    YearPopup.ListIndex = YearPopup.ListIndex - 1
		    MonthPopup.ListIndex = 11
		  Elseif m > 1 Then
		    MonthPopup.ListIndex = MonthPopup.ListIndex - 1
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CurrentMonthButton
	#tag Event
		Sub Action()
		  //User wants to move to current month
		  
		  mSelectedDate = New date
		  mSelectedDate.Day = 1
		  mSelectedDate.TotalSeconds = mSelectedDate.TotalSeconds
		  
		  Update
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EndYear"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
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
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
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
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="StartYear"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
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
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
