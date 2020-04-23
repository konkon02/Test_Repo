program testProject1;

uses
  Vcl.Forms,
  testUnit1 in 'testUnit\testUnit1.pas' {Form1},
  Unit2 in 'testUnit2\Unit2.pas' {Form2},
  Unit3 in 'testUnit3\Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
