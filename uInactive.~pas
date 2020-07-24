unit uInactive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ffdb;

type
  TfrmInactive = class(TForm)
    btnActivate: TBitBtn;
    DBGrid1: TDBGrid;
    qryInactive: TffQuery;
    qryInactiverecid: TAutoIncField;
    qryInactiveemployeename: TStringField;
    qryInactivepassword: TStringField;
    qryInactiveregion_id: TSmallintField;
    qryInactiveactivated: TSmallintField;
    qryInactiveAccess_id: TSmallintField;
    qryInactivedateentered: TDateTimeField;
    qryInactivedatemodified: TDateTimeField;
    qryInactiveenteredby: TStringField;
    qryInactivemodifiedby: TStringField;
    dsUserList: TDataSource;
    btnShowInactive: TBitBtn;
    btnDelete: TBitBtn;
    qryChk: TffQuery;
    qryInactiveusername: TStringField;
    Label1: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
    procedure btnShowInactiveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInactive: TfrmInactive;

implementation

uses uMain;

{$R *.dfm}

procedure TfrmInactive.FormShow(Sender: TObject);
begin
  btnShowInactive.Click;
  
end;

procedure TfrmInactive.btnActivateClick(Sender: TObject);
var intrecid, intQuestion: integer;
    stremployeename: string;
begin
    //validate
    if (not qryInactive.Active) or (qryInactive.RecordCount=0) then
    begin
        messageDlg('Failed! No selected record.',mtError, [mbOk],0);
    end
    else
    begin

        intrecid:= qryInactiverecid.Value;
        stremployeename:= qryInactiveemployeename.AsString;
        intQuestion:= messageDlg('Activate ' + qryInactiveemployeename.AsString + '?',mtConfirmation,[mbYes,mbNo],0);
        if intQuestion <> 6 then //<>mrYes
        begin
         exit;
        end;

        with frmMain.qryChk do
        begin
         Close;
         SQL.clear;
         SQL.Add('Update tblUser');
         SQL.Add('Set activated=1');
         SQL.Add('Where recid=:para1');
         ParamByName('para1').Value:= intrecid;
         ExecSql;
         Close;
        end;
        btnShowInactive.Click;
        frmMain.btnShow.Click;
        frmMain.edtSearch.Text:= stremployeename;
    end;
end;

procedure TfrmInactive.btnShowInactiveClick(Sender: TObject);
begin
    qryInactive.Close;
  with qryInactive do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select * From tbluser');
        SQL.Add('Where activated<>1');
        SQL.Add('Order by employeename');
        Open;
    end;
end;

procedure TfrmInactive.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
    end;

    if (key = vk_escape) then
    begin
       //frmInactive.Close;
    end;
end;

procedure TfrmInactive.btnDeleteClick(Sender: TObject);
var
    intrecid, intQuestion: integer;
begin

    //validate
    if not (qryInactive.Active) or (qryInactive.RecordCount=0) then
    begin
        messageDlg('No record to delete!',mtError, [mbOk],0);
        exit;
    end;

    

    intrecid:= qryInactiverecid.Value;

    intQuestion:= messageDlg('Delete ' + qryInactiveemployeename.AsString,mtConfirmation,[mbYes,mbNo],0);
    if intQuestion <> 6 then //<>mrYes
    begin
        exit;
    end;

    with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Delete From tblUser');
        SQL.Add('Where recid=:asrecid');
        ParamByName('asrecid').Value:= intrecid;
        ExecSql;
        Close;
    end;
    btnShowInactive.Click;
end;

procedure TfrmInactive.btnSearchClick(Sender: TObject);
begin

    if trim(edtSearch.Text)<>'' then
    begin
        with qryInactive do
        begin
            Close;
            SQL.clear;
            SQL.Add('Select * From tbluser');
            SQL.Add('Where (upper(employeename) like :asemployeename) and activated<>1');
            SQL.Add('Order by employeename');
            ParamByName('asemployeename').Value:= '%' + UpperCase( edtSearch.Text )+ '%';
            Open;
        end;
    end
    else
    begin
        btnShowInactive.Click;
    end;
end;

procedure TfrmInactive.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    btnSearch.Click;
end;

procedure TfrmInactive.btnCloseClick(Sender: TObject);
begin
    frmInactive.Close;
end;

procedure TfrmInactive.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_return) then
    begin
    end;

    if (key = vk_escape) then
    begin
        edtSearch.Text:= '';
    end;
end;

end.
