object ISFMain: TISFMain
  Left = 0
  Top = 0
  Width = 855
  Height = 521
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'MaintDB'
  OnCreate = IWAppFormCreate
  Background.Filename = 
    'W:\source\IntraWeb6.0\Demos\Win32\Delphi\DieFlyDie\Files\grid_ba' +
    'ckground.gif'
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  StyleSheet.Filename = 'styles.css'
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 855
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
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 855
    inherited IWFrameRegion: TIWRegion
      Width = 855
      TabOrder = 1
      ExplicitWidth = 855
      DesignSize = (
        855
        69)
      inherited rectBlackTop: TIWRectangle
        Font.Color = clWebBLACK
      end
      inherited rectRedTop: TIWRectangle
        Width = 722
        Font.Color = clWebBLACK
        ExplicitWidth = 722
      end
      inherited IWRectangleTitle: TIWRectangle
        Width = 855
        Font.Color = clWebDIMGRAY
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 552
      end
      inherited lblWelcome: TIWLabel
        Left = 152
        Width = 3
        Height = 15
        Font.Size = 9
        Font.PxSize = 12
        Font.Color = clWebDARKSLATEGRAY
        ExplicitLeft = 152
        ExplicitWidth = 3
        ExplicitHeight = 15
      end
      inherited iwlSignOut: TIWLink
        Font.Size = 9
        Font.Style = [fsUnderline]
        Font.PxSize = 12
        Font.Color = clWebBLUE
      end
      inherited lnkSignIn: TIWLink
        Left = 540
        Font.Size = 9
        Font.Style = [fsUnderline]
        Font.PxSize = 12
        Font.Color = clWebBLUE
        OnClick = TopBarlnkSignInClick
        ExplicitLeft = 540
      end
    end
  end
  object IWRegion1: TIWRegion
    Left = 142
    Top = 69
    Width = 713
    Height = 452
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.Style = cbsNone
    ZIndex = -1
    object IWDBMemo1: TIWDBMemo
      AlignWithMargins = False
      Left = 6
      Top = 59
      Width = 679
      Height = 318
      StyleRenderOptions.RenderBorder = False
      BGColor = clWebWHITE
      Editable = False
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.PxSize = 12
      InvisibleBorder = True
      HorizScrollBar = False
      VertScrollBar = True
      Required = False
      SubmitOnAsyncEvent = True
      AutoEditable = False
      DataField = 'PROGRESSDETAILS'
      DataSource = dmUser.dsProgress
      FriendlyName = 'IWDBMemo1'
    end
    object IWRegion2: TIWRegion
      Left = 0
      Top = 0
      Width = 713
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ZIndex = -1
      object lblWelcome: TIWLabel
        AlignWithMargins = False
        Left = 12
        Top = 26
        Width = 210
        Height = 22
        ZIndex = 1
        Font.FontName = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Font.PxSize = 18
        Font.Color = clWebDARKSLATEGRAY
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'lblWelcome'
        Caption = 'Welcome to MaintDB'
      end
    end
    object IWRegion3: TIWRegion
      Left = 0
      Top = 347
      Width = 713
      Height = 105
      RenderInvisibleControls = False
      Align = alBottom
      BorderOptions.Style = cbsNone
      ZIndex = -1
      object IWLabel3: TIWLabel
        AlignWithMargins = False
        Left = 8
        Top = 36
        Width = 141
        Height = 14
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'bruce.eglington@usask.ca'
      end
      object IWDBLabel1: TIWDBLabel
        AlignWithMargins = False
        Left = 8
        Top = 20
        Width = 108
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        NoWrap = True
        HasTabOrder = False
        DataField = 'PROGRESSDATE'
        DataSource = dmUser.dsProgress
        FriendlyName = 'IWDBLabel1'
      end
      object IWLabel1: TIWLabel
        AlignWithMargins = False
        Left = 8
        Top = 4
        Width = 113
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Dr Bruce Eglington'
      end
      object iwlNumUses: TIWLabel
        AlignWithMargins = False
        Left = 542
        Top = 51
        Width = 141
        Height = 14
        Alignment = taRightJustify
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNumUses'
        Caption = 'This program has been used '
      end
      object iwbPermissions: TIWButton
        AlignWithMargins = False
        Left = 376
        Top = 36
        Width = 120
        Height = 30
        Caption = 'iwbPermissions'
        Color = clBtnFace
        FriendlyName = 'iwbPermissions'
        TabOrder = 3
        OnClick = iwbPermissionsClick
      end
      object iwbCheckIniFile: TIWButton
        AlignWithMargins = False
        Left = 376
        Top = 72
        Width = 120
        Height = 30
        Caption = 'iwbCheckIniFile'
        Color = clBtnFace
        FriendlyName = 'iwbCheckIniFile'
        TabOrder = 4
        OnClick = iwbCheckIniFileClick
      end
    end
  end
  inline LeftTree: TISFProductTree
    Left = 0
    Top = 69
    Width = 142
    Height = 452
    Align = alLeft
    Constraints.MaxWidth = 142
    Constraints.MinWidth = 142
    Color = clNone
    ParentColor = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    ExplicitTop = 69
    ExplicitHeight = 452
    inherited IWFrameRegion: TIWRegion
      Height = 452
      TabOrder = 2
      ExplicitHeight = 452
      inherited rectRight: TIWRectangle
        Left = 134
        Top = 0
        Height = 452
        Font.Color = clWebBLACK
        ExplicitLeft = 134
        ExplicitTop = 0
        ExplicitHeight = 450
      end
      inherited iwregPageLinks: TIWRegion
        Height = 318
        ExplicitHeight = 318
        inherited iwlDefineQuery: TIWLink
          OnClick = LeftTreeiwlDefineQueryClick
          TabOrder = -1
        end
      end
    end
  end
end
