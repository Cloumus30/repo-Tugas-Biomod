object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 742
  ClientWidth = 1186
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
    Width = 1161
    Height = 727
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 0
        Top = 19
        Width = 78
        Height = 13
        Caption = 'Jumlah Time Lag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 640
        Top = 0
        Width = 106
        Height = 13
        Caption = 'Autocorreltaion rxx(L)'
      end
      object Label3: TLabel
        Left = 807
        Top = 0
        Width = 96
        Height = 13
        Caption = 'coefficient predictor'
      end
      object Label4: TLabel
        Left = 974
        Top = 0
        Width = 90
        Height = 13
        Caption = 'error exitator e(m)'
      end
      object Label5: TLabel
        Left = 0
        Top = 249
        Width = 52
        Height = 13
        Caption = 'Rxx Matrix'
      end
      object Label6: TLabel
        Left = 0
        Top = 407
        Width = 86
        Height = 13
        Caption = 'Invers Rxx Matrix'
      end
      object ListBox1: TListBox
        Left = 640
        Top = 19
        Width = 161
        Height = 158
        ItemHeight = 13
        TabOrder = 0
      end
      object Chart1: TChart
        Left = 178
        Top = 3
        Width = 447
        Height = 230
        Title.Text.Strings = (
          'Input File PCG')
        BottomAxis.Title.Caption = 'Sample Number'
        LeftAxis.Title.Caption = 'Amplitude (mV)'
        View3D = False
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object inputseries: TLineSeries
          Legend.Text = 'Input'
          LegendTitle = 'Input'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object errorSeries: TLineSeries
          Legend.Text = 'e[m]'
          LegendTitle = 'e[m]'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object Button1: TButton
        Left = 0
        Top = 65
        Width = 113
        Height = 25
        Caption = 'AutoCorrelation'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 32
        Top = 38
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '4'
      end
      object ListBox3: TListBox
        Left = 974
        Top = 19
        Width = 161
        Height = 158
        ItemHeight = 13
        TabOrder = 4
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 268
        Width = 320
        Height = 120
        FixedCols = 0
        FixedRows = 0
        TabOrder = 5
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 426
        Width = 320
        Height = 120
        FixedCols = 0
        FixedRows = 0
        TabOrder = 6
      end
      object Chart2: TChart
        Left = 338
        Top = 264
        Width = 406
        Height = 213
        Title.Text.Strings = (
          'Prediction Signal')
        View3D = False
        TabOrder = 7
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object PredictionSeries: TLineSeries
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
      object Chart4: TChart
        Left = 750
        Top = 264
        Width = 400
        Height = 213
        Title.Text.Strings = (
          'Frequency Response')
        View3D = False
        TabOrder = 8
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object A_omegaSeries: TLineSeries
          Legend.Text = 'A omega'
          LegendTitle = 'A omega'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object H_omegaSeries: TLineSeries
          Legend.Text = 'H Omega'
          LegendTitle = 'H Omega'
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
        Left = 0
        Top = 96
        Width = 113
        Height = 25
        Caption = 'Matrix'
        Enabled = False
        TabOrder = 9
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 0
        Top = 127
        Width = 113
        Height = 25
        Caption = 'Coeffisien Predictor'
        Enabled = False
        TabOrder = 10
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 0
        Top = 158
        Width = 113
        Height = 25
        Caption = 'Error Exitation'
        Enabled = False
        TabOrder = 11
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 0
        Top = 218
        Width = 113
        Height = 25
        Caption = 'Frequency Response'
        Enabled = False
        TabOrder = 12
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 0
        Top = 189
        Width = 113
        Height = 25
        Caption = 'Prediction Signal'
        Enabled = False
        TabOrder = 13
        OnClick = Button6Click
      end
      object ListBox4: TListBox
        Left = 3
        Top = 552
        Width = 230
        Height = 144
        ItemHeight = 13
        TabOrder = 14
      end
      object ListBox5: TListBox
        Left = 258
        Top = 552
        Width = 121
        Height = 144
        ItemHeight = 13
        TabOrder = 15
      end
      object ListBox2: TListBox
        Left = 807
        Top = 19
        Width = 161
        Height = 158
        ItemHeight = 13
        TabOrder = 16
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
end
