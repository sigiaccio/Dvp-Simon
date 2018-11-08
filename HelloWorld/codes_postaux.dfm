object Form_cp: TForm_cp
  Left = 0
  Top = 0
  Caption = 'Form_cp'
  ClientHeight = 719
  ClientWidth = 1644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grp_cp1: TGroupBox
    Left = 8
    Top = 8
    Width = 105
    Height = 169
    Caption = 'old localite'
    TabOrder = 0
  end
  object grp_cp2: TGroupBox
    Left = 119
    Top = 8
    Width = 122
    Height = 169
    Caption = 'new localite'
    TabOrder = 1
  end
  object btn_localites: TButton
    Left = 135
    Top = 183
    Width = 75
    Height = 25
    Caption = 'btn_localites'
    TabOrder = 6
    OnClick = btn_localitesClick
  end
  object wwDBGrid_allocFamil_update_localites: TwwDBGrid
    Left = 8
    Top = 214
    Width = 377
    Height = 497
    Selected.Strings = (
      'ID_LOCALITE'#9'10'#9'ID_LOCALITE'
      'CP'#9'4'#9'CP'
      'NOM'#9'40'#9'NOM')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_localite_old
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object wwDBGrid_allocFamil_localite_new: TwwDBGrid
    Left = 391
    Top = 214
    Width = 377
    Height = 497
    Selected.Strings = (
      'ID'#9'10'#9'ID'
      'CP'#9'4'#9'CP'
      'NOM'#9'40'#9'NOM')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_localite_new
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object edt_cp: TEdit
    Left = 8
    Top = 187
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '6238'
    OnEnter = edt_cpEnter
  end
  object grp_cp3: TGroupBox
    Left = 247
    Top = 8
    Width = 114
    Height = 169
    Caption = 'etudiant'
    TabOrder = 5
  end
  object grp_cp4: TGroupBox
    Left = 367
    Top = 8
    Width = 114
    Height = 169
    Caption = 'anc etud'
    TabOrder = 7
  end
  object wwDBGrid_etudiant: TwwDBGrid
    Left = 774
    Top = 214
    Width = 363
    Height = 497
    Selected.Strings = (
      'MAT_ETUD'#9'10'#9'MAT_ETUD'
      'ADR_ID_LOCALITE'#9'10'#9'ADR_ID_LOCALITE'
      'NOM'#9'40'#9'NOM')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_etudiant
    TabOrder = 8
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object wwDBGrid_anc_etudiant: TwwDBGrid
    Left = 1143
    Top = 214
    Width = 418
    Height = 497
    Selected.Strings = (
      'MAT_ETUD'#9'10'#9'MAT ETUD'
      'ADR_ID_LOCALITE'#9'10'#9'ADR ID LOCALITE'
      'NOM'#9'40'#9'NOM')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_anc_etudiant
    TabOrder = 9
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object btn_clear: TButton
    Left = 216
    Top = 183
    Width = 75
    Height = 25
    Caption = 'btn_clear'
    TabOrder = 10
  end
  object ds_localite_old: TDataSource
    DataSet = ibqry_localites_old
    Left = 32
    Top = 40
  end
  object ibqry_localites_old: TIBOQuery
    Active = True
    KeyLinks.Strings = (
      'LOCALITES.ID_LOCALITE')
    RecordCountAccurate = True
    SQL.Strings = (
      'select localites.ID_LOCALITE, localites.CP, localites.NOM'
      'from localites'
      'order by localites.cp')
    Left = 32
    Top = 104
    object intgrfld_localites_oldID_LOCALITE: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_LOCALITE'
      Required = True
    end
    object strngfld_localites_oldCP: TStringField
      DisplayWidth = 4
      FieldName = 'CP'
      Required = True
      Size = 4
    end
    object strngfld_localites_oldNOM: TStringField
      DisplayWidth = 40
      FieldName = 'NOM'
      Required = True
      Size = 40
    end
  end
  object ibqry_localites_new: TIBOQuery
    Active = True
    RecordCountAccurate = True
    DataSource = ds_localite_old
    SQL.Strings = (
      'select LOCALITES2.ID, LOCALITES2.CP, LOCALITES2.NOM'
      'from LOCALITES2'
      'order by localites2.cp')
    Left = 160
    Top = 104
    object intgrfld_localites_newID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object strngfld_localites_newCP: TStringField
      DisplayWidth = 4
      FieldName = 'CP'
      Size = 4
    end
    object strngfld_localites_newNOM: TStringField
      DisplayWidth = 40
      FieldName = 'NOM'
      Size = 40
    end
  end
  object ds_localite_new: TDataSource
    DataSet = ibqry_localites_new
    Left = 160
    Top = 32
  end
  object ibqry_etudiant: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'pcodepostal'
        ParamType = ptInput
      end>
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select ETUDIANTS.MAT_ETUD, etudiants.ADR_ID_LOCALITE, LOCALITES.' +
        'NOM'
      'from etudiants'
      
        'inner join localites on etudiants.ADR_ID_LOCALITE = LOCALITES.ID' +
        '_LOCALITE'
      '/*where LOCALITES.CP = 1050*/'
      'where LOCALITES.CP = :pcodepostal'
      'order by localites.cp')
    Left = 280
    Top = 104
    object strngfld_etudiantMAT_ETUD: TStringField
      DisplayWidth = 10
      FieldName = 'MAT_ETUD'
      Required = True
      Size = 10
    end
    object intgrfld_etudiantADR_ID_LOCALITE: TIntegerField
      DisplayWidth = 10
      FieldName = 'ADR_ID_LOCALITE'
    end
    object strngfld_etudiantNOM: TStringField
      DisplayWidth = 40
      FieldName = 'NOM'
      Required = True
      Size = 40
    end
  end
  object ds_etudiant: TDataSource
    DataSet = ibqry_etudiant
    Left = 288
    Top = 32
  end
  object ds_anc_etudiant: TDataSource
    DataSet = ibqry_anc_etudiant
    Left = 400
    Top = 32
  end
  object ibqry_anc_etudiant: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'pcodepostal'
        ParamType = ptInput
      end>
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select ANC_ETUD.MAT_ETUD, ANC_ETUD.ADR_ID_LOCALITE, LOCALITES.NO' +
        'M'
      'from ANC_ETUD'
      
        'inner join localites on ANC_ETUD.ADR_ID_LOCALITE = LOCALITES.ID_' +
        'LOCALITE'
      'where LOCALITES.CP = :pcodepostal')
    Left = 400
    Top = 104
    object strngfld_anc_etudiantMAT_ETUD: TStringField
      DisplayLabel = 'MAT ETUD'
      DisplayWidth = 10
      FieldName = 'MAT_ETUD'
      Required = True
      Size = 10
    end
    object intgrfld_anc_etudiantADR_ID_LOCALITE: TIntegerField
      DisplayLabel = 'ADR ID LOCALITE'
      DisplayWidth = 10
      FieldName = 'ADR_ID_LOCALITE'
    end
    object strngfld_anc_etudiantNOM: TStringField
      DisplayWidth = 40
      FieldName = 'NOM'
      Required = True
      Size = 40
    end
  end
end
