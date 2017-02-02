unit BookForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmBook = class(TForm)
    pnlHeader: TPanel;
    pnlContent: TPanel;
    pnlMain: TPanel;
    pnlInput: TPanel;
    pnlMainHeader: TPanel;
    grdBook: TDBGrid;
    lblCaption: TLabel;
    btnAdd: TButton;
    btnClose: TButton;
    lblSearch: TLabel;
    edtSearch: TEdit;
    chkSearchTitle: TCheckBox;
    chkSearchAuthor: TCheckBox;
    Label1: TLabel;
    edtTilte: TDBEdit;
    Splitter1: TSplitter;
    Label2: TLabel;
    edtISBN: TDBEdit;
    Label3: TLabel;
    edtAuthor: TDBEdit;
    Label4: TLabel;
    edtPrice: TDBEdit;
    Label5: TLabel;
    edtLink: TDBEdit;
    GroupBox1: TGroupBox;
    btnImageClear: TButton;
    btnImageLoad: TButton;
    Label6: TLabel;
    mmoDescription: TDBMemo;
    btnDelete: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    imgBook: TImage;
    dsBook: TDataSource;
    dlgLoadImage: TOpenDialog;
    lblLink: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnImageLoadClick(Sender: TObject);
    procedure btnImageClearClick(Sender: TObject);
    procedure dsBookDataChange(Sender: TObject; Field: TField);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dsBookStateChange(Sender: TObject);
    procedure edtISBNExit(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBook: TfrmBook;

implementation

{$R *.dfm}

uses
  DataAccessModule, CommonFunctions, WinAPI.ShellAPI;

procedure TfrmBook.btnAddClick(Sender: TObject);
begin
  dmDataAccess.qryBook.Append;
  edtTilte.SetFocus;
end;

procedure TfrmBook.btnCancelClick(Sender: TObject);
begin
  dmDataAccess.qryBook.Cancel;
end;

procedure TfrmBook.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBook.btnDeleteClick(Sender: TObject);
var
  RentYn, Title, Msg: string;
begin
  RentYn := dmDataAccess.qryBook.FieldByName('BOOK_RENT_YN').AsString;
  if RentYn = 'Y' then
  begin
    Showmessage('대여 중인 도서는 삭제할 수 없습니다. 도서 반납 후 삭제 가능합니다.');
    Exit;
  end;

  Title := dmDataAccess.qryBook.FieldByName('BOOK_TITLE').AsString;
  Msg := Format('[%s] 도서를 삭제하시겠습니까?', [Title]);
  if MessageDlg(Msg, mtInformation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  dmDataAccess.qryBook.Delete;
end;

procedure TfrmBook.btnImageClearClick(Sender: TObject);
var
  Field: TField;
begin
  imgBook.Picture.Assign(nil);

  Field := dmDataAccess.qryBook.FieldByName('BOOK_IMAGE');
  if dmDataAccess.qryBook.State <> dsEdit then
    dmDataAccess.qryBook.Edit;
  Field.Assign(nil);
end;

procedure TfrmBook.btnImageLoadClick(Sender: TObject);
var
  Field: TField;
begin
  if dlgLoadImage.Execute then
  begin
    LoadImageFromFile(imgBook, dlgLoadImage.FileName);

    Field := dmDataAccess.qryBook.FieldByName('BOOK_IMAGE');
    SaveImageToBlobField(imgBook, Field as TBlobField);
  end;
end;

procedure TfrmBook.btnSaveClick(Sender: TObject);
begin
  if edtTilte.Text = '' then
  begin
    ShowMessage('제목을 입력하세요.');
    edtTilte.SetFocus;
    Exit;
  end;

  if edtAuthor.Text = '' then
  begin
    ShowMessage('저자를 입력하세요.');
    edtAuthor.SetFocus;
    Exit;
  end;

  dmDataAccess.qryBook.Post;
  dmDataAccess.qryBook.Refresh;
end;

procedure TfrmBook.dsBookDataChange(Sender: TObject; Field: TField);
var
  LField: TField;
begin
  if dmDataAccess.qryBook.State = dsEdit then
    Exit;

  LField := dmDataAccess.qryBook.FieldByName('BOOK_IMAGE');
  if LField is TBlobField then
    LoadImageFromBlobField(imgBook, LField as TBlobField);
end;

procedure TfrmBook.dsBookStateChange(Sender: TObject);
var
  State: TDataSetState;
begin
  State := dmDataAccess.qryBook.State;

  btnAdd.Enabled := (State = dsBrowse);
  btnSave.Enabled := (State <> dsBrowse);
  btnCancel.Enabled := (State <> dsBrowse);

  btnDelete.Enabled := (State = dsBrowse) and (dmDataAccess.qryBook.RecordCount > 0);
end;

procedure TfrmBook.edtISBNExit(Sender: TObject);
var
  Seq, ISBN: string;
begin
  Seq := dmDataAccess.qryBook.FieldByName('BOOK_SEQ').AsString;
  ISBN := dmDataAccess.qryBook.FieldByName('BOOK_ISBN').AsString;

  if dmDataAccess.qryBook.State = dsBrowse then
    Exit;

  if dmDataAccess.DuplicatedISBN(Seq, ISBN) then
  begin
    ShowMessage('이미 등록된 도서입니다.(ISBN이 중복됩니다.)');
    edtISBN.Text := '';
    edtISBN.SetFocus;
  end;
end;

procedure TfrmBook.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';

  if edtSearch.Text <> '' then
  begin
    if chkSearchTitle.Checked then
      Filter := Format('BOOK_TITLE like ''%%%s%%''', [edtSearch.Text]);
    if chkSearchAuthor.Checked then
    begin
      if Filter <> '' then
        Filter := Filter + ' or ';
      Filter := Filter + Format('BOOK_AUTHOR like ''%%%s%%''', [edtSearch.Text]);
    end;
  end;

  dmDataAccess.qryBook.Filter := Filter;
  dmDataAccess.qryBook.Filtered := (Filter <> '');
end;

procedure TfrmBook.lblLinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(edtLink.Text), nil, nil, SW_SHOW);
end;

end.
