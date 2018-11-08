object AllocFamFrm: TAllocFamFrm
  Left = 0
  Top = 0
  Width = 756
  Height = 510
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  ParentFont = False
  TabOrder = 0
  object PgCtrl: TPageControl
    Left = 0
    Top = 0
    Width = 756
    Height = 510
    ActivePage = OnemTbSht
    Align = alClient
    TabOrder = 0
    object AFTbSht: TTabSheet
      Caption = 'Allocations familiales'
      ExplicitLeft = 8
      object grid_allocFamil: TwwDBGrid
        Left = 3
        Top = 0
        Width = 590
        Height = 153
        Selected.Strings = (
          'dateDebut'#9'18'#9'Date d'#233'but'#9'T'#9
          'dateFin'#9'18'#9'Date Fin'#9'T'#9
          'secondaire'#9'10'#9'Secondaire'#9'T'#9
          'superieur'#9'10'#9'Superieur'#9'T'#9
          'ects'#9'10'#9'Ects'#9'T'#9)
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = ds_allocFamil
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
      end
      object allocFamiltest: TwwDBGrid
        Left = 3
        Top = 288
        Width = 721
        Height = 120
        Selected.Strings = (
          'MAT_ETUD'#9'10'#9'MAT_ETUD'
          'DATE_DEB'#9'10'#9'DATE_DEB'
          'DATE_FIN'#9'10'#9'DATE_FIN'
          'DENOM_CRT'#9'20'#9'DENOM_CRT'
          'ECTS_NBR'#9'10'#9'ECTS_NBR'
          'NB_PERIODES'#9'10'#9'NB_PERIODES'
          'NB_PERIODES_STAGE'#9'10'#9'NB_PERIODES_STAGE'
          'NO_CLASSE'#9'10'#9'NO_CLASSE'
          'PERIODES_SEMAINE'#9'19'#9'PERIODES_SEMAINE'
          'SEC_SUP'#9'3'#9'SEC_SUP')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = ds_allocFamiTEST
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
      end
    end
    object OnemTbSht: TTabSheet
      Caption = 'Onem'
      ImageIndex = 2
      ExplicitLeft = 220
      ExplicitTop = 147
      object Label5: TLabel
        Left = 0
        Top = 8
        Width = 42
        Height = 16
        Caption = 'Dates'
      end
      object PerSubLbl: TLabel
        Left = 96
        Top = 8
        Width = 29
        Height = 16
        Caption = 'Per.'
      end
      object PeriodesOnemScrllBx: TScrollBox
        Left = 3
        Top = 30
        Width = 748
        Height = 125
        Align = alCustom
        TabOrder = 0
      end
    end
  end
  object btn_allocFamil2: TButton
    Left = 236
    Top = -4
    Width = 75
    Height = 25
    Caption = 'btn_allocFamil2'
    TabOrder = 1
    OnClick = btn_allocFamil2Click
  end
  object ds_allocFamil: TDataSource
    DataSet = dset_allocFamil
    Left = 136
    Top = 112
  end
  object qry_allocFamil: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'PMatEtud'
        ParamType = ptInput
      end>
    IB_Connection = ibdtbs_connexion
    RecordCountAccurate = True
    DataSource = ds_allocFamil
    SQL.Strings = (
      'select distinct classes.NO_CLASSE,'
      '       INSCRIPTIONS.MAT_ETUD,'
      '       UF.DENOM_CRT,'
      '       NIVEAUX.SEC_SUP,'
      '  org.DATE_DEB,'
      '  org.date_fin,'
      '       uf.NB_PERIODES,'
      '       uf.NB_PERIODES_STAGE,'
      ''
      ''
      
        '-- Le case permet de calculer les p'#233'riodes semaines de la classe' +
        ' en fonction des p'#233'riodes de l'#39'UE'
      '-- ou des p'#233'riodes de stage de l'#39'UE'
      '       case'
      
        '       WHEN UF.ID_TYPE_UF = 2 then cast(UF.NB_PERIODES_STAGE as ' +
        'decimal(4,2))/(ORG.NB_SEM_JJ + ORG.NB_SEM_SD)'
      
        '            else  cast(UF.NB_PERIODES as decimal(4,2))/(ORG.NB_S' +
        'EM_JJ + ORG.NB_SEM_SD)'
      '       end as PERIODES_SEMAINE,'
      '       case'
      '       WHEN niveaux.SEC_SUP = '#39'SEC'#39' then 0'
      '            else CONTENUS_SECTIONS.ECTS_NBR'
      '       end as ECTS_NBR'
      ''
      'from'
      '  INSCRIPTIONS'
      
        '  inner join CLASSES on (INSCRIPTIONS.NO_CLASSE = CLASSES.NO_CLA' +
        'SSE)'
      '  inner join UF on (CLASSES.ID_UF = UF.ID_UF)'
      '  inner join NIVEAUX on (NIVEAUX.NIVEAU = UF.NIVEAU)'
      '  inner join ORG on (CLASSES.ID_ORG = Org.ID_ORG)'
      
        '  inner join HORAIRES on (HORAIRES.NO_CLASSE = CLASSES.NO_CLASSE' +
        ')'
      
        '  inner join CONTENUS_SECTIONS on (CONTENUS_SECTIONS.ID_SECTION ' +
        '= CLASSES.ID_SECTION AND CONTENUS_SECTIONS.ID_UF = CLASSES.ID_UF' +
        ')'
      ''
      'where'
      '  INSCRIPTIONS.MAT_ETUD = :PMatEtud  '
      '/*  INSCRIPTIONS.MAT_ETUD = '#39'2014003483'#39'*/ '
      'and'
      '  INSCRIPTIONS.CODE_MOTIF_TRANSF is null'
      'order by'
      '       HORAIRES.DATE_DEB,'
      '       HORAIRES.DATE_FIN')
    Left = 216
    Top = 112
    object strngfld_allocFamilMAT_ETUD: TStringField
      DisplayWidth = 10
      FieldName = 'MAT_ETUD'
      Required = True
      Size = 10
    end
    object qry_allocFamilDATE_DEB: TDateField
      DisplayWidth = 10
      FieldName = 'DATE_DEB'
      Required = True
    end
    object qry_allocFamilDATE_FIN: TDateField
      DisplayWidth = 10
      FieldName = 'DATE_FIN'
      Required = True
    end
    object qry_allocFamilDENOM_CRT: TStringField
      DisplayWidth = 20
      FieldName = 'DENOM_CRT'
    end
    object qry_allocFamilECTS_NBR: TIntegerField
      DisplayWidth = 10
      FieldName = 'ECTS_NBR'
      ReadOnly = True
    end
    object qry_allocFamilNB_PERIODES: TSmallintField
      DisplayWidth = 10
      FieldName = 'NB_PERIODES'
    end
    object qry_allocFamilNB_PERIODES_STAGE: TSmallintField
      DisplayWidth = 10
      FieldName = 'NB_PERIODES_STAGE'
    end
    object qry_allocFamilNO_CLASSE: TIntegerField
      DisplayWidth = 10
      FieldName = 'NO_CLASSE'
      Required = True
    end
    object qry_allocFamilPERIODES_SEMAINE: TIBOBCDField
      DisplayWidth = 19
      FieldName = 'PERIODES_SEMAINE'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qry_allocFamilSEC_SUP: TStringField
      DisplayWidth = 3
      FieldName = 'SEC_SUP'
      Required = True
      Size = 3
    end
  end
  object dset_allocFamil: TwwClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 48
    Top = 112
    Data = {
      6E0000009619E0BD0100000018000000050000000000030000006E0009646174
      6544656275740800080000000000076461746546696E08000800000000000A73
      65636F6E64616972650800040000000000097375706572696575720800040000
      000000046563747308000400000000000000}
    object dateDebut: TDateTimeField
      DisplayLabel = 'Date d'#233'but'
      DisplayWidth = 18
      FieldName = 'dateDebut'
    end
    object dateFin: TDateTimeField
      DisplayLabel = 'Date Fin'
      DisplayWidth = 18
      FieldName = 'dateFin'
    end
    object secondaire: TFloatField
      DisplayLabel = 'Secondaire'
      DisplayWidth = 10
      FieldName = 'secondaire'
    end
    object superieur: TFloatField
      DisplayLabel = 'Superieur'
      DisplayWidth = 10
      FieldName = 'superieur'
    end
    object ects: TFloatField
      DisplayLabel = 'Ects'
      DisplayWidth = 10
      FieldName = 'ects'
    end
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
  object ds_allocFamiTEST: TDataSource
    DataSet = qry_allocFamil
    Left = 408
    Top = 256
  end
end
