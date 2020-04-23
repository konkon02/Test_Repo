object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 382
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 265
    Height = 305
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 287
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = #12501#12449#12452#12523
      object N2: TMenuItem
        Caption = #26032#35215#20316#25104
        OnClick = NewFileClick
      end
      object N6: TMenuItem
        Caption = #38283#12367
        OnClick = FileOpenClick
      end
      object N7: TMenuItem
        Caption = #20445#23384
        OnClick = SaveFileClick
      end
      object N8: TMenuItem
        Caption = #21517#21069#12434#12388#12369#12390#20445#23384
        OnClick = NameAsSaveClick
      end
      object Close: TMenuItem
        Caption = #38281#12376#12427
      end
    end
    object N3: TMenuItem
      Caption = #32232#38598
      object mnuUndo: TMenuItem
        Caption = #20803#12395#25147#12377
        OnClick = mnuUndoClick
      end
      object mnuRedo: TMenuItem
        Caption = #12420#12426#30452#12375
        OnClick = mnuRedoClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnuCut: TMenuItem
        Caption = #20999#12426#21462#12426
        OnClick = mnuCutClick
      end
      object mnuCopy: TMenuItem
        Caption = #12467#12500#12540
        OnClick = mnuCopyClick
      end
      object mnuPaste: TMenuItem
        Caption = #36028#12426#20184#12369
        OnClick = mnuPasteClick
      end
      object mnuDelete: TMenuItem
        Caption = #21066#38500
        OnClick = mnuDeleteClick
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object mnuSearch: TMenuItem
        Caption = #26908#32034
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object mnuSelectAll: TMenuItem
        Caption = #12377#12409#12390#36984#25246
        OnClick = mnuSelectAllClick
      end
      object mnuGetDay: TMenuItem
        Caption = #26085#20184#12392#26178#21051
        OnClick = mnuGetDayClick
      end
    end
    object N5: TMenuItem
      Caption = #12504#12523#12503
      object N4: TMenuItem
        Caption = #12504#12523#12503#12398#34920#31034
      end
      object N18: TMenuItem
        Caption = #12501#12451#12540#12489#12496#12483#12463#12398#36865#20449
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object N20: TMenuItem
        Caption = #12496#12540#12472#12519#12531#24773#22577
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 88
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 128
  end
end
