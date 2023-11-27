unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  //UserSessionUnit,
  IWApplication, IWAppForm,
  IWGlobal,
  Windows,
  IniFiles,
  IW.Common.AppInfo,
  IW.Browser.Browser,
  midaslib,
  usrIW_dm,
  maint_dm,
  maint_constants;


type
  TIWServerController = class(TIWServerControllerBase)
    //procedure IWServerControllerBaseBrowserCheck(aSession: TIWApplication;
    //  var rBrowser: TBrowser);
    procedure IWServerControllerBaseGetMainForm(var vMainForm: TIWBaseForm);
    procedure IWServerControllerBaseNewSession(aSession: TIWApplication);
  private
    procedure GetIniFile;
  public
  end;

  // This is a class which you can add variables to that are specific to the user. Add variables
  // to this class instead of creating global variables. This object can references by using:
  //   UserSession
  // So if a variable named UserName of type string is added, it can be referenced by using:
  //   UserSession.UserName
  // Such variables are similar to globals in a normal application, however these variables are
  // specific to each user.
  //
  // See the IntraWeb Manual for more details.
  TUserSession = class(TComponent)
  public
    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only

    {
    this group of parameters need to be present in all
    EggSoft programs to facilitate user control and testing.
    }
    UserID, UserPassword : string;
    //SQLMemoField: TStringList;
    //UserAccessRights : TStringList;
    ThisProgram : string;
    ThisProgramName : string;
    CanView : boolean;
    CanModify : boolean;
    CanInsert : boolean;
    CanDelete : boolean;
    IsDeveloper : boolean;
    CanValidate : boolean;

    CanExportGraphValues : boolean;
    CanViewPlus : boolean;
    CanModifyPlus : boolean;
    CanExport : boolean;

    //UserSessionID : integer;
    ThisLoginTime : TDateTime;
    WhereAmI :  string;
    ShowDebugButtons : boolean;
    DelayConnections : boolean;
    //NumUserRightsItems : integer;

    {
    this group of parameters is needed by most
    EggSoft programs to facilitate grid paging and record location.
    }
    RecordChosen : string;
    ParameterChosen: string;
    UnitSender : string;
    PageNum, PageNumTotal : integer;

    UserDisplayName,
    UserLastName, UserFirstName, UserEMail : string;

    IncludeEquipmentValues : boolean;
    EquipmentValues : TStringList;
    IncludeCategoryValues : boolean;
    CategoryValues : TStringList;
    IncludeTechnicianValues: Boolean;
    TechnicianValues: TStringList;
    IncludeRoomValues: Boolean;
    RoomValues: TStringList;
    IncludeManufacturerValues: Boolean;
    ManufacturerValues: TStringList;
    IncludeCompanyValues: Boolean;
    CompanyValues: TStringList;
    OrderByValue: string;

    //tmpStrList : TStringList;


    dmUser : TdmUser;
    dmR : TdmR;

    procedure NeedLogin(AForm : TIWAppFormClass);
    procedure AfterLogin;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetCookies;
    procedure GetCookies;
    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
  end;

// Procs
  function UserSession: TUserSession;
  function IWServerController: TIWServerController;

implementation
{$R *.dfm}

uses
  System.IOUtils,
  IWInit,
  usr_uLogin, usr_uregister, XMLDoc, XMLIntf,
  maint_umain,
  usr_uDBInterface, NumRecipes_varb,
  usr_insufficientright, usr_constants;


function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

function UserSession: TUserSession;
begin
  Result := TUserSession(WebApplication.Data);
end;

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
  tmpStr   : string;
  iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  DriverName,
  LibraryName, VendorLib, GetDriverFunc,
  IniFileName,
  IniFileNameAppInfo,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  MaintDBPath,
  DBUserName, DBPassword,DBSpecific,DBSQLDialectStr,DBCharSet,
  DataPath   : string;
  PublicPath : string;
