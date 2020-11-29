unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ComCtrls,
  Vcl.StdCtrls, VCLTee.Series,Math;

type
  arrextend=array of extended;
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    RR_Tachogram: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Chart1: TChart;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Series1: TLineSeries;
    ListBox1: TListBox;
    Label9: TLabel;
    Label10: TLabel;
    Chart2: TChart;
    Chart3: TChart;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Button2: TButton;
    Edit10: TEdit;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Chart4: TChart;
    Series4: TLineSeries;
    Label14: TLabel;
    Label15: TLabel;
    Edit9: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure mayerrsa;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fs,jumdat:integer;
  hrmean,offset,scal,fase,tau1,tau2,f1,f2,c1,c2:extended;
  sf:array[0..10000] of extended;
  T:arrextend;


implementation

{$R *.dfm}

function IDFT (inpre:array of extended; inpim:array of extended; jumdata:integer):arrextend;
var
  i,k:integer;
  re,im:extended;
  resim,resre,magspek:arrextend;
begin
//       xrei=xrei+xri[k]*(cos(2*pi*k*n/N))
//	xrij=xrij+xij[k]*sin(2*pi*k*n/N)
    SetLength(resre,jumdata);
    SetLength(resim,jumdata);
    SetLength(magspek,jumdata);
    for i:= 0 to jumdata-1 do
      begin
        re:=0;
        im:=0;
        for k := 0 to jumdata-1 do
        begin
          re:=re+inpre[k]*cos(2*pi*k*i/jumdata);
          im:=im+inpim[k]*sin(2*pi*k*i/jumdata);
        end;
        resre[i]:=re/jumdata;
        resim[i]:=im/jumdata;
//        magspek[i]:= resre[i]+resim[i];
      end;
    for i := 0 to jumdata-1 do
      begin
        magspek[i]:=resre[i]+resim[i];
      end;
    result:=magspek;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   mayerrsa;
end;

//mayer rsa
procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
  sfre,sfim:arrextend;
begin
    Series3.Clear;
    scal:=StrToFloat(Edit10.Text);
    hrmean:=StrToFloat(edit9.Text);
    SetLength(sfre,jumdat);
    SetLength(sfim,jumdat);
    for i := 0 to jumdat-1 do
      begin
        fase:=Random*2*pi;
        sfre[i]:= sf[i]*cos(fase);
        sfim[i]:= sf[i]*sin(fase);
      end;
    T:=IDFT(sfre,sfim,jumdat);
    for i := 0 to jumdat-1 do
      begin
        Series3.AddXY(i,T[i]);
      end;
    offset:= 60/hrmean;
    ListBox1.Items.Add(FloatToStr(offset));
    for i := 0 to jumdat do
      begin
        T[i]:= (T[i]+offset);
        Series4.AddXY(i,T[i]);
      end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    TrackBar1.Max:=1000;
    TrackBar1.Min:=0;

    TrackBar2.Max:=1000;
    TrackBar2.Min:=0;


end;

procedure TForm1.mayerrsa;
var
  i:integer;
  f:extended;
begin
    Series1.Clear;
    Series2.Clear;

    fs:= StrToInt(Edit2.Text);
    jumdat:= StrToInt(Edit1.Text);
//    SetLength(sf,jumdat);
    tau1:= StrToFloat(Edit3.Text);
    tau2:= StrToFloat(Edit4.Text);
    f1:= StrToFloat(Edit5.Text);
    f2:= StrToFloat(Edit6.Text);
    c1:= StrToFloat(Edit7.Text);
    c2:= StrToFloat(Edit8.Text);
    Label10.Caption:=FloatToStr(sqr(tau1)/sqr(tau2));

    for i:=0 to jumdat-1 do
       begin
           f:=i/jumdat;
           sf[i]:=sqr(tau1)/sqrt(2*pi*sqr(c1))*exp(-1*sqr(f-f1)/(2*sqr(c1)))+
                 sqr(tau2)/sqrt(2*pi*sqr(c2))*exp(-1*sqr(f-f2)/(2*sqr(c2)));
      //     ListBox1.items.add(FloatToStr(sf[i]));
           Series1.addXY(f,sf[i]);
           sf[i]:=sqrt(sf[i]);
       end;

//   Mirroring
    for i:= 0 to jumdat -1 do
      begin
          sf[(jumdat div 2)+i]:=sf[(jumdat div 2)-i];
          series2.AddXY(i/jumdat,sf[i]);
      end;

    Button2.Enabled:=True;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
    Edit3.Text:=FloatToStr(TrackBar1.Position/1000);
    mayerrsa;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
     Edit4.Text:=FloatToStr(TrackBar2.Position/1000);
    mayerrsa;
end;

end.
