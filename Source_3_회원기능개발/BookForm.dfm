object frmBook: TfrmBook
  Left = 0
  Top = 0
  Caption = #46020#49436#44288#47532' '#54868#47732
  ClientHeight = 528
  ClientWidth = 707
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
    Width = 707
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 312
    ExplicitTop = 184
    ExplicitWidth = 185
    DesignSize = (
      707
      41)
    object lblCaption: TLabel
      Left = 24
      Top = 14
      Width = 44
      Height = 13
      Caption = #46020#49436#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAdd: TButton
      Left = 541
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #52628#44032
      TabOrder = 0
      OnClick = btnAddClick
      ExplicitLeft = 658
    end
    object btnClose: TButton
      Left = 621
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 1
      OnClick = btnCloseClick
      ExplicitLeft = 738
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 41
    Width = 707
    Height = 487
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 320
    ExplicitTop = 280
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Splitter1: TSplitter
      Left = 395
      Top = 1
      Width = 5
      Height = 485
      Align = alRight
      ExplicitLeft = 560
    end
    object pnlMain: TPanel
      Left = 1
      Top = 1
      Width = 394
      Height = 485
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 168
      ExplicitTop = 208
      ExplicitWidth = 185
      ExplicitHeight = 41
      object pnlMainHeader: TPanel
        Left = 1
        Top = 1
        Width = 392
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 160
        ExplicitTop = 200
        ExplicitWidth = 185
        object lblSearch: TLabel
          Left = 16
          Top = 16
          Width = 22
          Height = 13
          Caption = #44160#49353
        end
        object edtSearch: TEdit
          Left = 47
          Top = 12
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyUp = edtSearchKeyUp
        end
        object chkSearchTitle: TCheckBox
          Left = 179
          Top = 14
          Width = 54
          Height = 17
          Caption = #51228#47785
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkSearchAuthor: TCheckBox
          Left = 232
          Top = 14
          Width = 97
          Height = 17
          Caption = #51200#51088
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object grdBook: TDBGrid
        Left = 1
        Top = 42
        Width = 392
        Height = 442
        Align = alClient
        DataSource = dsBook
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
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
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOOK_PRICE'
            Title.Caption = #44032#44201
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOOK_RENT'
            Title.Caption = #45824#50668#50668#48512
            Visible = True
          end>
      end
    end
    object pnlInput: TPanel
      Left = 400
      Top = 1
      Width = 306
      Height = 485
      Align = alRight
      TabOrder = 1
      DesignSize = (
        306
        485)
      object Label1: TLabel
        Left = 24
        Top = 15
        Width = 22
        Height = 13
        Caption = #51228#47785
      end
      object Label2: TLabel
        Left = 24
        Top = 64
        Width = 23
        Height = 13
        Caption = 'ISBN'
      end
      object Label3: TLabel
        Left = 24
        Top = 112
        Width = 22
        Height = 13
        Caption = #51200#51088
      end
      object Label4: TLabel
        Left = 24
        Top = 161
        Width = 22
        Height = 13
        Caption = #44032#44201
      end
      object Label5: TLabel
        Left = 24
        Top = 207
        Width = 22
        Height = 13
        Caption = #47553#53356
      end
      object Label6: TLabel
        Left = 24
        Top = 253
        Width = 22
        Height = 13
        Caption = #49444#47749
      end
      object lblLink: TLabel
        Left = 103
        Top = 207
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #48148#47196#44032#44592
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnClick = lblLinkClick
        ExplicitLeft = 109
      end
      object edtTilte: TDBEdit
        Left = 24
        Top = 34
        Width = 257
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_TITLE'
        DataSource = dsBook
        TabOrder = 0
        ExplicitWidth = 193
      end
      object edtISBN: TDBEdit
        Left = 24
        Top = 83
        Width = 121
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_ISBN'
        DataSource = dsBook
        TabOrder = 1
        OnExit = edtISBNExit
        ExplicitWidth = 133
      end
      object edtAuthor: TDBEdit
        Left = 24
        Top = 131
        Width = 121
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_AUTHOR'
        DataSource = dsBook
        TabOrder = 2
        ExplicitWidth = 133
      end
      object edtPrice: TDBEdit
        Left = 24
        Top = 180
        Width = 121
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_PRICE'
        DataSource = dsBook
        TabOrder = 3
        ExplicitWidth = 133
      end
      object edtLink: TDBEdit
        Left = 24
        Top = 226
        Width = 121
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_LINK'
        DataSource = dsBook
        TabOrder = 4
        ExplicitWidth = 133
      end
      object GroupBox1: TGroupBox
        Left = 151
        Top = 61
        Width = 132
        Height = 159
        Anchors = [akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 163
        object imgBook: TImage
          Left = 2
          Top = 15
          Width = 128
          Height = 142
          Align = alClient
          Proportional = True
          Stretch = True
          ExplicitLeft = 16
          ExplicitTop = 24
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
      end
      object btnImageClear: TButton
        Left = 151
        Top = 226
        Width = 60
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52488#44592#54868
        TabOrder = 6
        OnClick = btnImageClearClick
        ExplicitLeft = 163
      end
      object btnImageLoad: TButton
        Left = 213
        Top = 226
        Width = 70
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #48520#47084#50724#44592
        TabOrder = 7
        OnClick = btnImageLoadClick
        ExplicitLeft = 225
      end
      object mmoDescription: TDBMemo
        Left = 24
        Top = 272
        Width = 261
        Height = 145
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_DESCRIPTION'
        DataSource = dsBook
        ScrollBars = ssVertical
        TabOrder = 8
        ExplicitWidth = 273
      end
      object btnDelete: TButton
        Left = 24
        Top = 423
        Width = 59
        Height = 25
        Caption = #49325#51228
        TabOrder = 9
        OnClick = btnDeleteClick
      end
      object btnSave: TButton
        Left = 165
        Top = 423
        Width = 58
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #51200#51109
        TabOrder = 10
        OnClick = btnSaveClick
        ExplicitLeft = 178
      end
      object btnCancel: TButton
        Left = 227
        Top = 423
        Width = 59
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52712#49548
        TabOrder = 11
        OnClick = btnCancelClick
        ExplicitLeft = 240
      end
    end
  end
  object dsBook: TDataSource
    DataSet = dmDataAccess.qryBook
    OnStateChange = dsBookStateChange
    OnDataChange = dsBookDataChange
    Left = 232
    Top = 256
  end
  object dlgLoadImage: TOpenDialog
    Left = 696
    Top = 184
  end
end
