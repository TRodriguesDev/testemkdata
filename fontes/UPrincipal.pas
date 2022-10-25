unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, System.StrUtils, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, ACBrConsultaCNPJ, ACBrBase, ACBrSocket,
  ACBrConsultaCPF, ACBrValidador, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmPrincipal = class(TForm)
    pctrlModulos: TPageControl;
    TabClientes: TTabSheet;
    TabProdutos: TTabSheet;
    pCtrlCad: TPageControl;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    TabPesqCli: TTabSheet;
    TabCadCli: TTabSheet;
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
    DBNavCli: TDBNavigator;
    DBNavCto: TDBNavigator;
    DBNavigator4: TDBNavigator;
    DBNavEnd: TDBNavigator;
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
    btnPesq: TSpeedButton;
    ACBrValidador: TACBrValidador;
    Label29: TLabel;
    DBEdit4: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure verificardoctos(tp:integer;valor:string;Inserindo:Boolean);
    procedure edtCpfCnpfExit(Sender: TObject);
    procedure edtRgIEExit(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure edtCpfCnpfKeyPress(Sender: TObject; var Key: Char);
    procedure DBCTipoExit(Sender: TObject);
    procedure DBGPesqDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavCliClick(Sender: TObject; Button: TNavigateBtn);
    procedure edtPesqDoctoExit(Sender: TObject);
    procedure pCtrlCadChange(Sender: TObject);
    procedure pctrlModulosChange(Sender: TObject);

  private
    procedure iniClientes(Pesq : TFDQuery);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  function validardocto(docto, Tp : string; validador : TACBrValidador) : boolean;


implementation

Uses UDmlCad;

{$R *.dfm}

function validardocto(docto, Tp: string; validador : TACBrValidador) : boolean;
Begin
  Result := true;
  if (tp = '1') and (length(trim(docto)) < 14) then
  begin
    messagebox(application.Handle,'CNPJ incompleto, por favor, preencha corretamente!','CLIENTES',mb_ok+MB_ICONINFORMATION+MB_SYSTEMMODAL);
    result := False;
  end;

  Validador.Documento := Trim(docto);
  if tp = '0' then
    Validador.TipoDocto := docCPF
  else
    Validador.TipoDocto := docCNPJ;

  if Validador.Validar then
  else begin
    messagebox(application.Handle,'O Número do documento esta incorreto, por favor, preencha corretamente!','CLIENTES',mb_ok+MB_ICONINFORMATION+MB_SYSTEMMODAL);
    Result := False;
  end;
end;

procedure TFrmPrincipal.iniClientes(Pesq : TFDQuery);
begin
  With Pesq do
  Begin
    Active := false;
    Sql.Clear;
    Sql.Add('SELECT C.*, CONTATOS, ENDERECOS FROM CAD_CLIENTES C');
    Sql.Add('LEFT OUTER JOIN');
    Sql.Add('(SELECT ID_CLIENTE, COUNT(ID_CLIENTE) CONTATOS FROM CAD_CONTATOS');
    Sql.Add('GROUP BY ID_CLIENTE) TCONT ON C.IDCLIENTE = TCONT.ID_CLIENTE');
    Sql.add('LEFT OUTER JOIN');
    Sql.Add('(SELECT ID_CLIENTE, COUNT(ID_CLIENTE) ENDERECOS FROM CAD_ENDERECOS');
    Sql.Add('GROUP BY ID_CLIENTE) TEND ON C.IDCLIENTE = TEND.ID_CLIENTE');
  End;
end;


procedure TFrmPrincipal.pCtrlCadChange(Sender: TObject);
begin
  if TabClientes.Showing = true then
    pCtrlDets.TabIndex := 0;
end;

procedure TFrmPrincipal.pctrlModulosChange(Sender: TObject);
begin
  if TabClientes.Showing = true then
  Begin
    pCtrlCad.TabIndex   := 0;
    pCtrlDets.TabIndex  := 0;
  End;

end;

procedure TFrmPrincipal.verificardoctos(tp:integer;valor:string;Inserindo:Boolean);
Var
  Pesq: TFDQuery;
  vDocto : String;
  vStatus : Integer;
begin
  if tp = 0 then
    vDocto := 'CPF/CNPJ'
  else
    vDocto := 'RG/IE';

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
        //Sql.Add('SELECT * FROM CAD_CLIENTES C');
        iniClientes(DmlCad.FDQClientes);
        Sql.Add('WHERE IDCLIENTE = ' + inttostr(Pesq.FieldByName('IDCLIENTE').AsInteger));
        Open;
      End;
    end;
  end;

  Pesq.DisposeOf;
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

procedure TFrmPrincipal.DBNavCliClick(Sender: TObject;
  Button: TNavigateBtn);
var
  vIdUlt : Integer;
  Pesq : TFDQuery;
  vInsc : Boolean;
begin
  vInsc := DmlCad.FDQClientes.State in [dsInsert];
  if Button = nbPost then
  begin
    //vIdUlt := 0;
    if ((length(trim(edtCpfCnpf.Text)) > 10) and (Length(trim(edtNome.Text)) > 3) and (Length(Trim(edtRgIE.Text)) > 3)) then
    else begin
      MessageBox(application.Handle,'Preencha todos os campos!','CLIENTES',mb_ok+MB_ICONINFORMATION+MB_SYSTEMMODAL);
      abort;
    end;

    {
    Pesq := TFDQuery.Create(Nil);
    Pesq.Connection := DmlCad.FDCon;
    Pesq.sql.Clear;
    Pesq.sql.Add('SELECT GEN_ID(GEN_IDCLIENTES,0) ULT FROM CAD_CLIENTES');
    Pesq.Active := True;

    vIdUlt := Pesq.FieldByName('ULT').AsInteger + 1; }

    DmlCad.FDQClientes.Refresh;

    if vInsc = true then
    begin
      iniClientes(DmlCad.FDQClientes);
      DmlCad.FDQClientes.Active := True;
      DmlCad.FDQClientes.Last;
    end;
    //DmlCad.FDQClientes.Locate('IDCLIENTE',vIdUlt,[]);

  end;
end;

procedure TFrmPrincipal.edtCEPExit(Sender: TObject);

function consultaCEP : Boolean;
var
  json : string;
  vjsonPair : TJSONPair;
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

      DmlCad.FDQEnderecos.FieldByName('END_END').AsString := jsonObj.GetValue('logradouro').value;
      DmlCad.FDQEnderecos.FieldByName('BAI_END').AsString := jsonObj.GetValue('bairro').value;
      DmlCad.FDQEnderecos.FieldByName('CID_END').AsString := jsonObj.GetValue('localidade').value;
      DmlCad.FDQEnderecos.FieldByName('UF_END').AsString  := jsonObj.GetValue('uf').value;
      Result := True;

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
  if validardocto(Trim(edtCpfCnpf.Text), ifthen(DmlCad.FDQClientesTIPO_CLI.asstring='F','0','1'), ACBrValidador) = False then
    edtCpfCnpf.SetFocus;

  //Verifica se ja existe documento cadastrado
  verificardoctos(0,edtCpfCnpf.Text,DmlCad.FDQClientes.State in [dsInsert]);
end;

procedure TFrmPrincipal.edtCpfCnpfKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9'] = false) and (key <> char(8))  then
    key := #0;
end;

procedure TFrmPrincipal.edtPesqDoctoExit(Sender: TObject);
begin
  if Trim(edtPesqDocto.Text) <> '' then
    if validardocto(Trim(edtPesqDocto.Text), Ifthen(Length(Trim(edtPesqDocto.Text)) > 11,'1','0'), ACBrValidador) = False then
      edtPesqDocto.SetFocus;
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

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TabPesqCli.Showing = true then
    if Key = vk_f3 then
      btnPesq.Click;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  iniClientes(DmlCad.FDQClientes);
  DmlCad.FDQClientes.sql.Add('WHERE 0 = -1');
  DmlCad.FDQClientes.Active     := True;

  DmlCad.FDQContatos.Active     := True;
  DmlCad.FDQEnderecos.Active    := True;
  pctrlModulos.ActivePageIndex  := 0;
  pCtrlCad.ActivePageIndex      := 0;
end;

procedure TFrmPrincipal.btnPesqClick(Sender: TObject);
begin
  Try
    With DmlCad.FDQClientes do
    Begin
      iniClientes(DmlCad.FDQClientes);
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

    stBarPesq.Panels[0].Text :=  ' Não encontrei clientes';

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
