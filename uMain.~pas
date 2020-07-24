unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ffdb, ffllcomm, fflllgcy,
  ffllbase, ffllcomp, fflleng, ffsrintm, ffsreng, ffdbbase, ffclreng, uAdd;

type
  TfrmMain = class(TForm)
    DBGrid1: TDBGrid;
    btnAdd: TBitBtn;
    btnDeactivate: TBitBtn;
    btnView: TBitBtn;
    btnGenerate: TBitBtn;
    lblRecCount: TLabel;
    Trans1: TffLegacyTransport;
    RSE1: TFFRemoteServerEngine;
    Comms1: TffCommsEngine;
    ffSession1: TffSession;
    tbluser: TffTable;
    tbluserrecid: TAutoIncField;
    tbluseremployeename: TStringField;
    tbluserpassword: TStringField;
    tbluserregion_id: TSmallintField;
    tbluseractivated: TSmallintField;
    tbluserAccess_id: TSmallintField;
    dsUserList: TDataSource;
    btnEdit: TBitBtn;
    qryAcct: TffQuery;
    qryChk: TffQuery;
    qryAcctrecid: TAutoIncField;
    qryAcctemployeename: TStringField;
    qryAcctpassword: TStringField;
    qryAcctregion_id: TSmallintField;
    qryAcctactivated: TSmallintField;
    qryAcctAccess_id: TSmallintField;
    qryAcctdateentered: TDateTimeField;
    qryAcctdatemodified: TDateTimeField;
    qryAcctenteredby: TStringField;
    qryAcctmodifiedby: TStringField;
    btnShow: TBitBtn;
    edtSearch: TEdit;
    Label2: TLabel;
    btnImport: TBitBtn;
    qryAcctusername: TStringField;
    tbluserusername: TStringField;
    qryAcctregionname: TStringField;
    qryAcctbranchname: TStringField;
    qryAcctemployeeid: TStringField;
    qryAccttinid: TStringField;
    qryAcctemailaddress: TStringField;
    qryHist: TffQuery;
    tbluserregionname: TStringField;
    tbluserbranchname: TStringField;
    tbluseremployeetype: TStringField;
    tbluserdateentered: TDateTimeField;
    tbluserenteredby: TStringField;
    tbluserbranchcode: TStringField;
    qryAcctbranchcode: TStringField;
    qryAcctemployeetype: TStringField;
    qryDefault: TffQuery;
    qryDefaultrecid: TAutoIncField;
    qryDefaultusername: TStringField;
    qryDefaultemployeename: TStringField;
    qryDefaultpassword: TStringField;
    qryDefaultregion_id: TSmallintField;
    qryDefaultactivated: TSmallintField;
    qryDefaultaccess_id: TSmallintField;
    qryDefaultregionname: TStringField;
    qryDefaultbranchname: TStringField;
    qryDefaultbranchcode: TStringField;
    qryDefaultemployeeid: TStringField;
    qryDefaultemployeetype: TStringField;
    qryDefaulttinid: TStringField;
    qryDefaultemailaddress: TStringField;
    qryDefaultdateentered: TDateTimeField;
    qryDefaultdatemodified: TDateTimeField;
    qryDefaultenteredby: TStringField;
    qryDefaultmodifiedby: TStringField;
    btnSearch: TBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnDeactivateClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public
    { Public declarations }
    gsUser: string;
  end;

var
  frmMain: TfrmMain;

implementation

uses uInactive, uEdit, uFilter, uRcgUser, uSelectServer, StrUtils;

{$R *.dfm}



procedure TfrmMain.btnAddClick(Sender: TObject);
begin
    frmAdd.edtEmployeeName.Text:= '';
    frmAdd.edtusername.Text:= '';
    frmAdd.edtpassword.Text:= '';
    frmAdd.edtEmailAddress.Text:= '';
    frmAdd.cboBranch.ItemIndex:= 8;
    frmAdd.cboEmployeeType.ItemIndex:= 1;
    frmAdd.ShowModal;
end;

procedure TfrmMain.btnViewClick(Sender: TObject);
begin
    frmInactive.ShowModal;
end;

