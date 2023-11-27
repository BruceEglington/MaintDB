unit maint_frProductTree;

interface

uses
  Windows, Messages, SysUtils, {$IFNDEF VER130}Variants,{$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, IWBaseControl, IWControl, IWCompLabel,
  IWHTMLControls, IWCompExtCtrls, IWHTMLTag, IWCompRectangle,
  IWContainer, IWRegion, IWVCLBaseControl, IWBaseHTMLControl,
  IWVCLBaseContainer, IWHTMLContainer, IWHTML40Container;

type
  TISFProductTree = class(TFrame)
    IWFrameRegion: TIWRegion;
    rectRight: TIWRectangle;
    iwregPageLinks: TIWRegion;
    iwlDefineQuery: TIWLink;
    iwlMainPage: TIWLink;
    IWImage1: TIWImage;
    iwlEquipment: TIWLink;
    procedure iwlDefineQueryClick(Sender: TObject);
    procedure iwlMainPageClick(Sender: TObject);
    procedure iwlEquipmentClick(Sender: TObject);
  protected
  public
  end;

implementation
{$R *.dfm}

uses
  IWColor, IWAppForm, IWForm, IWInit,
//  uDocumentation,
  ServerController, IWApplication, maint_uMain, maint_definequery,
  maint_equipment;

{ TISFProductTree }

procedure TISFProductTree.iwlDefineQueryClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlMainPageClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFProductTree.iwlEquipmentClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFEquipment.Create(WebApplication).Show;
end;

end.
