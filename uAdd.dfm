object frmAdd: TfrmAdd
  Left = 438
  Top = 156
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Add New Employee'
  ClientHeight = 253
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 80
    Height = 13
    Caption = 'Employee Name:'
  end
  object Branch: TLabel
    Left = 16
    Top = 91
    Width = 66
    Height = 13
    Caption = 'Branch name:'
  end
  object Label3: TLabel
    Left = 16
    Top = 63
    Width = 49
    Height = 13
    Caption = 'Password:'
  end
  object Label4: TLabel
    Left = 16
    Top = 35
    Width = 56
    Height = 13
    Caption = 'User Name:'
  end
  object Label2: TLabel
    Left = 16
    Top = 147
    Width = 76
    Height = 13
    Caption = 'Employee Type:'
  end
  object Label5: TLabel
    Left = 16
    Top = 174
    Width = 69
    Height = 13
    Caption = 'Email Address:'
  end
  object edtEmployeeName: TEdit
    Left = 112
    Top = 8
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object btnSave: TBitBtn
    Left = 280
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 6
    OnClick = btnSaveClick
    Glyph.Data = {
      6E040000424D6E04000000000000360000002800000013000000120000000100
      1800000000003804000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0505050505
      0505050505050505050505050505050505050505050505050505050505050505
      0505050505FFFFFFFFFFFF000000FFFFFFFFFFFF050505BCC27FBCC27F050505
      050505050505050505050505050505050505050505050505BCC27FBCC27F0505
      05FFFFFFFFFFFF000000FFFFFFFFFFFF050505BCC27FBCC27F050505050505C0
      CAA6C0CAA6050505050505050505050505050505BCC27FBCC27F050505FFFFFF
      FFFFFF000000FFFFFFFFFFFF050505BCC27FBCC27F050505050505C0CAA6C0CA
      A6050505050505050505050505050505BCC27FBCC27F050505FFFFFFFFFFFF00
      0000FFFFFFFFFFFF050505BCC27FBCC27F050505050505C0CAA6C0CAA6050505
      050505050505050505050505BCC27FBCC27F050505FFFFFFFFFFFF000000FFFF
      FFFFFFFF050505BCC27FBCC27F80803F05050505050505050505050505050505
      050505050580803FBCC27FBCC27F050505FFFFFFFFFFFF000000FFFFFFFFFFFF
      050505BCC27FBCC27FBCC27FBCC27FBCC27FBCC27FBCC27FBCC27FBCC27FBCC2
      7FBCC27FBCC27FBCC27F050505FFFFFFFFFFFF000000FFFFFFFFFFFF050505BC
      C27FBCC27F80803F05050505050505050505050505050505050505050580803F
      BCC27FBCC27F050505FFFFFFFFFFFF000000FFFFFFFFFFFF050505BCC27FBCC2
      7F050505C5C5C5FCFCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFD050505BCC27FBC
      C27F050505FFFFFFFFFFFF000000FFFFFFFFFFFF050505BCC27FBCC27F050505
      C5C5C5FCFCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFD050505BCC27FBCC27F0505
      05FFFFFFFFFFFF000000FFFFFFFFFFFF050505BCC27FBCC27F050505C5C5C5FC
      FCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFD050505BCC27FBCC27F050505FFFFFF
      FFFFFF000000FFFFFFFFFFFF050505BCC27FBCC27F050505C5C5C5FCFCFDFCFC
      FDFCFCFDFCFCFDFCFCFDFCFCFD050505BCC27FBCC27F050505FFFFFFFFFFFF00
      0000FFFFFFFFFFFF050505BCC27FBCC27F050505C5C5C5FCFCFDFCFCFDFCFCFD
      FCFCFDFCFCFDFCFCFD050505BCC27FBCC27F050505FFFFFFFFFFFF000000FFFF
      FFFFFFFF05050505050505050505050505050505050505050505050505050505
      0505050505050505050505050505050505FFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
  end
  object btnCancel: TBitBtn
    Left = 360
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelClick
    Glyph.Data = {
      6E040000424D6E04000000000000360000002800000013000000120000000100
      1800000000003804000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000FF0000
      80000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF808080FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000FF000080000080
      000080808080FFFFFFFFFFFFFFFFFF0000FF000080000080808080FFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000FF00008000008000008000
      0080808080FFFFFF0000FF000080000080000080000080808080FFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000800000
      80808080000080000080000080000080000080808080FFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080
      000080000080000080000080808080FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00008000008000008000008000
      0080000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000800000800000800000800000808080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080808080FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF0000FF000080000080000080000080000080808080FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
      000080000080000080808080000080000080000080808080FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF00008000008000
      0080808080FFFFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080808080FFFF
      FFFFFFFFFFFFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FF000080000080000080FFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF0000FF0000800000FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
  end
  object edtusername: TEdit
    Left = 112
    Top = 32
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object btnPopulate: TBitBtn
    Left = 15
    Top = 224
    Width = 105
    Height = 25
    Caption = 'Populate Region'
    TabOrder = 8
    Visible = False
    OnClick = btnPopulateClick
  end
  object cboBranch: TComboBox
    Left = 112
    Top = 88
    Width = 305
    Height = 22
    Style = csOwnerDrawFixed
    DropDownCount = 30
    ItemHeight = 16
    TabOrder = 3
  end
  object edtRegionCode: TEdit
    Left = 112
    Top = 112
    Width = 49
    Height = 21
    TabOrder = 9
    Text = '1'
    Visible = False
  end
  object btnGetRegion: TBitBtn
    Left = 128
    Top = 224
    Width = 97
    Height = 25
    Caption = 'Get Region Code'
    TabOrder = 10
    Visible = False
    OnClick = btnGetRegionClick
  end
  object edtRegionname: TEdit
    Left = 168
    Top = 112
    Width = 49
    Height = 21
    TabOrder = 11
    Text = 'edtRegionname'
    Visible = False
  end
  object edtBranchCode: TEdit
    Left = 232
    Top = 112
    Width = 49
    Height = 21
    TabOrder = 12
    Text = '1'
    Visible = False
  end
  object edtpassword: TEdit
    Left = 112
    Top = 56
    Width = 145
    Height = 21
    MaxLength = 20
    TabOrder = 2
  end
  object cboEmployeeType: TComboBox
    Left = 112
    Top = 144
    Width = 201
    Height = 22
    Style = csOwnerDrawFixed
    DropDownCount = 30
    ItemHeight = 16
    TabOrder = 4
  end
  object btnEmpType: TBitBtn
    Left = 16
    Top = 200
    Width = 105
    Height = 25
    Caption = 'Populate EmpType'
    TabOrder = 13
    Visible = False
    OnClick = btnEmpTypeClick
  end
  object edtEmailAddress: TEdit
    Left = 112
    Top = 171
    Width = 305
    Height = 21
    MaxLength = 60
    TabOrder = 5
  end
  object qryChk: TffQuery
    DatabaseName = 'AcctMaintenance'
    SessionName = 'Sess1'
    SQL.Strings = (
      'select * from tbluser')
    Left = 224
    Top = 200
  end
  object qryRegion: TffQuery
    DatabaseName = 'AcctMaintenance'
    SessionName = 'Sess1'
    SQL.Strings = (
      'select * from Region')
    Left = 256
    Top = 200
  end
  object dsRegion: TDataSource
    DataSet = qryRegion
    Left = 304
    Top = 88
  end
end