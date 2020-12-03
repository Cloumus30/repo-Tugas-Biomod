program pend3dku;

uses
  Forms,
  pend3d in 'pend3d.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
