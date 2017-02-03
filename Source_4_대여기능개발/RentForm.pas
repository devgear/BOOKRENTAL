unit RentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmRent = class(TForm)
    pnlHeader: TPanel;
    pnlContent: TPanel;
    lblCaption: TLabel;
    btnAdd: TButton;
    btnClose: TButton;
    pnlGrid: TPanel;
    pnlInput: TPanel;
    Splitter1: TSplitter;
    pnlGridHeader: TPanel;
    grdList: TDBGrid;
    Label1: TLabel;
    edtSearch: TEdit;
    chkSearchBook: TCheckBox;
    chkSearchUser: TCheckBox;
    grpUser: TGroupBox;
    GroupBox2: TGroupBox;
    btnFindUser: TButton;
    GroupBox1: TGroupBox;
    imgUser: TImage;
    Label2: TLabel;
    edtUserName: TDBEdit;
    edtUserBirth: TDBEdit;
    Label3: TLabel;
    edtUserPhone: TDBEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    imgBook: TImage;
    btnFindBook: TButton;
    Label5: TLabel;
    edtBookTitle: TDBEdit;
    Label6: TLabel;
    edtBookAuthor: TDBEdit;
    Label7: TLabel;
    edtBookPrice: TDBEdit;
    btnRent: TButton;
    btnReturn: TButton;
    btnCancel: TButton;
    dsRent: TDataSource;
    dsRentUser: TDataSource;
    dsRentBook: TDataSource;
    procedure dsRentUserDataChange(Sender: TObject; Field: TField);
    procedure dsRentBookDataChange(Sender: TObject; Field: TField);
    procedure btnFindUserClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnFindBookClick(Sender: TObject);
    procedure dsRentStateChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRentClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRent: TfrmRent;

implementation

{$R *.dfm}

uses DataAccessModule, CommonFunctions, FindUserForm, FindBookFOrm;

procedure TfrmRent.btnAddClick(Sender: TObject);
begin
  dmDataAccess.qryRent.Append;
end;

procedure TfrmRent.btnCancelClick(Sender: TObject);
begin
  dmDataAccess.qryRent.Cancel;
end;

procedure TfrmRent.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRent.btnFindBookClick(Sender: TObject);
begin
  frmFindBook := TfrmFindBook.Create(nil);
  try
    frmFindBook.ShowModal;

    if dmDataAccess.qryRent.State <> dsEdit then
      dmDataAccess.qryRent.Edit;
    dmDataAccess.qryRent.FieldByName('BOOK_SEQ').AsInteger :=
      frmFindBook.SelectedSeq;
  finally
    frmFindBook.Free;
  end;
end;

procedure TfrmRent.btnFindUserClick(Sender: TObject);
begin
  frmFindUser := TfrmFindUser.Create(nil);
  try
    frmFindUser.ShowModal;

    if dmDataAccess.qryRent.State <> dsEdit then
      dmDataAccess.qryRent.Edit;
    dmDataAccess.qryRent.FieldByName('USER_SEQ').AsInteger :=
      frmFindUser.SelectedSeq;
  finally
    frmFindUser.Free;
  end;
end;

procedure TfrmRent.btnRentClick(Sender: TObject);
var
  UserSeq, BookSeq: Integer;
begin
  UserSeq := dmDataAccess.qryRent.FieldByName('USER_SEQ').AsInteger;
  BookSeq := dmDataAccess.qryRent.FieldByName('BOOK_SEQ').AsInteger;

  dmDataAccess.ExecuteRent(UserSeq, BookSeq, True);
end;

procedure TfrmRent.btnReturnClick(Sender: TObject);
var
  UserSeq, BookSeq: Integer;
begin
  UserSeq := dmDataAccess.qryRent.FieldByName('USER_SEQ').AsInteger;
  BookSeq := dmDataAccess.qryRent.FieldByName('BOOK_SEQ').AsInteger;

  dmDataAccess.ExecuteRent(UserSeq, BookSeq, False);
end;

procedure TfrmRent.dsRentBookDataChange(Sender: TObject; Field: TField);
var
  LField: TField;
begin
  if dmDataAccess.qryRentBook.State <> dsBrowse then
    Exit;

  LField := dmDataAccess.qryRentBook.FieldByName('BOOK_IMAGE');

  LoadImageFromBlobField(imgBook, LField as TBlobField);
end;

procedure TfrmRent.dsRentStateChange(Sender: TObject);
var
  State: TDataSetState;
begin
  State := dmDataAccess.qryRent.State;

  btnAdd.Enabled := (State = dsBrowse);
  btnRent.Enabled := (State <> dsBrowse);
  btnReturn.Enabled := (State = dsBrowse);
  btnCancel.Enabled := (State <> dsBrowse);

  btnFindUser.Enabled := (State <> dsBrowse);
  btnFindBook.Enabled := (State <> dsBrowse);
end;

procedure TfrmRent.dsRentUserDataChange(Sender: TObject; Field: TField);
var
  LField: TField;
begin
  if dmDataAccess.qryRentUser.State <> dsBrowse then
    Exit;

  LField := dmDataAccess.qryRentUser.FieldByName('USER_IMAGE');

  LoadImageFromBlobField(imgUser, LField as TBlobField);
end;

procedure TfrmRent.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';

  if edtSearch.Text <> '' then
  begin
    if chkSearchBook.Checked then
      Filter := Format('BOOK_TITLE like ''%%%s%%''', [edtSearch.Text]);
    if chkSearchUser.Checked then
    begin
      if Filter <> '' then
        Filter := Filter + ' or ' ;
      Filter := Format('USER_NAME like ''%%%s%%''', [edtSearch.Text]);
    end;
  end;

  dmDataAccess.qryRent.Filter := Filter;
  dmDataAccess.qryRent.Filtered := (Filter <> '');
end;

end.
