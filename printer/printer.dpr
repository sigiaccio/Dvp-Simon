program printer;

uses
  Vcl.Forms,
  imprimante in '..\imprimante.pas' {Form1};
  //,EDSPrint in 'EDSPrint.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
