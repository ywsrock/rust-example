VERSION 5.00
Object = "{00F72214-59C6-45B0-840A-F09FDEB2D5F4}#3.3#0"; "PhoneAPI.ocx"
Object = "{7571CEA4-BD56-40F8-8C6B-4E938351380F}#1.0#0"; "afValue.ocx"
Begin VB.Form frmMain 
   BackColor       =   &H00808080&
   BorderStyle     =   3  '固定ﾀﾞｲｱﾛｸﾞ
   ClientHeight    =   4275
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   19110
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "ＭＳ Ｐ明朝"
      Size            =   11.25
      Charset         =   128
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4275
   ScaleWidth      =   19110
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows の既定値
   Begin VB.PictureBox Picture2 
      Height          =   2955
      Left            =   60
      ScaleHeight     =   2895
      ScaleWidth      =   18855
      TabIndex        =   28
      Top             =   1320
      Width           =   18915
      Begin VB.Timer tmrTrns 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   9180
         Top             =   2040
      End
      Begin VB.TextBox txtCalling 
         Height          =   330
         Left            =   14940
         TabIndex        =   42
         TabStop         =   0   'False
         Top             =   540
         Width           =   2115
      End
      Begin VB.TextBox txtFocus 
         Height          =   330
         Left            =   9300
         TabIndex        =   0
         Text            =   "フォーカス移動誤操作防止用"
         Top             =   1320
         Width           =   3315
      End
      Begin VB.TextBox txtCallTime 
         Appearance      =   0  'ﾌﾗｯﾄ
         BackColor       =   &H00C0FFFF&
         Height          =   315
         Left            =   7260
         Locked          =   -1  'True
         TabIndex        =   34
         Top             =   1740
         Width           =   1095
      End
      Begin afValue.Value afValue 
         Left            =   60
         Top             =   1020
         _ExtentX        =   635
         _ExtentY        =   344
      End
      Begin VB.TextBox txtTalkTime 
         Appearance      =   0  'ﾌﾗｯﾄ
         BackColor       =   &H00C0FFFF&
         Height          =   315
         Left            =   7260
         Locked          =   -1  'True
         TabIndex        =   33
         Top             =   1260
         Width           =   1095
      End
      Begin VB.Timer tmrTalk 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   8400
         Top             =   1260
      End
      Begin VB.Timer tmrMsg 
         Enabled         =   0   'False
         Left            =   8400
         Top             =   2220
      End
      Begin VB.Timer tmrMakecall 
         Enabled         =   0   'False
         Left            =   8400
         Top             =   1740
      End
      Begin VB.TextBox txtPhoneNo 
         Height          =   330
         Left            =   14940
         TabIndex        =   32
         TabStop         =   0   'False
         Top             =   180
         Width           =   2115
      End
      Begin VB.CommandButton cmdDebug 
         Caption         =   "終了"
         Height          =   555
         Left            =   60
         TabIndex        =   31
         TabStop         =   0   'False
         Top             =   60
         Width           =   435
      End
      Begin VB.ListBox lstLog 
         BeginProperty Font 
            Name            =   "ＭＳ ゴシック"
            Size            =   9
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2760
         Left            =   540
         TabIndex        =   29
         Top             =   60
         Width           =   5415
      End
      Begin PhoneAPI.ucPhoneApi ucPhoneApi1 
         Height          =   1155
         Left            =   6060
         TabIndex        =   30
         Top             =   60
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   2037
      End
      Begin VB.Label Label5 
         Caption         =   "通知番号"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   13740
         TabIndex        =   41
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "電話番号"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   13740
         TabIndex        =   40
         Top             =   180
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "未読チェック"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6120
         TabIndex        =   37
         Top             =   2220
         Width           =   1335
      End
      Begin VB.Label Label2 
         Caption         =   "AC発信待ち"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6120
         TabIndex        =   36
         Top             =   1740
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "通話時間"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6120
         TabIndex        =   35
         Top             =   1260
         Width           =   1095
      End
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00C0E0FF&
      Height          =   1155
      Left            =   60
      ScaleHeight     =   1095
      ScaleWidth      =   18915
      TabIndex        =   24
      Top             =   60
      Width           =   18975
      Begin VB.CommandButton cmdButton 
         Caption         =   "業務切替"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   14
         Left            =   16620
         Picture         =   "frmMain.frx":030A
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   43
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "電話機"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   13
         Left            =   10920
         Picture         =   "frmMain.frx":0FD4
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   39
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "解除"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   12
         Left            =   2940
         Picture         =   "frmMain.frx":12DE
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   38
         Top             =   420
         Width           =   1035
      End
      Begin VB.Timer tmrAfTaskClose 
         Enabled         =   0   'False
         Left            =   18420
         Top             =   600
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "終了"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   10
         Left            =   17760
         Picture         =   "frmMain.frx":1BA8
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   2
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "外線転送"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   5
         Left            =   9780
         Picture         =   "frmMain.frx":1EB2
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   17
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "内線転送"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   4
         Left            =   8640
         Picture         =   "frmMain.frx":21BC
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   16
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "保留解除"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   3
         Left            =   7500
         Picture         =   "frmMain.frx":24C6
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   15
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "保留"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   2
         Left            =   6360
         Picture         =   "frmMain.frx":27D0
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   14
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "切断"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   1
         Left            =   5220
         Picture         =   "frmMain.frx":2ADA
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   13
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "発信"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   0
         Left            =   4080
         Picture         =   "frmMain.frx":2DE4
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   12
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton btnCti 
         BackColor       =   &H00FFC0C0&
         Caption         =   "研修"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   12
         Left            =   15480
         Picture         =   "frmMain.frx":30EE
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   23
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton btnCti 
         BackColor       =   &H00C0FFFF&
         Caption         =   "休憩"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   11
         Left            =   14340
         Picture         =   "frmMain.frx":33F8
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   22
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton btnCti 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Pass変更"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   7
         Left            =   12060
         Picture         =   "frmMain.frx":3702
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   19
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton btnCti 
         BackColor       =   &H00FFFFFF&
         Caption         =   "申送事項"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   6
         Left            =   12660
         Picture         =   "frmMain.frx":3A0C
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   18
         Top             =   -420
         Visible         =   0   'False
         Width           =   1035
      End
      Begin VB.CommandButton btnCti 
         Caption         =   "録音検索"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   8
         Left            =   10440
         Picture         =   "frmMain.frx":3D16
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   20
         Top             =   60
         Visible         =   0   'False
         Width           =   1035
      End
      Begin VB.CommandButton btnCti 
         BackColor       =   &H00C0C0FF&
         Caption         =   "離席"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   10
         Left            =   13200
         Picture         =   "frmMain.frx":4020
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   21
         Top             =   120
         Width           =   1035
      End
      Begin VB.Frame FrameMode 
         BackColor       =   &H00C0E0FF&
         Caption         =   "モード"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   1800
         TabIndex        =   4
         Top             =   60
         Visible         =   0   'False
         Width           =   1035
         Begin VB.OptionButton optNext 
            BackColor       =   &H00C0E0FF&
            Caption         =   "停止"
            BeginProperty Font 
               Name            =   "ＭＳ Ｐ明朝"
               Size            =   9.75
               Charset         =   128
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Index           =   2
            Left            =   120
            TabIndex        =   7
            TabStop         =   0   'False
            Top             =   720
            Width           =   855
         End
         Begin VB.OptionButton optNext 
            BackColor       =   &H00C0E0FF&
            Caption         =   "3秒"
            BeginProperty Font 
               Name            =   "ＭＳ Ｐ明朝"
               Size            =   9.75
               Charset         =   128
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Index           =   1
            Left            =   120
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   480
            Width           =   855
         End
         Begin VB.OptionButton optNext 
            BackColor       =   &H00C0E0FF&
            Caption         =   "即時"
            BeginProperty Font 
               Name            =   "ＭＳ Ｐ明朝"
               Size            =   9.75
               Charset         =   128
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Index           =   0
            Left            =   120
            TabIndex        =   5
            TabStop         =   0   'False
            Top             =   240
            Value           =   -1  'True
            Width           =   855
         End
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "次顧客"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   11
         Left            =   1800
         Picture         =   "frmMain.frx":432A
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   3
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "受付開始"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   7
         Left            =   1800
         Picture         =   "frmMain.frx":4634
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   8
         Top             =   -600
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "受付停止"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   6
         Left            =   2940
         Picture         =   "frmMain.frx":493E
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   9
         Top             =   120
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "発信開始"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   9
         Left            =   4080
         Picture         =   "frmMain.frx":4C48
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   10
         Top             =   -600
         Width           =   1035
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "発信停止"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   900
         Index           =   8
         Left            =   2940
         Picture         =   "frmMain.frx":4F52
         Style           =   1  'ｸﾞﾗﾌｨｯｸｽ
         TabIndex        =   11
         Top             =   -600
         Width           =   1035
      End
      Begin VB.Label txtStatus 
         Alignment       =   2  '中央揃え
         BackColor       =   &H00008000&
         BorderStyle     =   1  '実線
         Caption         =   "無作業"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   12
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   345
         Left            =   120
         TabIndex        =   27
         Top             =   120
         Width           =   1575
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  '中央揃え
         BackStyle       =   0  '透明
         Caption         =   "亀田 康人"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   760
         Width           =   1575
      End
      Begin VB.Label lblUserId 
         Alignment       =   2  '中央揃え
         BackStyle       =   0  '透明
         Caption         =   "0560"
         BeginProperty Font 
            Name            =   "ＭＳ Ｐ明朝"
            Size            =   9.75
            Charset         =   128
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   25
         Top             =   520
         Width           =   1575
      End
   End
   Begin VB.Label lblDebug 
      BackStyle       =   0  '透明
      Caption         =   "＊＊＊＊＊＊＊ 　デバッグ 画面 　OnOff"
      ForeColor       =   &H00FFFFFF&
      Height          =   1275
      Left            =   -60
      TabIndex        =   1
      Top             =   -60
      Width           =   1815
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim sRead           As MESSAGE_FLAGS    '未読状態
Dim sDropCmd        As String           '切断通知後に発行するイベント
Dim sWaitCnt        As String           '待呼件数情報
Dim sPlayBtn        As Boolean          '録音再生ボタン

Private m_bChangeGroup As Boolean
Private m_nCtiType As Integer

'---------------------------------------------------------------------
' 目的説明  -- データ受信
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub afValue_OnData(strData As String)
    Dim Ret     As Long

    Select Case strData
    '----------------------------------
    Case "LOCK"         'ロック中(作業,離席,休憩,研修)
    '----------------------------------
    Case "UNLOCK"       'ロック解除
        SetCtiUserStatus
    '----------------------------------
    Case "ENDLOCK"      'ロック認証せずに終了(起動中のアプリを終了させる)
        Ret = AfTaskCheck                   '起動中のAFタスクを調べる
        If Ret <> 0 Then
            AfTaskClose                     'AFタスクに終了要求(WM_CLOSE)を出す
        End If
        Unload Me
        Exit Sub
    '----------------------------------
    Case "ENDSYSTEM"    'すべて終了させる
        Ret = AfTaskCheck                   '起動中のAFタスクを調べる
        If Ret <> 0 Then
            AfTaskClose                     'AFタスクに終了要求(WM_CLOSE)を出す
        End If
        Unload Me
        Exit Sub
    '----------------------------------
    Case "ENDPHONE"     '終了させる
        Unload Me
        Exit Sub
    '----------------------------------
    Case "OUTPHONE"     '電話機起動
        gFlagOutPhone = True
        'フラグに合わせてボタン状態をセット
        ShowButtonStatus
    '----------------------------------
    Case "ENDOUTPHONE"  '電話機終了
        gFlagOutPhone = False
        'フラグに合わせてボタン状態をセット
        ShowButtonStatus
    '----------------------------------
    Case "ENDCANCEL"    '終了取り消し(「終了」ボタン押下後、他のアプリがキャンセル要求)
        tmrAfTaskClose.Enabled = False
    End Select

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 「終了」ボタン - デバッグ用
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub cmdDebug_Click()
    Unload Me
End Sub

'---------------------------------------------------------------------
' 目的説明  -- ログに残す
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub CtiAddCmdLog(Level As Integer, strMsg As String)
On Error GoTo Err_Exit
    
    Dim Ret     As Long
    Dim nLen    As Long
    Dim nPos    As Long
    
    lstLog.AddItem strMsg, 0
    
    If lstLog.ListCount > 50 Then
        nLen = lstLog.ListCount - 50
        For nPos = 0 To nLen
           lstLog.RemoveItem lstLog.ListCount - 1
        Next
    End If
    
    TraceLog Level, strMsg
        
    Exit Sub
Err_Exit:
    MsgBox Err.Description, vbExclamation
End Sub

'---------------------------------------------------------------------
' 目的説明  -- AP状態を変更する
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Sub SetReadyMode(lngReadyMode As Long)
    Dim i       As Integer
    Dim str     As String

    CtiAddCmdLog LOG_DBG, "SetReadyMode(" & lngReadyMode & ")"

    gPhone.ReadyMode = lngReadyMode

    'AP状態表示を変更する
    i = ApplStatusIdx(CInt(lngReadyMode))
    
    'モニタ中表示
    If gAPStat(i).UserStatus > 1 Then 'And lngUserStatus <> 4 Then
        If ucPhoneApi1.LogonType = 3 Then       'ログオン種類 (0:通常, 1:PD, 2:着信, 3:モニタ)
            lngReadyMode = APSTAT_MONITOR
            gPhone.ReadyMode = lngReadyMode
            i = ApplStatusIdx(CInt(lngReadyMode))
        End If
    End If
    
    '状態表示を更新
    txtStatus.BackColor = gAPStat(i).BackColor
    txtStatus.Caption = gAPStat(i).Title

    'ウインドウの背景色を変更
    Me.BackColor = txtStatus.BackColor
    
    'APIプロパティにもセットする
    ucPhoneApi1.BackColor = txtStatus.BackColor

    CtiAddCmdLog LOG_DBG, "「" & txtStatus.Caption & "」(" & ucPhoneApi1.AppStatus & ")"
    
    'フラグに合わせてボタン状態をセット
    ShowButtonStatus
    
    'DBのステータスを変更する
    If lngReadyMode = APSTAT_LOGOFF And gUser.Extension = "" Then
        'Load時に画面表示のみ先行し、設定値が不完全でくる
    Else
        SetCtiUserStatus
    End If
    
    'AP状態を入れる
    If ucPhoneApi1.AppStatus <> CStr(lngReadyMode) Then
        ucPhoneApi1.AppStatus = lngReadyMode
    End If
    
    '状態取得
    str = ucPhoneApi1.GetStatus
    Select Case lngReadyMode
    
    Case APSTAT_IBSTOP              '受付停止(IB)
        If str <> "WorkTime" Then ucPhoneApi1.WorkTime
    
    Case APSTAT_PDSTOP              '発信停止(PD)
        If str <> "WorkTime" Then ucPhoneApi1.WorkTime
    
    Case APSTAT_IBREADY             '受付可能(IB)
        '対応ダイヤルインを取得する
        DialinGroupSet
    
        'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL (4,6,8 は疑似動作)
        If gUser.CtiMode = 9 And str <> "Ready" Then
            ucPhoneApi1.Ready
        End If
    
    Case APSTAT_PDREADY             '受付可能(PD)
        'ACの発信待ち時間
        i = SQL_GET_CF2PROFILE(4, "PRE_G" & Format(gUser.GroupCode, "00") & "_NOANS_RINGNUMBER")
        gPhone.AutoCallWait = i * 3                 '発信回数 * 3秒 = NoAnswerまでの発信待ち時間
        
        'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL (4,6,8 は疑似動作)
        If gUser.CtiMode = 1 And str <> "Ready" Then
            ucPhoneApi1.Ready
        End If
    
    Case APSTAT_NEXT                '待機中(AC,PC次データ待ち)
        If str <> "WorkTime" Then ucPhoneApi1.WorkTime
    
    Case APSTAT_SELECT              '選択中
        If str <> "WorkTime" Then ucPhoneApi1.WorkTime
    
    Case APSTAT_DATAIN              '処理中
        If str <> "WorkTime" Then ucPhoneApi1.WorkTime
                                         
    Case APSTAT_MAKECALL            '発信中
        If str <> "WorkTime" Then ucPhoneApi1.WorkTime
                                         
    Case APSTAT_COUNT               'カウント中
        If str <> "WorkTime" Then ucPhoneApi1.WorkTime
    
    End Select
        
