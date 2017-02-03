unit FindUserForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmFindUser = class(TForm)
    pnlHeader: TPanel;
    grdList: TDBGrid;
    pnlBottom: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    chkSearchName: TCheckBox;
    btnSelect: TButton;
    btnClose: TButton;
    dsFindUser: TDataSource;
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelectClick(Sender: TObject);
    procedure grdListKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSelectedSeq: Integer;
  public
    property SelectedSeq: Integer read FSelectedSeq;
  end;

var
  frmFindUser: TfrmFindUser;

implementation

{$R *.dfm}

uses DataAccessModule;

procedure TfrmFindUser.btnSelectClick(Sender: TObject);
begin
  FSelectedSeq := dmDataAccess.qryFindUser.FieldByName('USER_SEQ').AsInteger;
end;

procedure TfrmFindUser.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';
  if edtSearch.Text <> '' then
  begin
    if chkSearchName.Checked then
      Filter := Format('USER_NAME like ''%%%s%%''', [edtSearch.Text]);
  end;

  dmDataAccess.qryFindUser.Filter := Filter;
  dmDataAccess.qryFindUser.Filtered := (Filter <> '');

  if Key in [VK_DOWN, VK_RETURN] then
    grdList.SetFocus;
end;

procedure TfrmFindUser.grdListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN] then
    btnSelect.Click;
end;

end.
