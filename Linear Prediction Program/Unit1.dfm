object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 595
  ClientWidth = 865
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
  object PageControl1: TPageControl
    Left = 8
    Top = 10
    Width = 857
    Height = 577
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ExplicitLeft = 0
      object ListBox1: TListBox
        Left = 288
        Top = 288
        Width = 97
        Height = 97
        ItemHeight = 13
        TabOrder = 0
      end
      object Chart1: TChart
        Left = 16
        Top = 3
        Width = 400
        Height = 250
        Title.Text.Strings = (
          'Input File PCG')
        BottomAxis.Title.Caption = 'Sample Number'
        LeftAxis.Title.Caption = 'Amplitude (mV)'
        View3D = False
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TLineSeries
          Legend.Visible = False
          ShowInLegend = False
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
end
