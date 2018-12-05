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
  OnCreate = FormCreate
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
    Left = 278
    Top = 183
    Width = 75
    Height = 25
    Caption = 'update correspo'
    TabOrder = 6
    OnClick = btn_localitesClick
  end
  object wwDBGrid_localites_old: TwwDBGrid
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
  object wwDBGrid_localite_new: TwwDBGrid
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
    Text = '7100'
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
    Width = 438
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
    Left = 1218
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
    Left = 135
    Top = 183
    Width = 75
    Height = 25
    Caption = 'update_grid'
    TabOrder = 10
    OnClick = btn_clearClick
  end
  object wwDBGrid_corres: TwwDBGrid
    Left = 952
    Top = 24
    Width = 320
    Height = 120
    Selected.Strings = (
      'GOOD'#9'10'#9'GOOD'
      'NOTGOOD'#9'10'#9'NOTGOOD'
      'CP'#9'4'#9'CP'
      'NOM'#9'40'#9'NOM')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_corres
    TabOrder = 11
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object btn_update_etudiants: TButton
    Left = 359
    Top = 183
    Width = 75
    Height = 25
    Caption = 'btn_update_etudiants'
    TabOrder = 12
    OnClick = btn_update_etudiantsClick
  end
  object btn_anc_etudiant: TButton
    Left = 440
    Top = 183
    Width = 75
    Height = 25
    Caption = 'btn_anc_etudiant'
    TabOrder = 13
    OnClick = btn_anc_etudiantClick
  end
  object ibqry_localites_old: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'pcodepostal'
        ParamType = ptInput
      end>
    IB_Connection = ibdtbs_connexion
    KeyLinks.Strings = (
      'LOCALITES.ID_LOCALITE')
    RecordCountAccurate = True
    DataSource = ds_anc_etudiant
    SQL.Strings = (
      'select localites.ID_LOCALITE, localites.CP, localites.NOM'
      'from localites'
      'where localites.cp = :pcodepostal'
      'order by localites.cp'
      '')
    Left = 48
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
    IB_Connection = ibdtbs_connexion
    KeyLinks.Strings = (
      'LOCALITES2.ID')
    RecordCountAccurate = True
    SQL.Strings = (
      'select LOCALITES2.ID, LOCALITES2.CP, LOCALITES2.NOM'
      'from LOCALITES2'
      '/*where localites2.cp = :pcodepostal*/'
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
        DataType = ftString
        Name = 'pcodepostal'
        ParamType = ptInput
      end>
    IB_Connection = ibdtbs_connexion
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
    IB_Connection = ibdtbs_connexion
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
  object ds_localite_old: TDataSource
    DataSet = ibqry_localites_old
    Left = 48
    Top = 32
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
    Left = 608
    Top = 40
    SavedPassword = '.JuMbLe.01.4B3A132E012A154B'
  end
  object ibqry_corres: TIBOQuery
    IB_Connection = ibdtbs_connexion
    KeyLinks.Strings = (
      'LOCALITES_CORRESPONDANCE.good')
    RecordCountAccurate = True
    SQL.Strings = (
      'select good, notgood, cp, nom'
      'from localites_correspondance')
    Left = 520
    Top = 112
    object intgrfld_corresGOOD: TIntegerField
      DisplayWidth = 10
      FieldName = 'GOOD'
    end
    object intgrfld_corresNOTGOOD: TIntegerField
      DisplayWidth = 10
      FieldName = 'NOTGOOD'
    end
    object strngfld_corresCP: TStringField
      DisplayWidth = 4
      FieldName = 'CP'
      Size = 4
    end
    object strngfld_corresNOM: TStringField
      DisplayWidth = 40
      FieldName = 'NOM'
      Size = 40
    end
  end
  object ds_corres: TDataSource
    DataSet = ibqry_corres
    Left = 520
    Top = 32
  end
  object ibqry_corres_update: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM LOCALITES_CORRESPONDANCE LOCALITES_CORRESPONDANCE'
      'WHERE'
      'LOCALITES_CORRESPONDANCE.RDB$DB_KEY = :DB_KEY')
    EditSQL.Strings = (
      'UPDATE LOCALITES_CORRESPONDANCE LOCALITES_CORRESPONDANCE SET'
      '   LOCALITES_CORRESPONDANCE.GOOD = :GOOD,'
      '   LOCALITES_CORRESPONDANCE.NOTGOOD = :NOTGOOD,'
      '   LOCALITES_CORRESPONDANCE.CP = :CP,'
      '   LOCALITES_CORRESPONDANCE.NOM = :NOM'
      'WHERE'
      'LOCALITES_CORRESPONDANCE.RDB$DB_KEY = :DB_KEY')
    IB_Connection = ibdtbs_connexion
    InsertSQL.Strings = (
      'INSERT INTO LOCALITES_CORRESPONDANCE('
      '   GOOD,'
      '   NOTGOOD,'
      '   CP,'
      '   NOM)'
      'VALUES ('
      '   :GOOD,'
      '   :NOTGOOD,'
      '   :CP,'
      '   :NOM)')
    KeyLinks.Strings = (
      'LOCALITES_CORRESPONDANCE.good')
    RecordCountAccurate = True
    SQL.Strings = (
      'select good, notgood, cp, nom'
      'from localites_correspondance')
    Left = 704
    Top = 112
  end
  object ibqry_etudiant_update: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM ETUDIANTS ETUDIANTS'
      'WHERE'
      '   MAT_ETUD = :OLD_MAT_ETUD')
    EditSQL.Strings = (
      'UPDATE ETUDIANTS ETUDIANTS SET'
      '   ETUDIANTS.MAT_ETUD = :MAT_ETUD, /*PK*/'
      '   ETUDIANTS.NOM = :NOM,'
      '   ETUDIANTS.PRENOM = :PRENOM,'
      '   ETUDIANTS.NOM_SANS_CAR_SPEC = :NOM_SANS_CAR_SPEC,'
      '   ETUDIANTS.PRENOM_SANS_CAR_SPEC = :PRENOM_SANS_CAR_SPEC,'
      '   ETUDIANTS.SEXE = :SEXE,'
      '   ETUDIANTS.DATE_NAISS = :DATE_NAISS,'
      '   ETUDIANTS.ID_VILLE_NAISS = :ID_VILLE_NAISS,'
      '   ETUDIANTS.ID_PAYS_NATIONALITE = :ID_PAYS_NATIONALITE,'
      '   ETUDIANTS.ADR_RUE = :ADR_RUE,'
      '   ETUDIANTS.ADR_NO = :ADR_NO,'
      '   ETUDIANTS.ADR_BOITE = :ADR_BOITE,'
      '   ETUDIANTS.ADR_ID_LOCALITE = :ADR_ID_LOCALITE,'
      '   ETUDIANTS.GSM = :GSM,'
      '   ETUDIANTS.TEL = :TEL,'
      '   ETUDIANTS.CODE_DOC_ID = :CODE_DOC_ID,'
      '   ETUDIANTS.DATE_VAL_CI = :DATE_VAL_CI,'
      '   ETUDIANTS.NO_COMPTE = :NO_COMPTE,'
      '   ETUDIANTS.ALLOC_FAM = :ALLOC_FAM,'
      '   ETUDIANTS.NO_IBIS = :NO_IBIS,'
      '   ETUDIANTS.NO_INSC_FOREM = :NO_INSC_FOREM,'
      '   ETUDIANTS.NO_NATIONAL = :NO_NATIONAL,'
      '   ETUDIANTS.NATIONALITE_PERE = :NATIONALITE_PERE,'
      '   ETUDIANTS.NIV_ETUDES = :NIV_ETUDES,'
      '   ETUDIANTS.SIT_EMPLOI = :SIT_EMPLOI,'
      '   ETUDIANTS.EMAIL = :EMAIL,'
      '   ETUDIANTS.ID_ETUDIANT = :ID_ETUDIANT,'
      '   ETUDIANTS.ATTESTATION_STIB = :ATTESTATION_STIB,'
      '   ETUDIANTS.TYPE_CONTRAT = :TYPE_CONTRAT,'
      '   ETUDIANTS.TYPE_OCCUP = :TYPE_OCCUP,'
      '   ETUDIANTS.NOTE = :NOTE,'
      '   ETUDIANTS.DATE_CREATED = :DATE_CREATED,'
      '   ETUDIANTS.DATE_MODIFIED = :DATE_MODIFIED,'
      '   ETUDIANTS.USERNAME = :USERNAME,'
      '   ETUDIANTS.PASSWORD = :PASSWORD,'
      '   ETUDIANTS.STATUS = :STATUS,'
      '   ETUDIANTS.DATE_SEND_USERNAME = :DATE_SEND_USERNAME,'
      '   ETUDIANTS.NEWSLETTER = :NEWSLETTER,'
      '   ETUDIANTS.MODIFIED_BY = :MODIFIED_BY'
      'WHERE'
      '   MAT_ETUD = :OLD_MAT_ETUD')
    IB_Connection = ibdtbs_connexion
    InsertSQL.Strings = (
      'INSERT INTO ETUDIANTS('
      '   MAT_ETUD, /*PK*/'
      '   NOM,'
      '   PRENOM,'
      '   NOM_SANS_CAR_SPEC,'
      '   PRENOM_SANS_CAR_SPEC,'
      '   SEXE,'
      '   DATE_NAISS,'
      '   ID_VILLE_NAISS,'
      '   ID_PAYS_NATIONALITE,'
      '   ADR_RUE,'
      '   ADR_NO,'
      '   ADR_BOITE,'
      '   ADR_ID_LOCALITE,'
      '   GSM,'
      '   TEL,'
      '   CODE_DOC_ID,'
      '   DATE_VAL_CI,'
      '   NO_COMPTE,'
      '   ALLOC_FAM,'
      '   NO_IBIS,'
      '   NO_INSC_FOREM,'
      '   NO_NATIONAL,'
      '   NATIONALITE_PERE,'
      '   NIV_ETUDES,'
      '   SIT_EMPLOI,'
      '   EMAIL,'
      '   ID_ETUDIANT,'
      '   ATTESTATION_STIB,'
      '   TYPE_CONTRAT,'
      '   TYPE_OCCUP,'
      '   NOTE,'
      '   DATE_CREATED,'
      '   DATE_MODIFIED,'
      '   USERNAME,'
      '   PASSWORD,'
      '   STATUS,'
      '   DATE_SEND_USERNAME,'
      '   NEWSLETTER,'
      '   MODIFIED_BY)'
      'VALUES ('
      '   :MAT_ETUD,'
      '   :NOM,'
      '   :PRENOM,'
      '   :NOM_SANS_CAR_SPEC,'
      '   :PRENOM_SANS_CAR_SPEC,'
      '   :SEXE,'
      '   :DATE_NAISS,'
      '   :ID_VILLE_NAISS,'
      '   :ID_PAYS_NATIONALITE,'
      '   :ADR_RUE,'
      '   :ADR_NO,'
      '   :ADR_BOITE,'
      '   :ADR_ID_LOCALITE,'
      '   :GSM,'
      '   :TEL,'
      '   :CODE_DOC_ID,'
      '   :DATE_VAL_CI,'
      '   :NO_COMPTE,'
      '   :ALLOC_FAM,'
      '   :NO_IBIS,'
      '   :NO_INSC_FOREM,'
      '   :NO_NATIONAL,'
      '   :NATIONALITE_PERE,'
      '   :NIV_ETUDES,'
      '   :SIT_EMPLOI,'
      '   :EMAIL,'
      '   :ID_ETUDIANT,'
      '   :ATTESTATION_STIB,'
      '   :TYPE_CONTRAT,'
      '   :TYPE_OCCUP,'
      '   :NOTE,'
      '   :DATE_CREATED,'
      '   :DATE_MODIFIED,'
      '   :USERNAME,'
      '   :PASSWORD,'
      '   :STATUS,'
      '   :DATE_SEND_USERNAME,'
      '   :NEWSLETTER,'
      '   :MODIFIED_BY)')
    RecordCountAccurate = True
    SQL.Strings = (
      'select *'
      'from etudiants')
    Left = 816
    Top = 112
  end
end
