unit DataAccessModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmDataAccess = class(TDataModule)
    conBookRental: TFDConnection;
    qryBook: TFDQuery;
    qryBookBOOK_SEQ: TIntegerField;
    qryBookBOOK_TITLE: TWideStringField;
    qryBookBOOK_ISBN: TStringField;
    qryBookBOOK_AUTHOR: TWideStringField;
    qryBookBOOK_PRICE: TIntegerField;
    qryBookBOOK_LINK: TWideStringField;
    qryBookBOOK_RENT_YN: TStringField;
    qryBookBOOK_IMAGE: TBlobField;
    qryBookBOOK_DESCRIPTION: TWideMemoField;
    qryBookBOOK_RENT: TStringField;
    qryDuplicatedBook: TFDQuery;
    procedure qryBookCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function DuplicatedISBN(ASeq, AISBN: string): Boolean;
  end;

var
  dmDataAccess: TdmDataAccess;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmDataAccess.DuplicatedISBN(ASeq, AISBN: string): Boolean;
begin
  Result := False;
  qryDuplicatedBook.Close;
  qryDuplicatedBook.ParamByName('ISBN').AsString := AISBN;
  qryDuplicatedBook.Open;

  if (qryDuplicatedBook.RecordCount > 0)
    and (qryDuplicatedBook.Fields[0].AsString <> ASeq) then
    Result := True;
end;

procedure TdmDataAccess.qryBookCalcFields(DataSet: TDataSet);
var
  RentYn: string;
begin
  RentYn := qryBook.FieldByName('BOOK_RENT_YN').AsString;
  if RentYn = 'Y' then
    qryBook.FieldByName('BOOK_RENT').AsString := '대여 중'
  else
    qryBook.FieldByName('BOOK_RENT').AsString := '대여 가능'
  ;
end;

end.