End Sub

'---------------------------------------------------------------------
' 目的説明  -- ダイヤルイングループの設定
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Sub DialinGroupSet()
On Error GoTo Err_Exit
    ' ADOのｵﾌﾞｼﾞｪｸﾄ変数を宣言する
    Dim cnn         As New ADODB.Connection
    Dim rs          As New ADODB.Recordset
    Dim qry         As New ADODB.Recordset
    Dim strMessage  As String
    Dim errX        As ADODB.Error
    Dim SQL         As String
    Dim DialinNo    As String
    Dim DialinList  As String
    
    DialinList = ""
    
    'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
    If gUser.CtiMode = 9 Then
        cnn.Open gDbConnectionString       ' 接続を確立する
        
        'ユーザーのクライアントコード取得
        SQL = "select * from TB_USERCLIENTPOWER where UserID='" & gUser.UserID & "'"
        TraceLog LOG_SQL, SQL
        rs.Open SQL, cnn, adOpenKeyset, adLockOptimistic
        Do Until rs.EOF
            '該当するダイヤルインを取得する
            If rs!ClientCode <> 0 Then
                SQL = "select * from TB_DIALIN where ClientCode=" & rs!ClientCode
                TraceLog LOG_SQL, SQL
                qry.Open SQL, cnn, adOpenKeyset, adLockOptimistic
                Do Until qry.EOF
                    DialinNo = "" & qry!DialinNo
                    DialinList = DialinList & DialinNo & ";"
                    qry.MoveNext
                Loop
                qry.Close
            End If
            rs.MoveNext
        Loop
        rs.Close
    
        cnn.Close
    End If
    
    '着信可能ダイヤルインを指定する
    ucPhoneApi1.CommandEx "ACCEPTDIALIN " & DialinList
    
    Exit Sub
Err_Exit:
    TraceLog LOG_ERR, "[DialinGroupSet]" & Err.Description
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 発信通知番号を取得
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Function GetFreeDial(ClientCode As Long) As String
On Error GoTo Err_Exit
    ' ADOのｵﾌﾞｼﾞｪｸﾄ変数を宣言する
    Dim cnn         As New ADODB.Connection
    Dim rs          As New ADODB.Recordset
    Dim strMessage  As String
    Dim errX        As ADODB.Error
    Dim SQL         As String
    
    If ClientCode = 0 Then
        Exit Function
    End If

    cnn.Open gDbConnectionString       ' 接続を確立する
    
    SQL = "select FreeDial from TB_DIALIN where ClientCode=" & ClientCode
    TraceLog LOG_SQL, SQL
    rs.Open SQL, cnn, adOpenKeyset, adLockOptimistic
    If rs.EOF = False Then
        GetFreeDial = "" & rs!FreeDial
    End If
    rs.Close

    cnn.Close
    Exit Function
Err_Exit:
    TraceLog LOG_ERR, "[GetFreeDial]" & Err.Description
End Function

