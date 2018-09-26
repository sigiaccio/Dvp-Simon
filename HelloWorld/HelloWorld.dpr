program HelloWorld;
//{$APPTYPE CONSOLE}

uses
  Vcl.Forms,
  UMain_copie in 'UMain_copie.pas' {FHelloWorld},
  Upopupmodal in 'Upopupmodal.pas' {popupmodal},
  lib.log in '..\..\EPFC-Apps\XE2\Lib\lib.log.pas',
  lib.windows in '..\..\EPFC-Apps\XE2\Lib\lib.windows.pas',
  lib.validation.field in 'Lib\lib.validation.field.pas',
  CalcWeekAF in 'CalcWeekAF.pas' {Form1};

{$R *.res}
begin
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFHelloWorld, FHelloWorld);
  Application.CreateForm(Tpopupmodal, popupmodal);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

