program prjAcctMtce;

uses
  Forms,
  uRcgUser in 'uRcgUser.pas' {frmUserLogin},
  uMain in 'uMain.pas' {frmMain},
  uAdd in 'uAdd.pas' {frmAdd},
  uInactive in 'uInactive.pas' {frmInactive},
  uEdit in 'uEdit.pas' {frmEdit},
  uFilter in 'uFilter.pas' {frmFilter},
  uChangePassword in 'uChangePassword.pas' {frmChangePassword},
  uSelectServer in 'uSelectServer.pas' {frmSelectServer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSelectServer, frmSelectServer);
  Application.CreateForm(TfrmUserLogin, frmUserLogin);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAdd, frmAdd);
  Application.CreateForm(TfrmInactive, frmInactive);
  Application.CreateForm(TfrmEdit, frmEdit);
  Application.CreateForm(TfrmFilter, frmFilter);
  Application.CreateForm(TfrmChangePassword, frmChangePassword);

  Application.Run;
end.
