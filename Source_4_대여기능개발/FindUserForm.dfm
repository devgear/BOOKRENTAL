object frmFindUser: TfrmFindUser
  Left = 0
  Top = 0
  Caption = #54924#50896' '#44160#49353
  ClientHeight = 271
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 136
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 22
      Height = 13
      Caption = #44160#49353
    end
    object edtSearch: TEdit
      Left = 56
      Top = 10
      Width = 123
      Height = 21
      TabOrder = 0
      OnKeyUp = edtSearchKeyUp
    end
    object chkSearchName: TCheckBox
      Left = 194
      Top = 13
      Width = 97
      Height = 17
      Caption = #51060#47492
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object grdList: TDBGrid
    Left = 0
    Top = 41
    Width = 551
    Height = 189
    Align = alClient
    DataSource = dsFindUser
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = grdListKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_NAME'
        Title.Caption = #51060#47492
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_PHONE'
        Title.Caption = #50672#46973#52376
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_BIRTH'
        Title.Caption = #49373#45380#50900#51068
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_SEX_STR'
        Title.Caption = #49457#48324
        Visible = True
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 230
    Width = 551
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 32
    ExplicitTop = 152
    ExplicitWidth = 185
    DesignSize = (
      551
      41)
    object btnSelect: TButton
      Left = 384
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49440#53469
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSelectClick
      ExplicitLeft = 351
    end
    object btnClose: TButton
      Left = 465
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #45803#44592
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 432
    end
  end
  object dsFindUser: TDataSource
    DataSet = dmDataAccess.qryFindUser
    Left = 272
    Top = 144
  end
end
