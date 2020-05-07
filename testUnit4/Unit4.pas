unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    procedure makec;
    procedure FormCreate(Sender: TObject);
  private
    { Private 宣言 }
    ye,mo:string;
    // ye : 月(西暦)
    // mo : 日(西暦)
    size:integer;
    // size : 全体の大きさを管理する
  public
    { Public 宣言 }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
   ye:=formatdatetime('yyyy',date); //“今日”の西暦を求めます。
   mo:=formatdatetime('m',date);    //“今日”の月を求めます。
   size:=400;                       //“size”をとりあえず４００にしてみます。
   makec;
end;

procedure TForm4.makec;
  var
     i,week:integer;
     str:String;
begin
   form4.ClientWidth:=size;    //フォームの内側の幅を，変数“size”にする
   form4.ClientHeight:=size;   //フォームの内側の高さを，変数“size”にする

   image1.Left:=0; //以下の４行でイメージコンポーネントをフォーム全体に広げる
   image1.Top:=0;
   image1.Width:=size;
   image1.Height:=size;

   week:=dayofweek(strtodate(ye+'/'+mo+'/1')); //“今月”の始まりの曜日を求める
   with image1.Canvas do begin
      brush.Color:=clwhite;        //塗りつぶしの色を白にする
      fillrect(image1.ClientRect); //image1全体を塗りつぶす
      brush.Style:=bsclear;        //塗りつぶしのスタイルを文字だけの塗りつぶしにする
      //これをbssolidにすると文字の周りをbrush.colorで指定した色で塗りつぶします。

      //月の書き込み
      font.Size:=size div 14;  //フォントの大きさをsizeの１４分の１にする
      font.Color:=clblue;      //フォントの色を青にする
      textout(size div 2 -textwidth(mo+'月') div 2, //Ｘ座標は中央
              size*3 div 20-textheight(mo+'月') div 2, //Ｙ座標は２０分の３の部分
              mo+'月');

      //西暦の書き込み
      font.Size:=size div 22;  //フォントの大きさをsizeの２２分の１にする
      font.Color:=clblue;      //フォントの色を青にする
      textout(size*4 div 5-textwidth(ye+'年') div 2,0,ye+'年');
      //Ｘ座標は左から５分の４のところ，Ｙ座標は０に書き込む
      font.Size:=size div 20; //フォントのサイズをsizeの２０分の１にする

      // 曜日の書き込み
      for i:=1 to 7 do begin //曜日を書き込むため７回繰り返す
        case i of
          1:begin
              font.Color:=clred; //フォントの色を赤にして
              str:='日';         //文字を「日」にする。この文字を「Sun」にすることもできます。
          end;
          2:begin
              font.Color:=clblack; //月～金はフォントの色を黒にする
              str:='月';
          end;
          3:begin
              font.Color:=clblack;
              str:='火';
          end;
          4:begin
              font.Color:=clblack;
              str:='水';
          end;
          5:begin
              font.Color:=clblack;
              str:='木';
          end;
          6:begin
              font.Color:=clblack;
              str:='金';
          end;
          7:begin
              font.Color:=clblue; //土曜日はフォントの色を青にする
              str:='土';
          end;
        end;

        // 曜日を書き込む
        textout(size*((i-1) mod 7+1) div 8 -textwidth(str) div 2,
                size*5 div 20-textheight(str) div 2,
                str);
      end;
      // 曜日の書き込み終了

      // 区切り線を入れる
      pen.Color:=clblack;                  //ペンの色を黒にする
      pen.Width:=2;                        //ペンの太さを２にする
      moveto(size*1 div 16,size*1 div 3);  //Ｘ座標は１６等分した１～１５まで
      lineto(size*15 div 16,size*1 div 3); //Ｙ座標は３等分した１番目の場所
      // 区切り線を入れる終了

      for i:=1 to 31 do begin //１日から３１日まで繰り返します

        // 小の月大の月閏年の判別
        case i of
          29:if StrToInt(mo)=2 then begin //２９日のとき
              if StrToInt(ye) mod 4 > 0 then begin
                 exit; //４で割りきれなければ閏年でないので終了
              end else begin
                 if (StrToInt(ye) mod 100=0) and (StrToInt(ye) mod 400>0) then exit;
                 end; //１００で割り切れて，４００で割り切れれば閏年でない
             end;
          30:if StrToInt(mo)=2 then exit; //３０日のとき２月であれば終了
          31:begin //３１日のとき
             if StrToInt(mo) <= 7 then begin
                if StrToInt(mo) mod 2=0 then exit;
                end else begin
                if StrToInt(mo) mod 2=1 then exit;
                end; //小の月であれば終了
             end;
          end;
        // 小の月大の月閏年の判別終了

        //日付の色を変える
        case (week+i-2) mod 7+1 of  //日付を書き込むＸ座標による場合分け
          1:font.Color:=clred;      //１(日曜)のときはフォントの色を赤にする
          7:font.Color:=clblue;     //７(土曜)のときはフォントの色を青にする
          else font.Color:=clblack; //それ以外は黒にする
        end;

        //font.Color:=clblack; //フォントの色を黒にする
        textout(size*((week+i-2) mod 7+1) div 8 -textwidth(inttostr(i)) div 2,
                size*((week+i-2) div 7+4) div 10-textheight(inttostr(i)) div 2,
                inttostr(i)); //日付を書き込む
      end;
   end;
end;

end.
