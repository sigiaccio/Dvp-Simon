object frm_villes: Tfrm_villes
  Left = 0
  Top = 0
  Caption = 'frm_villes'
  ClientHeight = 719
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_fleche: TLabel
    Left = 143
    Top = 411
    Width = 36
    Height = 13
    Caption = 'devient'
  end
  object grid_villes: TwwDBGrid
    Left = 16
    Top = 16
    Width = 601
    Height = 377
    Selected.Strings = (
      'PAYS'#9'25'#9'PAYS'#9'F'
      'VILLE'#9'40'#9'VILLE'#9'F'#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_villes
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnDblClick = grid_villesDblClick
    OnKeyDown = grid_villesKeyDown
  end
  object edt_ville: TEdit
    Left = 16
    Top = 408
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'edt_ville'
  end
  object btn_ville: TButton
    Left = 312
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Modifier la ville'
    TabOrder = 2
  end
  object edt_villenew: TEdit
    Left = 185
    Top = 408
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = 'edt_ville'
  end
  object ibdtbs_connexion: TIBODatabase
    CacheStatementHandles = False
    SQLDialect = 3
    Params.Strings = (
      'SERVER=epfc01dev01'
      'PROTOCOL=TCP/IP'
      'PATH=c:\epfc1819Test.fdb'
      'USER NAME=SYSDBA'
      'CHARACTER SET=ISO8859_1'
      'BUFFERS=<default>'
      'SQL DIALECT=3')
    Isolation = tiCommitted
    Left = 656
    Top = 24
    SavedPassword = '.JuMbLe.01.4B3A132E012A154B'
  end
  object qry_villes: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM VILLES VILLES'
      'WHERE'
      'VILLES.RDB$DB_KEY = :DB_KEY')
    EditSQL.Strings = (
      'UPDATE VILLES VILLES SET'
      '   VILLES.NOM = :NOM'
      'WHERE'
      'VILLES.RDB$DB_KEY = :DB_KEY')
    IB_Connection = ibdtbs_connexion
    InsertSQL.Strings = (
      'INSERT INTO VILLES('
      '   NOM)'
      'VALUES ('
      '   :NOM)')
    RecordCountAccurate = True
    SQL.Strings = (
      'select villes.nom as ville, pays.nom as pays'
      'from villes'
      'inner join pays on villes.id_pays = pays.id_pays'
      'where villes.utilise = '#39'T'#39
      'and pays.UTILISE = '#39'T'#39
      'order by pays.NOM')
    Left = 656
    Top = 88
    object strngfld_villesPAYS: TStringField
      DisplayWidth = 25
      FieldName = 'PAYS'
      Required = True
      Size = 50
    end
    object strngfld_villesVILLE: TStringField
      DisplayWidth = 40
      FieldName = 'VILLE'
      Required = True
      Size = 40
    end
  end
  object ds_villes: TDataSource
    DataSet = qry_villes
    Left = 656
    Top = 152
  end
end
