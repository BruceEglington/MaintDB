unit maint_dm;

interface

uses
  {$IFDEF Linux}QForms, {$ELSE}Forms, {$ENDIF}
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, WideStrings, DBXDevartInterBase;

type
  TdmR = class(TDataModule)
    sqlcMaintDB: TSQLConnection;
    Query1: TSQLQuery;
    dspQuery1: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    dsQuery1: TDataSource;
    qCategories: TSQLQuery;
    qCompanies: TSQLQuery;
    qEquipment: TSQLQuery;
    qManufacturers: TSQLQuery;
    qRooms: TSQLQuery;
    qTechnicians: TSQLQuery;
    dspCategories: TDataSetProvider;
    dspCompanies: TDataSetProvider;
    dspEquipment: TDataSetProvider;
    dspManufacturers: TDataSetProvider;
    dspRooms: TDataSetProvider;
    dspTechnicians: TDataSetProvider;
    cdsCategories: TClientDataSet;
    cdsCompanies: TClientDataSet;
    cdsEquipment: TClientDataSet;
    cdsManufacturers: TClientDataSet;
    cdsRooms: TClientDataSet;
    cdsTechnicians: TClientDataSet;
    dsCategories: TDataSource;
    dsCompanies: TDataSource;
    dsEquipment: TDataSource;
    dsManufacturers: TDataSource;
    dsRooms: TDataSource;
    dsTechnicians: TDataSource;
    qCategoriesID: TSmallintField;
    qCategoriesCATEGORY: TStringField;
    cdsCategoriesID: TSmallintField;
    cdsCategoriesCATEGORY: TStringField;
    qCompaniesSETUPID: TIntegerField;
    qCompaniesCOMPANYNAME: TStringField;
    cdsCompaniesSETUPID: TIntegerField;
    cdsCompaniesCOMPANYNAME: TStringField;
    qEquipmentID: TSmallintField;
    qEquipmentEQUIPMENT: TStringField;
    qEquipmentROOMID: TSmallintField;
    qEquipmentMANUFACTURERID: TSmallintField;
    qEquipmentCELL: TStringField;
    qEquipmentPHONE: TStringField;
    qEquipmentFAX: TStringField;
    qEquipmentCONTACT: TStringField;
    qEquipmentEMAIL: TStringField;
    qEquipmentCOMMENTS: TBlobField;
    cdsEquipmentID: TSmallintField;
    cdsEquipmentEQUIPMENT: TStringField;
    cdsEquipmentROOMID: TSmallintField;
    cdsEquipmentMANUFACTURERID: TSmallintField;
    cdsEquipmentCELL: TStringField;
    cdsEquipmentPHONE: TStringField;
    cdsEquipmentFAX: TStringField;
    cdsEquipmentCONTACT: TStringField;
    cdsEquipmentEMAIL: TStringField;
    cdsEquipmentCOMMENTS: TBlobField;
    qManufacturersMANUFACTURERID: TSmallintField;
    qManufacturersMANUFACTURER: TStringField;
    qManufacturersCITY: TStringField;
    qManufacturersSTATEPROV: TStringField;
    qManufacturersCOUNTRY: TStringField;
    qManufacturersCELL: TStringField;
    qManufacturersPHONE: TStringField;
    qManufacturersFAX: TStringField;
    qManufacturersEMAIL: TStringField;
    qManufacturersWEBSITE: TStringField;
    qManufacturersCONTACT: TStringField;
    qManufacturersCOMMENTS: TBlobField;
    cdsManufacturersMANUFACTURERID: TSmallintField;
    cdsManufacturersMANUFACTURER: TStringField;
    cdsManufacturersCITY: TStringField;
    cdsManufacturersSTATEPROV: TStringField;
    cdsManufacturersCOUNTRY: TStringField;
    cdsManufacturersCELL: TStringField;
    cdsManufacturersPHONE: TStringField;
    cdsManufacturersFAX: TStringField;
    cdsManufacturersEMAIL: TStringField;
    cdsManufacturersWEBSITE: TStringField;
    cdsManufacturersCONTACT: TStringField;
    cdsManufacturersCOMMENTS: TBlobField;
    qRoomsID: TSmallintField;
    qRoomsROOM: TStringField;
    qRoomsCOMPANYID: TSmallintField;
    cdsRoomsID: TSmallintField;
    cdsRoomsROOM: TStringField;
    cdsRoomsCOMPANYID: TSmallintField;
    qTechniciansTECHNICIANID: TSmallintField;
    qTechniciansTECHNICIAN: TStringField;
    cdsTechniciansTECHNICIANID: TSmallintField;
    cdsTechniciansTECHNICIAN: TStringField;
    Query1ISSUEID: TIntegerField;
    Query1PROBLEMSHORT: TStringField;
    Query1DATEENTERED: TSQLTimeStampField;
    Query1COMPLETE: TStringField;
    cdsQuery1ISSUEID: TIntegerField;
    cdsQuery1PROBLEMSHORT: TStringField;
    cdsQuery1DATEREPAIRED: TSQLTimeStampField;
    cdsQuery1DATEENTERED: TSQLTimeStampField;
    cdsQuery1COMPLETE: TStringField;
    Query1EQUIPMENT: TStringField;
    cdsQuery1EQUIPMENT: TStringField;
    Query1DATEREPAIRED: TSQLTimeStampField;
    qIssueDetails: TSQLQuery;
    qIssueDetailsISSUEID: TIntegerField;
    qIssueDetailsPROBLEMSHORT: TStringField;
    qIssueDetailsPROBLEM: TBlobField;
    qIssueDetailsEQUIPMENTID: TSmallintField;
    qIssueDetailsTECHNICIANID: TSmallintField;
    qIssueDetailsSOLUTION: TMemoField;
    qIssueDetailsDATEREPAIRED: TSQLTimeStampField;
    qIssueDetailsDATEENTERED: TSQLTimeStampField;
    qIssueDetailsCATEGORYID: TSmallintField;
    qIssueDetailsCOMPLETE: TStringField;
    dspIssueDetails: TDataSetProvider;
    cdsIssueDetails: TClientDataSet;
    dsIssueDetails: TDataSource;
    cdsIssueDetailsISSUEID: TIntegerField;
    cdsIssueDetailsPROBLEMSHORT: TStringField;
    cdsIssueDetailsPROBLEM: TBlobField;
    cdsIssueDetailsEQUIPMENTID: TSmallintField;
    cdsIssueDetailsTECHNICIANID: TSmallintField;
    cdsIssueDetailsSOLUTION: TMemoField;
    cdsIssueDetailsDATEREPAIRED: TSQLTimeStampField;
    cdsIssueDetailsDATEENTERED: TSQLTimeStampField;
    cdsIssueDetailsCATEGORYID: TSmallintField;
    cdsIssueDetailsCOMPLETE: TStringField;
    qYesNo: TSQLQuery;
    qYesNoYESNOID: TStringField;
    qYesNoYESNO: TStringField;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    cdsYesNoYESNOID: TStringField;
    cdsYesNoYESNO: TStringField;
    qMaxIssue: TSQLQuery;
    dspMaxIssue: TDataSetProvider;
    cdsMaxIssue: TClientDataSet;
    dsMaxIssue: TDataSource;
    qMaxIssueMAX: TIntegerField;
    cdsMaxIssueMAX: TIntegerField;
    qMaxEquip: TSQLQuery;
    qMaxEquipMAX: TSmallintField;
    dspMaxEquip: TDataSetProvider;
    cdsMaxEquip: TClientDataSet;
    dsMaxEquip: TDataSource;
    cdsMaxEquipMAX: TSmallintField;
    SQLMonitor1: TSQLMonitor;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
  public
    //procedure GetFormData;
    //procedure SetFormData;
    procedure ConstructQuery;
    procedure SubmitQuery;
  end;

