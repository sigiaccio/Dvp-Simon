object popupmodal: Tpopupmodal
  Left = 0
  Top = 0
  Caption = 'popupmodal'
  ClientHeight = 429
  ClientWidth = 1402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 1
    OnClick = btn2Click
  end
  object txt_return: TStaticText
    Left = 8
    Top = 70
    Width = 54
    Height = 17
    Caption = 'txt_return'
    TabOrder = 2
  end
  object wdbgrd_horaire: TwwDBGrid
    Left = 32
    Top = 128
    Width = 1337
    Height = 161
    Selected.Strings = (
      'ID_HORAIRE'#9'3'#9'ID horaire'
      'NO_CLASSE'#9'5'#9'Num'#233'ro classe'
      '"Cours denom"'#9'150'#9'"Cours denom"'
      '"Sections denom"'#9'25'#9'"Sections denom"'
      'DATE_DEB'#9'10'#9'DATE_DEB'
      'DATE_FIN'#9'10'#9'DATE_FIN'
      'DENOM'#9'25'#9'DENOM'
      'DENOM_FREQ_SEM'#9'2'#9'DENOM_FREQ_SEM'
      'HEURE_DEB'#9'10'#9'HEURE_DEB'
      'HEURE_FIN'#9'10'#9'HEURE_FIN'
      'ID_JOUR'#9'10'#9'ID_JOUR'
      'ID_ORG'#9'3'#9'ID_ORG'
      'NOM'#9'10'#9'NOM'
      'NOM_1'#9'10'#9'NOM_1'
      'NUMER_FREQ_SEM'#9'5'#9'NUMER_FREQ_SEM'
      'PRENOM'#9'5'#9'PRENOM'
      'PRENOM_1'#9'5'#9'PRENOM_1'
      'USERNAME'#9'30'#9'USERNAME')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_horaire
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnDblClick = wdbgrd_horaireDblClick
  end
  object dbnvgr_personne: TDBNavigator
    Left = 32
    Top = 97
    Width = 240
    Height = 25
    DataSource = ds_horaire
    Kind = dbnHorizontal
    TabOrder = 4
  end
  object wdbgrd_cours: TwwDBGrid
    Left = 159
    Top = 319
    Width = 346
    Height = 45
    Selected.Strings = (
      'COUNT'#9'10'#9'Nombre d'#39#233'tudiants par cours'#9'F'#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_count_horaire
    TabOrder = 5
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object ibqry_horaire: TIBOQuery
    Active = True
    IB_Connection = FHelloWorld.ibdtbs_connexion
    KeyLinks.Strings = (
      'HORAIRES.ID_HORAIRE')
    RecordCountAccurate = True
    SQL.Strings = (
      'select id_horaire, classes.no_classe,'
      'personne.nom, personne.prenom, personne.USERNAME,'
      'cours.denom "Cours denom",'
      'sections.denom "Sections denom",'
      'resp_peda.nom, resp_peda.prenom,'
      'org.id_org,'
      'uf.denom,'
      
        'horaires.date_deb, horaires.date_fin, horaires.heure_deb, horair' +
        'es.heure_fin,'
      'HORAIRES.NUMER_FREQ_SEM, HORAIRES.DENOM_FREQ_SEM,'
      'HORAIRES.ID_JOUR'
      ''
      'FROM horaires'
      'INNER JOIN classes on classes.no_classe = horaires.no_classe'
      'INNER JOIN personne on personne.id_pers = horaires.id_pers'
      'INNER JOIN cours on cours.id_cours = horaires.id_cours'
      'INNER JOIN sections on sections.id_section = classes.id_section'
      
        'INNER JOIN resp_peda on resp_peda.id_resp_peda = sections.id_res' +
        'p_peda'
      'INNER JOIN ORG on ORG.id_org = classes.id_org'
      'INNER JOIN UF on UF.id_uf = classes.id_uf'
      'order by horaires.ID_HORAIRE ASC'
      '')
    Left = 152
    Top = 40
    object intgrfld_horaireID_HORAIRE: TIntegerField
      DisplayLabel = 'ID horaire'
      DisplayWidth = 3
      FieldName = 'ID_HORAIRE'
      Required = True
    end
    object intgrfld_horaireNO_CLASSE: TIntegerField
      DisplayLabel = 'Num'#233'ro classe'
      DisplayWidth = 5
      FieldName = 'NO_CLASSE'
      Required = True
    end
    object strngfld_horaireCoursdenom: TStringField
      DisplayWidth = 150
      FieldName = '"Cours denom"'
      Required = True
      Size = 150
    end
    object strngfld_horaireSectionsdenom: TStringField
      DisplayWidth = 25
      FieldName = '"Sections denom"'
      Size = 200
    end
    object dtfld_horaireDATE_DEB: TDateField
      DisplayWidth = 10
      FieldName = 'DATE_DEB'
      Required = True
    end
    object dtfld_horaireDATE_FIN: TDateField
      DisplayWidth = 10
      FieldName = 'DATE_FIN'
      Required = True
    end
    object strngfld_horaireDENOM: TStringField
      DisplayWidth = 25
      FieldName = 'DENOM'
      Size = 200
    end
    object smlntfld_horaireDENOM_FREQ_SEM: TSmallintField
      DisplayWidth = 2
      FieldName = 'DENOM_FREQ_SEM'
      Required = True
    end
    object tmfld_horaireHEURE_DEB: TTimeField
      DisplayWidth = 10
      FieldName = 'HEURE_DEB'
      Required = True
    end
    object tmfld_horaireHEURE_FIN: TTimeField
      DisplayWidth = 10
      FieldName = 'HEURE_FIN'
      Required = True
    end
    object smlntfld_horaireID_JOUR: TSmallintField
      DisplayWidth = 10
      FieldName = 'ID_JOUR'
      Required = True
    end
    object strngfld_horaireID_ORG: TStringField
      DisplayWidth = 3
      FieldName = 'ID_ORG'
      Required = True
      Size = 3
    end
    object strngfld_horaireNOM: TStringField
      DisplayWidth = 10
      FieldName = 'NOM'
      Size = 50
    end
    object strngfld_horaireNOM_1: TStringField
      DisplayWidth = 10
      FieldName = 'NOM_1'
      Size = 25
    end
    object smlntfld_horaireNUMER_FREQ_SEM: TSmallintField
      DisplayWidth = 5
      FieldName = 'NUMER_FREQ_SEM'
      Required = True
    end
    object strngfld_horairePRENOM: TStringField
      DisplayWidth = 5
      FieldName = 'PRENOM'
      Size = 50
    end
    object strngfld_horairePRENOM_1: TStringField
      DisplayWidth = 5
      FieldName = 'PRENOM_1'
      Size = 25
    end
    object strngfld_horaireUSERNAME: TStringField
      DisplayWidth = 30
      FieldName = 'USERNAME'
      Size = 30
    end
  end
  object ds_horaire: TDataSource
    DataSet = ibqry_horaire
    Left = 240
    Top = 40
  end
  object IBOQuery1: TIBOQuery
    IB_Connection = FHelloWorld.ibdtbs_connexion
    KeyLinks.Strings = (
      'HORAIRES.ID_HORAIRE')
    RecordCountAccurate = True
    SQL.Strings = (
      'select distinct id_horaire, classes.no_classe,'
      'personne.nom, personne.prenom, personne.USERNAME,'
      'cours.denom "Cours denom",'
      'sections.denom "Sections denom",'
      'resp_peda.nom, resp_peda.prenom,'
      'org.id_org,'
      'uf.denom,'
      
        'horaires.date_deb, horaires.date_fin, horaires.heure_deb, horair' +
        'es.heure_fin,'
      'HORAIRES.NUMER_FREQ_SEM, HORAIRES.DENOM_FREQ_SEM,'
      'HORAIRES.ID_JOUR'
      ''
      'FROM horaires'
      'INNER JOIN classes on classes.no_classe = horaires.no_classe'
      'INNER JOIN personne on personne.id_pers = horaires.id_pers'
      'INNER JOIN cours on cours.id_cours = horaires.id_cours'
      'INNER JOIN sections on sections.id_section = classes.id_section'
      
        'INNER JOIN resp_peda on resp_peda.id_resp_peda = sections.id_res' +
        'p_peda'
      'INNER JOIN ORG on ORG.id_org = classes.id_org'
      'INNER JOIN UF on UF.id_uf = classes.id_uf'
      'order by horaires.ID_HORAIRE ASC'
      '')
    Left = 152
    Top = 40
    object IntegerField1: TIntegerField
      DisplayLabel = 'ID horaire'
      DisplayWidth = 3
      FieldName = 'ID_HORAIRE'
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Num'#233'ro classe'
      DisplayWidth = 5
      FieldName = 'NO_CLASSE'
      Required = True
    end
    object StringField1: TStringField
      DisplayWidth = 25
      FieldName = '"Cours denom"'
      Required = True
      Size = 150
    end
    object StringField2: TStringField
      DisplayWidth = 25
      FieldName = '"Sections denom"'
      Size = 200
    end
    object DateField1: TDateField
      DisplayWidth = 10
      FieldName = 'DATE_DEB'
      Required = True
    end
    object DateField2: TDateField
      DisplayWidth = 10
      FieldName = 'DATE_FIN'
      Required = True
    end
    object StringField3: TStringField
      DisplayWidth = 25
      FieldName = 'DENOM'
      Size = 200
    end
    object SmallintField1: TSmallintField
      DisplayWidth = 2
      FieldName = 'DENOM_FREQ_SEM'
      Required = True
    end
    object TimeField1: TTimeField
      DisplayWidth = 10
      FieldName = 'HEURE_DEB'
      Required = True
    end
    object TimeField2: TTimeField
      DisplayWidth = 10
      FieldName = 'HEURE_FIN'
      Required = True
    end
    object SmallintField2: TSmallintField
      DisplayWidth = 10
      FieldName = 'ID_JOUR'
      Required = True
    end
    object StringField4: TStringField
      DisplayWidth = 3
      FieldName = 'ID_ORG'
      Required = True
      Size = 3
    end
    object StringField5: TStringField
      DisplayWidth = 10
      FieldName = 'NOM'
      Size = 50
    end
    object StringField6: TStringField
      DisplayWidth = 10
      FieldName = 'NOM_1'
      Size = 25
    end
    object SmallintField3: TSmallintField
      DisplayWidth = 5
      FieldName = 'NUMER_FREQ_SEM'
      Required = True
    end
    object StringField7: TStringField
      DisplayWidth = 5
      FieldName = 'PRENOM'
      Size = 50
    end
    object StringField8: TStringField
      DisplayWidth = 5
      FieldName = 'PRENOM_1'
      Size = 25
    end
    object StringField9: TStringField
      DisplayWidth = 30
      FieldName = 'USERNAME'
      Size = 30
    end
  end
  object ibqry_count_cours: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Pno_classe'
        ParamType = ptInput
      end>
    IB_Connection = FHelloWorld.ibdtbs_connexion
    RecordCountAccurate = True
    SQL.Strings = (
      'select count( DISTINCT etudiants.mat_etud)'
      'from inscriptions'
      
        'INNER JOIN etudiants on etudiants.MAT_ETUD = INSCRIPTIONS.MAT_ET' +
        'UD'
      'INNER JOIN classes on INSCRIPTIONS.NO_CLASSE = classes.NO_CLASSE'
      'INNER JOIN horaires on classes.NO_CLASSE = horaires.NO_CLASSE'
      'INNER JOIN cours on horaires.ID_COURS = cours.ID_COURS'
      'where classes.no_classe = :Pno_classe'
      ''
      '')
    Left = 400
    Top = 40
    object intgrfld_count_coursCOUNT: TIntegerField
      DisplayLabel = 'Nombre d'#39#233'tudiants par cours'
      DisplayWidth = 10
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object ds_count_horaire: TDataSource
    DataSet = ibqry_count_cours
    Left = 496
    Top = 48
  end
end
