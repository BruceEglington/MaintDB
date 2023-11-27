object ISFEquipDetails: TISFEquipDetails
  Left = 0
  Top = 0
  Width = 763
  Height = 518
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'MaintDB'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwDBeContact: TIWDBEdit
    Left = 204
    Top = 252
    Width = 545
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeContact'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = True
    DataField = 'CONTACT'
    PasswordPrompt = False
    DataSource = dmR.dsEquipment
  end
  object iwDBlcbManufacturer: TIWDBLookupComboBox
    Left = 204
    Top = 224
    Width = 325
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = False
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = True
    DataField = 'MANUFACTURERID'
    DataSource = dmR.dsEquipment
    FriendlyName = 'iwDBlcbManufacturer'
    KeyField = 'MANUFACTURERID'
    ListField = 'MANUFACTURER'
    ListSource = dmR.dsManufacturers
    DisableWhenEmpty = True
  end
  object iwDBmComments: TIWDBMemo
    Left = 94
    Top = 418
    Width = 655
    Height = 89
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    BGColor = clWebWHITE
    Editable = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 7
    SubmitOnAsyncEvent = True
    AutoEditable = True
    DataField = 'COMMENTS'
    DataSource = dmR.dsEquipment
    FriendlyName = 'iwDBmComments'
  end
  object IWLabel1: TIWLabel
    Left = 94
    Top = 200
    Width = 37
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Room'
    RawText = False
  end
  object IWLabel2: TIWLabel
    Left = 94
    Top = 230
    Width = 78
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Manufacturer'
    RawText = False
  end
  object IWLabel3: TIWLabel
    Left = 94
    Top = 396
    Width = 68
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'Comments'
    RawText = False
  end
  object iwbCancelChanges: TIWButton
    Left = 487
    Top = 82
    Width = 109
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Cancel changes'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelChanges'
    ScriptEvents = <>
    TabOrder = 8
    OnClick = iwbCancelChangesClick
  end
  object iwbApplyUpdates: TIWButton
    Left = 357
    Top = 82
    Width = 109
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Save changes'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbApplyUpdates'
    ScriptEvents = <>
    TabOrder = 9
    OnClick = iwbApplyUpdatesClick
  end
  object iwbReturn: TIWButton
    Left = 96
    Top = 82
    Width = 109
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Return to list'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    ScriptEvents = <>
    TabOrder = 10
    OnClick = iwbReturnClick
  end
  object iwbDelete: TIWButton
    Left = 618
    Top = 82
    Width = 109
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Delete'
    Confirmation = 'Are you sure you want to delete this reference?'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDelete'
    ScriptEvents = <>
    TabOrder = 11
    OnClick = iwbDeleteClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 69
    Width = 83
    Height = 449
    Cursor = crAuto
    Align = alLeft
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1
    RenderSize = True
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Color = clNone
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwDBeEquipmentID: TIWDBEdit
    Left = 204
    Top = 128
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeEquipmentID'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 13
    AutoEditable = True
    DataField = 'ID'
    PasswordPrompt = False
    DataSource = dmR.dsEquipment
  end
  object IWLabel4: TIWLabel
    Left = 94
    Top = 132
    Width = 13
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'ID'
    RawText = False
  end
  object IWLabel5: TIWLabel
    Left = 94
    Top = 162
    Width = 104
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Equipment name'
    RawText = False
  end
  object iwDBeEquipment: TIWDBEdit
    Left = 204
    Top = 158
    Width = 545
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeEquipment'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 12
    AutoEditable = True
    DataField = 'EQUIPMENT'
    PasswordPrompt = False
    DataSource = dmR.dsEquipment
  end
  object iwDBlcbRoom: TIWDBLookupComboBox
    Left = 204
    Top = 196
    Width = 325
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = False
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = True
    DataField = 'ROOMID'
    DataSource = dmR.dsEquipment
    FriendlyName = 'iwDBlcbRoom'
    KeyField = 'ID'
    ListField = 'ROOM'
    ListSource = dmR.dsRooms
    DisableWhenEmpty = True
  end
  object IWLabel6: TIWLabel
    Left = 94
    Top = 256
    Width = 46
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Contact'
    RawText = False
  end
  object IWLabel7: TIWLabel
    Left = 94
    Top = 284
    Width = 64
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Telephone'
    RawText = False
  end
  object iwDBePhone: TIWDBEdit
    Left = 204
    Top = 280
    Width = 169
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBePhone'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = True
    DataField = 'PHONE'
    PasswordPrompt = False
    DataSource = dmR.dsEquipment
  end
  object IWLabel8: TIWLabel
    Left = 94
    Top = 310
    Width = 42
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Telefax'
    RawText = False
  end
  object iwDBeFax: TIWDBEdit
    Left = 204
    Top = 306
    Width = 169
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeFax'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 0
    AutoEditable = True
    DataField = 'FAX'
    PasswordPrompt = False
    DataSource = dmR.dsEquipment
  end
  object IWLabel9: TIWLabel
    Left = 94
    Top = 336
    Width = 66
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Cell phone'
    RawText = False
  end
  object iwDBeCell: TIWDBEdit
    Left = 204
    Top = 332
    Width = 169
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeCell'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = True
    DataField = 'CELL'
    PasswordPrompt = False
    DataSource = dmR.dsEquipment
  end
  object IWLabel10: TIWLabel
    Left = 94
    Top = 362
    Width = 39
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'E-mail'
    RawText = False
  end
  object iwDBeEmail: TIWDBEdit
    Left = 204
    Top = 358
    Width = 169
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeEmail'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = True
    DataField = 'EMAIL'
    PasswordPrompt = False
    DataSource = dmR.dsEquipment
  end
  object iwbEdit: TIWButton
    Left = 226
    Top = 82
    Width = 109
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Edit'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    ScriptEvents = <>
    TabOrder = 15
    OnClick = iwbEditClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 763
    Height = 69
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 69
    Constraints.MinHeight = 69
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 763
    inherited IWFrameRegion: TIWRegion
      Width = 763
      TabOrder = 14
      ExplicitWidth = 763
      inherited rectRedTop: TIWRectangle
        Width = 631
        ExplicitWidth = 631
      end
      inherited IWRectangleTitle: TIWRectangle
        Width = 763
        Text = '    DateView International Geochronology Database'
        ExplicitWidth = 513
      end
      inherited iwlSignOut: TIWLink
        TabOrder = 1
      end
      inherited lnkSignIn: TIWLink
        Left = 420
        TabOrder = 0
        ExplicitLeft = 420
      end
    end
  end
end