// Procs
  function dmR: TdmR;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  Variants, usrIW_dm, maint_constants;

// Since we are threaded we cannot use global variables to store form / datamodule references
// so we store them in WebApplication.Data and we could reference that each time, but by creating
// a function like this our other code looks "normal" almost as if its referencing a global.
// This function is not necessary but it makes the code in the main form which references this
// datamodule a lot neater.
// Without this function every time we would reference this datamodule we would use:
//   TDataModule1(WebApplication.Data).Datamodule.<method / component>
// By creating this procedure it becomes:
//   TDataModule1.<method / component>
// Which is just like normal Delphi code.

function dmR: TdmR;
begin
  Result := TUserSession(WebApplication.Data).dmR;
end;


procedure TdmR.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

{
procedure TdmR.GetFormData;
var
  V: Variant;
begin
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  V := dmUser.cdsUserInfoSESSIONINFO.AsVariant;
  dmUser.cdsUserInfo.Close;
end;

procedure TdmR.SetFormData2(SQLMemoField : string);
begin
  UserSession.WhereAmI := 'SetFormData';
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  if (dmUser.cdsUserInfo.RecordCount = 0) then
  begin
    dmUser.cdsUserInfo.Append;
    dmUser.cdsUserInfoUSERNAMEID.AsString := UserSession.UserID;
    dmUser.cdsUserInfoSOFTWAREID.AsString := UserSession.ThisProgram;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := SQLMemoField;
    dmUser.cdsUserInfo.Post;
  end else
  begin
    dmUser.cdsUserInfo.Edit;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := SQLMemoField;
    dmUser.cdsUserInfo.Post;
  end;
  dmUser.cdsUserInfo.ApplyUpdates(0);
  dmUser.cdsUserInfo.Close;
end;
}

