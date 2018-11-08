object IWFrame1: TIWFrame1
  Left = 0
  Top = 0
  Width = 730
  Height = 452
  TabOrder = 0
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 730
    Height = 452
    Cursor = crAuto
    RenderInvisibleControls = False
    TabOrder = 0
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    OnCreate = IWFrameRegionCreate
    Splitter = False
    ExplicitWidth = 343
    ExplicitHeight = 169
    object wwDBGrid_allocFamil1: TwwDBGrid
      Left = 144
      Top = 152
      Width = 320
      Height = 120
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = ds1
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
  end
  object client_dset_1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 56
    Top = 56
    object strngfldtest: TStringField
      FieldName = 'test'
    end
  end
  object ds1: TDataSource
    DataSet = ibqry1
    Left = 176
    Top = 56
  end
  object ibqry1: TIBOQuery
    Active = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select first 5 *'
      'from etudiants')
    Left = 336
    Top = 56
    object intgrfldibqry1ID_ETUDIANT: TIntegerField
      FieldName = 'ID_ETUDIANT'
      Required = True
    end
    object strngfldibqry1USERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 30
    end
  end
end
