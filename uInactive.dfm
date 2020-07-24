object frmInactive: TfrmInactive
  Left = 459
  Top = 198
  Width = 640
  Height = 497
  BorderIcons = [biSystemMenu]
  Caption = 'Inactive Account'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 312
    Top = 16
    Width = 117
    Height = 13
    Caption = 'Search Employee Name:'
  end
  object btnActivate: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Activate'
    TabOrder = 0
    OnClick = btnActivateClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 609
    Height = 377
    DataSource = dsUserList
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'username'
        Title.Caption = 'User Name'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employeename'
        Title.Caption = 'Employee Name'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recid'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'password'
        Title.Caption = 'Password'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'region_id'
        Title.Caption = 'Region ID'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'activated'
        Title.Caption = 'Status'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Access_id'
        Title.Caption = 'Access ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'modifiedby'
        Title.Caption = 'Updated By'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datemodified'
        Title.Caption = 'Last Update'
        Width = 95
        Visible = True
      end>
  end
  object btnShowInactive: TBitBtn
    Left = 200
    Top = 8
    Width = 57
    Height = 25
    Caption = 'Show List'
    TabOrder = 2
    Visible = False
    OnClick = btnShowInactiveClick
  end
  object btnDelete: TBitBtn
    Left = 88
    Top = 8
    Width = 107
    Height = 25
    Caption = 'Delete Employee'
    TabOrder = 3
    Visible = False
    OnClick = btnDeleteClick
  end
  object edtSearch: TEdit
    Left = 432
    Top = 16
    Width = 185
    Height = 21
    TabOrder = 4
    OnKeyDown = edtSearchKeyDown
    OnKeyUp = edtSearchKeyUp
  end
  object btnSearch: TBitBtn
    Left = 264
    Top = 8
    Width = 33
    Height = 25
    Caption = 'Search'
    TabOrder = 5
    Visible = False
    OnClick = btnSearchClick
  end
  object btnClose: TBitBtn
    Left = 536
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = btnCloseClick
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
  object qryInactive: TffQuery
    DatabaseName = 'AcctMaintenance'
    SessionName = 'Sess1'
    SQL.Strings = (
      'Select * from tbluser '
      'where activated <>1')
    Left = 64
    Top = 80
    object qryInactiverecid: TAutoIncField
      FieldName = 'recid'
    end
    object qryInactiveemployeename: TStringField
      FieldName = 'employeename'
      Size = 100
    end
    object qryInactivepassword: TStringField
      FieldName = 'password'
      Size = 4
    end
    object qryInactiveregion_id: TSmallintField
      FieldName = 'region_id'
    end
    object qryInactiveactivated: TSmallintField
      FieldName = 'activated'
    end
    object qryInactiveAccess_id: TSmallintField
      FieldName = 'Access_id'
    end
    object qryInactivedateentered: TDateTimeField
      FieldName = 'dateentered'
    end
    object qryInactivedatemodified: TDateTimeField
      FieldName = 'datemodified'
    end
    object qryInactiveenteredby: TStringField
      FieldName = 'enteredby'
      Size = 60
    end
    object qryInactivemodifiedby: TStringField
      FieldName = 'modifiedby'
      Size = 60
    end
    object qryInactiveusername: TStringField
      FieldName = 'username'
      Size = 60
    end
  end
  object dsUserList: TDataSource
    DataSet = qryInactive
    Left = 24
    Top = 80
  end
  object qryChk: TffQuery
    DatabaseName = 'AcctMaintenance'
    SessionName = 'Sess1'
    Left = 24
    Top = 128
  end
end
