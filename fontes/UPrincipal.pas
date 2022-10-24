unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, ACBrConsultaCNPJ, ACBrBase, ACBrSocket,
  ACBrConsultaCPF, ACBrValidador;

type
  TFrmPrincipal = class(TForm)
    pctrlModulos: TPageControl;
    TabClientes: TTabSheet;
    TabProdutos: TTabSheet;
    pCtrlCad: TPageControl;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    TabPesqCli: TTabSheet;
    Cadastro: TTabSheet;
    pCtrlDets: TPageControl;
    tabContatos: TTabSheet;
    Endereços: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCpfCnpf: TDBEdit;
    Label5: TLabel;
    edtRgIE: TDBEdit;
    Label7: TLabel;
    edtNome: TDBEdit;
    DBCTipo: TDBComboBox;
    Label8: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    Label19: TLabel;
    edtUF: TDBEdit;
    Label20: TLabel;
    edtCEP: TDBEdit;
    Label21: TLabel;
    edtEnd: TDBEdit;
    Label22: TLabel;
    edtLogra: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    edtCidade: TDBEdit;
    Label25: TLabel;
    edtBairro: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBNavigator4: TDBNavigator;
    DBNavigator5: TDBNavigator;
    DBNavigator6: TDBNavigator;
    Label26: TLabel;
    DBEdit25: TDBEdit;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    Panel1: TPanel;
    stBarPesq: TStatusBar;
    DBGPesq: TDBGrid;
    edtPesqDocto: TEdit;
    edtPesqNome: TEdit;
    RgPesq: TRadioGroup;
    Label27: TLabel;
    Label28: TLabel;
    SpeedButton1: TSpeedButton;
    ACBrValidador: TACBrValidador;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure verificardoctos(tp:integer;valor:string;Inserindo:Boolean);
    procedure edtCpfCnpfExit(Sender: TObject);
    procedure edtRgIEExit(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCpfCnpfKeyPress(Sender: TObject; var Key: Char);
    procedure DBCTipoExit(Sender: TObject);
    procedure DBGPesqDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

Uses UDmlCad, FireDAC.Comp.Client;

{$R *.dfm}

procedure TFrmPrincipal.verificardoctos(tp:integer;valor:string;Inserindo:Boolean);
Var
  Pesq: TFDQuery;
  vDocto : String;
  vStatus : Integer;
begin
  if tp = 0 then
    vDocto := 'RG/IE'
  else
    vDocto := 'CPF/CNPJ';

  if Inserindo = true then
    vStatus := 0
  else
    vStatus := 1;

  Pesq := TFDQuery.Create(Nil);
  Pesq.Connection := DmlCad.FDCon;
  Pesq.sql.Clear;
  Pesq.SQL.Add('SELECT IDCLIENTE, NOME_CLI FROM CAD_CLIENTES');
  if tp = 0 then
    Pesq.sql.Add('WHERE CPFCNPJ_CLI = ' + QuotedStr(edtCpfCnpf.Text))
  else
    Pesq.sql.Add('WHERE RGIE_CLI = ' + QuotedStr(edtrgie.text));
  Pesq.Open;

  if Pesq.RecordCount > vStatus then
  begin
    edtCpfCnpf.SetFocus;
    If MessageBox(application.Handle, PChar(vDocto + ' já cadastrado, deseja visualizar o cadastro?'),'CLIENTES',MB_YESNO+MB_ICONINFORMATION+MB_SYSTEMMODAL) = mryes then
    begin
      DmlCad.FDQClientes.Cancel;
      With DmlCad.FDQClientes do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM CAD_CLIENTES');
        Sql.Add('WHERE IDCLIENTE = ' + inttostr(Pesq.FieldByName('IDCLIENTE').AsInteger));
        Open;
      End;
    end;
  end;

  Pesq.Free;
end;

procedure TFrmPrincipal.DBCTipoExit(Sender: TObject);
begin
  if copy(DBCTipo.Text,1,1) = 'F' then
    edtCpfCnpf.MaxLength := 11
  else
    edtCpfCnpf.MaxLength := 14;
end;

procedure TFrmPrincipal.DBGPesqDblClick(Sender: TObject);
begin
  pCtrlCad.TabIndex := 1;
end;

procedure TFrmPrincipal.edtCEPExit(Sender: TObject);

function consultaCEP : Boolean;
var
  json : string;
  jsonObj: TJsonObject;
  erro : String;
begin
  Try
    //RESTClient.BaseURL := 'viacep.com.br/ws/' + trim(edtCEP.Text) + 'json/';
    RESTClient.BaseURL := 'http://viacep.com.br/ws/';
    RESTRequest.Resource := '{CEP}/{FRet}/';
    RESTRequest.Method   := TRESTRequestMethod.rmGET;
    RESTRequest.Params.AddUrlSegment('CEP',trim(edtcep.Text));
    RESTRequest.Params.AddUrlSegment('FRet','json');
    RESTRequest.execute;

    //Memo1.Text := RESTResponse.JSONText;

    If RESTRequest.Response.StatusCode <> 200 then
    Begin
      Result := False;

    End
    else begin
      json := RESTRequest.Response.JSONValue.ToString;
      jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json),0) as TJSONObject;

      //if jsonObj('erro') is null then
      //Begin

        edtEnd.Text     := jsonObj.GetValue('logradouro').value;
        edtBairro.Text  := jsonObj.GetValue('bairro').value;
        edtCidade.Text  := jsonObj.GetValue('localidade').value;
        edtUF.Text      := jsonObj.GetValue('uf').value;
        Result          := True;
      //End
      //else begin
        //Result := False;
        //erro   := jsonObj.GetValue('retorno').value;
      //end;
      jsonObj.DisposeOf;
    end;


  except
    Result := False;
  End;