procedure TfrmMain.btnShowClick(Sender: TObject);
begin
    with qryAcct do
    begin
        Close;
        SQL.clear;
        SQL.Add('Select * From tbluser');
        SQL.Add('Where activated=1');
        SQL.Add('Order by employeename');
        Open;
    end;
    lblRecCount.Caption:= 'Record(s): ' + IntToStr(qryAcct.RecordCount);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
    if gsUser<>'jcastillo' then
    begin
        btnImport.Visible:=false;
    end;

    if not Trans1.Enabled then
    begin
        Trans1.Enabled:= true;
    end;

    frmMain.Caption:= 'Intranet Account Maintenance - ' + frmSelectServer.cboServerName.Text;

    frmUserLogin.hide;
    btnShow.Click;
end;

procedure TfrmMain.edtSearchChange(Sender: TObject);
begin
    //qryAcct.Locate('employeename', edtSearch.Text, [loPartialKey]);
    btnSearch.Click;
end;

procedure TfrmMain.btnDeactivateClick(Sender: TObject);
var intrecid, intQuestion: integer;
begin
    //validate
    if (not qryAcct.Active) or (qryAcct.RecordCount=0) then
    begin
        messageDlg('Failed! No selected record.',mtError, [mbOk],0);
    end;

     intrecid:= qryAcctrecid.Value;
     intQuestion:= messageDlg('Deactivate ' + qryAcctemployeename.AsString + '?',mtConfirmation,[mbYes,mbNo],0);
     if intQuestion <> 6 then //<>mrYes
     begin
         exit;
     end;

     with qryChk do
     begin
         Close;
         SQL.clear;
         SQL.Add('Update tblUser');
         SQL.Add('Set activated=0');
         SQL.Add('Where recid=:para1');
         ParamByName('para1').Value:= intrecid;
         ExecSql;
         Close;
     end;

     btnShow.Click;
end;

procedure TfrmMain.btnEditClick(Sender: TObject);
begin
    //populate the dropdown branch
    frmEdit.cboBranch.Items.Clear;
    frmEdit.btnPopulate.Click;
    frmEdit.btnEmpType.Click;

    //validate
    if not (qryAcct.Active) or (qryAcct.RecordCount=0) then
    begin
        messageDlg('No record to edit!',mtError, [mbOk],0);
        exit;
    end;
    frmEdit.intrecid_edit:= qryAcctrecid.Value;
    frmEdit.edtusername.Text:= qryAcctusername.AsString;
    frmEdit.edtEmployeeName.Text:=  qryAcctemployeename.AsString;
    frmEdit.edtpassword.Text:= qryAcctpassword.AsString;
    frmEdit.edtBranchCode.Text:= qryAcctbranchcode.AsString;
    frmEdit.edtRegionCode.Text:= qryAcctregion_id.AsString;
    frmEdit.edtRegionname.Text:= qryAcctregionname.AsString;
    frmEdit.edtEmailAddress.Text:= qryAcctemailaddress.AsString;
    frmEdit.cboEmployeeType.ItemIndex:= frmEdit.cboEmployeeType.Items.IndexOf(qryAcctemployeetype.AsString);
    frmEdit.ShowModal;

end;

procedure TfrmMain.btnGenerateClick(Sender: TObject);
var
  myFile : TextFile;
  text   : string;
  filename: string;
  tab: Char;
  intCount, intQuestion: integer;
