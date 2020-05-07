program testProject1;

uses
  Vcl.Forms,
  testUnit1 in 'testUnit\testUnit1.pas' {Form1},
  Unit2 in 'testUnit2\Unit2.pas' {Form2},
  Unit3 in 'testUnit3\Unit3.pas' {Form3},
  Unit4 in 'testUnit4\Unit4.pas' {Form4},
  Unit5 in 'testUnit4\Unit5.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TForm2, Form2);
  //Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
