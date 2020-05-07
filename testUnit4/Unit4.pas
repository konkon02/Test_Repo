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
    { Private �錾 }
    ye,mo:string;
    // ye : ��(����)
    // mo : ��(����)
    size:integer;
    // size : �S�̂̑傫�����Ǘ�����
  public
    { Public �錾 }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
   ye:=formatdatetime('yyyy',date); //�g�����h�̐�������߂܂��B
   mo:=formatdatetime('m',date);    //�g�����h�̌������߂܂��B
   size:=400;                       //�gsize�h���Ƃ肠�����S�O�O�ɂ��Ă݂܂��B
   makec;
end;

procedure TForm4.makec;
  var
     i,week:integer;
     str:String;
begin
   form4.ClientWidth:=size;    //�t�H�[���̓����̕����C�ϐ��gsize�h�ɂ���
   form4.ClientHeight:=size;   //�t�H�[���̓����̍������C�ϐ��gsize�h�ɂ���

   image1.Left:=0; //�ȉ��̂S�s�ŃC���[�W�R���|�[�l���g���t�H�[���S�̂ɍL����
   image1.Top:=0;
   image1.Width:=size;
   image1.Height:=size;

   week:=dayofweek(strtodate(ye+'/'+mo+'/1')); //�g�����h�̎n�܂�̗j�������߂�
   with image1.Canvas do begin
      brush.Color:=clwhite;        //�h��Ԃ��̐F�𔒂ɂ���
      fillrect(image1.ClientRect); //image1�S�̂�h��Ԃ�
      brush.Style:=bsclear;        //�h��Ԃ��̃X�^�C���𕶎������̓h��Ԃ��ɂ���
      //�����bssolid�ɂ���ƕ����̎����brush.color�Ŏw�肵���F�œh��Ԃ��܂��B

      //���̏�������
      font.Size:=size div 14;  //�t�H���g�̑傫����size�̂P�S���̂P�ɂ���
      font.Color:=clblue;      //�t�H���g�̐F��ɂ���
      textout(size div 2 -textwidth(mo+'��') div 2, //�w���W�͒���
              size*3 div 20-textheight(mo+'��') div 2, //�x���W�͂Q�O���̂R�̕���
              mo+'��');

      //����̏�������
      font.Size:=size div 22;  //�t�H���g�̑傫����size�̂Q�Q���̂P�ɂ���
      font.Color:=clblue;      //�t�H���g�̐F��ɂ���
      textout(size*4 div 5-textwidth(ye+'�N') div 2,0,ye+'�N');
      //�w���W�͍�����T���̂S�̂Ƃ���C�x���W�͂O�ɏ�������
      font.Size:=size div 20; //�t�H���g�̃T�C�Y��size�̂Q�O���̂P�ɂ���

      // �j���̏�������
      for i:=1 to 7 do begin //�j�����������ނ��߂V��J��Ԃ�
        case i of
          1:begin
              font.Color:=clred; //�t�H���g�̐F��Ԃɂ���
              str:='��';         //�������u���v�ɂ���B���̕������uSun�v�ɂ��邱�Ƃ��ł��܂��B
          end;
          2:begin
              font.Color:=clblack; //���`���̓t�H���g�̐F�����ɂ���
              str:='��';
          end;
          3:begin
              font.Color:=clblack;
              str:='��';
          end;
          4:begin
              font.Color:=clblack;
              str:='��';
          end;
          5:begin
              font.Color:=clblack;
              str:='��';
          end;
          6:begin
              font.Color:=clblack;
              str:='��';
          end;
          7:begin
              font.Color:=clblue; //�y�j���̓t�H���g�̐F��ɂ���
              str:='�y';
          end;
        end;

        // �j������������
        textout(size*((i-1) mod 7+1) div 8 -textwidth(str) div 2,
                size*5 div 20-textheight(str) div 2,
                str);
      end;
      // �j���̏������ݏI��

      // ��؂��������
      pen.Color:=clblack;                  //�y���̐F�����ɂ���
      pen.Width:=2;                        //�y���̑������Q�ɂ���
      moveto(size*1 div 16,size*1 div 3);  //�w���W�͂P�U���������P�`�P�T�܂�
      lineto(size*15 div 16,size*1 div 3); //�x���W�͂R���������P�Ԗڂ̏ꏊ
      // ��؂��������I��

      for i:=1 to 31 do begin //�P������R�P���܂ŌJ��Ԃ��܂�

        // ���̌���̌��[�N�̔���
        case i of
          29:if StrToInt(mo)=2 then begin //�Q�X���̂Ƃ�
              if StrToInt(ye) mod 4 > 0 then begin
                 exit; //�S�Ŋ��肫��Ȃ���Ή[�N�łȂ��̂ŏI��
              end else begin
                 if (StrToInt(ye) mod 100=0) and (StrToInt(ye) mod 400>0) then exit;
                 end; //�P�O�O�Ŋ���؂�āC�S�O�O�Ŋ���؂��Ή[�N�łȂ�
             end;
          30:if StrToInt(mo)=2 then exit; //�R�O���̂Ƃ��Q���ł���ΏI��
          31:begin //�R�P���̂Ƃ�
             if StrToInt(mo) <= 7 then begin
                if StrToInt(mo) mod 2=0 then exit;
                end else begin
                if StrToInt(mo) mod 2=1 then exit;
                end; //���̌��ł���ΏI��
             end;
          end;
        // ���̌���̌��[�N�̔��ʏI��

        //���t�̐F��ς���
        case (week+i-2) mod 7+1 of  //���t���������ނw���W�ɂ��ꍇ����
          1:font.Color:=clred;      //�P(���j)�̂Ƃ��̓t�H���g�̐F��Ԃɂ���
          7:font.Color:=clblue;     //�V(�y�j)�̂Ƃ��̓t�H���g�̐F��ɂ���
          else font.Color:=clblack; //����ȊO�͍��ɂ���
        end;

        //font.Color:=clblack; //�t�H���g�̐F�����ɂ���
        textout(size*((week+i-2) mod 7+1) div 8 -textwidth(inttostr(i)) div 2,
                size*((week+i-2) div 7+4) div 10-textheight(inttostr(i)) div 2,
                inttostr(i)); //���t����������
      end;
   end;
end;

end.
