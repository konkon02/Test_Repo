{
�������̃T���v���v���O����
�Q�l�T�C�g
http://www.w-frontier.com/delphi/3_menu.html
}
unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Clipbrd;
  // Clipbrd�ǉ��B�N���b�v�{�[�h�փR�s�[�A�ǂݍ��݂��s���B

type
  TForm3 = class(TForm)
    Memo1: TMemo;      // �������R���|�[�l���g
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
    mnuGetDay: TMenuItem;  // �����̃e�L�X�g���_�C�A���O�ŕ\������{�^��
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
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
    // �����̃e�L�X�g���_�C�A���O�ŕ\��
    ShowMessage(Memo1.Text);
end;

procedure TForm3.NewFileClick(Sender: TObject); // �V�K�쐬
var ans : Word; // MessageDlg�̖߂�l�i�[�p

begin
   // Modified : �w�肵���R���|�[�l���g���ύX���ꂽ������
   // �ύX���ꂽ�ꍇTure�A����ȊOFalse
   if Memo1.Modified then
   begin
      // �ύX����
      // MessageDlg : ���b�Z�[�W�_�C�A���O
      // �N�G�X�`�����}�[�N�̃��b�Z�[�W�_�C�A���O��\��
      // �{�^���F�u�͂��v�u�������v�u�L�����Z���v
      // �Ō�̈���0 �F �f�t�H���g�̃t�H�[�J�X���ŏ��́u�͂��v�Ɏw��
      ans := MessageDlg('�ύX����Ă��܂��B�ۑ����܂����H',
                             mtConfirmation,[mbYes,mbNo,mbCancel],0);
      if ans = mrCancel then Exit;  // �u�L�����Z���v�����F�������Ȃ�
      if ans = mrYes then SaveFileClick(Self); // �u�͂��v�����F�ۑ�����(����)
   end else
   begin
      // �ύX�Ȃ�
      // Memo1.Lines : Memo1�̗v�f�̂���
      Memo1.Lines.Clear; // �������N���A
      Form3.Caption := '�ȈՃG�f�B�^'; // �E�B���h�E�^�C�g�����u�ȈՃG�f�B�^�v
   end;
end;

procedure TForm3.FileOpenClick(Sender: TObject); // �J��
begin
   // OpenDialog1���Ăяo���ꂽ��
   if OpenDialog1.Execute then
   begin
      // �w�肵���t�@�C����ǂݍ��݁A�\��
      Memo1.Lines.LoadFromFile(OpenDialog1.FileName);

      // �E�B���h�E�̃^�C�g�����t�@�C�����ɕύX
      Form3.Caption := OpenDialog1.FileName ;
   end ;

end;

procedure TForm3.SaveFileClick(Sender: TObject); // �㏑���ۑ�
begin
   // �J���Ă�t�@�C�������݂��邩�`�F�b�N���A
   // ���݂���ꍇ�͏㏑���ۑ����A���݂��Ȃ��ꍇ�͖��O��t���ĕۑ�
   // ��FileExists : �w�肵���t�@�C�������݂���ꍇTure�A�Ȃ��ꍇ��false��ԋp
   if FileExists(Form3.Caption) then
      Memo1.Lines.SaveToFile(Form3.Caption) else NameAsSaveClick(Self);
end;

procedure TForm3.NameAsSaveClick(Sender: TObject); // ���O��t���ĕۑ�
begin
   // SaveDialog1���Ăяo���ꂽ��
   if SaveDialog1.Execute then
   begin
      // �ۑ�����
      // ��SaveDialog1.FileName : �ۑ�����t�@�C�����̐�΃p�X
      Memo1.Lines.SaveToFile(SaveDialog1.FileName);
   end;
end;

procedure TForm3.CloseClick(Sender: TObject; var Action: TCloseAction); // ����
var ans : Word;
begin
   if Memo1.Modified then
   begin
      ans := MessageDlg('�ύX����Ă��܂��B�ۑ����܂����H',
                             mtConfirmation,[mbYes,mbNo,mbCancel],0);
      // �L�����Z���������A�I�������𒆎~����悤Action��caNone���w��
      if ans = mrCancel then Action := caNone;
      if ans = mrYes then SaveFileClick(Self);
   end

end;

// -------------------------------------------------------

procedure TForm3.mnuUndoClick(Sender: TObject); // ���ɖ߂�
begin
   Memo1.Undo;
end;

procedure TForm3.mnuRedoClick(Sender: TObject); // ��蒼��
begin
   Memo1.Undo;
end;

// -------------------------------------------------------

procedure TForm3.mnuCutClick(Sender: TObject); // �J�b�g
begin
   Memo1.CutToClipboard;
end;

procedure TForm3.mnuCopyClick(Sender: TObject); // �R�s�[
begin
   Memo1.CopyToClipboard;
end;

procedure TForm3.mnuPasteClick(Sender: TObject); // �\��t��
begin
   Memo1.PasteFromClipboard;
end;

procedure TForm3.mnuDeleteClick(Sender: TObject); // �폜
begin
   Memo1.SelText := '';
end;

// -------------------------------------------------------

procedure TForm3.mnuSelectAllClick(Sender: TObject); // ���ׂđI��
begin
   // �uwith Memo1 do�v�Ə����Ă����ƁAbegin�ȍ~�ŁuMemo1.�v�̋L�ڂ��K�v�Ȃ��Ȃ�
   with Memo1 do
   begin
      // �I������Ă钷���ƕ�����̒����������ꍇ�́A�I���𔽓](�I������)
      // ���������łȂ��ꍇ�́A���ׂđI��(SelectAll)
      if SelLength = GetTextLen then
         SelLength := 0 else SelectAll;
   end;
end;

procedure TForm3.mnuGetDayClick(Sender: TObject); // ���t�Ǝ���
var
   date:TDateTime;
   strDate:String;
begin
   date := Now;
   DateTimeToString(strDate, 'yyyy/MM/dd HH:mm:ss',date);
   Memo1.SelText := strDate;
end;


end.
