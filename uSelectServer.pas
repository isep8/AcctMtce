unit uSelectServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmSelectServer = class(TForm)
    Label1: TLabel;
    cboServerName: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectServer: TfrmSelectServer;

implementation

uses uMain, uRcgUser;

{$R *.dfm}

procedure TfrmSelectServer.btnCancelClick(Sender: TObject);
begin
    halt;

end;

procedure TfrmSelectServer.btnOkClick(Sender: TObject);
begin
    if frmMain.Trans1.Enabled then
    begin
        frmMain.Trans1.Enabled:= false;
    end;
    
    frmMain.Trans1.ServerName:=  cboServerName.Text;
    frmMain.Trans1.Enabled:= true;

    frmUserLogin.Show;
    frmSelectServer.Hide;
end;

procedure TfrmSelectServer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_return) then
    begin
       btnOk.Click;
    end;

    if (key = vk_escape) then
    begin
        btnCancel.Click;
    end;
end;

end.