begin
    //confirmation
    intQuestion:= messageDlg('Generate text file?',mtConfirmation,[mbYes,mbNo],0);
    if intQuestion <> 6 then //<>mrYes
    begin
        exit;
    end;


    //logged
    with qryChk do
    begin
        Close;
        SQL.clear;
        SQL.Add('Insert into Logs(username, activity, loginDT)');
        SQL.Add('Values(:asusername, :asactivity, :asLoginDT)');
        ParamByName('asusername').Value:= gsUser;
        ParamByName('asactivity').Value:= 'Generate Report';
        ParamByName('asLoginDT').Value:= now();
        ExecSql;
        Close;
    end;


    tab := chr(9);
    intCount:= 0;

  if not DirectoryExists('C:\Delphi Programs') then
  begin
    CreateDir('C:\Delphi Programs');
    ShowMessage('Folder (C:\Delphi Programs) was created.');
  end;


  filename:= 'C:\Delphi Programs\tbl_user.txt';
  if not FileExists(filename) then
  begin
      FileClose(FileCreate(filename));

  end;

  // Try to open the Test.txt file for writing to
  AssignFile(myFile, filename);
  ReWrite(myFile);

  //first loop in the default 20 users from tblusersdefault table
  with qryDefault do
  begin
      Close;
      SQL.clear;
      SQL.Add('Select * From tblUserDefault');
      SQL.Add('Order by recid');
      Open;
  end;

  // Write a couple of well known words to this file
  //WriteLn(myFile, 'Hello World');
    qryDefault.First;
    while not qryDefault.Eof do
    begin
        intCount:= intCount + 1;
        if (qryDefaultusername.AsString='RCG_Admin') or (qryDefaultusername.AsString='SGM') then
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '1' + tab + '0' + tab+ '1' + tab + '0';
            Writeln(myFile, text);
        end
        else if (qryDefaultusername.AsString='mike') then
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '1' + tab + '0' + tab+ '1' + tab + '1';
            Writeln(myFile, text);
        end
        else if qryDefaultusername.AsString='RCG_web' then
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '1' + tab + '1' + tab+ '1' + tab + '1';
            Writeln(myFile, text);
        end
        else if (qryDefaultusername.AsString='New Employee') or (qryDefaultusername.AsString='New Per Diem')then
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '0' + tab + '1' + tab+ '1' + tab + '1';
            Writeln(myFile, text);
        end
        else if (qryDefaultusername.AsString='softrigger2') or (qryDefaultusername.AsString='joyces')then
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '0' + tab + '7' + tab+ '0' + tab + '1';
            Writeln(myFile, text);
        end
        else if (qryDefaultusername.AsString='hrdept') or (qryDefaultusername.AsString='robin') or (qryDefaultusername.AsString='robinc') or (qryDefaultusername.AsString='softtrigger') or (qryDefaultusername.AsString='test') or (qryDefaultusername.AsString='rcgintraadmin') or (qryDefaultusername.AsString='mariajbarile') or (qryDefaultusername.AsString='nancytaylor') or (qryDefaultusername.AsString='marktest')    or (qryDefaultusername.AsString='marksgoze') or (qryDefaultusername.AsString='manson') or (qryDefaultusername.AsString='mb') then
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '1' + tab + '0' + tab+ '0' + tab + '0';
            Writeln(myFile, text);
        end
        else if qryDefaultusername.AsString='robin' then
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '1' + tab + '0' + tab+ '0' + tab + '0';
            Writeln(myFile, text);
        end
        else
        begin
            text:= IntToStr(intCount) +tab+ qryDefaultusername.AsString + tab + qryDefaultpassword.AsString + tab + qryDefaultemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '0' + tab + qryDefaultregion_id.AsString + tab+ '1' + tab + '1';
            Writeln(myFile, text);
        end;
    qryDefault.Next;
    end;

    //20 line above+
    qryAcct.First;
    while not qryAcct.Eof do
    begin
        intCount:= intCount + 1;
        text:= IntToStr(intCount) +tab+ qryAcctusername.AsString + tab + qryAcctpassword.AsString + tab + qryAcctemployeename.AsString +tab+tab+tab+tab+ '0' + tab + '0' + tab + qryAcctregion_id.AsString + tab+ '1' + tab + '1';
        Writeln(myFile, text);
    qryAcct.Next;
    end;
    //qryAcct.Close;

  // Close the file
  CloseFile(myFile);

  qryAcct.First;
  messageDlg('(' + filename + ') successfully created!'  ,mtInformation,[mbOk],0);

  // Reopen the file for reading
  //Reset(myFile);

  // Display the file contents
  //while not Eof(myFile) do
  //begin
    //ReadLn(myFile, text);
  //end;

  // Close the file for the last time
  //CloseFile(myFile);
end;

procedure TfrmMain.btnImportClick(Sender: TObject);
var
  myFile : TextFile;
  text   : string;
  filename: string;
  tab: Char;
  intCount: integer;
  intLen: integer;
  strValue: string;
  intChar: integer;
  intlasttabchar: integer;
  stremployeename, strregion, strpassword, strusername: string;
  intValueSequence, intQuestion: integer;
  strbranchname, strbranchcode, strregionname, stremployeetype, stremployeecode : string;
