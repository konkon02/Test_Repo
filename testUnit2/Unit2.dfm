object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 478
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 64
    Width = 609
    Height = 406
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 81
    Height = 41
    Caption = #30011#20687#12434#38283#12367
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 8
    Width = 81
    Height = 41
    Caption = #30011#20687#12434#20445#23384
    TabOrder = 1
    OnClick = Button2Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 200
    Top = 8
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 240
    Top = 8
  end
end
