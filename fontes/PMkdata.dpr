program PMkdata;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UDmlCad in 'UDmlCad.pas' {DmlCad: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmlCad, DmlCad);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
