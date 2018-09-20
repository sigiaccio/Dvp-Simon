object FHelloWorld: TFHelloWorld
  Left = 0
  Top = 0
  Caption = 'FHelloWorld'
  ClientHeight = 590
  ClientWidth = 1506
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_firstname: TLabel
    Left = 32
    Top = 84
    Width = 47
    Height = 13
    Caption = 'Firstname'
  end
  object lbl_name: TLabel
    Left = 32
    Top = 39
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object lbl_errors_name: TLabel
    Left = 32
    Top = 131
    Width = 29
    Height = 13
    Caption = 'Errors'
    Visible = False
  end
  object lbl_mat_etud: TLabel
    Left = 830
    Top = 29
    Width = 104
    Height = 13
    Caption = 'Matricule '#233'tudiant'
    FocusControl = dbedt_MAT_ETUD
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_nom: TLabel
    Left = 360
    Top = 32
    Width = 25
    Height = 14
    Caption = 'Nom'
    Color = clSkyBlue
    FocusControl = dbedt_NOM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'NOM'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl_prenom: TLabel
    Left = 575
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Pr'#233'nom'
    Color = clSkyBlue
    FocusControl = dbedt_PRENOM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl_sexe: TLabel
    Left = 784
    Top = 29
    Width = 28
    Height = 13
    Caption = 'Sexe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_DATE_NAISS: TLabel
    Left = 360
    Top = 84
    Width = 103
    Height = 13
    Caption = 'Date de naissance'
    Color = clMenuHighlight
    FocusControl = dbedt_DATE_NAISS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl_1: TLabel
    Left = 512
    Top = 84
    Width = 99
    Height = 13
    Caption = 'Ville de naissance'
    FocusControl = dbedt_NOM_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_PAYS: TLabel
    Left = 785
    Top = 84
    Width = 27
    Height = 13
    Caption = 'Pays'
    FocusControl = dbedt_ID_PAYS_NATIONALITE
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edt_name: TEdit
    Left = 94
    Top = 39
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Name'
    TextHint = 'Name'
  end
  object StaticText1: TStaticText
    Left = 32
    Top = 16
    Width = 55
    Height = 17
    Caption = 'HelloWorld'
    TabOrder = 1
  end
  object edt_firstname: TEdit
    Left = 94
    Top = 81
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Firstname'
    TextHint = 'Firstname'
  end
  object btn_submit: TButton
    Left = 94
    Top = 164
    Width = 75
    Height = 25
    Caption = 'Submit'
    TabOrder = 3
    OnClick = Submit
  end
  object edt_error: TEdit
    Left = 360
    Top = 224
    Width = 604
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
  object dbnvgr_personne: TDBNavigator
    Left = 32
    Top = 300
    Width = 240
    Height = 25
    DataSource = ds2
    Kind = dbnHorizontal
    TabOrder = 5
  end
  object wdbgrd1: TwwDBGrid
    Left = 32
    Top = 331
    Width = 932
    Height = 225
    Selected.Strings = (
      'MAT_ETUD'#9'10'#9'MAT_ETUD'#9#9
      'NOM'#9'50'#9'ETD.NOM'#9'F'
      'PRENOM'#9'50'#9'PRENOM'#9#9
      'SEXE'#9'1'#9'SEXE'#9'F'
      'DATE_NAISS'#9'10'#9'DATE_NAISS'#9'F'
      'ADR_RUE'#9'50'#9'ADR_RUE'#9'F'
      'ADR_NO'#9'7'#9'ADR_NO'#9'F'
      'ADR_BOITE'#9'7'#9'ADR_BOITE'#9'F'
      'CP'#9'4'#9'CP'#9'F'
      'GSM'#9'30'#9'GSM'#9'F'
      'TEL'#9'10'#9'TEL'#9'F'
      'NO_COMPTE'#9'16'#9'NO_COMPTE'#9'F'
      'ALLOC_FAM'#9'1'#9'ALLOC_FAM'#9'F'
      'NO_NATIONAL'#9'11'#9'NO_NATIONAL'#9'F'
      'EMAIL'#9'100'#9'EMAIL'#9'F'
      'DATE_CREATED'#9'18'#9'DATE_CREATED'#9'F'
      'DATE_MODIFIED'#9'18'#9'DATE_MODIFIED'#9'F'
      'USERNAME'#9'30'#9'USERNAME'#9'F'
      'MODIFIED_BY'#9'30'#9'MODIFIED_BY'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    DataSource = ds2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgDblClickColSizing]
    ParentFont = False
    TabOrder = 6
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    UseTFields = False
    TitleMenuAttributes.Options = [sfoSortAscending, sfoSortDescending, sfoGrouping, sfoSelectColumns, sfoCreateIndexes, sfoAutoTitleButtonSort]
    TitleMenuAttributes.MenuEnabled = True
    OnTitleButtonClick = wdbgrd1TitleButtonClick
  end
  object dbedt_MAT_ETUD: TDBEdit
    Left = 830
    Top = 48
    Width = 134
    Height = 21
    DataField = 'MAT_ETUD'
    DataSource = ds2
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object dbedt_NOM: TDBEdit
    Left = 360
    Top = 51
    Width = 209
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOM'
    DataSource = ds2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 49
    ParentFont = False
    TabOrder = 8
    OnChange = dbedt_NOMChange
    OnExit = dbedt_NOMExit
  end
  object dbedt_PRENOM: TDBEdit
    Left = 575
    Top = 51
    Width = 192
    Height = 21
    DataField = 'PRENOM'
    DataSource = ds2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnChange = dbedt_PRENOMChange
    OnExit = dbedt_PRENOMExit
  end
  object cbb_SEXE: TwwDBComboBox
    Left = 784
    Top = 48
    Width = 40
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = False
    AllowClearKey = False
    DataField = 'SEXE'
    DataSource = ds2
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 0
    Items.Strings = (
      'M'
      'F')
    ItemIndex = 0
    ParentFont = False
    Sorted = False
    TabOrder = 10
    UnboundDataType = wwDefault
  end
  object dbedt_DATE_NAISS: TDBEdit
    Left = 360
    Top = 103
    Width = 134
    Height = 21
    DataField = 'DATE_NAISS'
    DataSource = ds2
    TabOrder = 11
    OnChange = dbedt_DATE_NAISSChange
    OnExit = dbedt_DATE_NAISSExit
  end
  object dbedt_NOM_1: TDBEdit
    Left = 512
    Top = 103
    Width = 255
    Height = 21
    DataField = 'VILLE_NAISSANCE'
    DataSource = ds2
    TabOrder = 12
  end
  object dbedt_ID_PAYS_NATIONALITE: TDBEdit
    Left = 785
    Top = 103
    Width = 134
    Height = 21
    DataField = 'PAYS'
    DataSource = ds2
    TabOrder = 13
  end
  object ibqry_etudiant: TIBOQuery
    EditSQL.Strings = (
      '')
    IB_Connection = ibdtbs_connexion
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT etd.MAT_ETUD'
      '     , etd.NOM'
      '     , etd.PRENOM'
      '     , etd.SEXE'
      '     , etd.DATE_NAISS'
      '     , v.nom as ville_naissance'
      '     , p.nom as pays'
      '     , etd.ADR_RUE'
      '     , etd.ADR_NO'
      '     , etd.ADR_BOITE'
      '     , l.NOM as localite'
      '     , l.CP'
      '     , etd.GSM'
      '     , etd.TEL'
      '     , etd.NO_COMPTE'
      '     , etd.ALLOC_FAM'
      '     , etd.NO_NATIONAL'
      '     , etd.EMAIL'
      '     , etd.DATE_CREATED'
      '     , etd.DATE_MODIFIED'
      '     , etd.USERNAME'
      '     , etd.MODIFIED_BY'
      'FROM ETUDIANTS etd'
      'inner join VILLES v on v.ID_VILLE=etd.ID_VILLE_NAISS'
      'inner join LOCALITES l on l.ID_LOCALITE = etd.ADR_ID_LOCALITE'
      'inner join PAYS p on p.id_pays = etd.ID_PAYS_NATIONALITE')
    Left = 568
    Top = 256
    object strngfld_etudiantMAT_ETUD: TStringField
      FieldName = 'MAT_ETUD'
      Required = True
      Size = 10
    end
    object strngfld_etudiantNOM: TStringField
      FieldName = 'NOM'
      Required = True
      Size = 50
    end
    object strngfld_etudiantPRENOM: TStringField
      FieldName = 'PRENOM'
      Size = 50
    end
    object strngfld_etudiantSEXE: TStringField
      FieldName = 'SEXE'
      Size = 1
    end
    object dtfld_etudiantDATE_NAISS: TDateField
      FieldName = 'DATE_NAISS'
      Required = True
    end
    object strngfld_etudiantVILLE_NAISSANCE: TStringField
      FieldName = 'VILLE_NAISSANCE'
      Required = True
      Size = 40
    end
    object strngfld_etudiantPAYS: TStringField
      FieldName = 'PAYS'
      Required = True
      Size = 50
    end
    object strngfld_etudiantADR_RUE: TStringField
      FieldName = 'ADR_RUE'
      Size = 50
    end
    object strngfld_etudiantADR_NO: TStringField
      FieldName = 'ADR_NO'
      Size = 7
    end
    object strngfld_etudiantADR_BOITE: TStringField
      FieldName = 'ADR_BOITE'
      Size = 7
    end
    object strngfld_etudiantLOCALITE: TStringField
      FieldName = 'LOCALITE'
      Required = True
      Size = 40
    end
    object strngfld_etudiantCP: TStringField
      FieldName = 'CP'
      Required = True
      Size = 4
    end
    object strngfld_etudiantGSM: TStringField
      FieldName = 'GSM'
      Size = 30
    end
    object strngfld_etudiantTEL: TStringField
      FieldName = 'TEL'
      Size = 10
    end
    object strngfld_etudiantNO_COMPTE: TStringField
      FieldName = 'NO_COMPTE'
      Size = 16
    end
    object strngfld_etudiantALLOC_FAM: TStringField
      FieldName = 'ALLOC_FAM'
      Size = 1
    end
    object strngfld_etudiantNO_NATIONAL: TStringField
      FieldName = 'NO_NATIONAL'
      Size = 11
    end
    object strngfld_etudiantEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object dtmfld_etudiantDATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object dtmfld_etudiantDATE_MODIFIED: TDateTimeField
      FieldName = 'DATE_MODIFIED'
    end
    object strngfld_etudiantUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 30
    end
    object strngfld_etudiantMODIFIED_BY: TStringField
      FieldName = 'MODIFIED_BY'
      Required = True
      Size = 30
    end
  end
  object ds2: TDataSource
    DataSet = ibqry_etudiant
    Left = 632
    Top = 256
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
    Left = 488
    Top = 256
    SavedPassword = '.JuMbLe.01.4B3A132E012A154B'
  end
end
