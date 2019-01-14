program HelloWorld;
//{$APPTYPE CONSOLE}

uses
  Vcl.Forms,
  UMain_copie in 'UMain_copie.pas' {FHelloWorld},
  Upopupmodal in 'Upopupmodal.pas' {popupmodal},
  lib.log in '..\..\EPFC-Apps\XE2\Lib\lib.log.pas',
  lib.windows in '..\..\EPFC-Apps\XE2\Lib\lib.windows.pas',
  lib.validation.field in 'Lib\lib.validation.field.pas',
  CalcWeekAF in 'CalcWeekAF.pas' {Form1},
  codes_postaux in 'codes_postaux.pas' {Form_cp},
  Uvilles in 'Uvilles.pas' {frm_villes};

{$R *.res}
begin
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFHelloWorld, FHelloWorld);
  Application.CreateForm(Tpopupmodal, popupmodal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_cp, Form_cp);
  Application.CreateForm(Tfrm_villes, frm_villes);
  //Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

