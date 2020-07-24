unit uEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ffdb, Mask, StdCtrls, Buttons;

type
  TfrmEdit = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    edtEmployeeName: TEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    qryChk: TffQuery;
    Label4: TLabel;
    edtusername: TEdit;
    Branch: TLabel;
    cboBranch: TComboBox;
    edtRegionCode: TEdit;
    edtRegionname: TEdit;
    edtBranchCode: TEdit;
    btnPopulate: TBitBtn;
    btnGetRegion: TBitBtn;
    qryRegion: TffQuery;
    btnPopulateBranch: TBitBtn;
    edtpassword: TEdit;
    Label2: TLabel;
    cboEmployeeType: TComboBox;
    Label5: TLabel;
    edtEmailAddress: TEdit;
    btnEmpType: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
    procedure btnGetRegionClick(Sender: TObject);
    procedure btnPopulateBranchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEmpTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    intrecid_edit: integer;

  end;

var
  frmEdit: TfrmEdit;

implementation

uses uMain, uFilter;

{$R *.dfm}

procedure TfrmEdit.btnCancelClick(Sender: TObject);
begin
    frmEdit.Close;

end;

procedure TfrmEdit.btnSaveClick(Sender: TObject);
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

    //get region and branchcode
    btnGetRegion.Click;


    with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Update tblUser set username=:asusername, employeename=:asemployeename, password=:aspassword, region_id=:asregion_id, datemodified=:asdatemodified, modifiedby=:asmodifiedby, branchname=:asbranchname, branchcode=:asbranchcode, regionname=:asregionname,');
        SQL.Add('employeetype=:asemployeetype, emailaddress=:asemailaddress');
        SQL.Add('Where recid=:asrecid');
        ParamByName('asusername').Value:= edtusername.Text;
        ParamByName('asemployeename').Value:= edtEmployeeName.Text;
        ParamByName('aspassword').Value:=   edtpassword.Text;
        ParamByName('asregion_id').Value:= StrToInt(edtRegionCode.Text);
        ParamByName('asrecid').Value:= intrecid_edit;
        ParamByName('asdatemodified').Value:=  now();
        ParamByName('asmodifiedby').Value:= frmMain.gsUser;
        ParamByName('asbranchname').Value:= cboBranch.Text;
        ParamByName('asbranchcode').Value:= trim(edtBranchCode.Text);
        ParamByName('asregionname').Value:= trim(edtRegionname.Text);
        ParamByName('asemployeetype').Value:= cboEmployeeType.Text;
        ParamByName('asemailaddress').Value:= trim(edtEmailAddress.Text);
        ExecSql;

        Close;
        //frmMain.qryAcct.Refresh;
        if frmMain.edtSearch.Text='' then
        begin
            frmMain.btnShow.Click;
            frmMain.qryAcct.Locate('employeename', edtEmployeeName.Text, [loPartialKey]);
        end
        else
        begin
            frmMain.btnShow.Click;
            frmMain.btnSearch.Click;
            frmMain.qryAcct.Locate('employeename', edtEmployeeName.Text, [loPartialKey]);
        end;
        frmEdit.Close;
    end;
end;

procedure TfrmEdit.btnPopulateClick(Sender: TObject);
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

procedure TfrmEdit.btnGetRegionClick(Sender: TObject);
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

procedure TfrmEdit.btnPopulateBranchClick(Sender: TObject);
begin
    with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select branchname From Region ');
        SQL.Add('Where branchcode=:asbranchcode');
        ParamByName('asbranchcode').Value:= StrToInt(edtBranchCode.Text);
        Open;
    end;
    if qryChk.RecordCount>0 then
    begin
        cboBranch.ItemIndex:= cboBranch.Items.IndexOf(qryChk.fieldbyName('branchname').AsString);
    end;
    qryChk.Close;
end;

procedure TfrmEdit.FormShow(Sender: TObject);
begin
    //populate the branch if branchcode is not blank
    if trim(edtBranchCode.Text)<>'' then
    begin
        //cboBranch.Items.Clear;
        btnPopulateBranch.Click;
    end
    else if trim(edtBranchCode.Text)='' then
    begin
        if edtRegionCode.Text='8' then
        begin
            //ShowMessage('MANILA');
            edtRegionname.Text:= 'MANILA';
            edtBranchCode.Text:= '16';
            cboBranch.ItemIndex:= cboBranch.Items.IndexOf('MANILA');
        end
        else
        begin
            cboBranch.ItemIndex:=-1;
            edtRegionCode.Text:= '';
            edtRegionname.Text:= '';
        end;

    end;
end;

procedure TfrmEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_return) then
    begin
    end;

    if (key = vk_escape) then
    begin
        btnCancel.Click;
        
    end;
end;

procedure TfrmEdit.btnEmpTypeClick(Sender: TObject);
begin
   cboEmployeeType.Items.Clear;
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