'---------------------------------------------------------------------
' 目的説明  -- ボタン押下
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub btnCti_Click(Index As Integer)
On Error GoTo Err_Exit
    Dim Ret         As Long
    Dim strAppl     As String
    Dim strParm     As String

    strAppl = ""
    strParm = ""

    Dim cnn         As New ADODB.Connection
    cnn.Open gDbConnectionString       '###### 接続 ######

    Select Case Index
    
    Case CEX_MAIL       '6:申送事項
        CtiAddCmdLog LOG_INF, "<申送事項>ボタン"
        strAppl = SQL_GET_PROFILE_STRING(cnn, SECTION_BUTTON, "210")
        strParm = " " & gUser.UserID
    
    Case CEX_PASS       '7:Pass変更
        CtiAddCmdLog LOG_INF, "<Pass変更>ボタン"
        strAppl = SQL_GET_PROFILE_STRING(cnn, SECTION_BUTTON, "220")
        strParm = " " & gUser.UserID
    
    Case CEX_PLAY       '8:録音検索
        CtiAddCmdLog LOG_INF, "<録音検索>ボタン"
        'Shell App.Path & "\ISC_RECCLI.exe", vbNormalFocus
        strAppl = SQL_GET_PROFILE_STRING(cnn, SECTION_BUTTON, "230")
        strParm = " " & gUser.UserID
    
    Case CEX_LEAVESEAT  '10:離席
        CtiAddCmdLog LOG_INF, "<離席>ボタン"
        strAppl = SQL_GET_PROFILE_STRING(cnn, SECTION_BUTTON, "240")
        strParm = " " & gUser.UserID & ",1"
    
    Case CEX_BREAKTIME  '11:休憩
        CtiAddCmdLog LOG_INF, "<休憩>ボタン"
        strAppl = SQL_GET_PROFILE_STRING(cnn, SECTION_BUTTON, "250")
        strParm = " " & gUser.UserID & ",2"
    
    Case CEX_TRINING    '12:研修
        CtiAddCmdLog LOG_INF, "<研修>ボタン"
        strAppl = SQL_GET_PROFILE_STRING(cnn, SECTION_BUTTON, "260")
        strParm = " " & gUser.UserID & ",3"
        
    End Select
    
    cnn.Close                           '###### 切断 ######
    
    '外部アプリケーションの起動
    If strAppl <> "" Then
        CtiAddCmdLog LOG_INF, "起動アプリ: " & strAppl
        Call Shell(App.Path & "\" & strAppl & strParm, vbNormalFocus)
    End If
    
    Exit Sub
Err_Exit:
    TraceLog LOG_ERR, "[btnCti_Click]" & Err.Description
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 電話機能のボタンが押下された。
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub cmdButton_Click(Index As Integer)
On Error GoTo Err_Exit
    Dim Ret As Long
    Dim FlagConnect As Boolean
    
    Dim frmLogon As frmLogonGroup
    
    Select Case Index
    
    Case CMD_EXIT                           '10:終了
        CtiAddCmdLog LOG_INF, "<終了>ボタン"
'        Ret = f_MsgPop("AgentForceを終了してよろしいですか？", MSG_QUESTION)
'        If Ret = False Then
'            Exit Sub
'        End If
        m_bChangeGroup = False
        
        mTempFileDelete App.Path & "\" & DOCUMENT_GET_FOLDER_NAME
        mTempFileDelete App.Path & "\" & DOCUMENT_SET_FOLDER_NAME

        Ret = True
        Ret = AfTaskCheck                   '起動中のAFタスクを調べる
        If Ret = 0 Then
            'AFタスクが起動していなかったら終わる
            afValue.PostData "ENDPHONE"
        Else
            AfTaskClose         'AFタスクに終了要求(WM_CLOSE)を出す
            tmrAfTaskClose.Interval = 1000
            tmrAfTaskClose.Enabled = True
        End If
    
    Case CMD_IBREADY                        '7:受付開始(Ready)
        CtiAddCmdLog LOG_INF, "<受付開始>ボタン"
        cmdButton(CMD_IBREADY).Enabled = False
        SetReadyMode (APSTAT_IBREADY)       '画面の状態を着信待ちにする
        'ucPhoneApi1.Ready                   'CTIをReady状態にする
    
    Case CMD_IBSTOP                         '6:受付終了(WorkTime)
        CtiAddCmdLog LOG_INF, "<受付終了>ボタン"
        cmdButton(CMD_IBSTOP).Enabled = False
        SetReadyMode (APSTAT_IBSTOP)        '画面の状態を受付停止にする
        'ucPhoneApi1.WorkTime                'CTIをWorktime状態にする
    
    Case CMD_PDREADY                        '9:発信開始(PDReady)
        CtiAddCmdLog LOG_INF, "<発信開始>ボタン"
        'アウトバウンド業務は「メイン」が必ず起動していること
        If GetMainCount("メイン(") = 0 Then 'SVMAINのウインドウ数を取得する
            f_MsgPop "「メイン」を起動してください。", MSG_ERROR
            Exit Sub
        End If
        cmdButton(CMD_PDREADY).Enabled = False
    '   CtiMode (0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL)
        If gUser.CtiMode = 1 Then
            SetReadyMode (APSTAT_PDREADY)   '受付開始(PD)
            'ucPhoneApi1.Ready
        End If
        If gUser.CtiMode = 2 Then
            SetReadyMode (APSTAT_PDREADY)   '受付開始(PD)
            ucPhoneApi1.GetCallData         '番号要求を出す
        End If
    
    Case CMD_PDSTOP                         '8:発信終了(PDNotReady)
        CtiAddCmdLog LOG_INF, "<発信終了>ボタン"
        cmdButton(CMD_PDSTOP).Enabled = False
        SetReadyMode (APSTAT_PDSTOP)        '発信停止
        'ucPhoneApi1.WorkTime
    
    Case CMD_MAKECALL                       '0:発信
        CtiAddCmdLog LOG_INF, "<発信>ボタン"
        If txtPhoneNo = "" Then
            Exit Sub
        End If
        If gPhone.FlagMakecall = False Then
            cmdButton(CMD_MAKECALL).Enabled = False
            gPhone.CallWait = Now           '発信開始時刻
            gPhone.TalkSecond = 0           '通話秒数
            ucPhoneApi1.PhoneNo = txtPhoneNo
            ucPhoneApi1.MakeCall
        End If
        
    Case CMD_PHONE                          '13:電話機
        CtiAddCmdLog LOG_INF, "<電話機>ボタン"
        Shell App.Path & "\AF_PHONE.exe", vbNormalFocus
        DoEvents
        afValue.PostData "TOPOUTPHONE"
    
    Case CMD_DISCONNECT                     '1:切断
        CtiAddCmdLog LOG_INF, "<切断>ボタン"
        cmdButton(CMD_DISCONNECT).Enabled = False
        If gPhone.FlagMakecall = True Then
            ucPhoneApi1.StopCall            '発信中のときは停止要求
        ElseIf gPhone.FlagOnCall = True Then
            ucPhoneApi1.NotAnswer           '着信のときは着信拒否
        Else
            ucPhoneApi1.Disconnect          '他、切断要求
        End If
   
    Case CMD_HOLD                           '2:保留
        CtiAddCmdLog LOG_INF, "<保留>ボタン"
        cmdButton(CMD_HOLD).Enabled = False
        ucPhoneApi1.Hold
    
    Case CMD_UNHOLD                         '3:保留解除
        CtiAddCmdLog LOG_INF, "<保留解除>ボタン"
        cmdButton(CMD_UNHOLD).Enabled = False
        ucPhoneApi1.UnHold
    
    Case CMD_TRANSINSIDE                    '4:内線発信
        CtiAddCmdLog LOG_INF, "<内線転送>ボタン"
        frmExtension.Show (1)
    
    Case CMD_TRANSOUTSIDE                   '5:外線発信
        CtiAddCmdLog LOG_INF, "<外線転送>ボタン"
        frmTransferList.Show (1)
       
    Case CMD_NEXT                           '11:次顧客
        CtiAddCmdLog LOG_INF, "<次顧客>ボタン"
        SetReadyMode (APSTAT_NEXT)
        'ucPhoneApi1.WorkTime
        'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
        ' (4,6,8 は疑似動作)
        If gUser.CtiMode = 2 Or gUser.CtiMode = 3 Or gUser.CtiMode = 4 Then
            cmdButton(CMD_NEXT).Enabled = False
            ucPhoneApi1.GetCallData
            'ucPhoneApi1.ProfileIDに値が入る
        End If
        
    Case CMD_BACK                           '12:解除
        CtiAddCmdLog LOG_INF, "<解除>ボタン"
        SetReadyMode (APSTAT_PDSTOP)
        'ucPhoneApi1.WorkTime
        If CLng("0" & ucPhoneApi1.ProfileID) <> 0 Then
            ucPhoneApi1.SetCallSelect ucPhoneApi1.ProfileID, "0"
            ucPhoneApi1.ProfileID = "0"
        End If
    
    '2009/12/17 -->[#001]
    Case CMD_CHANGEJOB                      '14:業務切替
    
        '大阪府対応分 2011/08/09------------------------------------------------------------>>
        cmdButton(CMD_CHANGEJOB).Enabled = False
    
        CtiAddCmdLog LOG_INF, "<業務切替>ボタン"
    
        Set frmLogon = New frmLogonGroup
        
        frmLogon.Show vbModal
        
        '大阪府対応分 2011/08/09------------------------------------------------------------<<
        cmdButton(CMD_CHANGEJOB).Enabled = True
        
        If frmLogon.DialogResult = vbOK Then
            '切替実施されたら一旦終了
            m_bChangeGroup = True
    
            'ログオン状態を保存
            SaveLogonData
    
            AfTaskClose         'AFタスクに終了要求(WM_CLOSE)を出す
            tmrAfTaskClose.Interval = 1000
            tmrAfTaskClose.Enabled = True
            
        End If
        
        Set frmLogon = Nothing
    
    '2009/12/17 <--[#001]
    
    Case CMD_COUNT                          '20:カウント
        'NextMode = 次の発信・受付開始モード (0=次ボタン, 1=即時, 2=x秒カウント, 3=停止)
        Select Case ucPhoneApi1.NextMode
        Case 1
            gQuestionAnswer = True
        Case 2
            CtiAddCmdLog LOG_INF, "<カウント>画面"
            ucPhoneApi1.WorkTime
            gNextMsg = ucPhoneApi1.NextMsg    '"正常に結果を登録することができました。" & vbCrLf & vbCrLf & "※3秒後に自動的に発信を開始します。"
            gNextTime = ucPhoneApi1.NextTime
            frmNextDial.Show (1)
        Case 3
            gQuestionAnswer = False
        Case Else
            gQuestionAnswer = False
        End Select
        
        If gQuestionAnswer = True Then
            '受付開始
            'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
            ' (4,6,8 は疑似動作)
            Select Case gUser.CtiMode
            Case 1
                SetReadyMode (APSTAT_PDREADY)   '受付可能(PD)
                'ucPhoneApi1.Ready
            Case 9
                SetReadyMode (APSTAT_IBREADY)   '受付可能(IB)
                'ucPhoneApi1.Ready
            Case 2
                Call cmdButton_Click(CMD_NEXT)  'AC,PC次データ待ち
            Case 3, 4
                SetReadyMode (APSTAT_NEXT)      'AC,PC次データ待ち
                'ucPhoneApi1.WorkTime
            Case 5, 6, 7, 8
                SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
                'ucPhoneApi1.WorkTime
            Case 10
                SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
                'ucPhoneApi1.WorkTime
            Case Else
                SetReadyMode (APSTAT_IBREADY)   '着信待ち
                'ucPhoneApi1.Ready
            End Select
        Else
            '受付停止
            'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
            ' (4,6,8 は疑似動作)
            Select Case gUser.CtiMode
            Case 1
                SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
                'ucPhoneApi1.WorkTime
            Case 9
                SetReadyMode (APSTAT_IBSTOP)    '受付停止(IB)
                'ucPhoneApi1.WorkTime
            Case 2, 3, 4
                SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
                'ucPhoneApi1.WorkTime
            Case 5, 6, 7, 8
                SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
                'ucPhoneApi1.WorkTime
            Case 10
                SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
                'ucPhoneApi1.WorkTime
            Case Else
                SetReadyMode (APSTAT_IBSTOP)    '受付停止(IB)
                'ucPhoneApi1.WorkTime
            End Select
        End If
    
    End Select

    Exit Sub
Err_Exit:
    ErrorBreak "frmMain.cmdButton_Click"
End Sub

'---------------------------------------------------------------------
' 目的説明  -- フォームロード
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub Form_Load()
On Error GoTo Err_Exit
    Dim cnn         As New ADODB.Connection
    Dim vntData     As Variant
    Dim SQL         As String
    
'電話テスト起動設定
''    afValue.v("UserID") = "af001"
''    afValue.v("OpeName") = "徳重"
''    afValue.v("LogonMode") = 2
''    afValue.v("ClientCode") = "9"
''    afValue.v("JobCode") = "1001"
''    afValue.v("ListCode") = "1002"
''    afValue.v("GroupCode") = "1"
        
    gCurrentPath = App.Path
    
    sWaitCnt = "0"
    lblDebug.Caption = ""
    gStartDay = Now    '起動日
    
    Me.Height = 1395
    Me.Move 0, 13540
    
    '画面からはみ出たら中に入れる
    If Screen.Height < Me.Top Then
        Me.Top = Screen.Height - Me.Height
    End If
        
    gUser.UserID = afValue.v("UserID")
    gUser.UsrStat = 1
    gUser.CtiMode = CLng("0" & afValue.v("LogonMode"))
        
    '起動パラメータ UserID,UsrStat,CtiMode
    '   UsrStat (0=未ログイン、1=無作業、2=待機(着信待ち)、3=作業),
    '   CtiMode (0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL)
    If Command <> "" Then
        vntData = Split(Command & ",,,", ",")
        gUser.UserID = vntData(0)
        gUser.UsrStat = CLng("0" & vntData(1))
        gUser.CtiMode = CLng("0" & vntData(2))
    End If
    If gUser.UserID = "" Then
        gUser.UserID = "af12345"
    End If
    
    gLogLevel = CInt("0" & afValue.v("LogLevel"))
    TraceLog LOG_INF, "-------------------------" & gLogLevel
        
    gUser.ClientCode = CLng("0" & afValue.v("ClientCode"))
    gUser.JobCode = CLng("0" & afValue.v("JobCode"))
    gUser.ListCode = CLng("0" & afValue.v("ListCode"))
    gUser.GroupCode = CLng("0" & afValue.v("GroupCode"))
    
    SQL = "UserID=" & gUser.UserID
    SQL = SQL & ", UserName=" & afValue.v("OpeName")
    SQL = SQL & ", LogonMode=" & gUser.CtiMode
    SQL = SQL & ", GroupCode=" & gUser.GroupCode
    SQL = SQL & ", ClientCode=" & gUser.ClientCode
    SQL = SQL & ", JobCode=" & gUser.JobCode
    SQL = SQL & ", ListCode=" & gUser.ListCode
    TraceLog LOG_INF, SQL
    
    lblUserId.Caption = gUser.UserID
    lblUserName.Caption = afValue.v("OpeName")
    
    'DBアクセス情報取得
    GET_DBSTRING gCurrentPath & "\AgentForce.ini"
    TraceLog LOG_DBG, gDbConnectionString
    
    SetReadyMode (APSTAT_LOGOFF)        'ログオフ
    Me.Show
    'DoEvents
    
    If gUser.UserID = "" Then
        f_MsgPop "電話機起動パラメータエラーです。", MSG_ERROR
        mEndPhone
        Unload Me
        End
    End If
    
    cnn.Open gDbConnectionString       '###### 接続 ######
            
    'CTI種別 (0:なし,1:Ctstage,2:CF2,3:αGX,4:Comsip,5:Genesys,6:Avaya,)
    gUser.CtiType = SQL_GET_PROFILE_STRING(cnn, SECTION_CTI, "Type")
    ucPhoneApi1.CtiType = CLng("0" & gUser.CtiType)
    m_nCtiType = CLng("0" & gUser.CtiType)
    
    'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
    ' (4,6,8 は疑似動作)
    If gUser.CtiMode = 4 Or gUser.CtiMode = 6 Or gUser.CtiMode = 8 Then
        ucPhoneApi1.CtiType = 0
        m_nCtiType = 0
    End If
    
    ucPhoneApi1.OpenTel     'ocx初期処理(OpenTelの前にCtiTypeを指定しておくこと)
    gPhone.FlagOpen = True
    
    '着信イベントを無視する指定(AlfaGXなどでNotReadyできないので強制無視する指定)
    If gUser.CtiMode = 9 Then
        ucPhoneApi1.InboundMode = 1     '着信を有効
    Else
        ucPhoneApi1.InboundMode = 1 '0     'Alfaのみ着信を無視。CF2はNotReadyできるので1でOK
    End If
    
    'AP状態定義を取得する
    GetApplStatus cnn
    
    'ユーザー情報を取得する
    GET_USERDATA cnn
    lblUserName.Caption = gUser.UserName
    
    'UserDataが設定してなかったとき
    If gUser.CtiUserID = "" Then gUser.CtiUserID = gUser.UserID
    If gUser.CtiUserID = "" Then gUser.CtiUserID = ucPhoneApi1.Computer
    
    '複数メイン対応 (0=１つのみ、1=複数可能)
    ucPhoneApi1.MultiMain = SQL_GET_PROFILE_STRING(cnn, SECTION_APPL, "MultiMain")
    
    '「メイン」のアプリ名を取得
    gMainAppl = SQL_GET_PROFILE_STRING(cnn, SECTION_BUTTON, "000")
    
    cnn.Close                           '###### 切断 ######
    
    SetReadyMode (APSTAT_LOGOFF)        'ログオフ
    'DoEvents
    
    ucPhoneApi1.AppStatus = APSTAT_LOGOFF '"ログオフ"
    ucPhoneApi1.Server = gUser.Server
    ucPhoneApi1.PortNo = gUser.PortNo
    ucPhoneApi1.CtiUserID = gUser.CtiUserID
    ucPhoneApi1.CtiOpName = afValue.v("OpeName")
    ucPhoneApi1.CtiPassWD = gUser.CtiPassWD
    ucPhoneApi1.Extension = gUser.Extension
    ucPhoneApi1.Group = CLng("0" & afValue.v("GroupCode"))
    ucPhoneApi1.LogonType = 0       'ログオン種類 (0:通常, 1:PD, 2:着信, 3:モニタ)
    ucPhoneApi1.WorktimeMode = 2    'ワークタイムモード (0:NotReady, 1:外線Ready, 2:内線Ready, 3:内外線Ready)
    ucPhoneApi1.AutoRec = 0                     '自動録音
    
    'LogonMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
    Select Case gUser.CtiMode
    Case 1, 2, 3, 4, 5, 6, 7, 8, 10
        ucPhoneApi1.LogonType = 1   'PD
    Case 9
        ucPhoneApi1.LogonType = 2   '着信
    Case Else
        ucPhoneApi1.LogonType = 0   '通常
    End Select
    
    '以下の値は業務アプリが画面情報が変わる度に入れていく
'    ucPhoneApi1.TransCode = 0                   '外線転送コード
'    ucPhoneApi1.CallingNumber = ""              '発信通知番号
'    ucPhoneApi1.TransInfo = ""                  '転送通知情報

    If gUser.Extension = "" Then
        f_MsgPop "端末登録が行われていません。", MSG_ERROR
        ucPhoneApi1.CtiType = 0
        gUser.UsrStat = 0
        gUser.CtiMode = 0
'        mEndPhone
'        DoEvents
'        AfTaskClose
'        CmdSend1.CmdSend "@ENDPHONE"
'        DoEvents
'        CmdSend1.Close
'        Unload Me
'        End
    End If

    '小さい画面のPCで動かしたら画面に入れる
    If (Screen.Height - frmMain.Height) < frmMain.Top Then
        frmMain.Top = (Screen.Height - frmMain.Height) - 400
    End If
    If (Screen.Width - frmMain.Width) < frmMain.Left Then
        frmMain.Left = (Screen.Width - frmMain.Width)
    End If
    
    '録音再生ボタンの有効・無効
    If AF_FuncCheck(FUNC_090104, frmMain.afValue) = True Then
        sPlayBtn = True
    Else
        sPlayBtn = False
    End If
    
    cmdButton(CMD_IBREADY).Enabled = False      '受付開始
    cmdButton(CMD_IBSTOP).Enabled = False       '受付停止
    cmdButton(CMD_PDREADY).Enabled = False      '発信開始
    cmdButton(CMD_PDSTOP).Enabled = False       '発進停止
    cmdButton(CMD_MAKECALL).Enabled = False     '発信
    cmdButton(CMD_PHONE).Enabled = False        '電話機
    cmdButton(CMD_DISCONNECT).Enabled = False   '切断
    cmdButton(CMD_HOLD).Enabled = False         '保留
    cmdButton(CMD_UNHOLD).Enabled = False       '保留解除
    cmdButton(CMD_TRANSINSIDE).Enabled = False  '内線転送
    cmdButton(CMD_TRANSOUTSIDE).Enabled = False '外線転送
    cmdButton(CMD_EXIT).Enabled = True          '終了
    cmdButton(CMD_NEXT).Enabled = False         '次項目
    cmdButton(CMD_BACK).Enabled = False         '解除

    btnCti(CEX_MAIL).Enabled = True 'False      '申し送り
    btnCti(CEX_PASS).Enabled = True 'False      'Pass変更
    btnCti(CEX_PLAY).Enabled = sPlayBtn 'False      '録音再生
    btnCti(CEX_LEAVESEAT).Enabled = True 'False '離席
    btnCti(CEX_BREAKTIME).Enabled = True 'False '休憩
    btnCti(CEX_TRINING).Enabled = True 'False   '研修
    
    cmdButton(CMD_NEXT).Top = 1200              '次顧客
    cmdButton(CMD_NEXT).Left = 1800
    cmdButton(CMD_BACK).Top = 1200              '解除
    cmdButton(CMD_PDREADY).Top = 1200           '発信開始
    cmdButton(CMD_PDSTOP).Top = 1200            '発進停止
    cmdButton(CMD_IBREADY).Top = 1200           '受付開始
    cmdButton(CMD_IBSTOP).Top = 1200            '受付停止
    
    FrameMode.Visible = False                   'モード枠
'    optNext(0).Value = False                    ' 即時
'    optNext(1).Value = True                     ' ３秒
'    optNext(2).Value = False                    ' 停止
    
    'NextMode = 次の発信・受付開始モード (0=次ボタン, 1=即時, 2=x秒カウント, 3=停止)
    'LogonMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
    If gUser.CtiMode <> 9 Then
        ucPhoneApi1.NextMode = 2
    Else
        ucPhoneApi1.NextMode = 1
    End If

    ' ﾊﾟｽﾜｰﾄﾞ有効期限のﾁｪｯｸ
    If mPaswordCheck Then
        btnCti(7).BackColor = CLR_CHECK
    Else
        btnCti(7).BackColor = CLR_FREE
    End If
    
    ' 未読チェックタイマー
    tmrMsg.Interval = 10000
    gMsgRead.Count = 4
    Call tmrMsg_Timer
    tmrMsg.Enabled = True
    
    'フラグに合わせてボタン状態をセット
    ShowButtonStatus
    SetCtiUserStatus
        
    'CTI接続
    ucPhoneApi1.Init

    'ダイヤルイン一覧取得
    GetDialInList
    
    '発信通知番号取得
    Me.ucPhoneApi1.CallingNumber = GetFreeDial(gUser.ClientCode)

Exit Sub
Err_Exit:
    ErrorBreak "frmMain.Load"
End Sub

'---------------------------------------------------------------------
' 目的説明  -- フォームクエリアンロード
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

    Me.Visible = False

End Sub

'---------------------------------------------------------------------
' 目的説明  -- フォームアンロード
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub Form_Unload(Cancel As Integer)

    '終了処理
    mEndPhone

'    '電話機能クローズ
    ucPhoneApi1.EndTel
    ucPhoneApi1.CloseTel

    'プロセス間通信終了
    'CmdSend1.Close

    End
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 終了処理
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub mEndPhone()
On Error GoTo Err_Exit
    Dim Ret     As Long

    If gPhone.FlagEnd = True Then
        Exit Sub    '終了処理実行済み
    End If

    gPhone.FlagEnd = True

    'ボタンを使用不可にする
    cmdButton(CMD_IBREADY).Enabled = False      '受付開始
    cmdButton(CMD_IBSTOP).Enabled = False       '受付停止
    cmdButton(CMD_PDREADY).Enabled = False      '発信開始
    cmdButton(CMD_PDSTOP).Enabled = False       '発進停止
    cmdButton(CMD_MAKECALL).Enabled = False     '発信
    cmdButton(CMD_PHONE).Enabled = False        '電話機
    cmdButton(CMD_DISCONNECT).Enabled = False   '切断
    cmdButton(CMD_HOLD).Enabled = False         '保留
    cmdButton(CMD_UNHOLD).Enabled = False       '保留解除
    cmdButton(CMD_TRANSINSIDE).Enabled = False  '内線転送
    cmdButton(CMD_TRANSOUTSIDE).Enabled = False '外線転送
    cmdButton(CMD_EXIT).Enabled = False         '終了
    cmdButton(CMD_NEXT).Enabled = False         '次項目
    cmdButton(CMD_BACK).Enabled = False         '解除

    btnCti(CEX_MAIL).Enabled = False            '申し送り
    btnCti(CEX_PASS).Enabled = False            'Pass変更
    btnCti(CEX_PLAY).Enabled = False            '録音再生
'    btnCti(CEX_WORK).Enabled = False           '作業
    btnCti(CEX_LEAVESEAT).Enabled = False       '離席
    btnCti(CEX_BREAKTIME).Enabled = False       '休憩
    btnCti(CEX_TRINING).Enabled = False         '研修
    
    'ログオフ命令を出す
    If gPhone.FlagLogin Then
        ucPhoneApi1.Logoff
    End If
    
    gPhone.ReadyMode = 0
    gPhone.FlagError = 0

    '作業ステータス＆時間集計
    gUser.CtiMode = 0
    SetCtiUserStatus
        
    'FTPサーバー情報を取得する
    GetFtpProfile gDbConnectionString

    'ログファイルをサーバーへ送る
    SendLogData
    
    '「*.old」ファイル削除
    DeleteFileExtOld
        
    cmdButton(CMD_EXIT).Enabled = True          '終了(以降トラブル時終われるように押下可能にする)
    Exit Sub

Err_Exit:
    TraceLog LOG_ERR, "[mEndPhone]" & Err.Description
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 可変ボタン表示
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ShowButtonExt()
On Error GoTo Err_Exit
    
    '座標位置で表示OFFしています。Top=120 表示, Top=1200 非表示
    
    cmdButton(CMD_NEXT).Top = 1200              '次顧客
    cmdButton(CMD_NEXT).Left = 1800
    cmdButton(CMD_BACK).Top = 1200              '解除
    
    cmdButton(CMD_PDREADY).Top = 1200           '発信開始
    cmdButton(CMD_PDREADY).Left = 1800 '2940
    cmdButton(CMD_PDSTOP).Top = 1200            '発進停止
    cmdButton(CMD_PDSTOP).Left = 2940 '4080
    
    cmdButton(CMD_IBREADY).Top = 1200           '受付開始
    cmdButton(CMD_IBREADY).Left = 1800 '2940
    cmdButton(CMD_IBSTOP).Top = 1200            '受付停止
    cmdButton(CMD_IBSTOP).Left = 2940 '1800 '4080
    
    FrameMode.Visible = False                   'モード枠
    optNext(0).Visible = False                    ' 即時
    optNext(1).Visible = False                    ' ３秒
    optNext(2).Visible = False                    ' 停止
    
    Select Case gUser.CtiMode
    
    Case 0  ' 0：未ログイン
        cmdButton(CMD_NEXT).Top = 120           '次顧客
        cmdButton(CMD_NEXT).Enabled = False
    
    Case 1  '1：PD
        FrameMode.Visible = True                'モード枠
        optNext(0).Visible = True                 ' 即時
        optNext(1).Visible = True                 ' ３秒
        optNext(2).Visible = True                 ' 停止
        cmdButton(CMD_PDREADY).Top = 1200    '発信開始
        cmdButton(CMD_PDSTOP).Top = 120     '発進停止
        
        If gPhone.FlagConnect Or gPhone.FlagHold Then   '通話中
        ElseIf gPhone.ReadyMode = APSTAT_DATAIN Then    '処理中
        ElseIf gPhone.ReadyMode = APSTAT_SELECT Then    '選択中
        Else
            FrameMode.Visible = False                'モード枠
            optNext(0).Visible = False                 ' 即時
            optNext(1).Visible = False                 ' ３秒
            optNext(2).Visible = False                 ' 停止
            cmdButton(CMD_PDREADY).Top = 120    '発信開始
            cmdButton(CMD_PDSTOP).Top = 120     '発進停止
        End If
    
    Case 2  '2：AC
        FrameMode.Visible = True                'モード枠
        optNext(0).Visible = True                 ' 即時
        optNext(1).Visible = True                 ' ３秒
        optNext(2).Visible = True                 ' 停止
        cmdButton(CMD_PDREADY).Top = 1200    '発信開始
        cmdButton(CMD_PDSTOP).Top = 120     '発進停止
        
        If gPhone.FlagConnect Or gPhone.FlagHold Then   '通話中
        ElseIf gPhone.ReadyMode = APSTAT_DATAIN Then    '処理中
        ElseIf gPhone.ReadyMode = APSTAT_SELECT Then    '選択中
        Else
            FrameMode.Visible = False                'モード枠
            optNext(0).Visible = False                 ' 即時
            optNext(1).Visible = False                 ' ３秒
            optNext(2).Visible = False                 ' 停止
            cmdButton(CMD_PDREADY).Top = 120    '発信開始
            cmdButton(CMD_PDSTOP).Top = 120     '発進停止
        End If
    
    Case 3  '3：PC
        cmdButton(CMD_NEXT).Top = 120           '次顧客
        cmdButton(CMD_BACK).Top = 120           '解除
    
    Case 4  '4：DPC
        cmdButton(CMD_NEXT).Top = 120           '次顧客
        cmdButton(CMD_BACK).Top = 120           '解除
    
    Case 5  '5：PV
'        cmdButton(CMD_NEXT).Top = 120           '次顧客
'        cmdButton(CMD_BACK).Top = 120           '解除
    
    Case 6  '6：DPV
'        cmdButton(CMD_NEXT).Top = 120           '次顧客
'        cmdButton(CMD_BACK).Top = 120           '解除
    
    Case 7  '7: DC
'        cmdButton(CMD_NEXT).Top = 120           '次顧客
'        cmdButton(CMD_BACK).Top = 120           '解除
    
    Case 8  '8: DDC
'        cmdButton(CMD_NEXT).Top = 120           '次顧客
'        cmdButton(CMD_BACK).Top = 120           '解除
    
    Case 9  '9: IB
        If ucPhoneApi1.MultiMain = 1 Then
            cmdButton(CMD_IBSTOP).Top = 120         '受付停止
            cmdButton(CMD_IBREADY).Top = 120        '受付開始
        Else
            cmdButton(CMD_IBREADY).Top = 1200       '受付開始
            cmdButton(CMD_IBSTOP).Top = 120         '受付停止
            FrameMode.Visible = True                'モード枠
            optNext(0).Visible = True                 ' 即時
            optNext(1).Visible = True                 ' ３秒
            optNext(2).Visible = True                 ' 停止
            
            If gPhone.FlagConnect Or gPhone.FlagHold Then   '通話中
            ElseIf gPhone.ReadyMode = APSTAT_DATAIN Then    '処理中
            ElseIf gPhone.ReadyMode = APSTAT_SELECT Then    '選択中
            Else
                FrameMode.Visible = False                'モード枠
                optNext(0).Visible = False                 ' 即時
                optNext(1).Visible = False                 ' ３秒
                optNext(2).Visible = False                 ' 停止
                cmdButton(CMD_IBREADY).Top = 120       '受付開始
            End If
        End If
    
    Case 10 '10:TEL
    
    End Select

    If gPhone.FlagDisable <> 0 Then
        '無効状態
        FrameMode.Enabled = False               'モード枠
        optNext(0).Enabled = False                 ' 即時
        optNext(1).Enabled = False                 ' ３秒
        optNext(2).Enabled = False                 ' 停止
    Else
        FrameMode.Enabled = True                'モード枠
        optNext(0).Enabled = True                 ' 即時
        optNext(1).Enabled = True                 ' ３秒
        optNext(2).Enabled = True                 ' 停止
    End If

    '「次顧客」ボタン表示ならモード状態を０にする
    If cmdButton(CMD_NEXT).Top = 120 Then
        If ucPhoneApi1.NextMode <> 0 Then ucPhoneApi1.NextMode = 0
    End If

    Exit Sub
Err_Exit:
    ErrorBreak "frmMain.ShowButtonExt"
End Sub

'---------------------------------------------------------------------
' 目的説明  -- ボタンステータスをセットする
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ShowButtonStatus()
On Error GoTo Err_Exit
    Dim lngBackColor    As Long
    
    lngBackColor = gPhone.lngBackColor  '配色保持
    
    ShowButtonExt

    If gPhone.FlagDisable <> 0 Then
        '無効状態
        cmdButton(CMD_NEXT).Enabled = False             '次顧客
        cmdButton(CMD_BACK).Enabled = False             '解除
        cmdButton(CMD_IBREADY).Enabled = False          '受付開始
        cmdButton(CMD_IBSTOP).Enabled = False           '受付終了
        cmdButton(CMD_PDREADY).Enabled = False          '発信開始
        cmdButton(CMD_PDSTOP).Enabled = False           '発信停止
        
        cmdButton(CMD_MAKECALL).Enabled = False         '発信
        cmdButton(CMD_PHONE).Enabled = False            '電話機
        cmdButton(CMD_DISCONNECT).Enabled = False       '切断
        cmdButton(CMD_HOLD).Enabled = False             '保留
        cmdButton(CMD_UNHOLD).Enabled = False           '保留解除
        
        cmdButton(CMD_TRANSINSIDE).Enabled = False      '内線転送
        cmdButton(CMD_TRANSOUTSIDE).Enabled = False     '外線転送
        
        cmdButton(CMD_EXIT).Enabled = False             '終了
        cmdButton(CMD_CHANGEJOB).Enabled = False        '業務切替

        btnCti(CEX_MAIL).Enabled = False                '申し送り
        btnCti(CEX_PASS).Enabled = False                'Pass変更
        btnCti(CEX_PLAY).Enabled = False                '録音再生
        btnCti(CEX_LEAVESEAT).Enabled = False           '離席
        btnCti(CEX_BREAKTIME).Enabled = False           '休憩
        btnCti(CEX_TRINING).Enabled = False             '研修
        
    ElseIf gPhone.FlagInit = False Then
        '未初期化時
        cmdButton(CMD_NEXT).Enabled = False             '次顧客
        cmdButton(CMD_BACK).Enabled = False             '解除
        cmdButton(CMD_IBREADY).Enabled = False          '受付開始
        cmdButton(CMD_IBSTOP).Enabled = False           '受付終了
        cmdButton(CMD_PDREADY).Enabled = False          '発信開始
        cmdButton(CMD_PDSTOP).Enabled = False           '発信停止
        
        cmdButton(CMD_MAKECALL).Enabled = False         '発信
        cmdButton(CMD_PHONE).Enabled = False            '電話機
        cmdButton(CMD_DISCONNECT).Enabled = False       '切断
        cmdButton(CMD_HOLD).Enabled = False             '保留
        cmdButton(CMD_UNHOLD).Enabled = False           '保留解除
        
        cmdButton(CMD_TRANSINSIDE).Enabled = False      '内線転送
        cmdButton(CMD_TRANSOUTSIDE).Enabled = False     '外線転送
        
        cmdButton(CMD_EXIT).Enabled = True              '終了
        cmdButton(CMD_CHANGEJOB).Enabled = True         '業務切替

        btnCti(CEX_MAIL).Enabled = True                 '申し送り
        btnCti(CEX_PASS).Enabled = True                 'Pass変更
        btnCti(CEX_PLAY).Enabled = sPlayBtn                 '録音再生
        btnCti(CEX_LEAVESEAT).Enabled = True            '離席
        btnCti(CEX_BREAKTIME).Enabled = True            '休憩
        btnCti(CEX_TRINING).Enabled = True              '研修
        
    ElseIf gPhone.FlagLogin = False Then
        'ログオフ中
        cmdButton(CMD_NEXT).Enabled = False             '次顧客
        cmdButton(CMD_BACK).Enabled = False             '解除
        cmdButton(CMD_IBREADY).Enabled = False          '受付開始
        cmdButton(CMD_IBSTOP).Enabled = False           '受付終了
        cmdButton(CMD_PDREADY).Enabled = False          '発信開始
        cmdButton(CMD_PDSTOP).Enabled = False           '発信停止
        
        cmdButton(CMD_MAKECALL).Enabled = False         '発信
        cmdButton(CMD_PHONE).Enabled = False            '電話機
        cmdButton(CMD_DISCONNECT).Enabled = False       '切断
        cmdButton(CMD_HOLD).Enabled = False             '保留
        cmdButton(CMD_UNHOLD).Enabled = False           '保留解除
        
        cmdButton(CMD_TRANSINSIDE).Enabled = False      '内線転送
        cmdButton(CMD_TRANSOUTSIDE).Enabled = False     '外線転送
        
        cmdButton(CMD_EXIT).Enabled = True              '終了
        cmdButton(CMD_CHANGEJOB).Enabled = True         '業務切替

        btnCti(CEX_MAIL).Enabled = True                 '申し送り
        btnCti(CEX_PASS).Enabled = True                 'Pass変更
        btnCti(CEX_PLAY).Enabled = sPlayBtn                 '録音再生
        btnCti(CEX_LEAVESEAT).Enabled = True            '離席
        btnCti(CEX_BREAKTIME).Enabled = True            '休憩
        btnCti(CEX_TRINING).Enabled = True              '研修
        
'    ElseIf gFlagOutPhone = True Then
'        '電話機単体アプリ起動中
'        cmdButton(CMD_NEXT).Enabled = False             '次顧客
'        cmdButton(CMD_BACK).Enabled = False             '解除
'        cmdButton(CMD_IBREADY).Enabled = False          '受付開始
'        cmdButton(CMD_IBSTOP).Enabled = False           '受付終了
'        cmdButton(CMD_PDREADY).Enabled = False          '発信開始
'        cmdButton(CMD_PDSTOP).Enabled = False           '発信停止
'
'        cmdButton(CMD_MAKECALL).Enabled = False         '発信
'        cmdButton(CMD_PHONE).Enabled = False            '電話機
'        cmdButton(CMD_DISCONNECT).Enabled = False       '切断
'        cmdButton(CMD_HOLD).Enabled = False             '保留
'        cmdButton(CMD_UNHOLD).Enabled = False           '保留解除
'
'        cmdButton(CMD_TRANSINSIDE).Enabled = False      '内線転送
'        cmdButton(CMD_TRANSOUTSIDE).Enabled = False     '外線転送
'
'        cmdButton(CMD_EXIT).Enabled = False             '終了
'
'        btnCti(CEX_MAIL).Enabled = True                 '申し送り
'        btnCti(CEX_PASS).Enabled = True                 'Pass変更
'        btnCti(CEX_PLAY).Enabled = sPlayBtn                 '録音再生
'        btnCti(CEX_LEAVESEAT).Enabled = True            '離席
'        btnCti(CEX_BREAKTIME).Enabled = True            '休憩
'        btnCti(CEX_TRINING).Enabled = True              '研修
    
    Else
        '通話中
        
        If gPhone.FlagConnect = True Then
        
            cmdButton(CMD_NEXT).Enabled = False         '次顧客
            cmdButton(CMD_BACK).Enabled = False             '解除
            cmdButton(CMD_IBREADY).Enabled = False      '受付開始
            cmdButton(CMD_IBSTOP).Enabled = False       '受付終了
            cmdButton(CMD_PDREADY).Enabled = False      '発信開始
            cmdButton(CMD_PDSTOP).Enabled = False       '発信停止
        
            cmdButton(CMD_MAKECALL).Enabled = False     '発信
            cmdButton(CMD_PHONE).Enabled = False        '電話機
            cmdButton(CMD_DISCONNECT).Enabled = True    '切断
        
            cmdButton(CMD_TRANSINSIDE).Enabled = True   '内線転送
            '外線転送コードが指定されていないときは使用不可
            'If ucPhoneApi1.TransferCode <> 0 Then
                cmdButton(CMD_TRANSOUTSIDE).Enabled = True  '外線転送
            'End If
            
            cmdButton(CMD_EXIT).Enabled = False         '終了
            cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替
            
            btnCti(CEX_MAIL).Enabled = True 'False      '申し送り
            btnCti(CEX_PASS).Enabled = False            'Pass変更
            btnCti(CEX_PLAY).Enabled = False            '録音再生
            btnCti(CEX_LEAVESEAT).Enabled = False       '離席
            btnCti(CEX_BREAKTIME).Enabled = False       '休憩
            btnCti(CEX_TRINING).Enabled = False         '研修
            
            If gPhone.FlagHold = True Then
                '保留中
                cmdButton(CMD_HOLD).Enabled = False         '保留
                cmdButton(CMD_UNHOLD).Enabled = True        '保留解除
                cmdButton(CMD_DISCONNECT).Enabled = False   '切断
            Else
                cmdButton(CMD_HOLD).Enabled = True          '保留
                cmdButton(CMD_UNHOLD).Enabled = False       '保留解除
                cmdButton(CMD_DISCONNECT).Enabled = True    '切断
            End If
        
            '転送
            If gPhone.FlagTrans = True Then
                cmdButton(CMD_TRANSINSIDE).Enabled = False      '内線転送
                cmdButton(CMD_TRANSOUTSIDE).Enabled = False     '外線転送
            End If
        
        '着信呼び出し中
        ElseIf gPhone.FlagOnCall = True Then
        
            cmdButton(CMD_IBREADY).Enabled = False      '受付開始
            cmdButton(CMD_IBSTOP).Enabled = False       '受付終了
            cmdButton(CMD_PDREADY).Enabled = False      '発信開始
            cmdButton(CMD_PDSTOP).Enabled = False       '発信停止
        
            cmdButton(CMD_MAKECALL).Enabled = False     '発信
            cmdButton(CMD_PHONE).Enabled = False        '電話機
            cmdButton(CMD_DISCONNECT).Enabled = False   '切断
        
            cmdButton(CMD_EXIT).Enabled = False         '終了
            cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替
                    
        '発信中
        ElseIf gPhone.FlagMakecall = True Then
        
            cmdButton(CMD_NEXT).Enabled = False         '次顧客
            cmdButton(CMD_BACK).Enabled = False             '解除
            cmdButton(CMD_IBREADY).Enabled = False      '受付開始
            cmdButton(CMD_IBSTOP).Enabled = False       '受付終了
            cmdButton(CMD_PDREADY).Enabled = False      '発信開始
            cmdButton(CMD_PDSTOP).Enabled = False       '発信停止
        
            cmdButton(CMD_MAKECALL).Enabled = False     '発信
            cmdButton(CMD_PHONE).Enabled = False        '電話機
            cmdButton(CMD_DISCONNECT).Enabled = True    '切断
        
            cmdButton(CMD_EXIT).Enabled = False         '終了
            cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替
            
            btnCti(CEX_MAIL).Enabled = True             '申し送り
            btnCti(CEX_PASS).Enabled = False            'Pass変更
            btnCti(CEX_PLAY).Enabled = False            '録音再生
            btnCti(CEX_LEAVESEAT).Enabled = False       '離席
            btnCti(CEX_BREAKTIME).Enabled = False       '休憩
            btnCti(CEX_TRINING).Enabled = False         '研修
        
        '切断中
        Else
            cmdButton(CMD_IBREADY).Enabled = True       '受付開始
            cmdButton(CMD_IBSTOP).Enabled = False       '受付終了
            cmdButton(CMD_PDREADY).Enabled = True       '発信開始
            cmdButton(CMD_PDSTOP).Enabled = False       '発信停止
          
            cmdButton(CMD_MAKECALL).Enabled = True      '発信
            cmdButton(CMD_PHONE).Enabled = True         '電話機
            cmdButton(CMD_DISCONNECT).Enabled = False   '切断
            cmdButton(CMD_HOLD).Enabled = False         '保留
            cmdButton(CMD_UNHOLD).Enabled = False       '保留解除
          
            cmdButton(CMD_TRANSINSIDE).Enabled = False  '内線転送
            cmdButton(CMD_TRANSOUTSIDE).Enabled = False '外線転送
              
            'APSTAT_DATAIN      'データ処理中
            'APSTAT_IBREADY     '受付可能(IB)
            'APSTAT_PDREADY     '受付可能(PD)
            'APSTAT_NEXT        'AC,PC次データ待ち
            If gPhone.ReadyMode = APSTAT_DATAIN Or _
                gPhone.ReadyMode = APSTAT_IBREADY Or _
                gPhone.ReadyMode = APSTAT_PDREADY Then
                cmdButton(CMD_NEXT).Enabled = False         '次顧客
                cmdButton(CMD_BACK).Enabled = False         '解除
                btnCti(CEX_MAIL).Enabled = True             '申し送り
                btnCti(CEX_PASS).Enabled = False            'Pass変更
                btnCti(CEX_PLAY).Enabled = False            '録音再生
                btnCti(CEX_LEAVESEAT).Enabled = False       '離席
                btnCti(CEX_BREAKTIME).Enabled = False       '休憩
                btnCti(CEX_TRINING).Enabled = False         '研修
            ElseIf gPhone.ReadyMode = APSTAT_NEXT Then
                cmdButton(CMD_NEXT).Enabled = True          '次顧客
                cmdButton(CMD_BACK).Enabled = True          '解除
                btnCti(CEX_MAIL).Enabled = True             '申し送り
                btnCti(CEX_PASS).Enabled = False             'Pass変更
                btnCti(CEX_PLAY).Enabled = False             '録音再生
                btnCti(CEX_LEAVESEAT).Enabled = False        '離席
                btnCti(CEX_BREAKTIME).Enabled = False        '休憩
                btnCti(CEX_TRINING).Enabled = False          '研修
            Else
                cmdButton(CMD_NEXT).Enabled = True          '次顧客
                cmdButton(CMD_BACK).Enabled = False          '解除
                btnCti(CEX_MAIL).Enabled = True             '申し送り
                btnCti(CEX_PASS).Enabled = True             'Pass変更
                btnCti(CEX_PLAY).Enabled = sPlayBtn             '録音再生
                btnCti(CEX_LEAVESEAT).Enabled = True        '離席
                btnCti(CEX_BREAKTIME).Enabled = True        '休憩
                btnCti(CEX_TRINING).Enabled = True          '研修
            End If
            
            Select Case gPhone.ReadyMode
            
            Case APSTAT_MONITOR             'モニタモード
                cmdButton(CMD_IBREADY).Enabled = False      '着信受付可能 OFF
                cmdButton(CMD_IBSTOP).Enabled = False       '着信受付終了 OFF
                cmdButton(CMD_PDREADY).Enabled = False      'ＰＤ受付可能 OFF
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = False         '終了         OFF
                cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替     OFF
            
            Case APSTAT_IBREADY             '受付可能(IB)
                cmdButton(CMD_IBREADY).Enabled = False      '着信受付可能 OFF
                cmdButton(CMD_IBSTOP).Enabled = True        '着信受付終了 ON
                cmdButton(CMD_PDREADY).Enabled = False      'ＰＤ受付可能 OFF
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = False         '終了         OFF
                cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替     OFF

            Case APSTAT_PDREADY             '受付可能(PD)
                cmdButton(CMD_IBREADY).Enabled = False      '着信受付可能 OFF
                cmdButton(CMD_IBSTOP).Enabled = False       '着信受付終了 OFF
                cmdButton(CMD_PDREADY).Enabled = False      'ＰＤ受付可能 OFF
                cmdButton(CMD_PDSTOP).Enabled = True        'ＰＤ受付終了 ON
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = False         '終了         OFF
                cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替     OFF

            Case APSTAT_NEXT                'AC,PC次データ待ち
                cmdButton(CMD_IBREADY).Enabled = False      '着信受付可能 OFF
                cmdButton(CMD_IBSTOP).Enabled = True        '着信受付終了 ON
                cmdButton(CMD_PDREADY).Enabled = False      'ＰＤ受付可能 OFF
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = False         '終了         OFF
                cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替     OFF
                '   CtiMode (0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL)
                If gUser.CtiMode = 1 Or gUser.CtiMode = 2 _
                Or gUser.CtiMode = 3 Or gUser.CtiMode = 4 _
                Or gUser.CtiMode = 5 Or gUser.CtiMode = 6 _
                Or gUser.CtiMode = 7 Or gUser.CtiMode = 8 Then
                    'PC,DPCで選択中
                    cmdButton(CMD_MAKECALL).Enabled = True  '発信         ON
                    cmdButton(CMD_PHONE).Enabled = True     '電話機       ON
                End If
            
            Case APSTAT_DATAIN              '処理中
                cmdButton(CMD_IBREADY).Enabled = False      '着信受付可能 OFF
                cmdButton(CMD_IBSTOP).Enabled = False       '着信受付終了 OFF
                cmdButton(CMD_PDREADY).Enabled = False      'ＰＤ受付可能 OFF
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = True         '電話機       ON
                cmdButton(CMD_EXIT).Enabled = False         '終了         OFF
                cmdButton(CMD_CHANGEJOB).Enabled = False    '業務切替     OFF
                If gUser.CtiMode = 3 Or gUser.CtiMode = 4 Then
                    cmdButton(CMD_PHONE).Enabled = True     '電話機       ON
                End If
            
            Case APSTAT_COUNT               'カウント中
            
            Case APSTAT_SELECT              '選択中
                cmdButton(CMD_IBREADY).Enabled = False      '着信受付可能 OFF
                cmdButton(CMD_IBSTOP).Enabled = False       '着信受付終了 OFF
                cmdButton(CMD_PDREADY).Enabled = False      'ＰＤ受付可能 OFF
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = True          '終了         ON
                cmdButton(CMD_CHANGEJOB).Enabled = True     '業務切替     ON
                
            Case APSTAT_IBSTOP              '受付停止
                cmdButton(CMD_IBREADY).Enabled = True       '着信受付可能 ON
                cmdButton(CMD_IBSTOP).Enabled = False       '着信受付終了 OFF
                cmdButton(CMD_PDREADY).Enabled = True       'ＰＤ受付可能 ON
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = True          '終了         ON
                cmdButton(CMD_CHANGEJOB).Enabled = True     '業務切替     ON
                '   CtiMode (0：未ログイン、1：PD、2:AC、3：PC、4：DPC、5：PV、6：DPV、7: DC､8: DDC､9: IB)
                'If gUser.CtiMode = 9 And ucPhoneApi1.PhoneNo <> "" And ucPhoneApi1.MultiMain = 0 Then
                If gUser.CtiMode = 9 And ucPhoneApi1.MultiMain = 0 Then
                    'cmdButton(CMD_MAKECALL).Enabled = True  '発信         ON
                    cmdButton(CMD_PHONE).Enabled = True     '電話機       ON
                End If
                
            Case APSTAT_PDSTOP              '発信停止
                cmdButton(CMD_IBREADY).Enabled = True       '着信受付可能 ON
                cmdButton(CMD_IBSTOP).Enabled = False       '着信受付終了 OFF
                cmdButton(CMD_PDREADY).Enabled = True       'ＰＤ受付可能 ON
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = True          '終了         ON
                cmdButton(CMD_CHANGEJOB).Enabled = True     '業務切替     ON
                '   CtiMode (0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL)
                If gUser.CtiMode = 10 Then
                    cmdButton(CMD_PHONE).Enabled = True     '電話機       ON
                End If
            
            Case Else
                cmdButton(CMD_IBREADY).Enabled = True       '着信受付可能 ON
                cmdButton(CMD_IBSTOP).Enabled = False       '着信受付終了 OFF
                cmdButton(CMD_PDREADY).Enabled = True       'ＰＤ受付可能 ON
                cmdButton(CMD_PDSTOP).Enabled = False       'ＰＤ受付終了 OFF
                cmdButton(CMD_MAKECALL).Enabled = False     '発信         OFF
                cmdButton(CMD_PHONE).Enabled = False        '電話機       OFF
                cmdButton(CMD_EXIT).Enabled = True          '終了         ON
                cmdButton(CMD_CHANGEJOB).Enabled = True     '業務切替     ON
            End Select
        End If
    End If
    
    If gFlagOutPhone = True Then
        cmdButton(CMD_PHONE).Enabled = False            '電話機
    End If
    
'    If gPhone.FlagInit = False Then
'        gPhone.lngBackColor = cBLACK
'        txtStatus = "ログオフ"
'    End If
    
'    'エラーの時はエラーステータスにする
'    If gPhone.FlagError = 1 Then
'        gPhone.lngBackColor = cBLACK
'        txtStatus = "エラー"
'    End If
    
    '転送画面が出ていたらボタン状態＆カラー変更
    If gFrmShow.bTransfer Then
        frmTransfer.mButtonStatus
        '切断状態ならウインドウ消す
        If gPhone.FlagConnect = False Then Unload frmTransfer
    End If

    '転送一覧画面が出ていたらカラー変更
    If gFrmShow.bTransList = True Then
        'ステータスカラーを取得する
        frmTransferList.BackColor = Me.BackColor
        '切断状態ならウインドウ消す
        If gPhone.FlagConnect = False Then Unload frmTransferList
    End If

    '内線一覧画面が出ていたらボタン状態＆カラー変更
    If gFrmShow.bExtension = True Then
        frmExtension.mButtonStatus
        '切断状態ならウインドウ消す
        If gPhone.FlagConnect = False Then Unload frmExtension
    End If

    Exit Sub
Err_Exit:
    ErrorBreak "frmMain.ShowButtonStatus"
End Sub

'---------------------------------------------------------------------
' 目的説明  -- デバッグモード
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub lblDebug_DblClick()
    Dim cbAdd   As Long
    cbAdd = 3000
    
    If frmMain.Height > 1395 Then
        frmMain.Height = 1395
        frmMain.Top = frmMain.Top + cbAdd
 '       Me.Height = Me.Height - cbAdd
    Else
        frmMain.Height = 1395 + cbAdd
        frmMain.Top = frmMain.Top - cbAdd
'        Me.Height = Me.Height + cbAdd
    End If

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 次の発信・受付開始モード選択ラジオボタン
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub optNext_Click(Index As Integer)

    'NextMode = 次の発信・受付開始モード (0=次ボタン, 1=即時, 2=x秒カウント, 3=停止)
    
    '即時
    If Me.optNext(0).Value Then
        If ucPhoneApi1.NextMode <> 1 Then ucPhoneApi1.NextMode = 1
    End If
    
    '3秒
    If Me.optNext(1).Value Then
        If ucPhoneApi1.NextMode <> 2 Then ucPhoneApi1.NextMode = 2
    End If
    
    '停止
    If Me.optNext(2).Value Then
        If ucPhoneApi1.NextMode <> 3 Then ucPhoneApi1.NextMode = 3
    End If
        
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 終了確認タイマー
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub tmrAfTaskClose_Timer()
    Dim Ret As Long

    '起動しているAF_.exeアプリ件数を取得する
    Ret = AfTaskCheck
    If Ret = 0 Then
        '終了済みなら電話機を終わらせる
        tmrAfTaskClose.Enabled = False
        
        If m_bChangeGroup = False Then
            afValue.PostData "ENDPHONE"
        Else
           '業務切替処理
           mChangeGroup
        End If
        
    Else
        '30カウントしても終了しなかったら終了中止する
        tmrAfTaskClose.Interval = tmrAfTaskClose.Interval + 1
        If tmrAfTaskClose.Interval >= (1000 + 30) Then
            tmrAfTaskClose.Enabled = False
            f_MsgPop "AgentForce終了を取りやめました。", MSG_COMPLETE
        End If
    End If

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 発信タイマー(AC)
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub tmrMakecall_Timer()
    
    Dim nCount  As Integer
    nCount = CInt(txtCallTime.Text)
    txtCallTime.Text = CStr(nCount + 1)

    '発信状態以外になったらタイマー停止
    If ucPhoneApi1.GetStatus <> "発信中" Then
        tmrMakecall.Enabled = False
        txtCallTime.Text = "0"
        'ACでの発信を停止通知
        ''Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP")
        Exit Sub
    End If

    'AC発信タイムアウト
    If nCount >= gPhone.AutoCallWait And ucPhoneApi1.GetStatus = "発信中" Then
        CtiAddCmdLog LOG_INF, "発信タイムアウト(Count=" & nCount & ")による切断"
        tmrMakecall.Enabled = False
        sDropCmd = "@ONSTATUS ACCALLSTOP TIMEOUT"   '切断通知後に送る
        ucPhoneApi1.StopCall
'        ucPhoneApi1.Disconnect
        'AC発信タイムアウト
        'Call ucPhoneApi1.CommandEx("@ONERROR " & ONERR_MAKECALL_TIMEOUT)
        'ACでの発信を停止通知
        'Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP TIMEOUT")
    End If

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 未読チェックタイマー
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub tmrMsg_Timer()

    Dim str     As String
    
    gMsgRead.Count = gMsgRead.Count + 1
    If gMsgRead.Count < 6 Then  '1カウント10秒
        Exit Sub
    End If
    gMsgRead.Count = 0
    
    tmrMsg.Enabled = False
    
    '未読のﾁｪｯｸ
    mCheckMessages

    If sRead.FlagMessage <> gMsgRead.FlagMessage Then
        If gMsgRead.FlagMessage = True Then    '申送事項
            afValue.v("ReadMessage") = "1"
        Else
            afValue.v("ReadMessage") = "0"
        End If
        CtiAddCmdLog LOG_DBG, "Set ReadMessage=" & afValue.v("ReadMessage")
    End If

    If sRead.FlagRequest <> gMsgRead.FlagRequest Then
        If gMsgRead.FlagRequest = True Then     '依頼書
            afValue.v("ReadRequest") = "1"
        Else
            afValue.v("ReadRequest") = "0"
        End If
        CtiAddCmdLog LOG_DBG, "Set ReadRequest=" & afValue.v("ReadRequest")
    End If
    
    If sRead.FlagAlarm <> gMsgRead.FlagAlarm Then
        If gMsgRead.FlagAlarm = True Then     'アラーム
            afValue.v("ReadAlarm") = "1"
        Else
            afValue.v("ReadAlarm") = "0"
        End If
        CtiAddCmdLog LOG_DBG, "Set ReadAlarm=" & afValue.v("ReadAlarm")
    End If
    
    '20130304 CHIFURE EXTENSION
    If sRead.FlagMail <> gMsgRead.FlagMail Then
        If gMsgRead.FlagMail = True Then     'メール
            afValue.v("ReadMail") = "1"
        Else
            afValue.v("ReadMail") = "0"
        End If
        CtiAddCmdLog LOG_DBG, "Set ReadMail=" & afValue.v("ReadMail")
    End If

    sRead.FlagMessage = gMsgRead.FlagMessage
    sRead.FlagRequest = gMsgRead.FlagRequest
    sRead.FlagAlarm = gMsgRead.FlagAlarm
    '20130304 CHIFURE EXTENSION
    sRead.FlagMail = gMsgRead.FlagMail

    '起動日と現在が日替わりしている？
    If Format(gStartDay, "d") <> Format(Now, "d") Then
        'ログを転送する
        SendLogData
    End If

    tmrMsg.Enabled = True

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 録音ID採番
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
'Function GetRecID() As Long
'On Error GoTo Err_Exit
'    Dim cnn         As New ADODB.Connection
'    Dim SQL         As String
'    Dim ERRNO       As Integer
'    Dim SQLERR      As Integer
'    Dim ValueData   As Long
'    Dim RecID       As Long
'    Dim StartTime   As String
'    Dim RecHour     As Integer
'    Dim PCName      As String
'
'    cnn.Open gDbConnectionString       '###### 接続 ######
'
'    '録音ID採番
'    SQL_SP_NEXTVALUETRN REQ_RECID, ValueData, ERRNO, SQLERR, cnn
'
'    If ERRNO = 0 Then
'        RecID = ValueData
'        StartTime = Format(gPhone.TalkTime, "YYYY/MM/DD hh:nn:ss")
'        RecHour = Format(StartTime, "hh")
'        PCName = ucPhoneApi1.Computer
'        '録音レコード作成
'        SQL = "insert into TB_RECDATA (RecID,ClientCode,ID,StartTime,EndTime,RecHour,RecSecond," & _
'            "UserID,PCName,PhoneNo,CustomerName,CustomerCode,JobCode,ListCode,ReceptionResult,RecMemo,FileStatus,UpdUserID,Timestamp)" & _
'            "values(" & RecID & ",0,0,'" & StartTime & "',''," & RecHour & ",0,'" & gUser.UserID & "','" & PCName & _
'            "','','',0,0,0,'','','0','" & gUser.UserID & "',getdate())"
'
'        cnn.Execute SQL
'    End If
'
'    cnn.Close                           '###### 切断 ######
'
'    CtiAddCmdLog LOG_DBG, "録音ID採番=" & ValueData
'
'    If ERRNO <> 0 Then
'        ValueData = 0
'    End If
'
'    GetRecID = ValueData
'    Exit Function
'
'Err_Exit:
'    TraceLog LOG_ERR, "[GetRecID]" & Err.Description
'    ValueData = 0
'    GetRecID = ValueData
'End Function

