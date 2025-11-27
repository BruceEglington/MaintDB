program MaintDB;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  IWRtlFix,
  IWStart,
  Forms,
  ServerController in 'ServerController.pas' {IWServerController: TIWServerController},
  maint_uMain in 'maint_uMain.pas',
  maint_frTopBar in 'maint_frTopBar.pas' {ISFTopBar: TFrame},
  maint_frProductTree in 'maint_frProductTree.pas' {ISFProductTree: TFrame},
  maint_frGrid in 'maint_frGrid.pas' {ISFGrid: TIWAppForm},
  usr_constants in '..\WebUserIW\usr_constants.pas',
  maint_definequery in 'maint_definequery.pas' {ISFDefineQuery: TIWAppForm},
  usr_uDBInterface in '..\WebUserIW\usr_uDBInterface.pas',
  usr_uLogin in '..\WebUserIW\usr_uLogin.pas' {ISFLogin: TIWAppForm},
  usr_uRegister in '..\WebUserIW\usr_uRegister.pas' {ISFRegister: TIWAppForm},
  maint_issueedit in 'maint_issueedit.pas' {ISFIssueEdit: TIWAppForm},
  maint_equipment in 'maint_equipment.pas' {ISFEquipment: TIWAppForm},
  usr_insufficientright in '..\WebUserIW\usr_insufficientright.pas' {ISFInsufficientRights: TIWAppForm},
  maint_equipdetails in 'maint_equipdetails.pas' {ISFEquipDetails: TIWAppForm},
  maint_constants in 'maint_constants.pas',
  usr_uChangeDetails in '..\WebUserIW\usr_uChangeDetails.pas' {ISFChangeUserDetails: TIWAppForm},
  usr_uForgotten in '..\WebUserIW\usr_uForgotten.pas' {ISFForgotten: TIWAppForm},
  usr_uRenew in '..\WebUserIW\usr_uRenew.pas' {ISFRenew: TIWAppForm},
  usrIW_dm in '..\WebUserIW\usrIW_dm.pas' {dmUser: TDataModule},
  usr_cookies in '..\WebUserIW\usr_cookies.pas',
  DB_List_Combo in '..\Eglington Delphi common code items\DB_List_Combo.pas',
  Allsorts in '..\Eglington Delphi common code items\Allsorts.pas',
  ErrCodes in '..\Eglington Delphi common code items\ErrCodes.pas',
  Mathproc in '..\Eglington Delphi common code items\Mathproc.pas',
  NumRecipes in '..\Eglington Delphi common code items\NumRecipes.pas',
  NumRecipes_varb in '..\Eglington Delphi common code items\NumRecipes_varb.pas',
  maint_dm in 'maint_dm.pas' {dmR: TDataModule};

{$R *.res}

begin
  TIWStart.Execute(true);
end.

