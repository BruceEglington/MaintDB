unit maint_equipdetails;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompMemo, IWDBStdCtrls, IWCompListbox, IWCompEdit,
  IWCompButton, IWVCLBaseControl, IWBaseHTMLControl, maint_frTopBar;

type
  TISFEquipDetails = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwDBeContact: TIWDBEdit;
    iwDBlcbManufacturer: TIWDBLookupComboBox;
    iwDBmComments: TIWDBMemo;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iwbCancelChanges: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbReturn: TIWButton;
    iwbDelete: TIWButton;
    rectLeft: TIWRectangle;
    iwDBeEquipmentID: TIWDBEdit;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    iwDBeEquipment: TIWDBEdit;
    iwDBlcbRoom: TIWDBLookupComboBox;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    iwDBePhone: TIWDBEdit;
    IWLabel8: TIWLabel;
    iwDBeFax: TIWDBEdit;
    IWLabel9: TIWLabel;
    iwDBeCell: TIWDBEdit;
    IWLabel10: TIWLabel;
    iwDBeEmail: TIWDBEdit;
    iwbEdit: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, maint_dm, maint_equipment, DB;

procedure TISFEquipDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbEdit.Visible := (dmR.cdsEquipment.State in [dsBrowse]);
  iwbReturn.Visible := (dmR.cdsEquipment.State in [dsBrowse]);
  iwbApplyUpdates.Visible := (dmR.cdsEquipment.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := (dmR.cdsEquipment.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := (dmR.cdsEquipment.State in [dsBrowse]);
end;

procedure TISFEquipDetails.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbApplyUpdates.Visible := UserSession.CanModify;
  iwbCancelChanges.Visible := UserSession.CanModify;
  iwbDelete.Visible := UserSession.CanDelete;
  iwDBeEquipmentID.Editable := false;
  iwDBeEquipment.Editable := UserSession.CanModify;
  iwDBlcbRoom.Editable := UserSession.CanModify;
  iwDBlcbManufacturer.Editable := UserSession.CanModify;
  iwDBeContact.Editable := UserSession.CanModify;
  iwDBePhone.Editable := UserSession.CanModify;
  iwDBeFax.Editable := UserSession.CanModify;
  iwDBeCell.Editable := UserSession.CanModify;
  iwDBeEmail.Editable := UserSession.CanModify;
  iwDBmComments.Editable := UserSession.CanModify;
  dmR.qRooms.Close;
  dmR.qRooms.ParamByName('COMPANYID').AsString := UserSession.CompanyValues.Strings[0];
  dmR.cdsRooms.Close;
  dmR.cdsRooms.Open;
  dmR.cdsManufacturers.Open;
  dmR.cdsEquipment.Locate('ID',UserSession.RecordChosen,[loCaseInsensitive, loPartialKey]);
end;

procedure TISFEquipDetails.iwbReturnClick(Sender: TObject);
begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFEquipment.Create(WebApplication).Show;
end;

procedure TISFEquipDetails.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmR.cdsEquipment.ApplyUpdates(0);
  except
  end;
end;

procedure TISFEquipDetails.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmR.cdsEquipment.CancelUpdates;
  except
  end;
end;

procedure TISFEquipDetails.iwbDeleteClick(Sender: TObject);
begin
  try
    dmR.cdsEquipment.Delete;
    dmR.cdsEquipment.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this record.',smAlert);
  end;
end;

procedure TISFEquipDetails.iwbEditClick(Sender: TObject);
begin
  dmR.cdsEquipment.Edit;
end;

end.
