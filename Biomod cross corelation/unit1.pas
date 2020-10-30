unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Buttons, ComCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart2: TChart;
    Chart2LineSeries1: TLineSeries;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ListBox3: TListBox;
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Korelasi;
    procedure TrackBar1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  t,h,rth:array [0..10000] of extended;
  jumdat:integer;
  teks:array[0..10]of string;
  hd,hds:array [0..10000] of extended;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  n,m:integer;
  txtfile:TextFile;

begin
  n:=0;
  m:=0;
//  Masukkan data Toe123
       Assignfile(txtfile,'Toe123.txt');
       reset(txtfile);
       while not eof(txtfile) do
        begin
          Readln(txtfile,t[n]);
          Chart1LineSeries1.AddXY(n,t[n]);
          Inc(n);
        end;
       jumdat:=n;
       CloseFile(txtfile);

// Masukkan Data Heel123
       Assignfile(txtfile,'Heel123.txt');
       reset(txtfile);
       while not eof(txtfile) do
        begin
          Readln(txtfile,hds[m]);
          Chart1LineSeries2.AddXY(m,hds[m]);
          h[m]:=hds[m];
          Inc(m);
        end;
       CloseFile(txtfile);
       TrackBar1.Min:=-jumdat;
       TrackBar1.Max:=jumdat;
       Edit1.Text:=IntToStr(TrackBar1.Position);
       Korelasi;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
begin
       ListBox3.Clear;
       for i:=0 to jumdat do
       begin
         teks[0]:= 't['+intToStr(i)+'] ='+FloatToStr(t[i]);
           teks[1]:= '       h['+intToStr(i)+'] ='+FloatToStr(h[i]);
           teks[2]:= '       rth['+intToStr(i)+'] ='+Format('%.4f',[rth[i]]);
           teks[3]:= teks[0]+teks[1]+teks[2];
           ListBox3.items.Add(teks[3]);
       end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
     TrackBar1.Position:=strToInt(Edit1.Text);
end;

procedure TForm1.Korelasi;
var
   i,lag:integer;
   sigma:extended;
  begin

       Chart2LineSeries1.Clear;
       for lag:=0 to jumdat do
       begin
         sigma:=0;
         for i:=0 to jumdat do
         begin
           sigma:= sigma+t[i]*h[i-lag];
         end;
           rth[lag]:=sigma/jumdat;
           Chart2LineSeries1.AddXY(lag,rth[lag]);
       end;
       for i:=0 to jumdat do
       begin
         h[i]:=hds[i];
       end;
  end;

procedure TForm1.TrackBar1Change(Sender: TObject);
var
   trackPos,i:integer;

begin
     Chart1LineSeries1.Clear;
     Chart1LineSeries2.Clear;
     Chart2LineSeries1.Clear;

     trackPos:= TrackBar1.Position;
     Edit1.Text:=intToStr(trackPos);
     for i:=0 to jumdat do
     begin
     hd[i]:=h[i-trackPos];
       Chart1LineSeries1.AddXY(i,t[i]);
       chart1LineSeries2.AddXY(i,hd[i]);
     end;
     for i:=0 to jumdat do
     begin
       h[i]:=hd[i];
     end;
     Korelasi;

end;

end.

