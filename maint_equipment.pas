unit maint_equipment;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl,
  IWCompRectangle, maint_frTopBar, IWCompButton;

type
  TISFEquipment = class(TIWAppForm)
    lblRecordCount: TIWLabel;
    iwDBg: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlSortedBy: TIWLabel;
    iwlPageNum: TIWLabel;
    IWLabel3: TIWLabel;
    iwlPageNumTotal: TIWLabel;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    iwbAddNew: TIWButton;
    iwbReturn: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0Click(ASender: TObject;
      const AValue: String);
    procedure IWDBGrid1ColumnsTitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbAddNewClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, maint_dm, maint_equipdetails, maint_uMain;




procedure TISFEquipment.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    lblRecordCount.Text := IntToStr(dmR.cdsEquipment.RecordCount)+' records match the query specified';
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
    iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
    iwbAddNew.Visible := UserSession.CanInsert;
  end;
end;

procedure TISFEquipment.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFEquipDetails.Create(WebApplication).Show;
end;

procedure TISFEquipment.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmR.cdsEquipment.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFEquipment.iwlPrevPageClick(Sender: TObject);
begin
  dmR.cdsEquipment.MoveBy(-1*iwDBg.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
end;

procedure TISFEquipment.iwlNextPageClick(Sender: TObject);
begin
  dmR.cdsEquipment.MoveBy(iwDBg.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
end;

procedure TISFEquipment.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    dmR.cdsEquipment.Close;
    dmR.cdsEquipment.Open;
    iwlPrevPage.Visible := (dmR.cdsEquipment.RecordCount > iwDBg.RowLimit);
    iwlNextPage.Visible := (dmR.cdsEquipment.RecordCount > iwDBg.RowLimit);
    UserSession.PageNum := 1;
    UserSession.PageNumTotal := dmR.cdsEquipment.RecordCount div iwDBg.RowLimit;
    if ((dmR.cdsEquipment.RecordCount mod iwDBg.RowLimit) <> 0) then UserSession.PageNumTotal := UserSession.PageNumTotal +1;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
    iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
  end;
end;

procedure TISFEquipment.iwbAddNewClick(Sender: TObject);
var
  MaximumItem : integer;
begin
  dmR.cdsMaxEquip.Open;
  MaximumItem := dmR.cdsMaxEquipMAX.AsInteger;
  dmR.cdsMaxEquip.Close;
  dmR.cdsEquipment.Open;
  try
    dmR.cdsEquipment.Append;
    dmR.cdsEquipmentID.AsInteger := MaximumItem + 1;
    dmR.cdsEquipmentEQUIPMENT.AsString := 'NEW';
    dmR.cdsEquipmentROOMID.AsInteger := 0;
    dmR.cdsEquipmentMANUFACTURERID.AsInteger := 0;
    dmR.cdsEquipment.Post;
    UserSession.RecordChosen := IntToStr(MaximumItem + 1);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFEquipDetails.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Unable to insert new record');
  end;
end;

procedure TISFEquipment.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