'---------------------------------------------------------------------
' 目的説明  -- 未読のﾁｪｯｸ
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Sub mCheckMessages()
On Error GoTo Err_Exit
    Dim SQL             As String
    Dim cnn             As New ADODB.Connection
    Dim rs              As New ADODB.Recordset
    Dim strMessage      As String
    Dim errX            As ADODB.Error
    Dim Ret             As Boolean
    Dim strTmp As String
    
    If gUser.UserID = "" Or gUser.CenterCode = "" Or gUser.DivisionCode = "" Then
        Exit Sub
    End If
    
    cnn.Open gDbConnectionString       '###### 接続 ######
    
    SQL = "select count(tb_messageRead.MessageCode) as datacount from tb_messageRead left join tb_message on tb_messageRead.MessageCode = tb_message.MessageCode " & _
            "where tb_messageRead.UserID = '" & gUser.UserID & "' and tb_messageRead.ReadFlag = '0' and tb_message.SendFlag = '1' and tb_message.SendDate < getdate()"
'    TraceLog SQL
    rs.Open SQL, cnn, adOpenForwardOnly, adLockReadOnly
    If rs!DataCount <> 0 Then
        gMsgRead.FlagMessage = True
        btnCti(6).BackColor = CLR_CHECK
    Else
        gMsgRead.FlagMessage = False
        btnCti(6).BackColor = CLR_FREE
    End If
    rs.Close
    
    SQL = "SELECT ReceiveCenterCode, ReceiveDivisionCode, RequestStatus FROM TB_REQUEST" & _
        " WHERE ReceiveCenterCode='" & gUser.CenterCode & _
            "' AND ReceiveDivisionCode='" & gUser.DivisionCode & _
            "' AND RequestStatus='0'"
