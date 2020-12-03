unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart;

type
arrextend = array of extended;
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    Chart1: TChart;
    Series1: TLineSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  inp: array[0..10000] of extended;
  datInp:arrextend;
  jumdat:integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  txtFile: TextFile;
  i,j:integer;
begin
        AssignFile(txtFile,'D:\Temp\lazarus\repo Tugas Biomod\Linear Prediction Program\PCG.txt');
        Reset(txtFile);
        i:=0;
        while not Eof(txtFile) do
        begin
            Readln(txtFile,inp[i],inp[i]);
            Series1.AddXY(i,inp[i]);
            Inc(i);
        end;
        CloseFile(txtFile);
        jumdat:=i;

        setLength(datInp,jumdat);
        for i := 0 to jumdat-1 do
          begin
              datInp[i]:= inp[i];
          end;

end;

end.