procedure TdmR.ConstructQuery;
var
  i : integer;
begin
  dmR.cdsQuery1.Close;
  dmR.Query1.Close;
  dmR.Query1.SQL.Clear;
  dmR.Query1.SQL.Add('select EquipDetails.Equipment, Issues.IssueId, Issues.ProblemShort,');
  dmR.Query1.SQL.Add('  Issues.DateEntered, Issues.DateRepaired, Issues.Complete');
  dmR.Query1.SQL.Add('from ISSUES, EQUIPDETAILS, CATEGORIES, MANUFACTURERS, COMPANIES, ROOMS, TECHNICIANS');
  dmR.Query1.SQL.Add('where Issues.EquipmentId=EquipDetails.ID');
  dmR.Query1.SQL.Add('and Issues.CategoryID=Categories.ID');
  dmR.Query1.SQL.Add('and EquipDetails.ManufacturerID=Manufacturers.ManufacturerID');
  dmR.Query1.SQL.Add('and Issues.TechnicianID=Technicians.TechnicianID');
  dmR.Query1.SQL.Add('and EquipDetails.RoomID=Rooms.ID');
  dmR.Query1.SQL.Add('and Rooms.CompanyID=Companies.SetupID');
  if UserSession.IncludeEquipmentValues then
  begin
    dmR.Query1.SQL.Add('and (Issues.EquipmentID='+''''+UserSession.EquipmentValues.Strings[0]+'''');
    if (UserSession.EquipmentValues.Count > 1) then
    begin
      for i := 2 to UserSession.EquipmentValues.Count do
      begin
        dmR.Query1.SQL.Add('or Issues.EquipmentID='+''''+UserSession.EquipmentValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeCategoryValues then
  begin
    dmR.Query1.SQL.Add('and (Issues.CategoryID='+''''+UserSession.CategoryValues.Strings[0]+'''');
    if (UserSession.CategoryValues.Count > 1) then
    begin
      for i := 2 to UserSession.CategoryValues.Count do
      begin
        dmR.Query1.SQL.Add('or Issues.CategoryID='+''''+UserSession.CategoryValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeTechnicianValues then
  begin
    dmR.Query1.SQL.Add('and (Issues.TechnicianID='+''''+UserSession.TechnicianValues.Strings[0]+'''');
    if (UserSession.TechnicianValues.Count > 1) then
    begin
      for i := 2 to UserSession.TechnicianValues.Count do
      begin
        dmR.Query1.SQL.Add('or Issues.TechnicianID='+''''+UserSession.TechnicianValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeRoomValues then
  begin
    dmR.Query1.SQL.Add('and (Rooms.ID='+''''+UserSession.RoomValues.Strings[0]+'''');
    if (UserSession.RoomValues.Count > 1) then
    begin
      for i := 2 to UserSession.RoomValues.Count do
      begin
        dmR.Query1.SQL.Add('or Rooms.ID='+''''+UserSession.RoomValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeManufacturerValues then
  begin
    dmR.Query1.SQL.Add('and (EquipDetails.ManufacturerID='+''''+UserSession.ManufacturerValues.Strings[0]+'''');
    if (UserSession.ManufacturerValues.Count > 1) then
    begin
      for i := 2 to UserSession.ManufacturerValues.Count do
      begin
        dmR.Query1.SQL.Add('or EquipDetails.ManufacturerID='+''''+UserSession.ManufacturerValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeCompanyValues then
  begin
    dmR.Query1.SQL.Add('and (Rooms.CompanyID='+''''+UserSession.CompanyValues.Strings[0]+'''');
    if (UserSession.CompanyValues.Count > 1) then
    begin
      for i := 2 to UserSession.CompanyValues.Count do
      begin
        dmR.Query1.SQL.Add('or Rooms.CompanyID='+''''+UserSession.CompanyValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
end;

procedure TdmR.SubmitQuery;
begin
  dmR.ConstructQuery;
  //UserSession.SQLMemoField.Text := dmR.Query1.SQL.Text;
  dmUser.SetFormData2(dmR.Query1.SQL.Text);
end;

end.
