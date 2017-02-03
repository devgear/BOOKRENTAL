object frmRent: TfrmRent
  Left = 0
  Top = 0
  Caption = #46020#49436#45824#50668' '#54868#47732
  ClientHeight = 559
  ClientWidth = 853
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
    Width = 853
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      853
      41)
    object lblCaption: TLabel
      Left = 16
      Top = 14
      Width = 44
      Height = 13
      Caption = #46020#49436#45824#50668
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAdd: TButton
      Left = 680
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49352' '#45824#52636
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnClose: TButton
      Left = 761
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 41
    Width = 853
    Height = 518
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 557
      Top = 1
      Height = 516
      Align = alRight
      ExplicitLeft = 288
      ExplicitTop = 168
      ExplicitHeight = 100
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 1
      Width = 556
      Height = 516
      Align = alClient
      TabOrder = 0
      object pnlGridHeader: TPanel
        Left = 1
        Top = 1
        Width = 554
        Height = 41
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 14
          Top = 16
          Width = 22
          Height = 13
          Caption = #44160#49353
        end
        object edtSearch: TEdit
          Left = 46
          Top = 11
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyUp = edtSearchKeyUp
        end
        object chkSearchBook: TCheckBox
          Left = 183
          Top = 13
          Width = 75
          Height = 17
          Caption = #46020#49436' '#51228#47785
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkSearchUser: TCheckBox
          Left = 264
          Top = 13
          Width = 97
          Height = 17
          Caption = #54924#50896' '#47749
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object grdList: TDBGrid
        Left = 1
        Top = 42
        Width = 554
        Height = 473
        Align = alClient
        DataSource = dsRent
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
            Title.Caption = #46020#49436' '#51228#47785
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_NAME'
            Title.Caption = #54924#50896#47749
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RENT_DATE'
            Title.Caption = #45824#50668#51068#51088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RENT_RETURN_DATE'
            Title.Caption = #48152#45225#50696#51221#51068
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RENT_RETURN'
            Title.Caption = #45824#50668#50668#48512
            Visible = True
          end>
      end
    end
    object pnlInput: TPanel
      Left = 560
      Top = 1
      Width = 292
      Height = 516
      Align = alRight
      TabOrder = 1
      DesignSize = (
        292
        516)
      object grpUser: TGroupBox
        Left = 6
        Top = 17
        Width = 275
        Height = 208
        Anchors = [akLeft, akTop, akRight]
        Caption = #54924#50896' '#51221#48372
        TabOrder = 0
        DesignSize = (
          275
          208)
        object Label2: TLabel
          Left = 127
          Top = 60
          Width = 22
          Height = 13
          Caption = #51060#47492
        end
        object Label3: TLabel
          Left = 127
          Top = 108
          Width = 44
          Height = 13
          Caption = #49373#45380#50900#51068
        end
        object Label4: TLabel
          Left = 127
          Top = 157
          Width = 33
          Height = 13
          Caption = #50672#46973#52376
        end
        object btnFindUser: TButton
          Left = 11
          Top = 25
          Width = 182
          Height = 25
          Caption = #54924#50896' '#44160#49353
          TabOrder = 0
          OnClick = btnFindUserClick
        end
        object GroupBox1: TGroupBox
          Left = 11
          Top = 63
          Width = 108
          Height = 129
          TabOrder = 1
          object imgUser: TImage
            Left = 3
            Top = 4
            Width = 101
            Height = 119
            Proportional = True
            Stretch = True
          end
        end
        object edtUserName: TDBEdit
          Left = 127
          Top = 79
          Width = 137
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'USER_NAME'
          DataSource = dsRentUser
          TabOrder = 2
        end
        object edtUserBirth: TDBEdit
          Left = 127
          Top = 127
          Width = 137
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'USER_BIRTH'
          DataSource = dsRentUser
          TabOrder = 3
        end
        object edtUserPhone: TDBEdit
          Left = 127
          Top = 176
          Width = 137
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'USER_PHONE'
          DataSource = dsRentUser
          TabOrder = 4
        end
      end
      object GroupBox2: TGroupBox
        Left = 6
        Top = 231
        Width = 275
        Height = 210
        Anchors = [akLeft, akTop, akRight]
        Caption = #46020#49436' '#51221#48372
        TabOrder = 1
        DesignSize = (
          275
          210)
        object Label5: TLabel
          Left = 127
          Top = 61
          Width = 22
          Height = 13
          Caption = #51228#47785
        end
        object Label6: TLabel
          Left = 127
          Top = 109
          Width = 22
          Height = 13
          Caption = #51200#51088
        end
        object Label7: TLabel
          Left = 127
          Top = 158
          Width = 22
          Height = 13
          Caption = #44032#44201
        end
        object GroupBox3: TGroupBox
          Left = 11
          Top = 64
          Width = 108
          Height = 129
          TabOrder = 0
          object imgBook: TImage
            Left = 4
            Top = 7
            Width = 101
            Height = 119
            Proportional = True
            Stretch = True
          end
        end
        object btnFindBook: TButton
          Left = 11
          Top = 26
          Width = 182
          Height = 25
          Caption = #46020#49436' '#44160#49353
          TabOrder = 1
          OnClick = btnFindBookClick
        end
        object edtBookTitle: TDBEdit
          Left = 127
          Top = 80
          Width = 137
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BOOK_TITLE'
          DataSource = dsRentBook
          TabOrder = 2
        end
        object edtBookAuthor: TDBEdit
          Left = 127
          Top = 128
          Width = 137
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BOOK_AUTHOR'
          DataSource = dsRentBook
          TabOrder = 3
        end
        object edtBookPrice: TDBEdit
          Left = 127
          Top = 177
          Width = 137
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BOOK_PRICE'
          DataSource = dsRentBook
          TabOrder = 4
        end
      end
      object btnRent: TButton
        Left = 6
        Top = 447
        Width = 75
        Height = 25
        Caption = #45824#52636
        TabOrder = 2
        OnClick = btnRentClick
      end
      object btnReturn: TButton
        Left = 87
        Top = 447
        Width = 75
        Height = 25
        Caption = #48152#45225
        TabOrder = 3
        OnClick = btnReturnClick
      end
      object btnCancel: TButton
        Left = 208
        Top = 447
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52712#49548
        TabOrder = 4
        OnClick = btnCancelClick
      end
    end
  end
  object dsRent: TDataSource
    DataSet = dmDataAccess.qryRent
    OnStateChange = dsRentStateChange
    Left = 240
    Top = 224
  end
  object dsRentUser: TDataSource
    DataSet = dmDataAccess.qryRentUser
    OnDataChange = dsRentUserDataChange
    Left = 624
    Top = 176
  end
  object dsRentBook: TDataSource
    DataSet = dmDataAccess.qryRentBook
    OnDataChange = dsRentBookDataChange
    Left = 632
    Top = 384
  end
end