begin
    tab := chr(9);
    intCount:= 0;

  filename:= 'C:\Delphi Programs\tbl_user_new.txt';
  if not FileExists(filename) then
  begin
    messageDlg(filename + ' does not exist!',mtInformation,[mbOk],0);
  end;

  //confirm import
  intQuestion:= messageDlg('Import C:\Delphi Programs\tbl_user_new.txt?',mtConfirmation,[mbYes,mbNo],0);
  if intQuestion <> 6 then //<>mrYes
  begin
      exit;
  end;

  // Try to open the Test.txt file for writing to
  AssignFile(myFile, filename);

  // Reopen the file for reading
  Reset(myFile);

  //Display the file contents
  intCount:= 0;
  intlasttabchar:= 0;

  
  while not Eof(myFile) do
  begin
    intCount:= intCount+1;
    ReadLn(myFile, text);
    intLen:= Length(text);
    intValueSequence:= 0;
    stremployeename:= '';
    strregion:= '';
    strpassword:='';
    strusername:= '';
    strbranchname:= '';
    strbranchcode:= '';
    strregionname:= '';
    stremployeetype:= '';
    stremployeecode:= '';


        for intChar := 1 to intLen do
        begin
            //get the tab position
            if text[intChar] = tab then
            begin
                intValueSequence:= intValueSequence+1;
                intlasttabchar:= intChar;
            end
            else
            begin
                if intValueSequence=0 then
                begin
                    //this is just a sequence number
                end
                else if intValueSequence=1 then
                begin
                    strusername:=strusername+text[intChar];
                end
                else if intValueSequence=2 then
                begin
                    strpassword:=strpassword+text[intChar];
                end
                else if intValueSequence=3 then
                begin
                    stremployeename:=stremployeename+text[intChar];
                end

                else if intValueSequence=9 then
                begin
                    strregion:=strregion+text[intChar];
                end
                else if intValueSequence=12 then
                begin
                    strregionname:=strregionname+text[intChar];
                end
                else if intValueSequence=13 then
                begin
                    strbranchname:=strbranchname+text[intChar];
                end
                else if intValueSequence=14 then
                begin
                    strbranchcode:=strbranchcode+text[intChar];
                end
                else if intValueSequence=15 then
                begin
                    stremployeetype:=stremployeetype+text[intChar];
                end
            end;
        end;

        stremployeecode:= RightStr( strbranchcode , 2);
        strbranchcode:= LeftStr(strbranchcode,2);
        
        if stremployeetype='Manila Administrative' then
        begin
            stremployeetype:= 'Administrative';
        end
        else if stremployeetype='Manila Consultant' then
        begin
            stremployeetype:= 'Consultant';
        end;

        //for first 20 blank regionname etc
        if stremployeetype='' then
        begin
            stremployeetype:= 'Administrative';
        end;
        if strregionname='' then
        begin
            strregionname:= 'CORPORATE';
        end;
        if strbranchname='' then
        begin
            strbranchname:= 'BACK OFFICE DEPARTMENT';
        end;
        if strbranchcode='' then
        begin
            strbranchcode:= '98';
        end;


        //ShowMessage(strusername + tab + strpassword +tab+ stremployeename + tab + strregion);
        if not tbluser.Active then tbluser.Open;
        tbluser.Insert;
        tbluserusername.Value:= strusername;
        tbluserpassword.Value:= strpassword;
        tbluseremployeename.Value:= stremployeename;
        tbluserregion_id.Value:= StrToInt(strregion);
        tbluserAccess_id.Value:= 1;
        tbluserregionname.Value:= strregionname;
        tbluserbranchname.Value:= strbranchname;
        tbluserbranchcode.Value:= strbranchcode;
        tbluseremployeetype.Value:= UpperCase(stremployeetype);
        tbluser.Post;

        lblRecCount.Caption:= 'Importing ' + strusername;
        lblRecCount.Refresh;

  end;

  // Close the file for the last time
  CloseFile(myFile);
  btnShow.Click;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Halt;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
begin
    with frmMain do
    begin
        with qryAcct do
        begin
            Close;
            SQL.clear;
            SQL.Add('Select * From tbluser');
            SQL.Add('Where (upper(employeename) like :asemployeename) and activated=1');
            SQL.Add('Order by employeename');
            ParamByName('asemployeename').Value:= '%' + UpperCase( edtSearch.Text )+ '%';
            Open;
        end;
    lblRecCount.Caption:= 'Record(s): ' + IntToStr(qryAcct.RecordCount);
    end;
end;

procedure TfrmMain.edtSearchKeyDown(Sender: TObject; var Key: Word;
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
