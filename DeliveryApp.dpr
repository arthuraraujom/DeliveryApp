program DeliveryApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.item in 'view\view.item.pas' {view_item},
  view.main in 'view\view.main.pas' {Form1},
  commons.types in 'commons\commons.types.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tview_item, view_item);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
