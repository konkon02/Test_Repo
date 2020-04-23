{
メモ帳のサンプルプログラム
参考サイト
http://www.w-frontier.com/delphi/3_menu.html
}
unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Clipbrd;
  // Clipbrd追加。クリップボードへコピー、読み込みを行う。

type
  TForm3 = class(TForm)
    Memo1: TMemo;      // メモ帳コンポーネント
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Close: TMenuItem;
    mnuUndo: TMenuItem;
    N11: TMenuItem;
    mnuCut: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPaste: TMenuItem;
    mnuDelete: TMenuItem;
    N16: TMenuItem;
    mnuSearch: TMenuItem;
    N4: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    mnuRedo: TMenuItem;
    N22: TMenuItem;
    mnuSelectAll: TMenuItem;
    mnuGetDay: TMenuItem;  // メモのテキストをダイアログで表示するボタン
    procedure Button1Click(Sender: TObject);
    procedure NameAsSaveClick(Sender: TObject);
    procedure FileOpenClick(Sender: TObject);
    procedure SaveFileClick(Sender: TObject);
    procedure NewFileClick(Sender: TObject);
    procedure mnuRedoClick(Sender: TObject);
    procedure mnuUndoClick(Sender: TObject);
    procedure mnuCutClick(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
    procedure mnuPasteClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure mnuGetDayClick(Sender: TObject);
    procedure CloseClick(Sender: TObject; var Action: TCloseAction);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
    // メモのテキストをダイアログで表示
    ShowMessage(Memo1.Text);
end;

procedure TForm3.NewFileClick(Sender: TObject); // 新規作成
var ans : Word; // MessageDlgの戻り値格納用

begin
   // Modified : 指定したコンポーネントが変更されたか判定
   // 変更された場合Ture、それ以外False
   if Memo1.Modified then
   begin
      // 変更あり
      // MessageDlg : メッセージダイアログ
      // クエスチョンマークのメッセージダイアログを表示
      // ボタン：「はい」「いいえ」「キャンセル」
      // 最後の引数0 ： デフォルトのフォーカスを最初の「はい」に指定
      ans := MessageDlg('変更されています。保存しますか？',
                             mtConfirmation,[mbYes,mbNo,mbCancel],0);
      if ans = mrCancel then Exit;  // 「キャンセル」押下：何もしない
      if ans = mrYes then SaveFileClick(Self); // 「はい」押下：保存処理(既存)
   end else
   begin
      // 変更なし
      // Memo1.Lines : Memo1の要素のこと
      Memo1.Lines.Clear; // メモをクリア
      Form3.Caption := '簡易エディタ'; // ウィンドウタイトルを「簡易エディタ」
   end;
end;

procedure TForm3.FileOpenClick(Sender: TObject); // 開く
begin
   // OpenDialog1が呼び出されたら
   if OpenDialog1.Execute then
   begin
      // 指定したファイルを読み込み、表示
      Memo1.Lines.LoadFromFile(OpenDialog1.FileName);

      // ウィンドウのタイトルをファイル名に変更
      Form3.Caption := OpenDialog1.FileName ;
   end ;

end;

procedure TForm3.SaveFileClick(Sender: TObject); // 上書き保存
begin
   // 開いてるファイルが存在するかチェックし、
   // 存在する場合は上書き保存し、存在しない場合は名前を付けて保存
   // ●FileExists : 指定したファイルが存在する場合Ture、ない場合はfalseを返却
   if FileExists(Form3.Caption) then
      Memo1.Lines.SaveToFile(Form3.Caption) else NameAsSaveClick(Self);
end;

procedure TForm3.NameAsSaveClick(Sender: TObject); // 名前を付けて保存
begin
   // SaveDialog1が呼び出されたら
   if SaveDialog1.Execute then
   begin
      // 保存処理
      // ●SaveDialog1.FileName : 保存するファイル名の絶対パス
      Memo1.Lines.SaveToFile(SaveDialog1.FileName);
   end;
end;

procedure TForm3.CloseClick(Sender: TObject; var Action: TCloseAction); // 閉じる
var ans : Word;
begin
   if Memo1.Modified then
   begin
      ans := MessageDlg('変更されています。保存しますか？',
                             mtConfirmation,[mbYes,mbNo,mbCancel],0);
      // キャンセル押下時、終了処理を中止するようActionにcaNoneを指定
      if ans = mrCancel then Action := caNone;
      if ans = mrYes then SaveFileClick(Self);
   end

end;

// -------------------------------------------------------

procedure TForm3.mnuUndoClick(Sender: TObject); // 元に戻す
begin
   Memo1.Undo;
end;

procedure TForm3.mnuRedoClick(Sender: TObject); // やり直し
begin
   Memo1.Undo;
end;

// -------------------------------------------------------

procedure TForm3.mnuCutClick(Sender: TObject); // カット
begin
   Memo1.CutToClipboard;
end;

procedure TForm3.mnuCopyClick(Sender: TObject); // コピー
begin
   Memo1.CopyToClipboard;
end;

procedure TForm3.mnuPasteClick(Sender: TObject); // 貼り付け
begin
   Memo1.PasteFromClipboard;
end;

procedure TForm3.mnuDeleteClick(Sender: TObject); // 削除
begin
   Memo1.SelText := '';
end;

// -------------------------------------------------------

procedure TForm3.mnuSelectAllClick(Sender: TObject); // すべて選択
begin
   // 「with Memo1 do」と書いておくと、begin以降で「Memo1.」の記載が必要なくなる
   with Memo1 do
   begin
      // 選択されてる長さと文字列の長さが同じ場合は、選択を反転(選択解除)
      // ↑が同じでない場合は、すべて選択(SelectAll)
      if SelLength = GetTextLen then
         SelLength := 0 else SelectAll;
   end;
end;

procedure TForm3.mnuGetDayClick(Sender: TObject); // 日付と時刻
var
   date:TDateTime;
   strDate:String;
begin
   date := Now;
   DateTimeToString(strDate, 'yyyy/MM/dd HH:mm:ss',date);
   Memo1.SelText := strDate;
end;


end.
