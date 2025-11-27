{
  ISFMain main user window

  This is the first page the user sees when accessing this application.
}

unit maint_uMain;

interface

uses
  System.IOUtils,
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompButton, Forms,
  IWCompRectangle, IWCompLabel, IWDBStdCtrls,
  IWCompText, IWCompExtCtrls,
  IWCompMemo, IWCompCheckbox, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion,
  IWHTMLControls, WideStrings,
  IniFiles,
  FMTBcd, DB, DBClient, Provider, SqlExpr, IWCompGrids, IWDBGrids,
  maint_frProductTree, maint_frTopBar, IWHTML40Container;

type
  TISFMain = class(TIWAppForm)
    lblWelcome: TIWLabel;
    TopBar: TISFTopBar;
    IWLabel1: TIWLabel;
    IWLabel3: TIWLabel;
    IWDBLabel1: TIWDBLabel;
    IWDBMemo1: TIWDBMemo;
    IWRegion1: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    LeftTree: TISFProductTree;
    iwlNumUses: TIWLabel;
    iwbPermissions: TIWButton;
    iwbCheckIniFile: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure LeftTreeiwlDefineQueryClick(Sender: TObject);
    procedure TopBarlnkSignInClick(Sender: TObject);
    procedure iwbPermissionsClick(Sender: TObject);
    procedure iwbCheckIniFileClick(Sender: TObject);
  public
  protected
    procedure LoadWelcomeMessage;
  end;

type
  TISFMainClass = class of TISFMain;

implementation
{$R *.dfm}

uses
  ServerController, usrIW_dm, IWColor, Graphics, jpeg,
  IWBaseForm, maint_dm, maint_constants, usr_constants;

procedure TISFMain.IWAppFormCreate(Sender: TObject);
var
  progstr : string;
begin
  progstr := WebApplication.RunParams.Values[ 'progname' ];
  UserSession.ThisProgram := 'MaintDB';
  //dmUser.SetDeveloperData('StratDB FormCreate');
  //TopBar.lblProgTitle.Text := 'StratDB Database';
  TopBar.lblWelcome.Text := 'Hello';
  if (UserSession.LoggedIn) then LoadWelcomeMessage;       //bme
end;

procedure TISFMain.LoadWelcomeMessage;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmUser.qProgress.Close;
  dmUser.qProgress.ParamByName('SoftwareID').AsString := UserSession.ThisProgram;
  dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
  dmUser.cdsProgress.Close;
  dmUser.cdsProgress.Open;
end;

procedure TISFMain.TopBarlnkSignInClick(Sender: TObject);
begin
  TopBar.SignIn(Sender);
end;

procedure TISFMain.IWAppFormRender(Sender: TObject);
begin
  LeftTree.iwregPageLinks.Visible := UserSession.LoggedIn;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('testing');
    //dmUser.SetDeveloperData(tmpcheckstr);
  end;
  if UserSession.IsDeveloper then
  begin
    dmUser.qNumTimesUsed.Close;
    dmUser.qNumTimesUsed.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsNumTimesUsed.Close;
    dmUser.cdsNumTimesUsed.Open;
    iwlNumUses.Caption := 'This program has been used '+dmUser.cdsNumTimesUsedNUMTIMESUSED.AsString+' times';
    dmUser.cdsNumTimesUsed.Close;
      iwbPermissions.Visible := false;
      iwbCheckIniFile.Visible := false;
    if ((UserSession.ShowDebugButtons) and (UserSession.IsDeveloper) and (UserSession.LoggedIn)) then
    begin
      iwbPermissions.Visible := true;
      iwbCheckIniFile.Visible := true;
    end else
    begin
      iwbPermissions.Visible := false;
      iwbCheckIniFile.Visible := false;
    end;
  end else
  begin
    iwlNumUses.Caption := '';
  end;
end;

procedure TISFMain.iwbCheckIniFileClick(Sender: TObject);
var
  AppIni   : TIniFile;
  tmpStr   : string;
  iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DriverName,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  MaintDBPath,
  DBUserName, DBPassword,DBSpecific,DBSQLDialectStr,DBCharSet,
  DataPath   : string;
  PublicPath : string;
begin
  PublicPath := TPath.GetPublicPath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'maintdb.ini';
  WebApplication.ShowMessage(IniFilename);
  AppIni := TIniFile.Create(IniFilename);
  try
    //URLBase := AppIni.ReadString('URLBase','URLBase','/stratdb');
    URLBase := AppIni.ReadString('URLBase','URLBase','/');
    if (URLBase = '/') then URLBase := '';
    WebApplication.ShowMessage('URLBase is ***'+URLBase+'***');
    UserControlPath := AppIni.ReadString('Paths','UserControl path','C:/Data/Firebird/UserControl2025v30_utf8.fdb');
    WebApplication.ShowMessage(UserControlPath);
    MaintDBPath := AppIni.ReadString('Paths','MaintDB path','C:/Data/Firebird/MaintDB2025v30_utf8.fdb');
    WebApplication.ShowMessage(MaintDBPath);
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    WebApplication.ShowMessage(DriverName);
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','masterkey');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','UTF8');
    DebugButtons := AppIni.ReadString('Debug','Buttons','active');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','active');
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
    WebApplication.ShowMessage(FromEmailAddress);
    WebApplication.ShowMessage(FromName);
    WebApplication.ShowMessage(HostName);
    WebApplication.ShowMessage(HostPort);
    WebApplication.ShowMessage(EmailUserID);
    WebApplication.ShowMessage(EmailPassword);
    WebApplication.ShowMessage(URLonTerminate);
  finally
    AppIni.Free;
  end;
end;

procedure TISFMain.iwbPermissionsClick(Sender: TObject);
begin
  if not UserSession.IsDeveloper then WebApplication.ShowMessage('IsDeveloper is FALSE')
                                 else WebApplication.ShowMessage('IsDeveloper is TRUE');
  if not UserSession.CanModify then WebApplication.ShowMessage('CanModify is FALSE')
                                 else WebApplication.ShowMessage('CanModify is TRUE');
  if not UserSession.CanInsert then WebApplication.ShowMessage('CanInsert is FALSE')
                                 else WebApplication.ShowMessage('CanInsert is TRUE');
  if not UserSession.CanDelete then WebApplication.ShowMessage('CanDelete is FALSE')
                                 else WebApplication.ShowMessage('CanDelete is TRUE');
  if not UserSession.CanValidate then WebApplication.ShowMessage('CanValidate is FALSE')
                                 else WebApplication.ShowMessage('CanValidate is TRUE');
  if not UserSession.CanExport then WebApplication.ShowMessage('CanExport is FALSE')
                                 else WebApplication.ShowMessage('CanExport is TRUE');
  if not UserSession.CanViewPlus then WebApplication.ShowMessage('CanViewPlus is FALSE')
                                 else WebApplication.ShowMessage('CanViewPlus is TRUE');
  if not UserSession.CanModifyPlus then WebApplication.ShowMessage('CanModifyPlus is FALSE')
                                 else WebApplication.ShowMessage('CanModifyPlus is TRUE');
  dmUser.cdsDevInfo.Close;
  dmUser.cdsDevInfo.Open;
  //dmUser.qTest.ExecSQL(false);
  dmUser.InsertDeveloperData('main page InsertDeveloperData');
  dmUser.SetDeveloperData('main page SetDeveloperData');
end;

procedure TISFMain.LeftTreeiwlDefineQueryClick(Sender: TObject);
begin
  //dmUser.SetDeveloperData('before define query');
  LeftTree.iwlDefineQueryClick(Sender);
end;

initialization
  TISFMain.SetAsMainForm;
end.
