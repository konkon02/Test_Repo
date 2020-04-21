program testProject1;

uses
  Vcl.Forms,
  testUnit1 in 'testUnit\testUnit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
