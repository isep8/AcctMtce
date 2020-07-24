unit uRcgUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ffdb, jpeg, ExtCtrls;

type
  TfrmUserLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtusername: TEdit;
    edtpassword: TEdit;
    btnLogin: TBitBtn;
    btnExit: TBitBtn;
    qryLogin: TffQuery;
    qryLoginrecid: TAutoIncField;
    qryLoginusername: TStringField;
    qryLoginpassword: TStringField;
    qryLoginfname: TStringField;
    qryLoginlname: TStringField;
    qryLogindateentered: TDateTimeField;
    qryLoginenteredby: TStringField;
    btnChangePassword: TBitBtn;
    Image1: TImage;
    Label3: TLabel;
    Bevel1: TBevel;
    qryChk: TffQuery;
    procedure btnLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnChangePasswordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserLogin: TfrmUserLogin;

implementation

uses uMain, uChangePassword;

{$R *.dfm}

procedure TfrmUserLogin.btnLoginClick(Sender: TObject);
begin
    //validate blank
    if trim(edtusername.Text)='' then
    begin
        messageDlg('Blank username!',mtError, [mbOk],0);
        edtusername.SetFocus;
        exit;
    end;
    if trim(edtpassword.Text)='' then
    begin
        messageDlg('Blank password!',mtError, [mbOk],0);
        edtpassword.SetFocus;
        exit;
    end;


    with qryLogin do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select * From RcgUsers');
        SQL.Add('Where username=:asusername');
        ParamByName('asusername').Value:= edtusername.Text;
        Open;
    end;
    if qryLogin.RecordCount>0 then
    begin
        if trim(edtpassword.Text)=trim(qryLoginpassword.AsString) then
        begin
            //logged
            with qryChk do
            begin
                Close;
                SQL.clear;
                SQL.Add('Insert into Logs(username, activity, loginDT)');
                SQL.Add('Values(:asusername, :asactivity, :asLoginDT)');
                ParamByName('asusername').Value:= edtusername.Text;
                ParamByName('asactivity').Value:= 'Login';
                ParamByName('asLoginDT').Value:= now();
                ExecSql;
                Close;
            end;


            frmMain.gsUser:= edtusername.Text;
            frmMain.Show;
        end
        else
        begin
            messageDlg('Password is incorrect!',mtError, [mbOk],0);
            edtpassword.SelectAll;
            edtpassword.SetFocus;
        end;
    end
    else
    begin
        messageDlg('Invalid User Name!',mtError, [mbOk],0);
        edtusername.SetFocus;
        edtusername.SelectAll;
    end;
end;

procedure TfrmUserLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_return) then
    begin
        btnLogin.Click;
    end;

    if (key = vk_escape) then
    begin
        btnExit.Click;
    end;
end;

procedure TfrmUserLogin.btnChangePasswordClick(Sender: TObject);
begin
    with qryLogin do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select * From RcgUsers');
        SQL.Add('Where username=:asusername');
        ParamByName('asusername').Value:= edtusername.Text;
        Open;
    end;
    if qryLogin.RecordCount>0 then
    begin
        if trim(edtpassword.Text)=trim(qryLoginpassword.AsString) then
        begin
            //frmMain.Show;
            frmChangePassword.ShowModal;            
        end
        else
        begin
            messageDlg('Password is incorrect!',mtError, [mbOk],0);
            edtpassword.SelectAll;
            edtpassword.SetFocus;
        end;
    end
    else
    begin
        messageDlg('Invalid User Name!',mtError, [mbOk],0);
        edtusername.SetFocus;
        edtusername.SelectAll;
    end;
end;

procedure TfrmUserLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //Halt;
end;

procedure TfrmUserLogin.FormDestroy(Sender: TObject);
begin
    halt;
end;

procedure TfrmUserLogin.btnExitClick(Sender: TObject);
begin
    Halt;
end;

procedure TfrmUserLogin.FormShow(Sender: TObject);
begin
    frmUserLogin.Caption:= frmMain.Trans1.ServerName;
end;

end.
