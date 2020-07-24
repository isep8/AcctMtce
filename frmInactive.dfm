object Form1: TForm1
  Left = 682
  Top = 160
  Width = 650
  Height = 467
  Caption = 'Inactive Account'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 609
    Height = 377
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'recid'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'employeename'
        Title.Caption = 'Employee Name'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'password'
        Title.Caption = 'Password'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'region_id'
        Title.Caption = 'Region ID'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'activated'
        Title.Caption = 'Status'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Access_id'
        Title.Caption = 'Access ID'
        Width = 70
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Activate'
    TabOrder = 1
  end
end
