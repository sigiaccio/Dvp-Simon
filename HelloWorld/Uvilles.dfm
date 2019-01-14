object frm_villes: Tfrm_villes
  Left = 0
  Top = 0
  Caption = 'frm_villes'
  ClientHeight = 698
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grid_villes: TwwDBGrid
    Left = 12
    Top = 16
    Width = 320
    Height = 665
    Selected.Strings = (
      'ID_VILLE'#9'10'#9'ID VILLE'#9#9
      'NOM'#9'40'#9'NOM'#9#9)
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
  end
  object grid_localites: TwwDBGrid
    Left = 338
    Top = 15
    Width = 399
    Height = 665
    Selected.Strings = (
      'NOM'#9'40'#9'NOM'
      'ID_LOCALITE'#9'14'#9'ID LOCALITE'
      'CP'#9'4'#9'CP')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_localites
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object btn_update: TButton
    Left = 752
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btn_update'
    TabOrder = 2
    OnClick = btn_updateClick
  end
  object qry_villes: TIBOQuery
    Active = True
    IB_Connection = ibdtbs_connexion
    RecordCountAccurate = True
    SQL.Strings = (
      'select *'
      'from villes'
      'where id_pays = 21'
      'order by NOM')
    Left = 352
    Top = 80
  end
  object qry_localites: TIBOQuery
    Active = True
    IB_Connection = ibdtbs_connexion
    KeyLinks.Strings = (
      'LOCALITES.ID_LOCALITE')
    RecordCountAccurate = True
    SQL.Strings = (
      'select *'
      'from localites'
      'where utilise = '#39'T'#39
      'order by NOM')
    Left = 352
    Top = 216
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
    Left = 352
    Top = 24
    SavedPassword = '.JuMbLe.01.4B3A132E012A154B'
  end
  object ds_villes: TDataSource
    DataSet = qry_villes
    Left = 352
    Top = 152
  end
  object ds_localites: TDataSource
    DataSet = qry_localites
    Left = 360
    Top = 280
  end
end
