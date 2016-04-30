unit uDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Forms, Windows, Messages, Dialogs,
  InvokeRegistry, Rio, SOAPHTTPClient, FileCtrl, MidasLib, AppEvnts, IniFiles,
  FMTBcd, DBClient, Provider, StdCtrls;

type
  TdmGerenciador = class(TDataModule)
    sqlConexao: TSQLConnection;
    ApplicationEvents1: TApplicationEvents;
    dstConfig: TSQLDataSet;
    dstUsuario: TSQLDataSet;
    dstConfigid: TIntegerField;
    dstConfigcfg_cnpj_empresa: TStringField;
    dstConfigcfg_venda: TIntegerField;
    dstConfigcfg_usuario: TIntegerField;
    dstConfigcfg_vendedor: TIntegerField;
    dstConfigcfg_flproducao: TStringField;
    dstConfigid_prevenda: TIntegerField;
    dstConfigcfg_razaosocial: TStringField;
    dstConfigcfg_fantasia: TStringField;
    dstConfigcfg_logradouro: TStringField;
    dstConfigcfg_logradouro_numero: TIntegerField;
    dstConfigcfg_bairro: TStringField;
    dstConfigcfg_cep: TStringField;
    dstConfigcfg_cidade: TStringField;
    dstConfigcfg_ufempresa: TStringField;
    dstConfigcfg_fone_empresa: TStringField;
    dstConfigcfg_mensagem_cupom1: TStringField;
    dstConfigcfg_mensagem_cupom2: TStringField;
    dstConfigcfg_data_atual: TDateField;
    dstConfigcfg_login_fpopular: TStringField;
    dstConfigcfg_senha_fpopular: TStringField;
    dstConfigcfg_chave: TStringField;
    dstUsuarioid: TIntegerField;
    dstUsuariosen_nome: TStringField;
    dstUsuariosenha: TStringField;
    dstUsuariosen_cargo: TStringField;
    dstUsuariosen_dtatual: TDateField;
    dspConfig: TDataSetProvider;
    dspUsuario: TDataSetProvider;
    cdsConfig: TClientDataSet;
    cdsUsuario: TClientDataSet;
    cdsConfigid: TIntegerField;
    cdsConfigcfg_cnpj_empresa: TStringField;
    cdsConfigcfg_venda: TIntegerField;
    cdsConfigcfg_usuario: TIntegerField;
    cdsConfigcfg_vendedor: TIntegerField;
    cdsConfigcfg_flproducao: TStringField;
    cdsConfigid_prevenda: TIntegerField;
    cdsConfigcfg_razaosocial: TStringField;
    cdsConfigcfg_fantasia: TStringField;
    cdsConfigcfg_logradouro: TStringField;
    cdsConfigcfg_logradouro_numero: TIntegerField;
    cdsConfigcfg_bairro: TStringField;
    cdsConfigcfg_cep: TStringField;
    cdsConfigcfg_cidade: TStringField;
    cdsConfigcfg_ufempresa: TStringField;
    cdsConfigcfg_fone_empresa: TStringField;
    cdsConfigcfg_mensagem_cupom1: TStringField;
    cdsConfigcfg_mensagem_cupom2: TStringField;
    cdsConfigcfg_data_atual: TDateField;
    cdsConfigcfg_login_fpopular: TStringField;
    cdsConfigcfg_senha_fpopular: TStringField;
    cdsConfigcfg_chave: TStringField;
    cdsUsuarioid: TIntegerField;
    cdsUsuariosen_nome: TStringField;
    cdsUsuariosenha: TStringField;
    cdsUsuariosen_cargo: TStringField;
    cdsUsuariosen_dtatual: TDateField;
    dstVendedor: TSQLDataSet;
    dstVendedorven_codigo: TIntegerField;
    dstVendedorven_nome: TStringField;
    dstVendedorven_login_fpopular: TStringField;
    dstVendedorven_senha_fpopular: TStringField;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    cdsVendedorven_codigo: TIntegerField;
    cdsVendedorven_nome: TStringField;
    cdsVendedorven_login_fpopular: TStringField;
    cdsVendedorven_senha_fpopular: TStringField;
    dstProduto: TSQLDataSet;
    dstProdutopro_barras: TStringField;
    dstProdutopro_medicamento: TStringField;
    dstProdutopro_quantidade_apresentacao: TFMTBCDField;
    dstProdutopro_valorvenda: TFMTBCDField;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutopro_barras: TStringField;
    cdsProdutopro_medicamento: TStringField;
    cdsProdutopro_quantidade_apresentacao: TFMTBCDField;
    cdsProdutopro_valorvenda: TFMTBCDField;
    dstConfigcfg_simulacao: TBooleanField;
    dstConfigcfg_vinculo_sistema: TBooleanField;
    cdsConfigcfg_simulacao: TBooleanField;
    cdsConfigcfg_vinculo_sistema: TBooleanField;
    dstPrevendas: TSQLDataSet;
    dstPrevendaItem: TSQLDataSet;
    dstPrevendasid_prevenda: TIntegerField;
    dstPrevendascpf_paciente: TStringField;
    dstPrevendascrm_medico: TStringField;
    dstPrevendasdata: TDateField;
    dstPrevendashora: TStringField;
    dstPrevendasid_vendedor: TIntegerField;
    dstPrevendassituacao: TStringField;
    dstPrevendasnumero_autorizacao: TStringField;
    dstPrevendasid_usuario: TIntegerField;
    dstPrevendaItemid_prevenda: TIntegerField;
    dstPrevendaItemid_item: TIntegerField;
    dstPrevendaItemproduto_codigo_barras: TStringField;
    dstPrevendaItemquant_solicitada: TFMTBCDField;
    dstPrevendaItemquant_preescrita: TFMTBCDField;
    dstPrevendaItemquant_autorizada: TFMTBCDField;
    dstPrevendaItemvalor_venda: TFMTBCDField;
    dstPrevendaItemvalor_parcela_ms: TFMTBCDField;
    dstPrevendaItemvalor_parcela_cliente: TFMTBCDField;
    dstPrevendaItemstatus: TStringField;
    dstPrevendaItemmotivo: TStringField;
    dspPrevendas: TDataSetProvider;
    dspPrevendaItens: TDataSetProvider;
    cdsPrevenda: TClientDataSet;
    cdsPrevendaItens: TClientDataSet;
    cdsPrevendaid_prevenda: TIntegerField;
    cdsPrevendacpf_paciente: TStringField;
    cdsPrevendacrm_medico: TStringField;
    cdsPrevendadata: TDateField;
    cdsPrevendahora: TStringField;
    cdsPrevendaid_vendedor: TIntegerField;
    cdsPrevendasituacao: TStringField;
    cdsPrevendanumero_autorizacao: TStringField;
    cdsPrevendaid_usuario: TIntegerField;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsListaVendedores: TClientDataSet;
    cdsListaVendedoresven_codigo: TIntegerField;
    cdsListaVendedoresven_nome: TStringField;
    cdsPrevendanome_vendedor: TStringField;
    cdsPrevendaItensid_prevenda: TIntegerField;
    cdsPrevendaItensid_item: TIntegerField;
    cdsPrevendaItensproduto_codigo_barras: TStringField;
    cdsPrevendaItensquant_solicitada: TFMTBCDField;
    cdsPrevendaItensquant_preescrita: TFMTBCDField;
    cdsPrevendaItensquant_autorizada: TFMTBCDField;
    cdsPrevendaItensvalor_venda: TFMTBCDField;
    cdsPrevendaItensvalor_parcela_ms: TFMTBCDField;
    cdsPrevendaItensvalor_parcela_cliente: TFMTBCDField;
    cdsPrevendaItensstatus: TStringField;
    cdsPrevendaItensmotivo: TStringField;
    cdsListaItens: TClientDataSet;
    cdsListaItensCDS_ID: TIntegerField;
    cdsListaItensCDS_PRODUTO: TStringField;
    cdsListaItensCDS_DESCRICAO: TStringField;
    cdsListaItensCDS_QUANTIDADE: TFloatField;
    cdsListaItensCDS_QUANT_APRESENTACAO: TFloatField;
    cdsListaItensCDS_QTPREESCRITA: TFloatField;
    cdsListaItensCDS_QUANT_AUTORIZADA: TFloatField;
    cdsListaItensCDS_QUANT_ESTORNADA: TFloatField;
    cdsListaItensCDS_STATUS: TStringField;
    cdsListaItensCDS_MOTIVO: TStringField;
    cdsListaItensCDS_VALOR_UNITARIO: TFloatField;
    cdsListaItensCDS_VALOR_MS: TFloatField;
    cdsListaItensCDS_VALOR_CLIENTE: TFloatField;
    cdsListaItensCDS_SITUACAO: TStringField;
    cdsListaItensCDS_SUBTOTAL: TFloatField;
    cdsListaItensCDS_VALOR_DIREFERENCA: TFloatField;
    dstPrevendasdata_receita: TDateField;
    cdsPrevendadata_receita: TDateField;
    cdsPrevendaNome_Situacao: TStringField;
    HTTPRIO1: THTTPRIO;
    cdsListaItensCDS_NRAUTORIZACAO: TStringField;
    cdsListaItensCDS_FLAUTORIZADO: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqlConexaoBeforeConnect(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure cdsListaItensCalcFields(DataSet: TDataSet);
    procedure cdsPrevendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Transc : TTransactionDesc;
    Function GetAmbienteFPopular(): String;
    function mvcodigo(campo,tabela:string):integer;
    function Maxmvcodigo(campo,tabela:string):integer;
    function mscodigo(campo,tabela:string):string;
    //
    procedure Start;
    procedure Comit(aTransc : TTransactionDesc);
    procedure Rollback(aMsg : String);
    function IDTransation : String;
    //
    Function ProcurarValor(aValor, aCampo, aTabela : String) : Boolean;
    Function ProcurarValorInt(aValor, aCampo, aTabela : String) : Boolean;
    Procedure CarregarListaVendedores(aCbxLista : TComboBox);
    Function GetQuantidadeApresentacao(aProduto : String): Double;
    Function AddItemListaProdutos(idSequencia : Integer; aProduto, aDescricao : String;
             fQuantidade, fQuantPreescrita, fValorUnitario : Double ): Boolean;
    Procedure AbrirDatasetItens();
    Function GetNomePaciente(aCPF : String): String;
    Function CalcularTotalItens(aCdsItens : TClientDataSet): Double;
    Function AdicionarPaciente(aCpf, aNome : String): String;
    Function AdicionarMedico(aCRM, aUF : String): String;
    Function GetIdVendedor(aNome : String): Integer;
    Function AdicionarItensPreVenda(idPrevenda : Integer; aCdsItens : TClientDataSet): Boolean;
    Function AtualizarItensPreVenda(idPrevenda : Integer; aCdsItens : TClientDataSet): Boolean;
    Function CarregarItensPreVenda(idPrevenda : Integer; aCdsItens : TClientDataSet): Boolean;
    Function GetUFMedico(aCRM : String): String;
    Function GetNomeVendedor(idVendedor : Integer): String;
    Function GetNomeProduto(aProduto: String): String;
    Function GetNomeUsuario(idUsuario : Integer): String;
    Function ExcluirItemPrevenda(idPrevenda : Integer; aProduto : String): Boolean;
    Function GerardnaEstacao(aCPF, aCNPJ, aCRM, aUFCRM, aDataReceita : String): Boolean;
    function ExecutaDna(const CmdLine: string;const WindowState: Word): boolean;
  end;

var
  dmGerenciador: TdmGerenciador;
  bHabilitarVenda : Boolean;
  aImgLogoFull : String;

implementation

Uses uFuncoes, udmPluspdv;

{$R *.dfm}

procedure TdmGerenciador.DataModuleCreate(Sender: TObject);
begin
     Try
          sqlConexao.Connected := False;
          sqlConexao.Connected := True;
          //
     Except
         on e: exception do
          begin
              Application.MessageBox(PChar('Erro na abertura do sistema! Erro:' + e.message),
                      'ATENÇÃO', MB_OK+MB_ICONERROR +MB_APPLMODAL);
              sqlConexao.Connected := false;
              Application.Terminate;
          End;
     End;
end;

procedure TdmGerenciador.DataModuleDestroy(Sender: TObject);
begin
    sqlConexao.Connected := false;
end;

procedure TdmGerenciador.sqlConexaoBeforeConnect(Sender: TObject);
Var 
	ConfigIni : TIniFile;
	Path, aFile, aHabilitarVenda : String;
begin
  try
      aFile := ExtractFilePath(ParamStr(0)) + 'dbexppgsql.dll';
      sqlConexao.VendorLib := aFile;
    	ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
      if not FileExists(ExtractFilePath(ParamStr(0)) + 'Config.ini') Then
      begin
           Application.MessageBox(PChar('Arquivo de configuração não encontrado!!!'),
                         'Atenção', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           raise Exception.Create('Erro arquivo de configuração.'+#13+'Aplicação encerrada.');
      End;
      //
      sqlConexao.Params.Values['HostName'] := ConfigIni.ReadString('CONFIG','SERVIDOR','');
    	sqlConexao.Params.Values['Database'] := ConfigIni.ReadString('CONFIG','DATABASE','');
      sqlConexao.Params.Values['User_Name'] := ConfigIni.ReadString('CONFIG','USUARIO','');
      sqlConexao.Params.Values['Password'] := ConfigIni.ReadString('CONFIG','PASS','');
      sqlConexao.Params.Values['PostgreSQL.UseUnicode'] := 'false';
      sqlConexao.Params.Values['Charset'] := 'win1252';
      //
      aImgLogoFull := 'N';
      if uFuncoes.empty(ConfigIni.ReadString('CONFIG','IMAGE_LOGO_FULL','')) Then
          aImgLogoFull := ConfigIni.ReadString('CONFIG','IMAGE_LOGO_FULL','');
      bHabilitarVenda := True;
      aHabilitarVenda := ConfigIni.ReadString('CONFIG','HABILITAR_VENDA','');
      If (aHabilitarVenda = 'N') Then
         bHabilitarVenda := False;
      //

  Finally
    	ConfigIni.Free;
  End;
end;

procedure TdmGerenciador.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
  NomeDoLog: string;
  Arquivo: TextFile;
begin
  NomeDoLog := ChangeFileExt(Application.Exename, '.log');
  AssignFile(Arquivo, NomeDoLog);
  if FileExists(NomeDoLog) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo, DateTimeToStr(Now) + ':' + E.Message);
    WriteLn(arquivo, '----------------------------------------------------------------------');
    Application.ShowException(E);
  finally
    CloseFile(arquivo)
  end;

end;

function TdmGerenciador.GetAmbienteFPopular: String;
var qraux : TSQLQuery;
    texto : string;
begin
  Result := 'P';
  texto := 'Select cfg_flproducao from config ';
  QrAux := TSQLQuery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConexao;
      sql.Add(texto);
      open;
      If Not (IsEmpty) Then
         Result := FieldByName('cfg_flproducao').AsString;
    finally
      free;
    end;
end;

function TdmGerenciador.Maxmvcodigo(campo, tabela: string): integer;
var qraux : TSQLQuery;
    texto : string;
begin
  texto := 'Select max('+campo+') from '+tabela;
  QrAux := TSQLQuery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConexao;
      sql.Add(texto);
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
end;

function TdmGerenciador.mscodigo(campo, tabela: string): string;
var qraux : TSQLQuery ;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSQLQuery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConexao;
      sql.Add(texto);
      open;
      result := fields[0].AsString;
    finally
      free;
    end;
end;

function TdmGerenciador.mvcodigo(campo, tabela: string): integer;
var qraux : TSQLQuery ;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSQLQuery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConexao;
      sql.Add(texto);
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
end;

procedure TdmGerenciador.Comit(aTransc: TTransactionDesc);
begin
     sqlConexao.Commit(aTransc);
end;

procedure TdmGerenciador.Rollback(aMsg : String);
begin
     sqlConexao.Rollback(Transc);
     raise Exception.Create(uFuncoes.MSG_ERROR+#13+aMsg);
end;

procedure TdmGerenciador.Start;
begin
     Transc.IsolationLevel := xilREADCOMMITTED;
     Transc.TransactionID  := StrToInt(IDTransation);
     sqlConexao.StartTransaction(Transc);
end;

function TdmGerenciador.IDTransation: String;
Var
  i : integer;
Const
  srt = '0123456789';
begin
     for i := 1 to 2 do
      begin
           Randomize;
           Result := Result + srt[Random(Length(srt))+1];
      End;
end;


function TdmGerenciador.ProcurarValor(aValor, aCampo,
  aTabela: String): Boolean;
Var
    qryBanco : TSQLQuery;
    texto : String;
    MydataModulePlus : TdmPluspdv;
begin
     result := False;
     texto  := 'select '+aCampo+' from '+aTabela+' where ('+aCampo+' = :pValor)';
     if (aCampo <> 'pro_barras') and (aTabela <> 'produtos') Then
     begin
          //
          qryBanco := TSQLQuery.Create(nil);
          with qryBanco do
           try
                SQLConnection := sqlConexao;
                Close;
                SQL.Add(texto);
                Params.ParamByName('pValor').AsString := aValor;
                Open;
                //
                If not (IsEmpty) Then
                     Result := True;
           Finally
              Free;
           End;
      End
      Else
      begin
           MydataModulePlus := TdmPluspdv.Create(nil);
           Try
                texto  := 'select cod_barras from '+aTabela+' where (cod_barras = :pValor)';
                //
                qryBanco := TSQLQuery.Create(nil);
                with qryBanco do
                 begin
                      SQLConnection := MydataModulePlus.sqlConnplus;
                      Close;
                      SQL.Add(texto);
                      Params.ParamByName('pValor').AsString := aValor;
                      Open;
                      //
                      If not (IsEmpty) Then
                         Result := true;
                 End;
           Finally
                 if (qryBanco <> nil) then
                    qryBanco.Free;
                 MydataModulePlus.Free;
           End;
      End;
end;

function TdmGerenciador.ProcurarValorInt(aValor, aCampo,
  aTabela: String): Boolean;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     result := False;
     texto  := 'select '+aCampo+' from '+aTabela+' where ('+aCampo+' = :pValor)';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pValor').AsInteger := StrtoInt( aValor );
           Open;
           //
           If not (IsEmpty) Then
                Result := True;
      Finally
         Free;
      End;
end;


procedure TdmGerenciador.CarregarListaVendedores(aCbxLista: TComboBox);
var qraux : TSQLQuery ;
    texto : string;
begin
  texto := 'select ven_codigo, ven_nome from vendedores order by ven_nome ';
  QrAux := TSQLQuery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConexao;
      sql.Add(texto);
      open;
      if not (IsEmpty) Then
       begin
            aCbxLista.Clear;
            While not (Eof) do
            begin
                 aCbxLista.Items.Add(FieldByName('ven_nome').AsString);
                 //
                 Next;
            End;
       End;
    finally
      free;
    end;
end;

procedure TdmGerenciador.cdsListaItensCalcFields(DataSet: TDataSet);
begin
     if (cdsListaItens.State = dsInternalCalc) Then
      begin
           // Subtotal
           if (cdsListaItensCDS_QUANTIDADE.AsFloat > 0)
              and (cdsListaItensCDS_VALOR_UNITARIO.AsFloat > 0) Then
             cdsListaItensCDS_SUBTOTAL.AsFloat := (cdsListaItensCDS_VALOR_UNITARIO.AsFloat * cdsListaItensCDS_QUANTIDADE.AsFloat);
           // valor diferenca
           cdsListaItensCDS_VALOR_DIREFERENCA.AsFloat := (cdsListaItensCDS_VALOR_MS.AsFloat - cdsListaItensCDS_VALOR_CLIENTE.AsFloat);
      End;
end;

function TdmGerenciador.AddItemListaProdutos(idSequencia : Integer; aProduto, aDescricao: String;
  fQuantidade, fQuantPreescrita, fValorUnitario: Double): Boolean;
Var
   fQuantAprensetacao : Double;
begin
     Result := False;
     Try
         With cdsListaItens do
          begin
               Append;
               FieldByName('CDS_ID').AsInteger       := idSequencia;
               FieldByName('CDS_PRODUTO').AsString   := ufuncoes.StrZero(aProduto,13);
               FieldByName('CDS_DESCRICAO').AsString := aDescricao;
               FieldByName('CDS_QUANTIDADE').AsFloat := fQuantidade;
               fQuantAprensetacao := GetQuantidadeApresentacao(FieldByName('CDS_PRODUTO').AsString);
               FieldByName('CDS_QUANT_APRESENTACAO').AsFloat := fQuantAprensetacao;
               FieldByName('CDS_QTPREESCRITA').AsFloat       := fQuantPreescrita;
               FieldByName('CDS_VALOR_UNITARIO').AsFloat     := fValorUnitario;
               FieldByName('CDS_SITUACAO').AsString := 'N';
               //
               Post;
          End;  // With cdsListaItens do
          Result := True;
     Except
          on e: exception do
           begin
                Application.MessageBox(PChar('Error : '+e.Message),
                    'Atenção', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           End;
     End;
end;

function TdmGerenciador.GetQuantidadeApresentacao(
  aProduto: String): Double;
Var
    qryBanco : TSQLQuery;
    texto : String;
    MydataModulePlus : TdmPluspdv;
begin
     Result := 1;
     if not (dmGerenciador.cdsConfigcfg_vinculo_sistema.AsBoolean) Then
      begin
          texto  := 'select pro_barras, pro_quantidade_apresentacao from produtos where (pro_barras = :pbarras) ';
          //
          qryBanco := TSQLQuery.Create(nil);
          { Banco Local}
          with qryBanco do
           try
                SQLConnection := sqlConexao;
                Close;
                SQL.Add(texto);
                Params.ParamByName('pbarras').AsString := uFuncoes.StrZero(aProduto, 13 );
                Open;
                //
                If not (IsEmpty) Then
                  if not uFuncoes.Empty(FieldByName('pro_quantidade_apresentacao').AsString) Then
                      Result := FieldByName('pro_quantidade_apresentacao').AsFloat;
           Finally
              Free;
           End;
      //
      End
      Else      { Banco Pluspdv}
      begin
           MydataModulePlus := TdmPluspdv.Create(nil);
           Try
                texto  := 'Select p.id, p.cod_barras, p.quant_armaz from produtos p where (p.cod_barras = :pbarras) ';
                //
                qryBanco := TSQLQuery.Create(nil);
                with qryBanco do
                 begin
                      SQLConnection := MydataModulePlus.sqlConnplus;
                      Close;
                      SQL.Add(texto);
                      Params.ParamByName('pbarras').AsString := uFuncoes.StrZero(aProduto,13);
                      Open;
                      //
                      If not (IsEmpty) Then
                        if not uFuncoes.Empty(FieldByName('quant_armaz').AsString) Then
                            Result := FieldByName('quant_armaz').AsFloat;
                 End;
           Finally
                 if (qryBanco <> nil) then
                    qryBanco.Free;
                 MydataModulePlus.Free;
           End;
      End;
end;

procedure TdmGerenciador.AbrirDatasetItens;
begin
     uFuncoes.RefreshCDS(cdsListaItens);
     cdsListaItens.EmptyDataSet;
end;

function TdmGerenciador.GetNomePaciente(aCPF: String): String;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     Result := '';
     texto  := 'select pac_cpf, pac_nome from pacientes where (pac_cpf = :pcpf) ';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pcpf').AsString := uFuncoes.Alltrim(aCPF);
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByName('pac_nome').AsString;
      Finally
         Free;
      End;
end;

function TdmGerenciador.CalcularTotalItens(
  aCdsItens: TClientDataSet): Double;
Var
   fSubTotal, FValor_MS, FValorCliente : Double;
begin
     Result := 0;
     fSubTotal := 0;
     FValor_MS := 0;
     FValorCliente  := 0;
     //
     aCdsItens.DisableControls;
     Try
          With aCdsItens do
          begin
               First;
               While not (Eof) do
                begin
                     fSubTotal := fSubTotal + FieldByname('CDS_SUBTOTAL').AsFloat;
                     FValor_MS := FValor_MS + FieldByname('CDS_VALOR_MS').AsFloat;
                     FValorCliente := FValorCliente + FieldByname('CDS_VALOR_CLIENTE').AsFloat;
                     //
                     Next;
                End;
                //
                Result := fSubTotal;
          End;  // With aCdsItens do
     Finally
         aCdsItens.First;
         aCdsItens.EnableControls;
     End;
end;

function TdmGerenciador.AdicionarMedico(aCRM, aUF: String): String;
Var
    qryConsulta, qryAux : TSQLQuery;
    texto, SqlTexto : String;
begin
     Result := '';
     texto  := 'select med_crm from medicos where (med_crm = :pcrm) ';
     //
     qryConsulta := TSQLQuery.Create(nil);
     with qryConsulta do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pcrm').AsString := uFuncoes.Alltrim(aCRM);
           Open;
           //
           If (IsEmpty) Then
               SqlTexto := 'Insert into medicos (med_crm, med_uf) values (:pcrm, :puf)'   // Inclusão
           Else
               SqlTexto := 'Update medicos set med_uf = :puf where (med_crm = :pcrm)';   // Alteração
           // Atualiza dados
           qryAux := TSQLQuery.Create(nil);
           With qryAux do
           begin
                try
                   SQLConnection := sqlConexao;
                   Close;
                   SQL.Add(SqlTexto);
                   Params.ParamByName('pcrm').AsString := uFuncoes.Alltrim(aCRM);
                   Params.ParamByName('puf').AsString  := auf;
                   ExecSQL();
                   Result := aCRM;
                Finally
                    Free;
                End;
           End;
      Finally
         Free;
      End;
end;

function TdmGerenciador.AdicionarPaciente(aCpf, aNome: String): String;
Var
    qryConsulta, qryAux : TSQLQuery;
    texto, SqlTexto : String;
begin
     Result := '';
     texto  := 'select pac_cpf from pacientes where (pac_cpf = :pcpf) ';
     //
     qryConsulta := TSQLQuery.Create(nil);
     with qryConsulta do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pcpf').AsString := uFuncoes.Alltrim(aCPF);
           Open;
           //
           If (IsEmpty) Then
               SqlTexto := 'Insert into pacientes (pac_cpf, pac_nome) values (:pcpf, :pnome)'   // Inclusão
           Else
               SqlTexto := 'Update pacientes set pac_nome = :pnome where (pac_cpf = :pcpf)';   // Alteração
           // Atualiza dados
           qryAux := TSQLQuery.Create(nil);
           With qryAux do
           begin
                try
                   SQLConnection := sqlConexao;
                   Close;
                   SQL.Add(SqlTexto);
                   Params.ParamByName('pcpf').AsString  := uFuncoes.Alltrim(aCPF);
                   Params.ParamByName('pnome').AsString := aNome;
                   ExecSQL();
                   Result := aCpf;
                Finally
                    Free;
                End;
           End;
      Finally
         Free;
      End;
end;

function TdmGerenciador.GetIdVendedor(aNome: String): Integer;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     Result := -1;
     texto  := 'select ven_codigo, ven_nome from vendedores where (ven_nome = :pnome) ';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pnome').AsString := aNome;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByName('ven_codigo').AsInteger;
      Finally
         Free;
      End;
end;

function TdmGerenciador.AdicionarItensPreVenda(idPrevenda : Integer;
  aCdsItens: TClientDataSet): Boolean;
Var
   iItem : Integer;
begin
     Result := False;
     uFuncoes.FilterCDS(cdsPrevendaItens, fsInteger, InttoStr(idPrevenda));
     if (cdsPrevendaItens.IsEmpty) Then
     begin
          aCdsItens.DisableControls;
          Try
            With aCdsItens do
            begin
                 First;
                 iItem := 1;
                 While not (Eof) do
                  begin
                       // incluir item
                       cdsPrevendaItens.Append;
                       cdsPrevendaItensid_prevenda.AsInteger    := idPrevenda;
                       cdsPrevendaItensid_item.AsInteger        := iItem;
                       cdsPrevendaItensproduto_codigo_barras.AsString := FieldByname('CDS_PRODUTO').AsString;
                       cdsPrevendaItensquant_solicitada.AsFloat := FieldByname('CDS_QUANTIDADE').AsFloat;
                       cdsPrevendaItensquant_preescrita.AsFloat := FieldByname('CDS_QTPREESCRITA').AsFloat;
                       cdsPrevendaItensvalor_venda.AsFloat      := FieldByname('CDS_VALOR_UNITARIO').AsFloat;
                       //
                       iItem := iItem + 1;
                       Next;
                  End;
            End;
            cdsPrevendaItens.ApplyUpdates(0);
            Result := true;
         Finally
             aCdsItens.EnableControls;
         End;
     End;
end;

function TdmGerenciador.GetUFMedico(aCRM: String): String;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     Result := '';
     texto  := 'select med_crm, med_uf from medicos where (med_crm = :pcrm) ';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pcrm').AsString := aCRM;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByName('med_uf').AsString;
      Finally
         Free;
      End;
end;

function TdmGerenciador.CarregarItensPreVenda(idPrevenda: Integer;
  aCdsItens: TClientDataSet): Boolean;
begin
     Result := False;
     uFuncoes.FilterCDS(cdsPrevendaItens, fsInteger, InttoStr(idPrevenda));
     if not (cdsPrevendaItens.IsEmpty) Then
     begin
          aCdsItens.DisableControls;
          uFuncoes.RefreshCDS(aCdsItens);
          aCdsItens.EmptyDataSet;
          Try
            With aCdsItens do
            begin
                 cdsPrevendaItens.First;
                 While not (cdsPrevendaItens.Eof) do
                  begin
                       // incluir item
                       Append;
                       FieldByname('CDS_PRODUTO').AsString       := cdsPrevendaItensproduto_codigo_barras.AsString;
                       FieldByname('CDS_DESCRICAO').AsString     := GetNomeProduto(cdsPrevendaItensproduto_codigo_barras.AsString);
                       FieldByname('CDS_QUANTIDADE').AsFloat     := cdsPrevendaItensquant_solicitada.AsFloat;
                       FieldByname('CDS_QTPREESCRITA').AsFloat   := cdsPrevendaItensquant_preescrita.AsFloat;
                       FieldByname('CDS_VALOR_UNITARIO').AsFloat := cdsPrevendaItensvalor_venda.AsFloat;
                       //
                       cdsPrevendaItens.Next;
                  End;   // While not (Eof) do
            End;      //  With aCdsItens do
            Result := True;
          Finally
               aCdsItens.First;
               aCdsItens.EnableControls;
          End;
         End;  // if (cdsPrevendaItens.IsEmpty) Then
end;

function TdmGerenciador.GetNomeProduto(aProduto: String): String;
Var
    qryBanco : TSQLQuery;
    texto : String;
    MydataModulePlus : TdmPluspdv;
begin
     Result := '';
     uFuncoes.RefreshCDS(cdsConfig);
     if not (cdsConfigcfg_vinculo_sistema.AsBoolean) Then
      begin
          texto  := 'select pro_barras, pro_medicamento from produtos where (pro_barras = :pbarras) ';
          //
          qryBanco := TSQLQuery.Create(nil);
          with qryBanco do
           try
                SQLConnection := sqlConexao;
                Close;
                SQL.Add(texto);
                Params.ParamByName('pbarras').AsString := uFuncoes.StrZero(aProduto,13);
                Open;
                //
                If not (IsEmpty) Then
                   Result := FieldByName('pro_medicamento').AsString;
           Finally
              Free;
           End;
      End
      Else
      begin
           //Application.CreateForm(TdmPluspdv, MydataModulePlus);
           MydataModulePlus := TdmPluspdv.Create(nil);
           Try
                texto  := 'Select p.id, p.descricao, p.cod_barras from produtos p where (p.cod_barras = :pbarras) ';
                //
                qryBanco := TSQLQuery.Create(nil);
                with qryBanco do
                 begin
                      SQLConnection := MydataModulePlus.sqlConnplus;
                      Close;
                      SQL.Add(texto);
                      Params.ParamByName('pbarras').AsString := uFuncoes.StrZero(aProduto,13);
                      Open;
                      //
                      If not (IsEmpty) Then
                         Result := FieldByName('descricao').AsString;
                 End;
           Finally
                 if (qryBanco <> nil) then
                    qryBanco.Free;
                 MydataModulePlus.Free;
           End;
      End;
end;

function TdmGerenciador.ExcluirItemPrevenda(idPrevenda: Integer;
  aProduto: String): Boolean;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     Result := False;
     texto  := 'delete from prevenda_itens where (id_prevenda = :pid) and (produto_codigo_barras = :pbarras) ';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
          Start;
          Try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pid').AsInteger    := idPrevenda;
           Params.ParamByName('pbarras').AsString := uFuncoes.StrZero(aProduto,13);
           ExecSQL();
           Comit(Transc);
           Result := True;
           //
          Except
                on e: exception do
                    Rollback(e.Message);
          End;
      Finally
         Free;
      End;
end;

function TdmGerenciador.GetNomeVendedor(idVendedor: Integer): String;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     Result := '';
     texto  := 'select ven_codigo, ven_nome from vendedores where (ven_codigo = :pcodigo) ';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pcodigo').AsInteger := idVendedor;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByName('ven_nome').AsString;
      Finally
         Free;
      End;
end;

function TdmGerenciador.AtualizarItensPreVenda(idPrevenda: Integer;
  aCdsItens: TClientDataSet): Boolean;
Var
   iItem : Integer;
   aProduto : String;
begin
     Result := False;
     uFuncoes.FilterCDS(cdsPrevendaItens, fsInteger, InttoStr(idPrevenda));
          aCdsItens.DisableControls;
          Try
            With aCdsItens do
            begin
                 First;
                 iItem := 1;
                 cdsPrevendaItens.First;
                 While not (Eof) do
                  begin
                       aProduto := FieldByname('CDS_PRODUTO').AsString;
                       if not (cdsPrevendaItens.Locate('produto_codigo_barras', aProduto,[])) Then
                       begin
                           cdsPrevendaItens.Append;
                           cdsPrevendaItensid_prevenda.AsInteger    := idPrevenda;
                       End
                       Else
                           // Atualiza item
                           cdsPrevendaItens.Edit;
                       //
                       cdsPrevendaItensid_item.AsInteger        := iItem;
                       cdsPrevendaItensproduto_codigo_barras.AsString := FieldByname('CDS_PRODUTO').AsString;
                       cdsPrevendaItensquant_solicitada.AsFloat := FieldByname('CDS_QUANTIDADE').AsFloat;
                       cdsPrevendaItensquant_preescrita.AsFloat := FieldByname('CDS_QTPREESCRITA').AsFloat;
                       cdsPrevendaItensvalor_venda.AsFloat      := FieldByname('CDS_VALOR_UNITARIO').AsFloat;
                       cdsPrevendaItens.post;
                       //
                       iItem := iItem + 1;
                       // Próximo registro
                       Next;
                  End;
            End;
            cdsPrevendaItens.ApplyUpdates(0);
            Result := true;
         Finally
             aCdsItens.EnableControls;
         End;
end;

function TdmGerenciador.GetNomeUsuario(idUsuario: Integer): String;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     Result := '';
     texto  := 'select id, sen_nome from usuarios where (id = :pcodigo) ';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pcodigo').AsInteger := idUsuario;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByName('sen_nome').AsString;
      Finally
         Free;
      End;
end;

procedure TdmGerenciador.cdsPrevendaCalcFields(DataSet: TDataSet);
begin
     If (cdsPrevenda.State = dsInternalcalc) Then
     begin
          If (cdsPrevendasituacao.AsString = 'A') Then
              cdsPrevendaNome_Situacao.AsString := 'ABERTA';
          If (cdsPrevendasituacao.AsString = 'E') Then
              cdsPrevendaNome_Situacao.AsString := 'ENVIADA';
          If (cdsPrevendasituacao.AsString = 'P') Then
              cdsPrevendaNome_Situacao.AsString := 'PRÉ-AUTORIZADA';
          If (cdsPrevendasituacao.AsString = 'N') Then
              cdsPrevendaNome_Situacao.AsString := 'NÃO AUTORIZADA';
          If (cdsPrevendasituacao.AsString = 'F') Then
              cdsPrevendaNome_Situacao.AsString := 'FECHADA';
     End;
end;

function TdmGerenciador.ExecutaDna(const CmdLine: string;
  const WindowState: Word): boolean;
var
   SUInfo: TStartupInfo;
   ProcInfo: TProcessInformation;
begin
   FillChar(SUInfo, SizeOf(SUInfo), #0);
   with SUInfo do
   begin
      cb := SizeOf(SUInfo);
      dwFlags := STARTF_USESHOWWINDOW;
      wShowWindow := WindowState;
   end;
   Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
             CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
             Nil, SUInfo, ProcInfo);
   { Aguarda até ser finalizado }
   if Result then
   begin
      If FileExists('c:\windows\system32\ftp.exe') Then // gambiarra pra saber se é windows 98
         WaitForSingleObject(ProcInfo.hProcess, INFINITE);
      { Libera os Handles }
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
   end;
end;

function TdmGerenciador.GerardnaEstacao(aCPF, aCNPJ, aCRM, aUFCRM,
  aDataReceita: String): Boolean;
Var
  aEspaco : String;
begin
     Result := false;
     aEspaco := ' ';
     try
         if (FileExists('DNA.TXT')) Then
             DeleteFile('DNA.TXT');
         winexec(PChar('gbasmsb.exe --solicitacao '+aCPF+ aEspaco + aCNPJ +aEspaco
            +aCRM+ aEspaco + aUFCRM + aEspaco + aDataReceita +' > DNA.TXT'),0);
         Result := true;
     Except

     End;
end;

end.
