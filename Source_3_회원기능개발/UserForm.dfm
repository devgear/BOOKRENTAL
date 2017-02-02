object frmUser: TfrmUser
  Left = 0
  Top = 0
  Caption = #54924#50896' '#44288#47532
  ClientHeight = 492
  ClientWidth = 784
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
    Width = 784
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 296
    ExplicitTop = 232
    ExplicitWidth = 185
    DesignSize = (
      784
      41)
    object lblCaption: TLabel
      Left = 16
      Top = 14
      Width = 44
      Height = 13
      Caption = #54924#50896#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAdd: TButton
      Left = 610
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49888#44508' '#46321#47197
      TabOrder = 0
      OnClick = btnAddClick
      ExplicitLeft = 585
    end
    object btnClose: TButton
      Left = 689
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 1
      OnClick = btnCloseClick
      ExplicitLeft = 664
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 41
    Width = 784
    Height = 451
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 288
    ExplicitTop = 296
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Splitter1: TSplitter
      Left = 453
      Top = 1
      Height = 449
      Align = alRight
      ExplicitLeft = 392
      ExplicitTop = 176
      ExplicitHeight = 100
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 1
      Width = 452
      Height = 449
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 304
      ExplicitTop = 208
      ExplicitWidth = 185
      ExplicitHeight = 41
      object pnlGridHeader: TPanel
        Left = 1
        Top = 1
        Width = 450
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 168
        ExplicitTop = 208
        ExplicitWidth = 185
        object Label1: TLabel
          Left = 14
          Top = 16
          Width = 22
          Height = 13
          Caption = #44160#49353
        end
        object edtSearch: TEdit
          Left = 50
          Top = 10
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyUp = edtSearchKeyUp
        end
        object chkSearchName: TCheckBox
          Left = 177
          Top = 13
          Width = 48
          Height = 17
          Caption = #51060#47492
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkSearchPhone: TCheckBox
          Left = 230
          Top = 13
          Width = 97
          Height = 17
          Caption = #51204#54868#48264#54840
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object grdList: TDBGrid
        Left = 1
        Top = 42
        Width = 450
        Height = 406
        Align = alClient
        DataSource = dsUser
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
            FieldName = 'USER_NAME'
            Title.Caption = #51060#47492
            Width = 100
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
          end
          item
            Expanded = False
            FieldName = 'USER_PHONE'
            Title.Caption = #51204#54868#48264#54840
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_MAIL'
            Title.Caption = #47700#51068#51452#49548
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_REG_DATE'
            Title.Caption = #46321#47197#51068#49884
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_OUT'
            Title.Caption = #53448#53748#50668#48512
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_OUT_DATE'
            Title.Caption = #53448#53748#51068#49884
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_RENT_COUNT'
            Title.Caption = #45824#50668#44428#49688
            Visible = True
          end>
      end
    end
    object pnlInput: TPanel
      Left = 456
      Top = 1
      Width = 327
      Height = 449
      Align = alRight
      TabOrder = 1
      DesignSize = (
        327
        449)
      object Label2: TLabel
        Left = 16
        Top = 14
        Width = 22
        Height = 13
        Caption = #51060#47492
      end
      object Label3: TLabel
        Left = 16
        Top = 60
        Width = 44
        Height = 13
        Caption = #49373#45380#50900#51068
      end
      object Label4: TLabel
        Left = 16
        Top = 163
        Width = 44
        Height = 13
        Caption = #51204#54868#48264#54840
      end
      object Label5: TLabel
        Left = 16
        Top = 211
        Width = 44
        Height = 13
        Caption = #47700#51068#51452#49548
      end
      object edtName: TDBEdit
        Left = 16
        Top = 33
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_NAME'
        DataSource = dsUser
        TabOrder = 0
        OnExit = edtNameExit
      end
      object dpBirth: TCalendarPicker
        Left = 16
        Top = 76
        Width = 137
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
        CalendarHeaderInfo.DaysOfWeekFont.Height = -13
        CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
        CalendarHeaderInfo.DaysOfWeekFont.Style = []
        CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.Font.Color = clWindowText
        CalendarHeaderInfo.Font.Height = -20
        CalendarHeaderInfo.Font.Name = 'Segoe UI'
        CalendarHeaderInfo.Font.Style = []
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        OnCloseUp = dpBirthCloseUp
        ParentFont = False
        TabOrder = 1
        TextHint = 'select a date'
        ExplicitWidth = 121
      end
      object grpSex: TDBRadioGroup
        Left = 16
        Top = 114
        Width = 137
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = #49457#48324
        Columns = 2
        DataField = 'USER_SEX'
        DataSource = dsUser
        Items.Strings = (
          #45224
          #50668)
        TabOrder = 2
        Values.Strings = (
          'M'
          'F')
        ExplicitWidth = 121
      end
      object edtPhone: TDBEdit
        Left = 16
        Top = 182
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_PHONE'
        DataSource = dsUser
        TabOrder = 3
        ExplicitWidth = 121
      end
      object edtMail: TDBEdit
        Left = 16
        Top = 230
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_MAIL'
        DataSource = dsUser
        TabOrder = 4
        ExplicitWidth = 121
      end
      object GroupBox1: TGroupBox
        Left = 159
        Top = 15
        Width = 162
        Height = 200
        Anchors = [akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 143
        object imgUser: TImage
          Left = 5
          Top = 8
          Width = 154
          Height = 189
          Proportional = True
          Stretch = True
        end
      end
      object btnClearImage: TButton
        Left = 159
        Top = 221
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52488#44592#54868
        TabOrder = 6
        OnClick = btnClearImageClick
        ExplicitLeft = 143
      end
      object btnLoadImage: TButton
        Left = 248
        Top = 221
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #48520#47084#50724#44592
        TabOrder = 7
        OnClick = btnLoadImageClick
        ExplicitLeft = 232
      end
      object btnDelete: TButton
        Left = 16
        Top = 280
        Width = 75
        Height = 25
        Caption = #54924#50896#53448#53748
        TabOrder = 8
        OnClick = btnDeleteClick
      end
      object btnSave: TButton
        Left = 167
        Top = 280
        Width = 75
        Height = 25
        Caption = #51200#51109
        TabOrder = 9
        OnClick = btnSaveClick
      end
      object btnCancel: TButton
        Left = 248
        Top = 280
        Width = 75
        Height = 25
        Caption = #52712#49548
        TabOrder = 10
        OnClick = btnCancelClick
      end
    end
  end
  object dlgLoadImage: TOpenDialog
    Left = 680
    Top = 136
  end
  object dsUser: TDataSource
    DataSet = dmDataAccess.qryUser
    OnStateChange = dsUserStateChange
    OnDataChange = dsUserDataChange
    Left = 232
    Top = 256
  end
end