'    TraceLog SQL
    rs.Open SQL, cnn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = False Then
        gMsgRead.FlagRequest = True
    Else
        gMsgRead.FlagRequest = False
    End If
    rs.Close
    
    '20130304 CHIFURE EXTENSION
    '未読メールチェック
    SQL = "SELECT COUNT(Id) datacount FROM TX_InboxMail where FirstReaderId = ''"
    rs.Open SQL, cnn, adOpenForwardOnly, adLockReadOnly
    If rs!DataCount <> 0 Then
        gMsgRead.FlagMail = True
    Else
        gMsgRead.FlagMail = False
    End If
    rs.Close
    
    gMsgRead.FlagAlarm = False
    
    strTmp = Format(DateAdd("n", 10, Now), "yyyy/mm/dd hh:nn")
    
    TraceLog 5, strTmp
    
    SQL = "SELECT TB_ALARM.CustomerCode, TB_ALARM.AlarmDate, TB_ALARM.AlarmHHNN " & _
            "From TB_ALARM WHERE TB_ALARM.AlarmDate <= '" & Format(Now, "yyyy/mm/dd") & "' AND TB_ALARM.AlarmFlag = '1' " & _
                "AND TB_ALARM.AlarmUserID = '" & gUser.UserID & "' AND TB_ALARM.AlarmUserFlag = '0'"
    rs.Open SQL, cnn, adOpenForwardOnly, adLockReadOnly
    
    Do Until rs.EOF
        If "" & rs!AlarmDate & " " & rs!AlarmHHNN <= strTmp Then
            gMsgRead.FlagAlarm = True
            Exit Do
        End If
        rs.MoveNext
    Loop
    rs.Close
    
    If gMsgRead.FlagAlarm = True Then
        cnn.Close
        Exit Sub
    End If
    
    SQL = "SELECT TB_ALARM.CustomerCode, TB_ALARM.AlarmDate, TB_ALARM.AlarmHHNN " & _
            "From TB_ALARM WHERE TB_ALARM.AlarmDate <= '" & Format(Now, "yyyy/mm/dd") & "' AND TB_ALARM.AlarmFlag = '1' " & _
                "AND TB_ALARM.AlarmUserFlag = '1'"
    rs.Open SQL, cnn, adOpenForwardOnly, adLockReadOnly
    Do Until rs.EOF
        If "" & rs!AlarmDate & " " & rs!AlarmHHNN <= strTmp Then
            gMsgRead.FlagAlarm = True
            Exit Do
        End If
        rs.MoveNext
    Loop
    rs.Close
    
    cnn.Close                           '###### 切断 ######
    
    Exit Sub
