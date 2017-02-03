program BookRental;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  DataAccessModule in 'DataAccessModule.pas' {dmDataAccess: TDataModule},
  BookForm in 'BookForm.pas' {frmBook},
  CommonFunctions in 'CommonFunctions.pas',
  UserForm in 'UserForm.pas' {frmUser},
  RentForm in 'RentForm.pas' {frmRent},
  FindUserForm in 'FindUserForm.pas' {frmFindUser},
  FindBookFOrm in 'FindBookFOrm.pas' {frmFindBook};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataAccess, dmDataAccess);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
