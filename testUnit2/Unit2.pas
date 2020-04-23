{
 画像を開く、表示、保存のテストプログラム
 参考サイト
 http://www.ne.jp/asahi/aaa/tach1394/delphi/0400/02.htm
 http://www.ne.jp/asahi/aaa/tach1394/delphi/0400/05.htm
}
unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Jpeg,
  Vcl.ExtDlgs;
  // 上記、'Jpeg'を追加

type
  TForm2 = class(TForm)
    Image1: TImage;     // 画像表示
    Button1: TButton;   // 画像を開くボタン
    Button2: TButton;   // 画像を保存するボタン
    OpenPictureDialog1: TOpenPictureDialog;   // 画像を開く処理を行う既存コンポーネント
    SavePictureDialog1: TSavePictureDialog;   // 画像の保存を行う既存のコンポーネント
    procedure Button1Click(Sender: TObject);  // 画像を開くイベントハンドラ
    procedure Button2Click(Sender: TObject);  // 画像を保存するイベントハンドラ
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
    //オープンピクチャーダイアログを呼び出す
    if OpenPictureDialog1.Execute then begin

       //ImageコンポーネントのPictureにファイルの画像を貼り付ける
       Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    //セーブピクチャーダイアログを呼出s
    if SavePictureDialog1.Execute then begin

      // ImageコンポーネントのPictureに描かれた画像を保存する
      Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
    end;

end;

end.