Err_Exit:
    ErrorBreak "frmMain.mCheckMessages"
End Sub

'---------------------------------------------------------------------
' 目的説明  -- ﾊﾟｽﾜｰﾄﾞ有効期限のﾁｪｯｸ
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Function mPaswordCheck() As Boolean
On Error GoTo Err_Exit
    Dim cnn             As New ADODB.Connection
    Dim Ret             As Boolean
    Dim SQL             As String
    Dim intValidTerm    As Integer
    Dim ValidDate       As Date
    
    If gUser.RankCode = "" Then
        Exit Function
    End If
    
    cnn.Open gDbConnectionString       '###### 接続 ######
    
    ' ﾊﾟｽﾜｰﾄﾞ設定日を取得
    SQL = "Select * from tb_user where UserID = '" & gUser.UserID & "'"
    ValidDate = Format(CDate(SQL_GETDATAFIELD_STRING(cnn, SQL, "PasswordDate")), "yyyy/mm/dd")
    
    ' 個人ﾊﾟｽﾜｰﾄﾞ有効期間を取得
    SQL = "SELECT * FROM TB_RANK WHERE RankCode='" & gUser.RankCode & "'"
    intValidTerm = SQL_GETDATAFIELD_STRING(cnn, SQL, "PersonPassTerm")
    
    cnn.Close                           '###### 切断 ######
    
    ValidDate = ValidDate + intValidTerm
    
    If Format(Now, "yyyy/mm/dd") > Format(ValidDate, "yyyy/mm/dd") Then
        Ret = True  '期限切れ(ボタンを赤くする)
    Else
        Ret = False '期限内(元の色に戻す)
    End If
    mPaswordCheck = Ret
    
    Exit Function
Err_Exit:
    ErrorBreak "frmMain.mPaswordCheck"
End Function

'---------------------------------------------------------------------
' 目的説明  -- 通話時間タイマー
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub tmrTalk_Timer()
On Error GoTo Err_Exit

    gPhone.TalkSecond = DateDiff("s", gPhone.TalkTime, Now)
    txtTalkTime.Text = CLng(gPhone.TalkSecond)

    Exit Sub
