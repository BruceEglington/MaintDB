object ISFDefineQuery: TISFDefineQuery
  Left = 0
  Top = 0
  Width = 775
  Height = 708
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'MaintDB query'
  OnCreate = IWAppFormCreate
  OnShow = IWAppFormShow
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignSize = (
    775
    708)
  DesignLeft = 2
  DesignTop = 2
  object iwbSubmitQuery: TIWButton
    Left = 210
    Top = 98
    Width = 125
    Height = 25
    Caption = 'Submit Query'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    TabOrder = 1
    OnClick = iwbSubmitQueryClick
  end
  object iwcbEquipment: TIWCheckBox
    Left = 106
    Top = 336
    Width = 223
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Equipment'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 2
    Checked = False
    FriendlyName = 'iwcbEquipment'
  end
  object iwlEquipment: TIWListbox
    Left = 108
    Top = 358
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 3
    NonEditableAsLabel = True
    FriendlyName = 'iwlEquipment'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbTechnicians: TIWCheckBox
    Left = 106
    Top = 158
    Width = 223
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Technicians'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 4
    Checked = False
    FriendlyName = 'iwcbTechnicians'
  end
  object iwlTechnicians: TIWListbox
    Left = 108
    Top = 180
    Width = 229
    Height = 140
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 5
    NonEditableAsLabel = True
    FriendlyName = 'iwlTechnicians'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbCategories: TIWCheckBox
    Left = 106
    Top = 494
    Width = 221
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Categories'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 6
    Checked = False
    FriendlyName = 'iwcbCategories'
  end
  object iwlCategories: TIWListbox
    Left = 108
    Top = 516
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 7
    NonEditableAsLabel = True
    FriendlyName = 'iwlCategories'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbRooms: TIWCheckBox
    Left = 106
    Top = 652
    Width = 225
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Rooms'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 10
    Checked = False
    FriendlyName = 'iwcbRooms'
  end
  object iwlRooms: TIWListbox
    Left = 108
    Top = 674
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 13
    NonEditableAsLabel = True
    FriendlyName = 'iwlRooms'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object IWText1: TIWText
    Left = 439
    Top = 80
    Width = 295
    Height = 247
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      'Select parameters which define the records '
      'you require. '
      ''
      'Multiple selections may be made in most list '
      'boxes. '
      ''
      'A more restricted range in data will improve '
      'performance and provide faster response '
      'times to your queries.'
      ''
      'Note that you also need to check the '#39'Include'#39
      'box above a list if you want the items specified'
      'to be include in your query.')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 69
    Width = 83
    Height = 639
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLIGHTGOLDENRODYELLOW
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitHeight = 1056
  end
  object IWButton1: TIWButton
    Left = 464
    Top = 612
    Width = 125
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Submit Query'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    TabOrder = 0
    OnClick = iwbSubmitQueryClick
  end
  object iwcbManufacturers: TIWCheckBox
    Left = 106
    Top = 820
    Width = 237
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Manufacturers'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 11
    Checked = False
    FriendlyName = 'iwcbManufacturers'
  end
  object iwlManufacturers: TIWListbox
    Left = 108
    Top = 840
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 14
    NonEditableAsLabel = True
    FriendlyName = 'iwlManufacturers'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbCompanies: TIWCheckBox
    Left = 106
    Top = 986
    Width = 247
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Companies'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 9
    Checked = False
    FriendlyName = 'iwcbCompanies'
  end
  object iwlCompanies: TIWListbox
    Left = 108
    Top = 1004
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 12
    NonEditableAsLabel = True
    FriendlyName = 'iwlCompanies'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwlblError: TIWLabel
    Left = 446
    Top = 386
    Width = 250
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwlblError'
    Caption = 'No items selected or boxes not checked'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 775
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
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 775
    inherited IWFrameRegion: TIWRegion
      Width = 775
      TabOrder = 8
      ExplicitWidth = 775
      DesignSize = (
        775
        69)
      inherited rectRedTop: TIWRectangle
        Width = 625
        ExplicitWidth = 625
      end
      inherited IWRectangleTitle: TIWRectangle
        Width = 775
        ExplicitWidth = 513
      end
      inherited iwlSignOut: TIWLink
        Left = 678
        OnClick = TopBariwlSignOutClick
        TabOrder = 1
        ExplicitLeft = 678
      end
      inherited lnkSignIn: TIWLink
        Left = 599
        TabOrder = 0
        ExplicitLeft = 599
      end
    end
  end
end
