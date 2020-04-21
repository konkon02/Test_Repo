unit testUnit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

var cnt : Integer;
begin
    //cnt := StrToInt(Button1.Caption);
    //cnt := cnt + 1;

    //Button1.Caption := IntToStr(cnt);


    //test
    // Button1を押下するとCaptinoをカウント
    // 以下は上記コードを１行にまとめたコード
    Button1.Caption := IntToStr(StrToInt(Button1.Caption)+1);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    // Button1のCaptinoを0に設定(クリア)
    Button1.Caption := '0';
end;

end.
