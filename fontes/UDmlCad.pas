unit UDmlCad;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.IniFiles, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Comp.DataSet;

type
  TDmlCad = class(TDataModule)
    FDCon: TFDConnection;
    FDQClientes: TFDQuery;
    FDTransaction: TFDTransaction;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDQContatos: TFDQuery;
    FDQEnderecos: TFDQuery;
    DSClientes: TDataSource;
    DSContatos: TDataSource;
    DSEnderecos: TDataSource;
    FDQClientesIDCLIENTE: TIntegerField;
    FDQClientesDTCAD_CLI: TSQLTimeStampField;
    FDQClientesTIPO_CLI: TStringField;
    FDQClientesCPFCNPJ_CLI: TStringField;
    FDQClientesRGIE_CLI: TStringField;
    FDQClientesATIVO_CLI: TStringField;
    FDQClientesDTUALT_CLI: TSQLTimeStampField;
    FDQContatosID_CLIENTE: TIntegerField;
    FDQContatosSEQ_CTO: TIntegerField;
    FDQContatosDTCAD_CTO: TSQLTimeStampField;
    FDQContatosDESCR_CTO: TStringField;
    FDQContatosDDD_CTO: TStringField;
    FDQContatosNUM_CTO: TStringField;
    FDQContatosEMAIL_CTO: TStringField;
    FDQContatosDTUALT_CTO: TSQLTimeStampField;
    FDQEnderecosID_CLIENTE: TIntegerField;
    FDQEnderecosSEQ_END: TIntegerField;
    FDQEnderecosDTCAD_END: TSQLTimeStampField;
    FDQEnderecosDEF_END: TStringField;
    FDQEnderecosDESCR_END: TStringField;
    FDQEnderecosPAIS_END: TStringField;
    FDQEnderecosUF_END: TStringField;
    FDQEnderecosCEP_END: TStringField;
    FDQEnderecosEND_END: TStringField;
    FDQEnderecosCOMPL_END: TStringField;
    FDQEnderecosCID_END: TStringField;
    FDQEnderecosBAI_END: TStringField;
    FDQEnderecosLOGRA_END: TStringField;
    FDQEnderecosDTUALT_END: TSQLTimeStampField;
    FDQClientesNOME_CLI: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmlCad: TDmlCad;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmlCad.DataModuleCreate(Sender: TObject);
Var
  Ini : TIniFile;
begin
  Try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Banco.ini');
    FDCON.Connected := False;
    //FDCOn.Params.Clear;
    //FDCon.Params.values['DriverID'] := 'FB';
    //FDCon.Params.values['Server'] := Ini.ReadString('CONN','SERVER','');
    FDCon.Params.values['Database'] := Ini.ReadString('CONN','DATABASE','');
    FDCON.Connected := True;
  Except On E:Exception do
    Showmessage('Erro Banco:' + e.message);

  End;
end;

end.
