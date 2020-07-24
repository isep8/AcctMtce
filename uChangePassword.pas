unit uChangePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmChangePassword = class(TForm)
    Label2: TLabel;
    edtpassword: TEdit;
    Label1: TLabel;
    edtConfirm: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangePassword: TfrmChangePassword;

implementation

uses uRcgUser;

{$R *.dfm}

procedure TfrmChangePassword.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmChangePassword.btnCancelClick(Sender: TObject);
begin
    frmChangePassword.Close;
end;

procedure TfrmChangePassword.btnOkClick(Sender: TObject);
begin
    if trim(edtpassword.Text)='' then
    begin
        messageDlg('Invalid blank password!',mtError, [mbOk],0);
        edtpassword.SetFocus;
        exit;
    end;

    if trim(edtpassword.Text)= trim(edtConfirm.Text) then
    begin

        with frmUserLogin do
        begin
            with qryLogin do
            begin
                Close;
                SQL.clear;
                SQL.Add('Update RcgUsers');
                SQL.Add('Set password=:aspassword');
                SQL.Add('Where username=:asusername');
                ParamByName('aspassword').Value:= trim(frmChangePassword.edtpassword.Text);
                ParamByName('asusername').Value:= frmUserLogin.edtusername.Text;
                ExecSql;
                Close;
            end;

            messageDlg('Password successfully changed!',mtInformation,[mbOk],0);
            frmUserLogin.edtpassword.Text:= '';
            frmUserLogin.SetFocus;
            btnCancel.Click;
        end;
    end
    else
    begin
        messageDlg('Typed mismatch!',mtError, [mbOk],0);
        edtConfirm.SetFocus;
        edtConfirm.SelectAll;
    end;
end;

end.
