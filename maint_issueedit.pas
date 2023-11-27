unit maint_issueedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, maint_frTopBar,
  IWCompMemo;

type
  TISFIssueEdit = class(TIWAppForm)
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    IWLabel2: TIWLabel;
    iwDBlcbCompleted: TIWDBLookupComboBox;
    iwDBlcbEquipment: TIWDBLookupComboBox;
    TopBar: TISFTopBar;
    iwDBeIssueID: TIWDBEdit;
    IWLabel3: TIWLabel;
    iwDBeProblemShort: TIWDBEdit;
    IWLabel4: TIWLabel;
    iwDBedateEntered: TIWDBEdit;
    IWLabel5: TIWLabel;
    iwDBeDateRepaired: TIWDBEdit;
    IWLabel6: TIWLabel;
    iwDBlcbTechnician: TIWDBLookupComboBox;
    IWLabel7: TIWLabel;
    iwDBlcbCategory: TIWDBLookupComboBox;
    IWLabel8: TIWLabel;
    iwDBmProblem: TIWDBMemo;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    iwDBmSolution: TIWDBMemo;
    iwbEdit: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, maint_dm, maint_constants, maint_frGrid;




procedure TISFIssueEdit.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFIssueEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwbSaveChanges.Visible := UserSession.CanModify;
    iwbCancelChanges.Visible := UserSession.CanModify;
    iwDBeIssueID.Editable := false;
    iwDBlcbEquipment.Editable := UserSession.CanModify;
    iwDBeProblemShort.Editable := UserSession.CanModify;
    iwDBeDateEntered.Editable := UserSession.CanModify;
    iwDBeDateRepaired.Editable := UserSession.CanModify;
    iwDBlcbCompleted.Editable := UserSession.CanModify;
    iwDBlcbTechnician.Editable := UserSession.CanModify;
    iwDBlcbCategory.Editable := UserSession.CanModify;
    iwDBmProblem.Editable := UserSession.CanModify;
    iwDBmSolution.Editable := UserSession.CanModify;
  end;
  dmR.cdsEquipment.Open;
  dmR.cdsTechnicians.Open;
  dmR.cdsCategories.Open;
  dmR.cdsYesNo.Open;
  dmR.qIssueDetails.Close;
  dmR.qIssueDetails.ParamByName('ISSUEID').AsString := UserSession.ParameterChosen;
  dmR.cdsIssueDetails.Close;
  dmR.cdsIssueDetails.Open;
end;

procedure TISFIssueEdit.iwbReturnClick(Sender: TObject);
begin
  dmR.cdsEquipment.Close;
  dmR.cdsTechnicians.Close;
  dmR.cdsCategories.Close;
  dmR.cdsIssueDetails.Close;
  dmR.cdsYesNo.Close;
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFGrid.Create(WebApplication).Show;
end;

procedure TISFIssueEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmR.cdsIssueDetails.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIssueEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmR.cdsIssueDetails.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;


procedure TISFIssueEdit.iwbEditClick(Sender: TObject);
begin
  dmR.cdsIssueDetails.Edit;
end;

end.
