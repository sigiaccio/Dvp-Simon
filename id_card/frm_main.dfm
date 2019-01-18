object frmMain: TfrmMain
  Left = 365
  Top = 240
  BorderStyle = bsDialog
  Caption = 'EID Demo'
  ClientHeight = 671
  ClientWidth = 958
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_comment: TLabel
    Left = 728
    Top = 271
    Width = 176
    Height = 26
    Caption = 
      'La puce doit '#234'tre activ'#233'e sur la carte.'#13#10'Sinon le logiciel bloqu' +
      'e'
  end
  object GroupBox1: TGroupBox
    Left = 13
    Top = 8
    Width = 665
    Height = 193
    Caption = 'Personal Information'
    TabOrder = 0
    object imgPerson: TImage
      Left = 540
      Top = 20
      Width = 112
      Height = 160
      Center = True
      Stretch = True
    end
    object edtlastName: TLabeledEdit
      Left = 120
      Top = 28
      Width = 225
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Name'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
    end
    object edtFirstName: TEdit
      Left = 356
      Top = 28
      Width = 137
      Height = 21
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
    end
    object edtBirthDate: TLabeledEdit
      Left = 120
      Top = 60
      Width = 121
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Birth Date'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
    end
    object edtBirthPlace: TLabeledEdit
      Left = 120
      Top = 92
      Width = 373
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Birth Place'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 3
    end
    object edtNationalNumber: TLabeledEdit
      Left = 120
      Top = 124
      Width = 121
      Height = 21
      EditLabel.Width = 79
      EditLabel.Height = 13
      EditLabel.Caption = 'National Number'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 4
    end
    object edtSex: TLabeledEdit
      Left = 120
      Top = 156
      Width = 25
      Height = 21
      EditLabel.Width = 18
      EditLabel.Height = 13
      EditLabel.Caption = 'Sex'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 5
    end
    object edtNationality: TLabeledEdit
      Left = 328
      Top = 124
      Width = 165
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Nationality'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ReadOnly = True
      TabOrder = 6
    end
    object edtMunicipality: TLabeledEdit
      Left = 272
      Top = 156
      Width = 221
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Municipality'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ReadOnly = True
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 13
    Top = 212
    Width = 665
    Height = 89
    Caption = 'Adress'
    TabOrder = 1
    object edtStreet: TLabeledEdit
      Left = 120
      Top = 20
      Width = 305
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Street'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
    end
    object edtZip: TLabeledEdit
      Left = 120
      Top = 56
      Width = 57
      Height = 21
      EditLabel.Width = 17
      EditLabel.Height = 13
      EditLabel.Caption = 'City'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
    end
    object edtCity: TEdit
      Left = 188
      Top = 56
      Width = 309
      Height = 21
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 3
    end
    object edtHouseNumber: TEdit
      Left = 436
      Top = 20
      Width = 57
      Height = 21
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 13
    Top = 308
    Width = 665
    Height = 149
    Caption = 'Card Information'
    TabOrder = 2
    object edtCardNumber: TLabeledEdit
      Left = 120
      Top = 24
      Width = 165
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'Card Number'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
    end
    object edtFrom: TLabeledEdit
      Left = 120
      Top = 60
      Width = 121
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Valid From'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
    end
    object edtUntil: TLabeledEdit
      Left = 368
      Top = 60
      Width = 121
      Height = 21
      EditLabel.Width = 21
      EditLabel.Height = 13
      EditLabel.Caption = 'Until'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
    end
    object edtType: TLabeledEdit
      Left = 368
      Top = 24
      Width = 281
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Type'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ReadOnly = True
      TabOrder = 3
    end
    object edtChipNumber: TLabeledEdit
      Left = 120
      Top = 104
      Width = 165
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Chip Number'
      LabelPosition = lpLeft
      LabelSpacing = 30
      ReadOnly = True
      TabOrder = 4
    end
  end
  object btnReadCard: TButton
    Left = 516
    Top = 609
    Width = 75
    Height = 25
    Caption = 'Read Card'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnClick = btnReadCardClick
  end
  object btnClose: TButton
    Left = 600
    Top = 609
    Width = 75
    Height = 25
    Caption = 'Close'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object Events: TListBox
    Left = 8
    Top = 463
    Width = 662
    Height = 140
    ItemHeight = 13
    TabOrder = 5
  end
  object btnSaveLog: TButton
    Left = 13
    Top = 613
    Width = 75
    Height = 25
    Caption = 'Save Log'
    TabOrder = 6
    OnClick = btnSaveLogClick
  end
  object dlgSave: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text File (*.txt)|*.txt|Any File (*.*)|*.*'
    Left = 56
    Top = 552
  end
  object ibdtbs_main: TIBODatabase
    CacheStatementHandles = False
    SQLDialect = 3
    Params.Strings = (
      'SERVER=isis'
      'PROTOCOL=TCP/IP'
      'PATH=c:\epfc1819.fdb'
      'USER NAME=SYSDBA')
    Isolation = tiCommitted
    TimeoutProps.AllowCheckOAT = 0
    Left = 792
    Top = 32
    SavedPassword = '.JuMbLe.01.4B3A132E012A154B'
  end
  object ibqry_personne: TIBOQuery
    IB_Connection = ibdtbs_main
    InsertSQL.Strings = (
      'INSERT INTO PERSONNE_ID('
      '   LASTNAME,'
      '   FIRSTNAME,'
      '   BIRTHDATE,'
      '   BIRTHPLACE,'
      '   NATIONALNUMBER,'
      '   SEX,'
      '   NATIONALITY,'
      '   MUNICIPALITY,'
      '   CARDNUMBER,'
      '   CHIPNUMBER,'
      '   HOUSENUMBER,'
      '   STREET,'
      '   ZIP,'
      '   CITY,'
      '   READPHOTO)'
      'VALUES ('
      '   :LASTNAME,'
      '   :FIRSTNAME,'
      '   :BIRTHDATE,'
      '   :BIRTHPLACE,'
      '   :NATIONALNUMBER,'
      '   :SEX,'
      '   :NATIONALITY,'
      '   :MUNICIPALITY,'
      '   :CARDNUMBER,'
      '   :CHIPNUMBER,'
      '   :HOUSENUMBER,'
      '   :STREET,'
      '   :ZIP,'
      '   :CITY,'
      '   :READPHOTO)')
    KeyLinks.Strings = (
      'PERSONNE_ID.ID')
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT'
      '      ID'
      '     , LASTNAME'
      '     , FIRSTNAME'
      '     , BIRTHDATE'
      '     , BIRTHPLACE'
      '     , NATIONALNUMBER'
      '     , SEX'
      '     , NATIONALITY'
      '     , MUNICIPALITY'
      '     , CARDNUMBER'
      '     , CHIPNUMBER'
      '     , HOUSENUMBER'
      '     , STREET'
      '     , ZIP'
      '     , CITY'
      '     , READPHOTO'
      'FROM '
      'PERSONNE_ID;')
    Left = 792
    Top = 104
    object strngfld_personneLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 255
    end
    object strngfld_personneFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 255
    end
    object strngfld_personneBIRTHDATE: TStringField
      FieldName = 'BIRTHDATE'
      Size = 255
    end
    object strngfld_personneBIRTHPLACE: TStringField
      FieldName = 'BIRTHPLACE'
      Size = 255
    end
    object strngfld_personneNATIONALNUMBER: TStringField
      FieldName = 'NATIONALNUMBER'
      Size = 255
    end
    object strngfld_personneSEX: TStringField
      FieldName = 'SEX'
      Size = 255
    end
    object strngfld_personneNATIONALITY: TStringField
      FieldName = 'NATIONALITY'
      Size = 255
    end
    object strngfld_personneMUNICIPALITY: TStringField
      FieldName = 'MUNICIPALITY'
      Size = 255
    end
    object strngfld_personneCARDNUMBER: TStringField
      FieldName = 'CARDNUMBER'
      Size = 255
    end
    object strngfld_personneCHIPNUMBER: TStringField
      FieldName = 'CHIPNUMBER'
      Size = 255
    end
    object strngfld_personneHOUSENUMBER: TStringField
      FieldName = 'HOUSENUMBER'
      Size = 255
    end
    object strngfld_personneSTREET: TStringField
      FieldName = 'STREET'
      Size = 255
    end
    object strngfld_personneZIP: TStringField
      FieldName = 'ZIP'
      Size = 255
    end
    object strngfld_personneCITY: TStringField
      FieldName = 'CITY'
      Size = 255
    end
    object smlntfld_personneREADPHOTO: TSmallintField
      FieldName = 'READPHOTO'
    end
  end
end