begin
  URLBase := '/';
  DBMonitor := 'Inactive';
  //UserSession.ShowDebugButtons := false;
  //UserSession.DelayConnections := false;
  UserControlPath := 'bromo2.usask.ca:s:\Data\Firebird\UserControl2021v30.fdb';
  MaintDBPath := 'bromo2.usask.ca:s:\Data\Firebird\MaintDB2021v30.fdb';
  DriverName := 'DevartInterBase';
  LibraryName := 'dbexpida41.dll';
  VendorLib := 'fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'masterkey';
  DBSQLDialectStr := '3';
  DBCharSet := 'ASCII';

  PublicPath := TPath.GetPublicPath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'maintdb.ini';
  IniFileNameAppInfo := ChangeFileExt(TIWAppInfo.GetAppFullFileName, '.ini');
  AppIni := TIniFile.Create(IniFilename);
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/maintdb');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','bromo2.usask.ca:s:\Data\Firebird\UserControl2021v30.fdb');
    MaintDBPath := AppIni.ReadString('Paths','MaintDB path','bromo2.usask.ca:s:\Data\Firebird\MaintDB2021v30.fdb');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','V0lcano3^');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','Active');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Active');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;
    FromEmailAddress := AppIni.ReadString('Email','FromEmailAddress','aht820@usask.ca');
    FromName := AppIni.ReadString('Email','FromName','EggSoft developer and database administrator');
    HostName := AppIni.ReadString('Email','HostName','smtp.office365.com');
    HostPort := AppIni.ReadString('Email','HostPort','587');
    EmailUserID := AppIni.ReadString('Email','EmailUserID','aht820@usask.ca');
    EmailPassword := AppIni.ReadString('Email','EmailPassword','nuC7Sy3Af4bu');
    URLonTerminate := AppIni.ReadString('URL','URLonTerminate','http://sil.usask.ca');
    FromEmailAddress := Trim(FromEmailAddress);
    FromName := Trim(FromName);
    HostName := Trim(HostName);
    HostPort := Trim(HostPort);
    EmailUserID := Trim(EmailUserID);
    EmailPassword := Trim(EmailPassword);
    URLonTerminate := Trim(URLonTerminate);
    //define connection parameters for UserControl connection
    dmUser.sqlcWebUser.Connected := false;
    dmUser.sqlcWebUser.Params.Clear;
    dmUser.sqlcWebUser.DriverName := DriverName;
    dmUser.sqlcWebUser.LibraryName := LibraryName;
    dmUser.sqlcWebUser.VendorLib := VendorLib;
    dmUser.sqlcWebUser.GetDriverFunc := GetDriverFunc;
    dmUser.sqlcWebUser.Params.Append('DriverName='+DriverName);
    dmUser.sqlcWebUser.Params.Append('Database='+UserControlPath);
    dmUser.sqlcWebUser.Params.Append('User_Name='+DBUserName);
    dmUser.sqlcWebUser.Params.Append('Password='+DBPassword);
    dmUser.sqlcWebUser.Params.Append('SQLDialect='+DBSQLDialectStr);
    dmUser.sqlcWebUser.Params.Append('Charset='+DBCharSet);
    dmUser.sqlcWebUser.Params.Append('LocaleCode=0000');
    dmUser.sqlcWebUser.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
    dmUser.sqlcWebUser.Params.Append('WaitOnLocks=True');
    dmUser.sqlcWebUser.Params.Append('CharLength=1');
    dmUser.sqlcWebUser.Params.Append('EnableBCD=True');
    dmUser.sqlcWebUser.Params.Append('OptimizedNumerics=false');
    dmUser.sqlcWebUser.Params.Append('LongStrings=True');
    dmUser.sqlcWebUser.Params.Append('UseQuoteChar=False');
    dmUser.sqlcWebUser.Params.Append('FetchAll=False');
    dmUser.sqlcWebUser.Params.Append('UseUnicode=False');
    //define connection parameters for MaintDB connection
    dmR.sqlcMaintDB.Connected := false;
    dmR.sqlcMaintDB.Params.Clear;
    dmR.sqlcMaintDB.DriverName := DriverName;
    dmR.sqlcMaintDB.LibraryName := LibraryName;
    dmR.sqlcMaintDB.VendorLib := VendorLib;
    dmR.sqlcMaintDB.Params.Append('DriverName='+DriverName);
    dmR.sqlcMaintDB.Params.Append('Database='+MaintDBPath);
    dmR.sqlcMaintDB.Params.Append('User_Name='+DBUserName);
    dmR.sqlcMaintDB.Params.Append('Password='+DBPassword);
    dmR.sqlcMaintDB.Params.Append('SQLDialect='+DBSQLDialectStr);
    dmR.sqlcMaintDB.Params.Append('Charset='+DBCharSet);
    dmR.sqlcMaintDB.Params.Append('LocaleCode=0000');
    dmR.sqlcMaintDB.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
    dmR.sqlcMaintDB.Params.Append('WaitOnLocks=True');
    dmR.sqlcMaintDB.Params.Append('CharLength=1');
    dmR.sqlcMaintDB.Params.Append('EnableBCD=True');
    dmR.sqlcMaintDB.Params.Append('OptimizedNumerics=false');
    dmR.sqlcMaintDB.Params.Append('LongStrings=True');
    dmR.sqlcMaintDB.Params.Append('UseQuoteChar=False');
    dmR.sqlcMaintDB.Params.Append('FetchAll=False');
    dmR.sqlcMaintDB.Params.Append('UseUnicode=False');
    if (DBMonitor = 'Active') then
    begin
      dmUser.SQLMonitor1.Active := true;
      //dmR.SQLMonitor1.Active := true;
    end else
    begin
      dmUser.SQLMonitor1.Active := false;
      //dmR.SQLMonitor1.Active := false;
    end;
    tmpcheckstr := UserControlPath;
  finally
    AppIni.Free;
  end;
