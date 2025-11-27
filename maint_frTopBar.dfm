object ISFTopBar: TISFTopBar
  Left = 0
  Top = 0
  Width = 792
  Height = 69
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
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
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 792
    Height = 69
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.Style = cbsNone
    ZIndex = -1
    DesignSize = (
      792
      69)
    object rectBlackTop: TIWRectangle
      AlignWithMargins = False
      Left = 1
      Top = 47
      Width = 134
      Height = 22
      Font.FontName = 'Arial'
      Font.PxSize = 13
      Font.Color = clWebBLACK
      BorderOptions.Width = 0
      FriendlyName = 'rectBlackTop'
      Color = clWebGRAY
      Alignment = taLeftJustify
      VAlign = vaMiddle
    end
    object rectRedTop: TIWRectangle
      AlignWithMargins = False
      Left = 133
      Top = 47
      Width = 659
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Font.FontName = 'Arial'
      Font.PxSize = 13
      Font.Color = clWebBLACK
      BorderOptions.Width = 0
      FriendlyName = 'rectRedTop'
      Color = clWebLIGHTGRAY
      Alignment = taLeftJustify
      VAlign = vaBottom
    end
    object IWRectangleTitle: TIWRectangle
      AlignWithMargins = False
      Left = 0
      Top = 0
      Width = 792
      Height = 39
      Align = alTop
      Text = '.   Maintenance Database'
      Font.FontName = 'Arial'
      Font.Size = 16
      Font.Style = [fsBold]
      Font.PxSize = 21
      Font.Color = clWebDIMGRAY
      BorderOptions.Width = 0
      FriendlyName = 'IWRectangleTitle'
      Color = clWebLIGHTGRAY
      Alignment = taLeftJustify
      VAlign = vaMiddle
      ExplicitLeft = 1
      ExplicitTop = 4
      ExplicitWidth = 517
    end
    object lblWelcome: TIWLabel
      AlignWithMargins = False
      Left = 146
      Top = 50
      Width = 56
      Height = 14
      Font.FontName = 'Arial'
      Font.Size = 8
      Font.Style = [fsBold]
      Font.PxSize = 10
      Font.Color = clWebDARKSLATEGRAY
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'lblWelcome'
      Caption = 'Welcome'
    end
    object iwlSignOut: TIWLink
      AlignWithMargins = False
      Left = 608
      Top = 16
      Width = 53
      Height = 17
      RenderSize = False
      StyleRenderOptions.RenderSize = False
      Alignment = taLeftJustify
      Color = clNone
      Font.FontName = 'Arial'
      Font.Style = [fsUnderline]
      Font.PxSize = 13
      Font.Color = clWebBLUE
      HasTabOrder = True
      DoSubmitValidation = False
      FriendlyName = 'iwlSignOut'
      OnClick = iwlSignOutClick
      TabOrder = -1
      RawText = False
      Caption = 'Log Out'
    end
    object lnkSignIn: TIWLink
      AlignWithMargins = False
      Left = 532
      Top = 16
      Width = 53
      Height = 17
      RenderSize = False
      StyleRenderOptions.RenderSize = False
      Alignment = taLeftJustify
      Color = clNone
      Font.FontName = 'Arial'
      Font.Style = [fsUnderline]
      Font.PxSize = 13
      Font.Color = clWebBLUE
      HasTabOrder = True
      DoSubmitValidation = False
      FriendlyName = 'lnkSignIn'
      OnClick = SignIn
      TabOrder = 1
      RawText = False
      Caption = 'Log In'
    end
  end
end