Err_Exit:
    ErrorBreak "frmMain.tmrTalk_Timer"
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 内線転送通知タイマー
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub tmrTrns_Timer()

    tmrTrns.Enabled = False
    afValue.PostData "内線転送完了"

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】着信通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnCall(strData As String)
On Error GoTo Err_Exit
    Dim lngMainIndex    As Long
    Dim vntData         As Variant
    Dim vntValue        As Variant
    Dim i               As Integer
    Dim str             As String

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnCall(" & strData & ")"
    
    gPhone.FlagOnCall = True
    
    gPhone.CallWait = Now              '着信通知開始時刻
    gPhone.TalkSecond = 0              '通話秒数
    
    SetReadyMode (APSTAT_ONCALL)       '着信中
    
    '転送着信
    If Left(strData, 1) = "2" Then
        '転送データを調べる (TransInfo)
        vntData = Split(strData & ",,,,", ",")
        str = vntData(3)
        vntData = Split(str & ";", ";")
        For i = 0 To UBound(vntData)
            vntValue = Split(vntData(i) & "=", "=")
            Select Case vntValue(0)
            Case "IO"
                gTrns.FlagIO = "" & vntValue(1)
            Case "ClientCode"
                gTrns.ClientCode = CLng("0" & vntValue(1))
            Case "JobCode"
                gTrns.JobCode = CLng("0" & vntValue(1))
            Case "ListCode"
                gTrns.ListCode = CLng("0" & vntValue(1))
            Case "CustomerCode"
                gTrns.CustomerCode = CLng("0" & vntValue(1))
            Case "gTrns.ProfileID"
                gTrns.ProfileID = CLng("0" & vntValue(1))
            Case "TimeConnect"
                gTrns.TimeConnect = "" & vntValue(1)
            Case "TimeMakecall"
                gTrns.TimeMakecall = "" & vntValue(1)
            Case "TimeOnCall"
                gTrns.TimeOnCall = "" & vntValue(1)
            End Select
        Next i
    End If
    
    '電話と対応する「メイン」がいる？
    lngMainIndex = CLng("0" & ucPhoneApi1.MainIndex)
    If lngMainIndex <> 0 Then
        Dim hWndFree        As Long
        '空いているメインを探す
        hWndFree = GetFreeHwnd("メイン(")
        '空きが無くても単独メインならReady状態なので指定する
        If hWndFree = 0 And ucPhoneApi1.MultiMain = 0 Then
            hWndFree = CLng(ucPhoneApi1.MainIndex)
        End If
        If hWndFree <> 0 Then
            ucPhoneApi1.MainIndex = CStr(hWndFree)  '空きメインを選択する
            afValue.PostData "ONCALL " & strData    '着信に対応するようイベントを送る
            Exit Sub
        Else
            CtiAddCmdLog LOG_INF, "空きメインなし"
        End If
    Else
        CtiAddCmdLog LOG_INF, "電話機連動メインなし"
    End If
    
    '「メイン」を起動する
    If gMainAppl <> "" Then
        ucPhoneApi1.MainIndex = "0"     '電話と紐付ける「メイン」indexを初期化
        CtiAddCmdLog LOG_INF, "起動アプリ: " & gMainAppl & " " & gUser.UserID & ",着信," & strData
        Call Shell(App.Path & "\" & gMainAppl & " " & gUser.UserID & ",着信," & strData, vbNormalFocus)
    End If

    Exit Sub
Err_Exit:
    TraceLog LOG_ERR, "[ucPhoneApi1_OnCall]" & Err.Description
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】着信キャンセル通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnCallCancel(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnCallCancel(" & strData & ")"
    
    gPhone.FlagOnCall = False

    SetReadyMode (APSTAT_IBSTOP)        '受付停止
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】例外CTIクローズ通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnClose(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnClose(" & strData & ")"
    
    gPhone.FlagLogin = False

    SetReadyMode (APSTAT_LOGOFF)        'ログオフ
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】通話開始通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnConnect(strData As String)
On Error GoTo Err_Exit
    Dim RecID       As Long
    Dim str         As String
        
    gPhone.FlagMakecall = False
    gPhone.FlagOnCall = False
    
    str = ucPhoneApi1.GetStatus
    
    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnConnect(" & strData & ") " & str
    
    If str = "転送中" Or str = "転送発信中" Then
        gPhone.FlagSecConnect = True
        SetReadyMode (APSTAT_CONNECT)       '通話中
        Exit Sub
    End If
        
    gPhone.FlagConnect = True
    
    gPhone.TalkTime = ucPhoneApi1.TimeConnect
    'gPhone.TalkTime = Now
    gPhone.TalkSecond = DateDiff("s", gPhone.TalkTime, Now)
    
    txtTalkTime.Text = CLng(gPhone.TalkSecond)
    tmrTalk.Interval = 1000
    tmrTalk.Enabled = True
    
    SetReadyMode (APSTAT_CONNECT)       '通話中
    
'録音開始時にPHONECTLで行う
''    '録音ID採番
''    RecID = GetRecID
''    If RecID = 0 Then
''        '採番できなかったとき「#PCName_yymmddhhnnss」で残す。
''        '(先頭の文字を数字以外にして置くと録音サーバーは処理しない)
''        ucPhoneApi1.RecFile = "#" & ucPhoneApi1.Computer & "_" & Format(Now, "yymmddhhnnss")
''    Else
''        ucPhoneApi1.RecFile = "" & RecID
''    End If
    
    '録音開始
    ucPhoneApi1.RecStart

    '   CtiMode (0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL)
''    If gUser.CtiMode = 9 Then
''        ucPhoneApi1.PhoneNo = ucPhoneApi1.ANI       'ANI番号を電話番号情報に入れる(返信発信用)
''    End If

    f_PopupMsg -1, "", "", 0    'ポップアップを消す
    
    Exit Sub
Err_Exit:
    TraceLog LOG_ERR, "[ucPhoneApi1_OnConnect]" & Err.Description
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】通話切断通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnDisconnect(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnDisconnect(" & strData & ")"
    
    'ucPhoneApi1.RecEnd  '録音終了は切断時に自動で行われる
    
    gPhone.FlagConnect = False
    gPhone.FlagSecConnect = False
    gPhone.FlagOnCall = False
    gPhone.FlagMakecall = False
    gPhone.FlagHold = False
    gPhone.FlagTrans = False

    tmrTalk.Enabled = False
    gPhone.DropTime = Now
    If Format(gPhone.TalkTime, "hh:nn:ss") = "00:00:00" Then
        gPhone.TalkSecond = 0
    Else
        gPhone.TalkSecond = DateDiff("s", gPhone.TalkTime, Now)
    End If
    txtTalkTime.Text = CLng(gPhone.TalkSecond)

    '   CtiMode (0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL)
    '   MultiMain (0：単独メイン、1：複数メイン)
    
    '着信で複数メインのときは作業中にする。（転送着信は除く）
    If gUser.CtiMode = 9 And ucPhoneApi1.MultiMain <> 0 Then
        SetReadyMode (APSTAT_IBSTOP)        '受付停止
    ElseIf gUser.CtiMode = 10 Then
        SetReadyMode (APSTAT_PDSTOP)        '発信停止
    Else
    
        '大阪府対応分 No81 2011/08/09------------------------------------------------------------>>
        'Connectエラー時のMsg画面を表示するので、この時点で消しておく
        Unload frmMsgbox
        '大阪府対応分 No81 2011/08/09------------------------------------------------------------<<
        
        SetReadyMode (APSTAT_DATAIN)        '処理中
        
        If gInTransComplate Then
            tmrTrns.Interval = 1000
            tmrTrns.Enabled = True
        End If

    End If
    
    '転送情報初期化
    gTrns.FlagIO = ""
    gTrns.CustomerCode = 0
    gTrns.ClientCode = 0
    gTrns.JobCode = 0
    gTrns.ListCode = 0
    gTrns.TimeConnect = ""
    gTrns.TimeMakecall = ""
    gTrns.TimeOnCall = ""
    gTrns.ProfileID = 0

    If sDropCmd <> "" Then
        Call ucPhoneApi1.CommandEx(sDropCmd)
        sDropCmd = ""
    End If

    gInTransComplate = False

    If gUser.CtiMode = 9 Then
        If sWaitCnt <> "0" And gPhone.WaitCallCount <> "" Then
            f_PopupMsg 0, "着信が " & sWaitCnt & " 件着ています。", gPhone.WaitCallCount, 0
        End If
    End If

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】エラー通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnError(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnError(" & strData & ")"

    Select Case strData
    
    Case ONERR_LOGON                'ログインエラー
        SetReadyMode (APSTAT_ERROR)
        f_MsgPop "ログインできません。", MSG_ERROR
    
    Case ONERR_LOGOOFF              'ログオフエラー
    Case ONERR_READYMODE            '状態変更エラー
    Case ONERR_READYMODE_AC         'オートコール番号取得待ち中に別の状態にしようとした。
    
    Case ONERR_MAKECALL             '発信エラー
        'ACでの発信を停止通知
        If Me.tmrMakecall.Enabled = True Then
            Me.tmrMakecall.Enabled = False
            SetReadyMode (APSTAT_DATAIN)
            Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP ERROR")
        End If
        gPhone.FlagMakecall = False
    
    Case ONERR_MAKECALL_NONUMBER    '発信先電話番号が指定されていません
        'ACでの発信を停止通知
        If Me.tmrMakecall.Enabled = True Then
            Me.tmrMakecall.Enabled = False
            SetReadyMode (APSTAT_DATAIN)
            Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP ERROR")
        End If
        gPhone.FlagMakecall = False
    
    Case ONERR_MAKECALL_TIMEOUT     '発信タイムアウト
        'ACでの発信を停止通知
        If Me.tmrMakecall.Enabled = True Then
            Me.tmrMakecall.Enabled = False
            SetReadyMode (APSTAT_DATAIN)
            Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP TIMEOUT")
        End If
        gPhone.FlagMakecall = False
    
    Case ONERR_MAKECALL_NOCONNECT   '発信失敗
        'ACでの発信を停止通知
        If Me.tmrMakecall.Enabled = True Then
            Me.tmrMakecall.Enabled = False
            SetReadyMode (APSTAT_DATAIN)
            Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP ERROR")
        End If
        gPhone.FlagMakecall = False

    Case ONERR_MAKECALL_BUSY        'ビジー
        'ACでの発信を停止通知
        If Me.tmrMakecall.Enabled = True Then
            Me.tmrMakecall.Enabled = False
            SetReadyMode (APSTAT_DATAIN)
            Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP BUSY")
        End If
        gPhone.FlagMakecall = False
    
    Case ONERR_MAKECALL_TALKIE      'トーキー
        'ACでの発信を停止通知
        If Me.tmrMakecall.Enabled = True Then
            Me.tmrMakecall.Enabled = False
            SetReadyMode (APSTAT_DATAIN)
            Call ucPhoneApi1.CommandEx("@ONSTATUS ACCALLSTOP TALKIE")
        End If
        gPhone.FlagMakecall = False
    
    Case ONERR_TRANSCALL            '転送エラー
    Case ONERR_TRANSCALL_NONUMBER   '転送先電話番号が指定されていません
    Case ONERR_TRANSCOMP            '転送完了エラー
    Case ONERR_TRANSCNCL            '転送キャンセルエラー
    Case ONERR_MONITER              'モニタ発信エラー
    Case ONERR_MONITER_NONUMBER     'モニタ発信先電話番号が指定されていません
    
    Case ONERR_ANSWER               '着信応答エラー
        If gPhone.FlagOnCall = True Then
            ucPhoneApi1.CommandEx "@ONCALLCANCEL"
        End If
    
    Case ONERR_NOTANSWER            '着信応答拒否エラー
    Case ONERR_HOLD                 '保留エラー
    Case ONERR_UNHOLD               '保留解除エラー
    Case ONERR_CALLSTOP             '発信停止エラー
    Case ONERR_DISCONNECT           '切断エラー
    Case ONERR_AUTOCALL_NODATA      '発信リストが完了しました。
    Case ONERR_AUTOCALL_ERROR       'オートコール配信サーバでエラーが発生しました。
    Case ONERR_AUTOCALL_STOP        'オートコールは停止状態です。
    Case ONERR_AUTOCALL_TIMEOUT     'オートコールサーバから応答が返ってきません。
    
    Case ONERR_COCODA_CONNECT       'CoCoDaPhone接続エラー(スピーカボタン押下を要求)
        SetReadyMode (APSTAT_ERROR)
        f_MsgPop "電話機のボタン状態を確認してください。", MSG_ERROR
    
    Case ONERR_COCODA_ERROR         'CoCoDaPhone初期化エラー
    Case ONERR_CTSTAGE_ERROR        'CTSTAGEのその他エラー
    Case ONERR_CFII_ERROR           'ContactForeceのその他エラー
    
    Case ONERR_CFII_CONNECT         'ContactForece接続エラー(スピー
        SetReadyMode (APSTAT_ERROR)
        f_MsgPop "電話機のハンドセットの問題", MSG_ERROR
    
    Case ONERR_PDBATCH              'PD停止再開一括処理エラー
    End Select

    'フラグに合わせてボタン状態をセット
    ShowButtonStatus
    SetCtiUserStatus
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】イベント通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnEvent(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnEvent(" & strData & ")"

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】保留通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnHold(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnHold(" & strData & ")"

    If strData = "1" Then
        gPhone.FlagHold = True
        SetReadyMode (APSTAT_HOLD)      '保留中
    Else
        gPhone.FlagHold = False
        SetReadyMode (APSTAT_CONNECT)   '通話中
    End If
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】CTI接続通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnInit(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnInit(" & strData & ")"
    
    gPhone.FlagInit = True

    '起動パラメータ 0=未ログイン、1=無作業、2=待機(着信待ち)、3=作業
    If gUser.UsrStat > 0 Then
        If gUser.CtiMode = 9 Then
            DialinGroupSet                  '着信ダイアルイン設定
        End If
        'ログイン要求
        ucPhoneApi1.Logon
    Else
        'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
        ' (4,6,8 は疑似動作)
        Select Case gUser.CtiMode
        Case 1
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case 9
            SetReadyMode (APSTAT_IBSTOP)   '受付停止(IB)
        Case 2, 3, 4
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case 5, 6, 7, 8
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case 10
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case Else
            SetReadyMode (APSTAT_IBSTOP)   '受付停止(IB)
        End Select
    End If
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】ログオン通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnLogon(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnLogon(" & strData & ")"
    
    gPhone.FlagLogin = True
    
    ucPhoneApi1.WorkTime    'ワークタイムにする
        
    '作業状態指定
    Select Case gUser.UsrStat
    
    Case 2  '待機
        'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
        ' (4,6,8 は疑似動作)
        Select Case gUser.CtiMode
        Case 1
            SetReadyMode (APSTAT_PDREADY)   '受付可能(PD)
            ucPhoneApi1.Ready
        Case 9
            SetReadyMode (APSTAT_IBREADY)   '受付可能(IB)
            ucPhoneApi1.Ready
        Case 2, 3, 4
            SetReadyMode (APSTAT_NEXT)      'PC次データ待ち
        Case 5, 6, 7, 8
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case 10
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case Else
            SetReadyMode (APSTAT_IBREADY)   '着信待ち
            'ucPhoneApi1.Ready
        End Select
    
    Case 1, 3 '作業
        'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
        ' (4,6,8 は疑似動作)
        Select Case gUser.CtiMode
        Case 1
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case 9
            SetReadyMode (APSTAT_IBSTOP)   '受付停止(IB)
        Case 2, 3, 4
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case 5, 6, 7, 8
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case 10
            SetReadyMode (APSTAT_PDSTOP)   '発信停止(PD)
        Case Else
            SetReadyMode (APSTAT_IBSTOP)   '受付停止(IB)
        End Select
    
    Case Else
        SetReadyMode (APSTAT_IBSTOP)        '受付停止(IB)
    
    End Select
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】録音終了通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnRecordEnd(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnRecordEnd(" & strData & ")"

    gPhone.FlagRec = False

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】録音開始通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnRecordStart(strData As String)

    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnRecordStart(" & strData & ")"
    
    gPhone.FlagRec = True

End Sub

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】ステータス変更通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnStatus(strData As String)
    Dim vntData     As Variant
    Dim vntDialinData As Variant
    Dim i           As Integer
    Dim str         As String
    
    CtiAddCmdLog LOG_INF, "ucPhoneApi1_OnStatus(" & strData & ")"

    'SetBusinessCodeによる作業中の業務を知らせ
    If Left(strData, 9) = "BUSINESS " Then
        vntData = Split(Mid(strData, 10), "<>")
        gUser.ClientCode = "" & vntData(0)
        gUser.JobCode = "" & vntData(1)
        gUser.ListCode = "" & vntData(2)
        gUser.CustomerCode = "" & vntData(3)
    End If
    
    'ログオフ通知
    If Left(strData, 6) = "LOGOFF" Then
        ucPhoneApi1.MainIndex = "0"
        ucPhoneApi1_OnClose ""
        Exit Sub
    End If

    '発信成功
    If Left(strData, 8) = "MAKECALL" Then
        gPhone.FlagMakecall = True
        '発信中にする
        SetReadyMode (APSTAT_MAKECALL)
    End If

    '発信停止
    If Left(strData, 4) = "STOP" Then
        gPhone.FlagMakecall = False
    End If

    '着信待ち呼数
    If Left(strData, 11) = "CALLDIALIN " Then
        vntDialinData = Split(CallDialinMsg(Mid(strData, 12)), ";")
        'gPhone.WaitCallCount = CallDialinMsg(Mid(strData, 12))
        gPhone.WaitCallCount = vntDialinData(0)
        gPhone.DialinNo = vntDialinData(1)
        Exit Sub
    End If

    'フラグに合わせてボタン状態をセット
    ShowButtonStatus
    SetCtiUserStatus
    
'    Me.BackColor = txtStatus.BackColor           '背景色を変更する
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 着信待ち呼数情報を整形する
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Function CallDialinMsg(strData As String) As String
On Error GoTo Err_Exit
    Dim vntData     As Variant
    Dim vntValue    As Variant
    Dim i           As Integer
    Dim str         As String
    Dim DialinNo         As String
    Dim strDialinNo As String
    Dim Count         As String

    vntData = Split(strData, ";")
    
    str = ""
    For i = 0 To UBound(vntData)
        If vntData(i) <> "" Then
            vntValue = Split(vntData(i) & "=", "=")
            DialinNo = vntValue(0)

            If i = UBound(vntData) Then
                strDialinNo = strDialinNo & DialinNo
            Else
                strDialinNo = strDialinNo & DialinNo & ","
            End If
            
            Count = vntValue(1)
            str = str & FindDialInName(DialinNo) & "(" & Count & ")" & vbCrLf
        End If
    Next
    
    CallDialinMsg = str & ";" & strDialinNo

    Exit Function
Err_Exit:
    ErrorBreak "frmMain.CallDialinMsg"
End Function

'---------------------------------------------------------------------
' 目的説明  -- ProfileIDの電話番号を取得する
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Function GetPhoneNoForProfileID(ProfileID As String, GroupCode As Long) As String
On Error GoTo Err_Exit
    Dim SQL             As String
    Dim cnn             As New ADODB.Connection
    Dim rs              As New ADODB.Recordset
    Dim strMessage      As String
    Dim errX            As ADODB.Error
    Dim PhoneNo         As String

    cnn.Open gDbConnectionString       '###### 接続 ######

    SQL = "select SystemPhoneNo1 from TB_DIALCTL where ProfileID=" & ProfileID
'    SQL = "select * from TB_DialControl" & Format(GroupCode, "00") & " where ProfileID=" & ProfileID
    TraceLog LOG_SQL, SQL

    rs.Open SQL, cnn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = False Then
'        PhoneNo = "" & rs!PhoneNo
        PhoneNo = "" & rs!SystemPhoneNo1
    End If
    rs.Close

    cnn.Close                           '###### 切断 ######
    
    GetPhoneNoForProfileID = PhoneNo
    Exit Function
Err_Exit:
    ErrorBreak "frmMain.GetPhoneNoForProfileID"
End Function

'---------------------------------------------------------------------
' 目的説明  -- 【電話機APIイベント】変数変更通知
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ucPhoneApi1_OnValue(strName As String, strData As String)
    Dim str         As String
    Dim lngApstat   As Long
    
    Select Case strName
    
    Case "PhoneNo"              '電話番号通知
        CtiAddCmdLog LOG_INF, Me.Name & ".ucPhoneApi1_OnValue PhoneNo=" & strData
        Me.txtPhoneNo.Text = strData
        
    Case "CallingNumber"        '発信通知番号
        CtiAddCmdLog LOG_INF, Me.Name & ".ucPhoneApi1_OnValue CallingNumber=" & strData
        Me.txtCalling.Text = strData
    
    Case "AppStatus"            'AP状態
        If gPhone.ReadyMode = Int(ucPhoneApi1.AppStatus) Then
            Exit Sub            '変更が無ければそのまま
        End If
        If gFlagOutPhone = True Then
            TraceLog LOG_WRN, "単体電話機起動中はAppStatusを外部から変更できません。"
            '状態を戻す
            ucPhoneApi1.AppStatus = gPhone.ReadyMode
            Exit Sub
        End If
        CtiAddCmdLog LOG_INF, Me.Name & ".ucPhoneApi1_OnValue AppStatus=" & strData
        '現在画面上のAP状態
        Select Case gPhone.ReadyMode
        Case APSTAT_IBSTOP      '受付停止(IB)
        Case APSTAT_PDSTOP      '発信停止(PD)
        Case APSTAT_IBREADY     '受付可能(IB)
        Case APSTAT_PDREADY     '受付可能(PD)
        Case APSTAT_SELECT      '選択中
        Case APSTAT_DATAIN      '処理中
        Case APSTAT_MONITOR     'モニター中
        Case APSTAT_NEXT        '次顧客選択中
        Case Else
            TraceLog LOG_WRN, "現在の画面からはAppStatusを外部から変更できません。"
            '状態を戻す
            ucPhoneApi1.AppStatus = gPhone.ReadyMode
            Exit Sub            'その他状態では変更不可
        End Select
        '変更するAP状態
        Select Case Int(strData) 'ucPhoneApi1.AppStatus)
        Case APSTAT_IBSTOP      '受付停止(IB)
        Case APSTAT_PDSTOP      '発信停止(PD)
        Case APSTAT_IBREADY     '受付可能(IB)
        Case APSTAT_PDREADY     '受付可能(PD)
        Case APSTAT_SELECT      '選択中
        Case APSTAT_DATAIN      '処理中
        Case APSTAT_COUNT       'カウント中
        Case APSTAT_MONITOR     'モニター中
        Case APSTAT_NEXT        '次顧客選択中
        Case Else
            TraceLog LOG_WRN, "その値はAppStatusを外部から変更できません。"
            '状態を戻す
            ucPhoneApi1.AppStatus = gPhone.ReadyMode
            Exit Sub            'その他状態には変更不可
        End Select
        '電話が切断中のステータスなら変更可能
        str = ucPhoneApi1.GetStatus
        If str = "Ready" Or str = "WorkTime" Or str = "LeaveSeat" Then
            'AP状態を変更する
            SetReadyMode (Int(strData)) 'ucPhoneApi1.AppStatus))
            'カウント中にするなら画面を出す
            If gPhone.ReadyMode = APSTAT_COUNT Then
                Call cmdButton_Click(CMD_COUNT)
            End If
        Else
            CtiAddCmdLog LOG_WRN, "AppStatus変更不可"
            '変更不可なら値を戻しておく
            ucPhoneApi1.AppStatus = gPhone.ReadyMode
        End If
        
    Case "NextMode"             '次顧客以降モード指定
        CtiAddCmdLog LOG_INF, "NextMode=" & strData
        '次の発信・受付開始モード (0=次ボタン, 1=即時, 2=x秒カウント, 3=停止)
        Select Case strData 'ucPhoneApi1.NextMode
        Case "0"
            'なし
        Case "1"
            Me.optNext(0).Value = True  '即時
            Me.optNext(1).Value = False '3秒
            Me.optNext(2).Value = False '停止
        Case "2"
            Me.optNext(0).Value = False '即時
            Me.optNext(1).Value = True  '3秒
            Me.optNext(2).Value = False '停止
        Case "3"
            Me.optNext(0).Value = False '即時
            Me.optNext(1).Value = False '3秒
            Me.optNext(2).Value = True  '停止
        End Select
    
    Case "ProfileID"            'PD発信情報
        CtiAddCmdLog LOG_INF, Me.Name & ".ucPhoneApi1_OnValue ProfileID=" & strData
        '「次顧客」ボタン押下時に無効にしているので解除する
        If cmdButton(CMD_NEXT).Enabled = False Then
            cmdButton(CMD_NEXT).Enabled = True
        End If
        '「次顧客」および「発信開始」状態のみ反応する
        If gPhone.ReadyMode <> APSTAT_NEXT And gPhone.ReadyMode <> APSTAT_PDREADY Then
            TraceLog LOG_DBG, "「次顧客」および「発信開始」状態のみ反応するのでスルー"
            Exit Sub
        End If
        'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：LC、6：DLC、7：DC、8：DDC、9：IB、10：TEL
        ' (4,6,8 は疑似動作)
        Select Case gUser.CtiMode
        Case 2
            'ucPhoneApi1.ProfileIDに値が入る
            If ucPhoneApi1.ProfileID = "" Then
                TraceLog LOG_DBG, "発信情報がありません。(ProfileIDが空)"
                'AP状態を変更する
                SetReadyMode (APSTAT_PDSTOP)
                f_MsgPop "発信情報がありません。", MSG_ERROR
                Exit Sub
            End If
            
            '-->>2011/04/26 富士火災で発覚 即時だとクリア時のProfileID"0"でデータがないといわれる
            If ucPhoneApi1.ProfileID = "0" Then
                TraceLog LOG_DBG, "発信情報がありません。(ProfileIDが0なのでエラーとしないで次を待つ)"
                'AP状態を変更する
'                SetReadyMode (APSTAT_PDSTOP)
'                f_MsgPop "発信情報がありません。", MSG_ERROR
                Exit Sub
            End If
            '--<<2011/04/26
            
            '発信中にする
''''            SetReadyMode (APSTAT_MAKECALL)
            '発信電話番号
            ucPhoneApi1.PhoneNo = GetPhoneNoForProfileID(ucPhoneApi1.ProfileID, gUser.GroupCode)
            If ucPhoneApi1.PhoneNo = "" Then
                'AP状態を変更する
                TraceLog LOG_DBG, "発信情報がありません。(電話番号が空)"
                SetReadyMode (APSTAT_PDSTOP)
                f_MsgPop "発信情報がありません。", MSG_ERROR
                Exit Sub
            End If
            '発信する
            txtCallTime.Text = "0"
'ＡＣ発信タイムアウトはとりあえずしないでオペレータ手動操作とする■■■■■■
''''            tmrMakecall.Interval = 1000
''''            tmrMakecall.Enabled = True
            ucPhoneApi1.MakeCall
            
        Case 3, 4
            If ucPhoneApi1.ProfileID = "" Then
                'AP状態を変更する
                SetReadyMode (APSTAT_PDSTOP)
                f_MsgPop "発信情報がありません。", MSG_ERROR
                Exit Sub
            End If
            '発信電話番号
            ucPhoneApi1.PhoneNo = GetPhoneNoForProfileID(ucPhoneApi1.ProfileID, gUser.GroupCode)
            If ucPhoneApi1.PhoneNo = "" Then
                'AP状態を変更する
                SetReadyMode (APSTAT_PDSTOP)
                f_MsgPop "発信情報がありません。", MSG_ERROR
                Exit Sub
            End If
            
        Case 5, 6
            '電話番号指定は「メイン」で行う
            
        Case 7, 8
            '電話番号指定は「メイン」で行う
            
        End Select
        
    Case "WaitCallCount"        '着信待ち呼数
        CtiAddCmdLog LOG_INF, "WaitCallCount=" & strData
        If gUser.CtiMode = 9 Then
            sWaitCnt = strData
            If sWaitCnt <> "0" And gPhone.FlagConnect = False Then
                f_PopupMsg 0, "着信が " & sWaitCnt & " 件着ています。", gPhone.WaitCallCount, 0
            Else
                f_PopupMsg -1, "", "", 0    'ポップアップを消す
            End If
        End If
    
    End Select
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 業務切替時のメイン処理
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub mChangeGroup()

    Dim nBeforeCtiType As Integer
    Dim nSelectCtiType As Integer
    
    '選択されたCTITypeを取得
    'CtiMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
    ' (4,6,8 は疑似動作)
    If gUser.CtiMode = 4 Or gUser.CtiMode = 6 Or gUser.CtiMode = 8 Then
        nSelectCtiType = 0
    Else
        nSelectCtiType = gUser.CtiType
    End If

    
    TraceLog LOG_DBG, "ChangeGroup UserID[" & gUser.UserID & "] UerName[" & gUser.UserName & "] PC[" & gUser.PCName & "] Ext[" & gUser.Extension & "] CtiMode[" & gUser.CtiMode & "] ClientCode[" & gUser.ClientCode & "] ClientName[" & gUser.ClientName & "] Group[" & gUser.GroupCode & "] Job[" & gUser.JobCode & "] List[" & gUser.ListCode & "]" & " CtiType:" & m_nCtiType & "->" & nSelectCtiType
    
    'ログオフ命令を出す
    If gPhone.FlagLogin Then
        ucPhoneApi1.Logoff
    End If
    
    '途中でCTI種別が変わった場合、PhoneCtlを終了する（擬似を想定）
    If m_nCtiType <> nSelectCtiType Then
        'PhoneCtl終了（後のOPENで再起動）
        ExitPhoneCtl
        '少し終了を待つ
        Sleep 500
        
        ucPhoneApi1.CtiType = nSelectCtiType
        m_nCtiType = nSelectCtiType
    End If
    
    
    '業務切替メッセージ
    afValue.PostData "CHANGEGROUP"
   
    ucPhoneApi1.OpenTel     'ocx初期処理(OpenTelの前にCtiTypeを指定しておくこと)
    gPhone.FlagOpen = True
    
    '着信イベントを無視する指定(AlfaGXなどでNotReadyできないので強制無視する指定)
    If gUser.CtiMode = 9 Then
        ucPhoneApi1.InboundMode = 1     '着信を有効
    Else
        ucPhoneApi1.InboundMode = 1 '0     'Alfaのみ着信を無視。CF2はNotReadyできるので1でOK
    End If
    
    SetReadyMode (APSTAT_LOGOFF)        'ログオフ
    'DoEvents
    
    ucPhoneApi1.AppStatus = APSTAT_LOGOFF '"ログオフ"
    ucPhoneApi1.Server = gUser.Server
    ucPhoneApi1.PortNo = gUser.PortNo
    ucPhoneApi1.CtiUserID = gUser.CtiUserID
    ucPhoneApi1.CtiOpName = afValue.v("OpeName")
    ucPhoneApi1.CtiPassWD = gUser.CtiPassWD
    ucPhoneApi1.Extension = gUser.Extension
    ucPhoneApi1.Group = CLng("0" & afValue.v("GroupCode"))
    ucPhoneApi1.LogonType = 0       'ログオン種類 (0:通常, 1:PD, 2:着信, 3:モニタ)
    ucPhoneApi1.WorktimeMode = 2    'ワークタイムモード (0:NotReady, 1:外線Ready, 2:内線Ready, 3:内外線Ready)
    ucPhoneApi1.AutoRec = 0                     '自動録音
    
    'LogonMode 0：未ログイン、1：PD、2：AC、3：PC、4：DPC、5：PV、6：DPV、7：DC、8：DDC、9：IB、10：TEL
    Select Case gUser.CtiMode
    Case 1, 2, 3, 4, 5, 6, 7, 8, 10
        ucPhoneApi1.LogonType = 1   'PD
    Case 9
        ucPhoneApi1.LogonType = 2   '着信
    Case Else
        ucPhoneApi1.LogonType = 0   '通常
    End Select
    
    'CTI接続
    ucPhoneApi1.Init

    '表示状態切替
    ' (4,6,8は疑似動作)
    Select Case gUser.CtiMode
        Case 1
            SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
            'ucPhoneApi1.WorkTime
        Case 9
            SetReadyMode (APSTAT_IBSTOP)    '受付停止(IB)
            'ucPhoneApi1.WorkTime
        Case 2, 3, 4
            SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
            'ucPhoneApi1.WorkTime
        Case 5, 6, 7, 8
            SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
            'ucPhoneApi1.WorkTime
        Case 10
            SetReadyMode (APSTAT_PDSTOP)    '発信停止(PD)
            'ucPhoneApi1.WorkTime
        Case Else
            SetReadyMode (APSTAT_IBSTOP)    '受付停止(IB)
            'ucPhoneApi1.WorkTime
    End Select
    
    
    'NextMode = 次の発信・受付開始モード (0=次ボタン, 1=即時, 2=x秒カウント, 3=停止)
        
    If Me.optNext(0).Value Then                '即時
        If ucPhoneApi1.NextMode <> 1 Then ucPhoneApi1.NextMode = 1
    ElseIf Me.optNext(1).Value Then            '3秒
        If ucPhoneApi1.NextMode <> 2 Then ucPhoneApi1.NextMode = 2
    ElseIf Me.optNext(2).Value Then            '停止
        If ucPhoneApi1.NextMode <> 3 Then ucPhoneApi1.NextMode = 3
    End If
    
    
    '切替終了
    m_bChangeGroup = False
        
End Sub

'---------------------------------------------------------------------
' 目的説明  -- ログインに必要なデータを保存する
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub SaveLogonData()

    'AFグローバル変数に代入
    afValue.v("UserID") = gUser.UserID  'gValue.UserID
    afValue.v("OpeName") = gUser.UserName  'gValue.UserName
    afValue.v("PCName") = gUser.PCName
    afValue.v("Extension") = gUser.Extension  'gValue.Extension
    afValue.v("LogonMode") = gUser.CtiMode
    afValue.v("ClientCode") = gUser.ClientCode  'gValue.ClientCode
    afValue.v("ClientName") = gUser.ClientName  'gValue.ClientName
    afValue.v("GroupCode") = gUser.GroupCode  'gValue.GroupCode
    afValue.v("JobCode") = gUser.JobCode  'gValue.JobCode
    afValue.v("ListCode") = gUser.ListCode  'gValue.ListCode
    
End Sub

'---------------------------------------------------------------------
' 目的説明  -- 電話機能を終了する
' 引数      --
' 戻り値    -- なし
'---------------------------------------------------------------------
Private Sub ExitPhoneCtl()

    Dim hwnd As Long
    Dim Ret As Long
    
    'キャプションからハンドル取得
    hwnd = FindWindow(vbNullString, "PhoneCtl")
    
    '電話機終了
    Ret = SendMessage(hwnd, WM_CLOSE, 0&, 0&)
       
    TraceLog LOG_DBG, "PhoneCtl Close=" & CStr(Ret) & "->" & CStr(hwnd)

End Sub
