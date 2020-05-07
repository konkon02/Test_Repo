object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 384
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 321
    Height = 321
    OnMouseDown = Image1MouseDown
  end
  object PopupMenu1: TPopupMenu
    Left = 344
    Top = 24
    object N1: TMenuItem
      Caption = #27425#12398#26376
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21069#12398#26376
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #35373#23450
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #32066#20102
      OnClick = N5Click
    end
  end
end