end;

{
procedure TIWServerController.IWServerControllerBaseBrowserCheck(
  aSession: TIWApplication; var rBrowser: TBrowser);
var
  MinVersion: Single;
begin
  // unknown browser
  if (rBrowser is TOther) then begin
    rBrowser.Free;
    // accept the unknown browser as Internet Explorer 8
    rBrowser := TInternetExplorer.Create(8);
  end
  // if is Safari, but older version
  else if (rBrowser is TSafari) and (not rBrowser.IsSupported) then begin
    MinVersion := rBrowser.MinSupportedVersion;
    rBrowser.Free;
    // we will create it as the minimum supported version
    rBrowser := TSafari.Create(MinVersion);
  end
  // if is Chrome, but older version
  else if (rBrowser is TChrome) and (not rBrowser.IsSupported) then begin
    MinVersion := rBrowser.MinSupportedVersion;
    rBrowser.Free;
    // we will create it as the minimum supported version
    rBrowser := TChrome.Create(MinVersion);
  end
  // if is Firefox, but older version
  else if (rBrowser is TFirefox) and (not rBrowser.IsSupported) then begin
    MinVersion := rBrowser.MinSupportedVersion;
    rBrowser.Free;
    // we will create it as the minimum supported version
    rBrowser := TFirefox.Create(MinVersion);
  end
  // if is IE, but older version
  else if (rBrowser is TInternetExplorer) and (not rBrowser.IsSupported) then begin
    MinVersion := rBrowser.MinSupportedVersion;
    rBrowser.Free;
    // we will create it as the minimum supported version
    rBrowser := TInternetExplorer.Create(MinVersion);
  end;
end;
}

procedure TIWServerController.IWServerControllerBaseGetMainForm(
  var vMainForm: TIWBaseForm);
begin
  vMainForm := TISFMain.Create(WebApplication);
end;


procedure TIWServerController.IWServerControllerBaseNewSession(
  aSession: TIWApplication);
begin
  ASession.Data := TUserSession.Create(nil);  //note this is a TUserSession
                                              //NOT to be confused with TIWUserSession
  GetIniFile;
end;

