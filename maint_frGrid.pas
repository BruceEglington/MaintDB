unit maint_frGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl,
  maint_frProductTree, maint_frTopBar, IWCompButton;

type
  TISFGrid = class(TIWAppForm)
    TopBar: TISFTopBar;
    lblRecordCount: TIWLabel;
    iwDBgResults: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlSortedBy: TIWLabel;
    LeftTree: TISFProductTree;
    iwbNewIssue: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1ColumnsTitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwDBgResultsColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwbNewIssueClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, maint_dm, maint_issueedit;




procedure TISFGrid.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    lblRecordCount.Text := IntToStr(dmR.cdsQuery1.RecordCount)+' records match the query specified';
    iwbNewIssue.Visible := UserSession.CanModify;
  end;
end;

procedure TISFGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmR.cdsQuery1.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmR.cdsQuery1.MoveBy(-1*iwDBgResults.RowLimit);
end;

procedure TISFGrid.iwlNextPageClick(Sender: TObject);
begin
  dmR.cdsQuery1.MoveBy(iwDBgResults.RowLimit);
end;

procedure TISFGrid.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    dmR.Query1.Close;
    dmR.cdsQuery1.Close;
    dmR.cdsQuery1.Open;
    iwlPrevPage.Visible := (dmR.cdsQuery1.RecordCount > iwDBgResults.RowLimit);
    iwlNextPage.Visible := (dmR.cdsQuery1.RecordCount > iwDBgResults.RowLimit);
  end;
end;

procedure TISFGrid.iwDBgResultsColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFIssueEdit.Create(WebApplication).Show
end;

procedure TISFGrid.iwbNewIssueClick(Sender: TObject);
var
  MaximumIssue : integer;
begin
  dmR.cdsMaxIssue.Close;
  dmR.cdsMaxIssue.Open;
  MaximumIssue := dmR.cdsMaxIssueMAX.AsInteger;
  dmR.cdsMaxIssue.Close;
  UserSession.ParameterChosen := IntToStr(MaximumIssue + 1);
  dmR.qIssueDetails.Close;
  dmR.qIssueDetails.ParamByName('ISSUEID').AsString := UserSession.ParameterChosen;
  dmR.cdsIssueDetails.Close;
  dmR.cdsIssueDetails.Open;
  try
    dmR.cdsIssueDetails.Append;
    dmR.cdsIssueDetailsISSUEID.AsInteger := MaximumIssue + 1;
    dmR.cdsIssueDetailsPROBLEMSHORT.AsString := '';
    dmR.cdsIssueDetailsPROBLEM.AsString := '';
    dmR.cdsIssueDetailsEQUIPMENTID.AsString := '0';
    dmR.cdsIssueDetailsTECHNICIANID.AsString := '0';
    dmR.cdsIssueDetailsSOLUTION.AsString := '';
    dmR.cdsIssueDetailsDATEENTERED.AsDateTime := Date;
    dmR.cdsIssueDetailsDATEREPAIRED.AsDateTime := Date;
    dmR.cdsIssueDetailsCATEGORYID.AsString := '0';
    dmR.cdsIssueDetailsCOMPLETE.AsString := 'N';
    dmR.cdsIssueDetails.Post;
    dmR.cdsIssueDetails.ApplyUpdates(0);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFIssueEdit.Create(WebApplication).Show
  except
    WebApplication.ShowMessage('Unable to append new record');
  end;
end;

end.