end;

var
  vErro : String;

begin
  if Length((Trim(edtCEP.Text))) = 8 then
  else begin
    MessageBox(application.Handle, 'CEP Invalído?','CLIENTES',MB_YESNO+MB_ICONINFORMATION+MB_SYSTEMMODAL);
    edtCEP.SetFocus;
  end;

  If consultaCEP = False then
    MessageBox(application.Handle, 'Desculpe, erro ao consultar o CEP, tente novamente ou preencha os dados manualmente','CLIENTES',MB_OK+MB_ICONERROR+MB_SYSTEMMODAL);

end;

procedure TFrmPrincipal.edtCpfCnpfExit(Sender: TObject);
begin
  //Verifica se é cpf ou cnpj
  if (DBCTipo.ItemIndex = 1) and (length(trim(edtCpfCnpf.Text)) < 14) then
  begin
    messagebox(application.Handle,'CNPJ incompleto, por favor, preencha corretamente!','CLIENTES',mb_ok+MB_ICONINFORMATION+MB_SYSTEMMODAL);
    edtCpfCnpf.SetFocus;
  end;

  ACBrValidador.Documento := Trim(edtCpfCnpf.Text);
  if DBCTipo.ItemIndex = 0 then
    ACBrValidador.TipoDocto := docCPF
  else
    ACBrValidador.TipoDocto := docCNPJ;

  if ACBrValidador.Validar then
  else begin
    messagebox(application.Handle,'O Número do documento esta incorreto, por favor, preencha corretamente!','CLIENTES',mb_ok+MB_ICONINFORMATION+MB_SYSTEMMODAL);
    edtCpfCnpf.SetFocus;
  end;

  //Verifica se ja existe documento cadastrado
  verificardoctos(0,edtCpfCnpf.Text,DmlCad.FDQClientes.State in [dsInsert]);
end;

procedure TFrmPrincipal.edtCpfCnpfKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9'] = false) and (key <> char(8)) then
    key := #0;
end;

procedure TFrmPrincipal.edtRgIEExit(Sender: TObject);
begin
  verificardoctos(1,edtRgIE.Text,DmlCad.FDQClientes.State in [dsInsert]);
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmlCad.FDQContatos.Active   := False;
  DmlCad.FDQEnderecos.Active  := False;
  DmlCad.FDQClientes.Active   := False;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin

  DmlCad.FDQClientes.Active     := False;
  DmlCad.FDQClientes.sql.Clear;
  DmlCad.FDQClientes.sql.add('SELECT * FROM CAD_CLIENTES WHERE 0 = -1');
  DmlCad.FDQClientes.Active     := True;

  DmlCad.FDQContatos.Active     := True;
  DmlCad.FDQEnderecos.Active    := True;
  pctrlModulos.ActivePageIndex  := 0;
  pCtrlCad.ActivePageIndex      := 0;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  Try
    With DmlCad.FDQClientes do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM CAD_CLIENTES');
      Sql.Add('WHERE 0 = 0');


      if TRIM(edtPesqDocto.Text) <> '' then
        Sql.Add('AND CPFCNPJ_CLI = ' + QuotedStr(edtPesqDocto.Text));
      if TRIM(edtPesqNome.Text) <> '' then
        Sql.Add('AND NOME_CLI LIKE ' + QuotedStr('%'+edtPesqNome.Text+'%'));

      //de um jeito diferente
      if RgPesq.ItemIndex <> 2 then
      begin
        Sql.Add('AND ATIVO_CLI = :SITU');
        ParamByName('SITU').AsString :=  copy(RgPesq.Items[RgPesq.ItemIndex],1,1);
      end;

      Sql.Add('ORDER BY NOME_CLI');
      Open;
    End;

    If Dmlcad.FDQClientes.RecordCount = 0 then
      MessageBox(application.Handle,'Desculpa, não encontrei registros para o filtro informado!','CLIENTES',MB_OK+MB_ICONINFORMATION+MB_SYSTEMMODAL)
    else begin
      If Dmlcad.FDQClientes.RecordCount = 1 then
        stBarPesq.Panels[0].Text := inttostr(Dmlcad.FDQClientes.RecordCount)  + '  Cliente encontrado'
      else
        stBarPesq.Panels[0].Text := inttostr(Dmlcad.FDQClientes.RecordCount)   + '  Clientes encontrados';
    end;


  Finally

  End;


end;

end.
