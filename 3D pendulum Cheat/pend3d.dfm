object Form1: TForm1
  Left = 307
  Top = 281
  Caption = '3D Upper Limb Model'
  ClientHeight = 768
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object Button1: TButton
    Left = 414
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Chart1: TChart
    Left = 8
    Top = 8
    Width = 400
    Height = 250
    BackWall.Brush.Style = bsClear
    Legend.LegendStyle = lsValues
    Title.Text.Strings = (
      '')
    Title.Visible = False
    View3D = False
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      SeriesColor = clRed
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      SeriesColor = clGreen
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Button2: TButton
    Left = 414
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 414
    Top = 8
    Width = 121
    Height = 105
    Caption = 'Angle Control'
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 23
      Height = 14
      Caption = 'Pitch'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 23
      Height = 14
      Caption = 'Yaw'
    end
    object Label3: TLabel
      Left = 16
      Top = 60
      Width = 17
      Height = 14
      Caption = 'Roll'
    end
    object SpinEdit1: TSpinEdit
      Left = 48
      Top = 19
      Width = 57
      Height = 23
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = SpinEdit1Change
    end
    object SpinEdit2: TSpinEdit
      Left = 48
      Top = 40
      Width = 57
      Height = 23
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = SpinEdit2Change
    end
    object SpinEdit3: TSpinEdit
      Left = 48
      Top = 64
      Width = 57
      Height = 23
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnChange = SpinEdit3Change
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 1088
    Top = 640
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer2Timer
    Left = 592
    Top = 40
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 1
    Left = 552
    Top = 40
  end
end
