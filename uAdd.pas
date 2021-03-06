unit uAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ffdb, Mask, DBCtrls;

type
  TfrmAdd = class(TForm)
    Label1: TLabel;
    edtEmployeeName: TEdit;
    Branch: TLabel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    qryChk: TffQuery;
    Label4: TLabel;
    edtusername: TEdit;
    qryRegion: TffQuery;
    dsRegion: TDataSource;
    btnPopulate: TBitBtn;
    cboBranch: TComboBox;
    edtRegionCode: TEdit;
    btnGetRegion: TBitBtn;
    edtRegionname: TEdit;
    edtBranchCode: TEdit;
    edtpassword: TEdit;
    Label2: TLabel;
    cboEmployeeType: TComboBox;
    btnEmpType: TBitBtn;
    Label5: TLabel;
    edtEmailAddress: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
    procedure btnGetRegionClick(Sender: TObject);
    procedure btnEmpTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd: TfrmAdd;

implementation

uses uInactive, uMain;

{$R *.dfm}

procedure TfrmAdd.btnCancelClick(Sender: TObject);
begin
    frmAdd.Close;
end;

procedure TfrmAdd.btnSaveClick(Sender: TObject);
begin
    //validations
    if trim(edtEmployeeName.Text) = '' then
    begin
        messageDlg('Employee name is required!',mtError, [mbOk],0);
        edtEmployeeName.SetFocus;
        exit;
    end;
    if trim(edtusername.Text) = '' then
    begin
        messageDlg('User name is required!',mtError, [mbOk],0);
        edtusername.SetFocus;
        exit;
    end;

    if trim(edtpassword.Text) = '' then
    begin
        messageDlg('Password is required!',mtError, [mbOk],0);
        edtpassword.SetFocus;
        exit;
    end;

    if trim(cboBranch.Text) = '' then
    begin
        messageDlg('Branch name is required!',mtError, [mbOk],0);
        cboBranch.SetFocus;
        exit;
    end;
    if trim(cboEmployeeType.Text) = '' then
    begin
        messageDlg('Employee Type is required!',mtError, [mbOk],0);
        cboEmployeeType.SetFocus;
        exit;
    end;
    
    if trim(edtEmailAddress.Text) = '' then
    begin
        messageDlg('Email address is required!',mtError, [mbOk],0);
        edtEmailAddress.SetFocus;
        exit;
    end;


    //validate
    with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select username From tbluser');
        SQL.Add('Where upper(username)=:asusername');
        ParamByName('asusername').Value:= UpperCase(edtusername.Text);
        Open;
    end;
    if qryChk.RecordCount>0 then
    begin
        qryChk.Close;
        messageDlg(edtusername.Text + ' already in use!',mtError, [mbOk],0);
        exit;
    end;


    btnGetRegion.Click;
    
    with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Insert into tblUser(username, employeename, password, region_id, activated, dateentered, enteredby, branchname, branchcode, regionname, access_id, employeetype, emailaddress)');
        SQL.Add('Values(:asusername, :asemployeename,:aspassword, :asregion_id, :asactivated, :asdateentered, :asenteredby, :asbranchname, :asbranchcode, :asregionname, :asaccess_id, :asemployeetype, :asemailaddress )');
        ParamByName('asusername').Value:= edtusername.Text;
        ParamByName('asemployeename').Value:= edtEmployeeName.Text;
        ParamByName('aspassword').Value:=   edtpassword.Text;
        ParamByName('asregion_id').Value:= StrToInt(edtRegionCode.Text);
        ParamByName('asactivated').Value:= 1;
        ParamByName('asaccess_id').Value:= 1;
        ParamByName('asdateentered').Value:=  now();
        ParamByName('asenteredby').Value:= frmMain.gsUser;
        ParamByName('asbranchname').Value:= cboBranch.Text;
        ParamByName('asbranchcode').Value:= StrToInt(edtBranchCode.Text);
        ParamByName('asregionname').Value:= edtRegionname.Text;
        ParamByName('asemployeetype').Value:= cboEmployeeType.Text;
        ParamByName('asemailaddress').Value:= edtEmailAddress.Text;
        ExecSql;
        Close;

        frmMain.edtSearch.Text:= '';
        frmMain.btnShow.Click;

        frmMain.edtSearch.Text:= edtEmployeeName.Text;
        //messageDlg('Record saved!',mtInformation,[mbOk],0);
        frmAdd.Close;
    end;
end;

procedure TfrmAdd.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = vk_return) then
    begin
    end;

    if (key = vk_escape) then
    begin
        frmAdd.Close;
    end;
end;

procedure TfrmAdd.FormShow(Sender: TObject);
begin
    btnPopulate.Click;
    btnEmpType.Click;
    cboBranch.ItemIndex:=0;
    edtEmployeeName.SetFocus;
    cboBranch.ItemIndex:= 8; //manila
    btnGetRegion.Click;
end;

procedure TfrmAdd.btnPopulateClick(Sender: TObject);
begin
    with qryRegion do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select branchname From Region');
        SQL.Add('Group by branchname');
        SQL.Add('Order by branchname');
        Open;
    end;
    qryRegion.First;
    while not qryRegion.Eof do
    begin
         cboBranch.Items.Add(qryRegion.FieldByName('branchname').AsString);
    qryRegion.Next;
    end;
    qryRegion.Close;


end;

procedure TfrmAdd.btnGetRegionClick(Sender: TObject);
begin
    with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select regionname, region_id, branchcode, branchname From Region ');
        SQL.Add('Where branchname = :asbranch');
        ParamByName('asbranch').Value:= cboBranch.Text;
        Open;
    end;
    if qryChk.RecordCount>0 then
    begin
        edtRegionCode.Text:= qryChk.FieldByName('region_id').AsString;
        edtRegionname.Text:= qryChk.FieldByName('regionname').AsString;
        edtBranchCode.Text:= qryChk.FieldByName('branchcode').AsString;
    end;
    qryChk.Close;
end;

procedure TfrmAdd.btnEmpTypeClick(Sender: TObject);
begin
   with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select Type From EmpType');
        SQL.Add('Group by Type');
        SQL.Add('Order by Type');
        Open;
    end;
    qryChk.First;
    while not qryChk.Eof do
    begin
         cboEmployeeType.Items.Add(qryChk.FieldByName('Type').AsString);
    qryChk.Next;
    end;
    qryChk.Close;
end;

end.

