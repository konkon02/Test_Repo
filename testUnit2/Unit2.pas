{
 �摜���J���A�\���A�ۑ��̃e�X�g�v���O����
 �Q�l�T�C�g
 http://www.ne.jp/asahi/aaa/tach1394/delphi/0400/02.htm
 http://www.ne.jp/asahi/aaa/tach1394/delphi/0400/05.htm
}
unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Jpeg,
  Vcl.ExtDlgs;
  // ��L�A'Jpeg'��ǉ�

type
  TForm2 = class(TForm)
    Image1: TImage;     // �摜�\��
    Button1: TButton;   // �摜���J���{�^��
    Button2: TButton;   // �摜��ۑ�����{�^��
    OpenPictureDialog1: TOpenPictureDialog;   // �摜���J���������s�������R���|�[�l���g
    SavePictureDialog1: TSavePictureDialog;   // �摜�̕ۑ����s�������̃R���|�[�l���g
    procedure Button1Click(Sender: TObject);  // �摜���J���C�x���g�n���h��
    procedure Button2Click(Sender: TObject);  // �摜��ۑ�����C�x���g�n���h��
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
    //�I�[�v���s�N�`���[�_�C�A���O���Ăяo��
    if OpenPictureDialog1.Execute then begin

       //Image�R���|�[�l���g��Picture�Ƀt�@�C���̉摜��\��t����
       Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    //�Z�[�u�s�N�`���[�_�C�A���O���ďos
    if SavePictureDialog1.Execute then begin

      // Image�R���|�[�l���g��Picture�ɕ`���ꂽ�摜��ۑ�����
      Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
    end;

end;

end.
