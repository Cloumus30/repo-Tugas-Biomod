object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 511
  ClientWidth = 897
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
  object Label14: TLabel
    Left = 7
    Top = 313
    Width = 33
    Height = 13
    Caption = 'Scaling'
  end
  object PageControl1: TPageControl
    Left = 7
    Top = 7
    Width = 897
    Height = 497
    ActivePage = TabSheet1
    TabOrder = 0
    object RR_Tachogram: TTabSheet
      Caption = 'RR_Tachogram'
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Jumlah Data'
      end
      object Label2: TLabel
        Left = 3
        Top = 35
        Width = 11
        Height = 13
        Caption = 'Fs'
      end
      object Label3: TLabel
        Left = 3
        Top = 62
        Width = 27
        Height = 13
        Caption = 'Tau 1'
      end
      object Label4: TLabel
        Left = 3
        Top = 89
        Width = 27
        Height = 13
        Caption = 'Tau 2'
      end
      object Label5: TLabel
        Left = 3
        Top = 116
        Width = 12
        Height = 13
        Caption = 'F1'
      end
      object Label6: TLabel
        Left = 3
        Top = 143
        Width = 12
        Height = 13
        Caption = 'F2'
      end
      object Label7: TLabel
        Left = 3
        Top = 170
        Width = 13
        Height = 13
        Caption = 'C1'
      end
      object Label8: TLabel
        Left = 3
        Top = 202
        Width = 13
        Height = 13
        Caption = 'C2'
      end
      object Label9: TLabel
        Left = 184
        Top = 3
        Width = 47
        Height = 13
        Caption = 'ratio Tau:'
      end
      object Label10: TLabel
        Left = 237
        Top = 3
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label12: TLabel
        Left = 3
        Top = 263
        Width = 33
        Height = 13
        Caption = 'Scaling'
      end
      object Label11: TLabel
        Left = 184
        Top = 263
        Width = 35
        Height = 13
        Caption = 'Offset:'
      end
      object Label13: TLabel
        Left = 225
        Top = 263
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label15: TLabel
        Left = 3
        Top = 287
        Width = 79
        Height = 13
        Caption = 'Heart rate mean'
      end
      object Button1: TButton
        Left = 3
        Top = 221
        Width = 75
        Height = 25
        Caption = 'Mayers-RSA'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 68
        Top = 5
        Width = 97
        Height = 21
        TabOrder = 1
        Text = '1000'
      end
      object Edit2: TEdit
        Left = 68
        Top = 32
        Width = 97
        Height = 21
        TabOrder = 2
        Text = '512'
      end
      object Chart1: TChart
        Left = 312
        Top = 4
        Width = 497
        Height = 157
        Title.Text.Strings = (
          'Mayers-RSA')
        BottomAxis.Title.Caption = 'Frekuensi (Hz)'
        LeftAxis.Title.Caption = 'Amplitude (mV)'
        View3D = False
        TabOrder = 3
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TLineSeries
          ShowInEditor = False
          Legend.Text = 'mayer-rsa'
          Legend.Visible = False
          LegendTitle = 'mayer-rsa'
          SeriesColor = clBlack
          ShowInLegend = False
          Brush.BackColor = clDefault
          Dark3D = False
          Pointer.Draw3D = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object Edit3: TEdit
        Left = 68
        Top = 59
        Width = 97
        Height = 21
        TabOrder = 4
        Text = '0,056'
      end
      object Edit4: TEdit
        Left = 68
        Top = 86
        Width = 97
        Height = 21
        TabOrder = 5
        Text = '0,08'
      end
      object Edit5: TEdit
        Left = 68
        Top = 114
        Width = 97
        Height = 21
        TabOrder = 6
        Text = '0,1'
      end
      object Edit6: TEdit
        Left = 68
        Top = 140
        Width = 97
        Height = 21
        TabOrder = 7
        Text = '0,25'
      end
      object Edit7: TEdit
        Left = 68
        Top = 167
        Width = 97
        Height = 21
        TabOrder = 8
        Text = '0,01'
      end
      object Edit8: TEdit
        Left = 68
        Top = 194
        Width = 97
        Height = 21
        TabOrder = 9
        Text = '0,01'
      end
      object TrackBar1: TTrackBar
        Left = 171
        Top = 58
        Width = 135
        Height = 22
        TabOrder = 10
        OnChange = TrackBar1Change
      end
      object TrackBar2: TTrackBar
        Left = 171
        Top = 86
        Width = 135
        Height = 22
        TabOrder = 11
        OnChange = TrackBar2Change
      end
      object Chart2: TChart
        Left = 312
        Top = 154
        Width = 497
        Height = 157
        Title.Text.Strings = (
          'mirroring dan sqrt(sf)')
        BottomAxis.Title.Caption = 'Frekuensi (Hz)'
        LeftAxis.Title.Caption = 'Amplitudo (mV)'
        View3D = False
        TabOrder = 12
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series2: TLineSeries
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
      object Chart3: TChart
        Left = -4
        Top = 317
        Width = 429
        Height = 149
        Title.Text.Strings = (
          'RR-Tachogram')
        BottomAxis.Title.Caption = 'sample (n)'
        LeftAxis.Title.Caption = 'Amplitudo(mV)'
        View3D = False
        TabOrder = 13
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series3: TLineSeries
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
      object Button2: TButton
        Left = 84
        Top = 221
        Width = 81
        Height = 25
        Caption = 'RR-tachogram'
        Enabled = False
        TabOrder = 14
        OnClick = Button2Click
      end
      object Edit10: TEdit
        Left = 68
        Top = 260
        Width = 97
        Height = 21
        TabOrder = 15
        Text = '2'
      end
      object Chart4: TChart
        Left = 431
        Top = 317
        Width = 429
        Height = 149
        Title.Text.Strings = (
          'RR-Tachogram setelah random seed number')
        BottomAxis.Title.Caption = 'sample (n)'
        LeftAxis.Title.Caption = 'Amplitudo(mV)'
        View3D = False
        TabOrder = 16
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series4: TLineSeries
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
      object Edit9: TEdit
        Left = 88
        Top = 287
        Width = 97
        Height = 21
        TabOrder = 17
        Text = '60'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'ECG'
      ImageIndex = 1
      object Label24: TLabel
        Left = 54
        Top = 266
        Width = 21
        Height = 13
        Caption = 'fecg'
      end
      object Label25: TLabel
        Left = 22
        Top = 306
        Width = 86
        Height = 13
        Caption = 'jumlah gelombang'
      end
      object Label26: TLabel
        Left = 232
        Top = 266
        Width = 63
        Height = 13
        Caption = 'Jumlah Data:'
      end
      object Label27: TLabel
        Left = 297
        Top = 266
        Width = 6
        Height = 13
        Caption = '0'
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 16
        Width = 278
        Height = 241
        Caption = 'GroupBox1'
        TabOrder = 0
        object Label16: TLabel
          Left = 3
          Top = 40
          Width = 9
          Height = 19
          Caption = 'P'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 3
          Top = 75
          Width = 12
          Height = 19
          Caption = 'Q'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 3
          Top = 112
          Width = 10
          Height = 19
          Caption = 'R'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 3
          Top = 152
          Width = 9
          Height = 19
          Caption = 'S'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 3
          Top = 192
          Width = 10
          Height = 19
          Caption = 'T'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 51
          Top = 21
          Width = 26
          Height = 19
          Caption = 'teta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 122
          Top = 21
          Width = 8
          Height = 19
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 197
          Top = 21
          Width = 9
          Height = 19
          Caption = 'b'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Edit11: TEdit
          Left = 51
          Top = 46
          Width = 54
          Height = 21
          TabOrder = 0
          Text = '-60'
        end
        object Edit12: TEdit
          Left = 122
          Top = 46
          Width = 54
          Height = 21
          TabOrder = 1
          Text = '1,2'
        end
        object Edit13: TEdit
          Left = 197
          Top = 45
          Width = 54
          Height = 21
          TabOrder = 2
          Text = '0,25'
        end
        object Edit14: TEdit
          Left = 51
          Top = 73
          Width = 54
          Height = 21
          TabOrder = 3
          Text = '-15'
        end
        object Edit15: TEdit
          Left = 122
          Top = 73
          Width = 54
          Height = 21
          TabOrder = 4
          Text = '-5,0'
        end
        object Edit16: TEdit
          Left = 197
          Top = 77
          Width = 54
          Height = 21
          TabOrder = 5
          Text = '0,1'
        end
        object Edit17: TEdit
          Left = 51
          Top = 114
          Width = 54
          Height = 21
          TabOrder = 6
          Text = '0'
        end
        object Edit18: TEdit
          Left = 122
          Top = 114
          Width = 54
          Height = 21
          TabOrder = 7
          Text = '30,0'
        end
        object Edit19: TEdit
          Left = 197
          Top = 114
          Width = 54
          Height = 21
          TabOrder = 8
          Text = '0,1'
        end
        object Edit20: TEdit
          Left = 51
          Top = 154
          Width = 54
          Height = 21
          TabOrder = 9
          Text = '15'
        end
        object Edit21: TEdit
          Left = 122
          Top = 154
          Width = 54
          Height = 21
          TabOrder = 10
          Text = '-7,5'
        end
        object Edit22: TEdit
          Left = 197
          Top = 154
          Width = 54
          Height = 21
          TabOrder = 11
          Text = '0,1'
        end
        object Edit23: TEdit
          Left = 51
          Top = 197
          Width = 54
          Height = 21
          TabOrder = 12
          Text = '90'
        end
        object Edit24: TEdit
          Left = 122
          Top = 197
          Width = 54
          Height = 21
          TabOrder = 13
          Text = '0,75'
        end
        object Edit25: TEdit
          Left = 197
          Top = 197
          Width = 54
          Height = 21
          TabOrder = 14
          Text = '0,4'
        end
      end
      object Chart5: TChart
        Left = 328
        Top = 3
        Width = 537
        Height = 254
        Title.Text.Strings = (
          'Hasil ECG')
        BottomAxis.Title.Caption = 'time (second)'
        LeftAxis.Title.Caption = 'Amplitudo (mV)'
        View3D = False
        Zoom.Animated = True
        Zoom.FullRepaint = True
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series5: TLineSeries
          Legend.Text = 'x'
          LegendTitle = 'x'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series6: TLineSeries
          Legend.Text = 'y'
          LegendTitle = 'y'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series7: TLineSeries
          Legend.Text = 'z'
          LegendTitle = 'z'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object Button3: TButton
        Left = 0
        Top = 341
        Width = 75
        Height = 25
        Caption = 'Button3'
        TabOrder = 2
        OnClick = Button3Click
      end
      object ListBox1: TListBox
        Left = 382
        Top = 318
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 3
      end
      object ListBox2: TListBox
        Left = 517
        Top = 318
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 4
      end
      object Edit26: TEdit
        Left = 125
        Top = 263
        Width = 84
        Height = 21
        TabOrder = 5
        Text = '256'
      end
      object Edit27: TEdit
        Left = 125
        Top = 303
        Width = 84
        Height = 21
        TabOrder = 6
        Text = '2'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 2
    end
  end
end