constructor TUserSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  //UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmR := TdmR.Create(Self);
  dmUser.sqlcWebUser.Connected := false;
  dmR.sqlcMaintDB.Connected := false;
  //UserAccessRights := TStringList.Create;

  EquipmentValues := TStringList.Create;
  CategoryValues := TStringList.Create;
  TechnicianValues := TStringList.Create;
  RoomValues := TStringList.Create;
  ManufacturerValues := TStringList.Create;
  CompanyValues := TStringList.Create;
  //tmpStrList := TStringList.Create;
  //SQLMemoField := TStringList.Create;
end;

destructor TUserSession.Destroy;
begin
  FreeAndNil(EquipmentValues);
  FreeAndNil(CategoryValues);
  FreeAndNil(TechnicianValues);
  FreeAndNil(RoomValues);
  FreeAndNil(ManufacturerValues);
  FreeAndNil(CompanyValues);
  //FreeAndNil(UserAccessRights);
  //FreeAndNil(tmpStrList);
  //FreeAndNil(SQLMemoField);
  dmR.sqlcMaintDB.Connected := false;
  dmUser.sqlcWebUser.Connected := false;
  inherited Destroy;
end;

procedure TUserSession.AfterLogin;
begin
  UserSession.WhereAmI := 'AfterLogin';
  UserSession.ThisProgram := 'MaintDB';
  UserSession.ThisProgramName := 'MaintDB';
  LoggedIn := TRUE;
  UserSession.CanView := false;
  UserSession.CanModify := false;
  UserSession.CanInsert := false;
  UserSession.CanDelete := false;
  UserSession.IsDeveloper := false;
  UserSession.CanValidate := false;
  IncrementNumUses(UserSession.ThisProgram);
  CheckRights(UserSession.ThisProgram,UserSession.UserID,UserSession.UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  UserSession.IncludeCompanyValues := true;
  UserSession.CompanyValues.Add('1');
  {
  UserSession.EquipmentValues.Add('Neptune');
  UserSession.CategoryValues.Add('HCl');
  UserSession.TechnicianValues.Add('Ba2');
  UserSession.RoomValues.Add('Ca2');
  UserSession.ManufacturerValues.Add('Fe3');
  UserSession.CompanyValues.Add('Sr2');
  }

  UserSession.GetCookies;

  if not UserSession.CanView then
  begin
    LoggedIn := false;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFInsufficientRights.Create(WebApplication).Show
  end else
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
         LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
      TISFMain.Create(WebApplication).Show
    else
      LastVisitedForm.Create(WebApplication).Show;
  end;
end;

procedure TUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  if LoggedIn then begin
  end;
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TUserSession.SetCookies;
var
  tmpString : string;
  tmpANSIstring : ANSIstring;
  i : integer;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    AStringList.Clear;
    if UserSession.IncludeEquipmentValues then
    begin
      AStringList.Add('IncludeEquipmentValues='+IntToStr(UserSession.EquipmentValues.Count));
      for i := 1 to UserSession.EquipmentValues.Count do
      begin
        AStringList.Add('EquipmentValues='+UserSession.EquipmentValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeCategoryValues then
    begin
      AStringList.Add('IncludeCategoryValues='+IntToStr(UserSession.CategoryValues.Count));
      for i := 1 to UserSession.CategoryValues.Count do
      begin
        AStringList.Add('CategoryValues='+UserSession.CategoryValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeTechnicianValues then
    begin
      AStringList.Add('IncludeTechnicianValues='+IntToStr(UserSession.TechnicianValues.Count));
      for i := 1 to UserSession.TechnicianValues.Count do
      begin
        AStringList.Add('TechnicianValues='+UserSession.TechnicianValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeRoomValues then
    begin
      AStringList.Add('IncludeRoomValues='+IntToStr(UserSession.RoomValues.Count));
      for i := 1 to UserSession.RoomValues.Count do
      begin
        AStringList.Add('RoomValues='+UserSession.RoomValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeManufacturerValues then
    begin
      AStringList.Add('IncludeManufacturerValues='+IntToStr(UserSession.ManufacturerValues.Count));
      for i := 1 to UserSession.ManufacturerValues.Count do
      begin
        AStringList.Add('ManufacturerValues='+UserSession.ManufacturerValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeCompanyValues then
    begin
      AStringList.Add('IncludeCompanyValues='+IntToStr(UserSession.CompanyValues.Count));
      for i := 1 to UserSession.CompanyValues.Count do
      begin
        AStringList.Add('CompanyValues='+UserSession.CompanyValues.Strings[i-1]);
      end;
    end;
    if (UserSession.LoggedIn) then
    begin
      tmpstring := AStringList.Text;
      tmpANSIstring := tmpstring;
      //WebApplication.ShowMessage(tmpstring);
      //WebApplication.ShowMessage(tmpstring);
      dmUser.qCookieInfo.Close;
      dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
      dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
      dmUser.cdsCookieInfo.Close;
      dmUser.cdsCookieInfo.Open;
      if (dmUser.cdsCookieInfo.RecordCount > 0) then
      begin
        //WebApplication.ShowMessage('cdsCookieInfo RecordCount > 0');
        //WebApplication.ShowMessage(UserSession.UserID);
        //WebApplication.ShowMessage(UserSession.ThisProgram);
        //WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Edit;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpstring;
        dmUser.cdsCookieInfo.Post;
      end else
      begin
        //WebApplication.ShowMessage('cdsCookieInfo RecordCount = 0');
        //WebApplication.ShowMessage(UserSession.UserID);
        //WebApplication.ShowMessage(UserSession.ThisProgram);
        //WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Append;
        dmUser.cdsCookieInfoUSERID.AsString := UserSession.UserID;
        dmUser.cdsCookieInfoSOFTWAREID.AsString := UserSession.ThisProgram;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpstring;
        dmUser.cdsCookieInfo.Post;
      end;
      WebApplication.ShowMessage(dmUser.cdsCookieInfoCOOKIEINFO.AsString);
      try
        dmUser.cdsCookieInfo.ApplyUpdates(0);
        //WebApplication.ShowMessage('Updates applied to cdsCookieInfo');
        //dmUser.SetDeveloperData(tmpstring);
      except
        WebApplication.ShowMessage('Not able to apply updates to cdsCookieInfo');
      end;
    end;
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetCookies;
var
  tmpString : string;
  i, tmpi, iCode : integer;
  tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      AStringList.Text := dmUser.cdsCookieInfoCOOKIEINFO.AsString;
    end;
    Val(AStringList.Values['IncludeEquipmentValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeEquipmentValues := true;
      UserSession.GetStringsValues(AStringList,'EquipmentValues',UserSession.EquipmentValues);
    end;
    Val(AStringList.Values['IncludeCategoryValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeCategoryValues := true;
      UserSession.GetStringsValues(AStringList,'CategoryValues',UserSession.CategoryValues);
    end;
    Val(AStringList.Values['IncludeTechnicianValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeTechnicianValues := true;
      UserSession.GetStringsValues(AStringList,'TechnicianValues',UserSession.TechnicianValues);
    end;
    Val(AStringList.Values['IncludeRoomValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeRoomValues := true;
      UserSession.GetStringsValues(AStringList,'RoomValues',UserSession.RoomValues);
    end;
    Val(AStringList.Values['IncludeManufacturerValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeManufacturerValues := true;
      UserSession.GetStringsValues(AStringList,'ManufacturerValues',UserSession.ManufacturerValues);
    end;
    Val(AStringList.Values['IncludeCompanyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeCompanyValues := true;
      UserSession.GetStringsValues(AStringList,'CompanyValues',UserSession.CompanyValues);
    end;
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetStringsValues(AStrings: TStrings;
                           AKey: String; AValueList: TStringList);
{from routine published by Bob Swart}
var
  FieldValue: String;
  i, match: Integer;
begin
  AKey := AKey + '=';
  for i:=0 to Pred(AStrings.Count) do
  begin
    FieldValue := AStrings.Strings[i];
    if Pos(AKey, FieldValue) = 1 then { exact match }
    begin
      match := Pos('=', FieldValue);
      if match > 0 then
        AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match))
    end;
  end;
end;


initialization
  TIWServerController.SetServerControllerClass;

end.

