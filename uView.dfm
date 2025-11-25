object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object lblResultado: TLabel
    Left = 400
    Top = 107
    Width = 113
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = '0,00'
  end
  object edtNumero1: TNumberBox
    Left = 40
    Top = 104
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtNumero2: TNumberBox
    Left = 212
    Top = 104
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Button1: TButton
    Left = 339
    Top = 103
    Width = 38
    Height = 25
    Caption = '='
    TabOrder = 2
    OnClick = Button1Click
  end
  object cbOperacao: TComboBox
    Left = 167
    Top = 104
    Width = 39
    Height = 23
    TabOrder = 3
    Text = '+'
  end
end
