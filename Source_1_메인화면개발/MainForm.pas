unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin;

type
  TfrmMain = class(TForm)
    tbMainMenu: TToolBar;
    pnlLayout: TPanel;
    btnMenuRent: TToolButton;
    btnMenuBook: TToolButton;
    btnMenuUser: TToolButton;
    ToolButton4: TToolButton;
    btnMenuClose: TToolButton;
    ilToolbar: TImageList;
    procedure btnMenuCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnMenuCloseClick(Sender: TObject);
begin
  Close;
end;

end.
