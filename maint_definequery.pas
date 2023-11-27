unit maint_definequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, 
  maint_frTopBar;

type
  TISFDefineQuery = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwbSubmitQuery: TIWButton;
    iwcbEquipment: TIWCheckBox;
    iwlEquipment: TIWListbox;
    iwcbTechnicians: TIWCheckBox;
    iwlTechnicians: TIWListbox;
    iwcbCategories: TIWCheckBox;
    iwlCategories: TIWListbox;
    iwcbRooms: TIWCheckBox;
    iwlRooms: TIWListbox;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    IWButton1: TIWButton;
    iwcbManufacturers: TIWCheckBox;
    iwlManufacturers: TIWListbox;
    iwcbCompanies: TIWCheckBox;
    iwlCompanies: TIWListbox;
    iwlblError: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure TopBariwlSignOutClick(Sender: TObject);
    procedure IWAppFormShow(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses maint_dm, ServerController, maint_frGrid, maint_constants,
  DB_List_Combo, usrIW_dm;

{$R *.dfm}


procedure TISFDefineQuery.IWAppFormCreate(Sender: TObject);
begin
  iwlblError.Visible := false;
end;

procedure TISFDefineQuery.iwbSubmitQueryClick(Sender: TObject);
begin
  //dmUser.SetDeveloperData('start submitquery');
  UserSession.IncludeEquipmentValues := iwcbEquipment.Checked;
  UserSession.IncludeCategoryValues := iwcbCategories.Checked;
  UserSession.IncludeTechnicianValues := iwcbTechnicians.Checked;
  UserSession.IncludeRoomValues := iwcbRooms.Checked;
  UserSession.IncludeManufacturerValues := iwcbManufacturers.Checked;
  UserSession.IncludeCompanyValues := iwcbCompanies.Checked;
  GetListBoxValues(iwlEquipment,dmR.cdsEquipment,'EQUIPMENT','ID',UserSession.EquipmentValues);
  GetListBoxValues(iwlCategories,dmR.cdsCategories,'CATEGORY','ID',UserSession.CategoryValues);
  GetListBoxValues(iwlTechnicians,dmR.cdsTechnicians,'TECHNICIAN','TECHNICIANID',UserSession.TechnicianValues);
  GetListBoxValues(iwlRooms,dmR.cdsRooms,'Room','ID',UserSession.RoomValues);
  GetListBoxValues(iwlManufacturers,dmR.cdsManufacturers,'Manufacturer','ManufacturerID',UserSession.ManufacturerValues);
  GetListBoxValues(iwlCompanies,dmR.cdsCompanies,'CompanyName','SetupID',UserSession.CompanyValues);
  if ((UserSession.IncludeEquipmentValues) and (UserSession.EquipmentValues.Count = 0)) then UserSession.IncludeEquipmentValues := false;
  if ((UserSession.IncludeCategoryValues) and (UserSession.CategoryValues.Count = 0)) then UserSession.IncludeCategoryValues := false;
  if ((UserSession.IncludeTechnicianValues) and (UserSession.TechnicianValues.Count = 0)) then UserSession.IncludeTechnicianValues := false;
  if ((UserSession.IncludeRoomValues) and (UserSession.RoomValues.Count = 0)) then UserSession.IncludeRoomValues := false;
  if ((UserSession.IncludeManufacturerValues) and (UserSession.ManufacturerValues.Count = 0)) then UserSession.IncludeManufacturerValues := false;
  if ((UserSession.IncludeCompanyValues) and (UserSession.CompanyValues.Count = 0)) then UserSession.IncludeCompanyValues := false;
  if Validate then
  begin
    //dmUser.SetDeveloperData('before SetCookies');
    UserSession.SetCookies;
    //dmUser.SetDeveloperData('before submitquery');
    dmR.SubmitQuery;
    //dmUser.SetDeveloperData('submitted submitquery');
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFGrid.Create(WebApplication).Show
  end;
end;

procedure TISFDefineQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

procedure TISFDefineQuery.IWAppFormShow(Sender: TObject);
begin
  dmR.qRooms.Close;
  dmR.qRooms.ParamByName('COMPANYID').AsString := UserSession.CompanyValues.Strings[0];
  iwcbEquipment.Checked := UserSession.IncludeEquipmentValues;
  iwcbCategories.Checked := UserSession.IncludeCategoryValues;
  iwcbTechnicians.Checked := UserSession.IncludeTechnicianValues;
  iwcbRooms.Checked := UserSession.IncludeRoomValues;
  iwcbManufacturers.Checked := UserSession.IncludeManufacturerValues;
  iwcbCompanies.Checked := UserSession.IncludeCompanyValues;
  UpdateListBoxValues(iwlEquipment,dmR.cdsEquipment,'EQUIPMENT','ID',UserSession.EquipmentValues);
  UpdateListBoxValues(iwlCategories,dmR.cdsCategories,'CATEGORY','ID',UserSession.CategoryValues);
  UpdateListBoxValues(iwlTechnicians,dmR.cdsTechnicians,'TECHNICIAN','TECHNICIANID',UserSession.TechnicianValues);
  UpdateListBoxValues(iwlRooms,dmR.cdsRooms,'Room','ID',UserSession.RoomValues);
  UpdateListBoxValues(iwlManufacturers,dmR.cdsManufacturers,'Manufacturer','ManufacturerID',UserSession.ManufacturerValues);
  UpdateListBoxValues(iwlCompanies,dmR.cdsCompanies,'CompanyName','SetupID',UserSession.CompanyValues);
end;

function TISFDefineQuery.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if ((UserSession.EquipmentValues.Count = 0) and UserSession.IncludeEquipmentValues) then UserSession.IncludeEquipmentValues := false;
  if ((UserSession.CategoryValues.Count = 0) and UserSession.IncludeCategoryValues) then UserSession.IncludeCategoryValues := false;
  if ((UserSession.TechnicianValues.Count = 0) and UserSession.IncludeTechnicianValues) then UserSession.IncludeTechnicianValues := false;
  if ((UserSession.RoomValues.Count = 0) and UserSession.IncludeRoomValues) then UserSession.IncludeRoomValues := false;
  if ((UserSession.ManufacturerValues.Count = 0) and UserSession.IncludeManufacturerValues) then UserSession.IncludeManufacturerValues := false;
  if ((UserSession.CompanyValues.Count = 0) and UserSession.IncludeCompanyValues) then UserSession.IncludeCompanyValues := false;
  if (not UserSession.IncludeEquipmentValues and not UserSession.IncludeCategoryValues
    and not UserSession.IncludeTechnicianValues and not UserSession.IncludeRoomValues
    and not UserSession.IncludeManufacturerValues and not UserSession.IncludeCompanyValues) then
  begin
    Result := false;
    iwlblError.Visible := true;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFDefineQuery.TopBariwlSignOutClick(Sender: TObject);
begin
  TopBar.iwlSignOutClick(Sender);
end;

end.
