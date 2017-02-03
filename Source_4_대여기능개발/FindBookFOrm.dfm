object frmFindBook: TfrmFindBook
  Left = 0
  Top = 0
  Caption = #46020#49436' '#44160#49353
  ClientHeight = 242
  ClientWidth = 472
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
    Width = 472
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -79
    ExplicitWidth = 551
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
    object chkSearchTItle: TCheckBox
      Left = 194
      Top = 13
      Width = 55
      Height = 17
      Caption = #51228#47785
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkSearchAuthor: TCheckBox
      Left = 245
      Top = 12
      Width = 55
      Height = 17
      Caption = #51200#51088
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object grdList: TDBGrid
    Left = 0
    Top = 41
    Width = 472
    Height = 160
    Align = alClient
    DataSource = dsFindBook
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
        FieldName = 'BOOK_TITLE'
        Title.Caption = #51228#47785
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOOK_AUTHOR'
        Title.Caption = #51200#51088
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOOK_PRICE'
        Title.Caption = #44032#44201
        Visible = True
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 201
    Width = 472
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -79
    ExplicitWidth = 551
    DesignSize = (
      472
      41)
    object btnSelect: TButton
      Left = 305
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49440#53469
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSelectClick
      ExplicitLeft = 384
    end
    object btnClose: TButton
      Left = 386
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #45803#44592
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 465
    end
  end
  object dsFindBook: TDataSource
    DataSet = dmDataAccess.qryFindBook
    Left = 272
    Top = 144
  end
end
