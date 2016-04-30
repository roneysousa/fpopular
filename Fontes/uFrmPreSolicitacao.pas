unit uFrmPreSolicitacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadModelo, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  StdCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  DBCtrls, ComCtrls, ToolEdit, Mask, CurrEdit, XSBuiltIns;

type
  TFrmPreSolicitacao = class(TFrmCadastro)
    Panel5: TPanel;
    pnlProduto: TPanel;
    JvGridDados: TJvDBUltimGrid;
    gbxReceitas: TGroupBox;
    Label1: TLabel;
    edtNRCPF: TMaskEdit;
    spLocCliente: TSpeedButton;
    Label8: TLabel;
    edtNMCLIE: TEdit;
    Label2: TLabel;
    edtNRCRM: TEdit;
    Label11: TLabel;
    cmbUF: TComboBox;
    Label3: TLabel;
    edtDTEMISSAO: TDateEdit;
    Label10: TLabel;
    cmbVendedores: TComboBox;
    edtCodigo: TEdit;
    edtQuantidade: TCurrencyEdit;
    edtQuantPreescrita: TCurrencyEdit;
    edtNMDESC: TEdit;
    spLocProduto: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    edtValor: TCurrencyEdit;
    pnlMensagem: TPanel;
    dsProdutos: TDataSource;
    lblTotal: TPanel;
    lblPreSolicitacao: TLabel;
    DBText2: TDBText;
    dbeInicio: TDateEdit;
    dbeFinal: TDateEdit;
    lblA: TLabel;
    cdsConsultarid_prevenda: TIntegerField;
    cdsConsultarcpf_paciente: TStringField;
    cdsConsultarpac_nome: TStringField;
    cdsConsultarcrm_medico: TStringField;
    cdsConsultarmed_uf: TStringField;
    cdsConsultarid_vendedor: TIntegerField;
    cdsConsultarven_nome: TStringField;
    cdsConsultarsituacao: TStringField;
    cdsConsultarnumero_autorizacao: TStringField;
    cdsConsultarid_usuario: TIntegerField;
    cdsConsultardata_receita: TDateField;
    DBText3: TDBText;
    Label9: TLabel;
    btnSolicitar: TBitBtn;
    StatusBar1: TStatusBar;
    procedure edtDTEMISSAOExit(Sender: TObject);
    procedure edtNRCRMKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbUFKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTEMISSAOKeyPress(Sender: TObject; var Key: Char);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantPreescritaKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantPreescritaExit(Sender: TObject);
    procedure cmbVendedoresKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCPFExit(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure edtNRCRMExit(Sender: TObject);
    procedure spLocProdutoClick(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtNRCPFChange(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure dbeFinalKeyPress(Sender: TObject; var Key: Char);
    procedure dbeInicioExit(Sender: TObject);
    procedure dbeFinalExit(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure dbeInicioKeyPress(Sender: TObject; var Key: Char);
    procedure tsPesquisaShow(Sender: TObject);
    procedure dbeInicioEnter(Sender: TObject);
    procedure dbeFinalEnter(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSolicitarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure HabilitarControles(bStatus : Boolean);
    Procedure BuscaRegistro(aCodigo : String);
    Procedure BuscaDadosProduto(aProduto : String);
    Procedure LimparCamposReceita();
    Procedure LimparCamposProduto();
    Procedure CentralizarPainelMensagem(bStatus : Boolean);
    Procedure NovoRegistro();
    Function ValidarCampos(): Boolean;
    Function VerificarProdutoLista(aProduto : String): Boolean;
    Procedure HabilitarCamposData(bStatus : Boolean);
    Procedure BuscarDadosPreSolicitacao();
    Function Solicitacao(): Boolean;
  public
    { Public declarations }
  end;

var
  FrmPreSolicitacao: TFrmPreSolicitacao;
  iTentativa : Integer;

implementation

uses uDM, uFuncoes, UFrmPesquisaProdutos, uFrmPesquisaClientes,
  ServicoSolicitacaoWS1, udmPluspdv, uFrmPesqProdutosPlus;

{$R *.dfm}

procedure TFrmPreSolicitacao.edtDTEMISSAOExit(Sender: TObject);
begin
  inherited;
    If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTEMISSAO.Text)) Then
     Begin
        Try
            StrToDate(edtDTEMISSAO.Text);
            edtDTEMISSAO.Date := StrToDate(edtDTEMISSAO.Text);
            //
            If (edtDTEMISSAO.Date > Date()) Then
              begin
                   edtDTEMISSAO.SetFocus;
                   Exit; 
              End;
        Except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               edtDTEMISSAO.SetFocus;
               Exit;
          End;
        end;
     End;
end;

procedure TFrmPreSolicitacao.HabilitarControles(bStatus: Boolean);
begin
     gbxReceitas.Enabled := bStatus;
     pnlProduto.Enabled  := bStatus;
end;

procedure TFrmPreSolicitacao.edtNRCRMKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13) and not uFuncoes.Empty(edtNRCRM.Text) Then
      begin
           Key := #0;
           cmbUF.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.edtNRCPFKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (key = #13) and uFuncoes.Empty(uFuncoes.RemoveChar(edtNRCPF.Text)) Then
      begin
           Key := #0;
           spLocClienteClick(Sender);
      End;
      //
     If (key = #13) and not uFuncoes.Empty(edtNRCPF.Text) Then
      begin
           Key := #0;
           edtNMCLIE.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.edtNMCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (key = #13) and not uFuncoes.Empty(edtNMCLIE.Text) Then
      begin
           Key := #0;
           edtNRCRM.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.cmbUFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (key = #13)
        and not uFuncoes.Empty(cmbUF.Text) Then
      begin
           Key := #0;
           edtDTEMISSAO.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.edtDTEMISSAOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTEMISSAO.Text)) Then
      Begin
          KEY := #0;
          cmbVendedores.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.BtAdicionarClick(Sender: TObject);
begin
  inherited;
       NovoRegistro();
end;

procedure TFrmPreSolicitacao.BtCancelarClick(Sender: TObject);
begin
     if (dsCadastro.DataSet.State = dsInsert) Then
      begin
          LimparCamposReceita();
          LimparCamposProduto();
          TClientDataSet(dsProdutos.DataSet).EmptyDataSet;
          dsProdutos.DataSet.Close;
      End;
  inherited;
        HabilitarControles(False);
        if (BtAdicionar.Enabled) Then
           BtAdicionar.SetFocus;
end;

procedure TFrmPreSolicitacao.BtGravarClick(Sender: TObject);
Var
   aOpcao, aCPF, aNomePaciente, aCRM,aUFMedico, aHora : String;
   idUsuario, idVendedor : Integer;
begin
//  inherited;
     If not (ValidarCampos()) Then
         Exit;
     //
     if (dsCadastro.DataSet.State = dsInsert) Then
            aOpcao := 'I';
     if (dsCadastro.DataSet.State = dsEdit) Then
            aOpcao := 'A';
     //
     aCPF          := uFuncoes.Alltrim(uFuncoes.RemoveChar(edtNRCPF.Text));
     aNomePaciente := uFuncoes.Alltrim(edtNMCLIE.Text);
     aCRM          := uFuncoes.Alltrim(edtNRCRM.Text);
     aUFMedico     := cmbUF.Text;
     idUsuario     := 1;
     idVendedor    := dmGerenciador.GetIdVendedor(cmbVendedores.Text);
     aHora         := ufuncoes.RemoveChar(TimeToStr(Time));
     //
     dmGerenciador.Start;
     Try
        // Dados Paciente
        aCPF := dmGerenciador.AdicionarPaciente(aCPF, aNomePaciente);
        // Dados Médico
        aCRM := dmGerenciador.AdicionarMedico(aCRM, cmbUF.Text);
        //
        if (aOpcao = 'I') then
        begin
             // Pegar próximo ID da prevenda
             ufuncoes.RefreshCDS(dmGerenciador.cdsConfig);
             dmGerenciador.cdsConfig.Edit;
             dmGerenciador.cdsConfigid_prevenda.AsInteger := dmGerenciador.cdsConfigid_prevenda.AsInteger + 1;
             dmGerenciador.cdsConfig.ApplyUpdates(0);
             //
             dsCadastro.DataSet.FieldByName('id_prevenda').AsInteger := dmGerenciador.cdsConfigid_prevenda.AsInteger;
        End;
        //
        dsCadastro.DataSet.FieldByName('cpf_paciente').AsString   := aCPF;
        dsCadastro.DataSet.FieldByName('crm_medico').AsString     := aCRM;
        dsCadastro.DataSet.FieldByName('data_receita').AsDateTime := edtDTEMISSAO.Date;
        dsCadastro.DataSet.FieldByName('data').AsDateTime         := Date();
        dsCadastro.DataSet.FieldByName('hora').AsString           := aHora;
        dsCadastro.DataSet.FieldByName('id_vendedor').AsInteger   := idVendedor;
        dsCadastro.DataSet.FieldByName('situacao').AsString       := 'A';
        dsCadastro.DataSet.FieldByName('id_usuario').AsInteger    := idUsuario;
        //
        dsCadastro.DataSet.Post;
        // Pré-venda
        TClientDataSet(dsCadastro.DataSet).ApplyUpdates(0);
        // Itens
        if (aOpcao = 'I') then
         begin
              // dmGerenciador.AdicionarItensPreVenda(idPrevenda : Integer; aCdsItens: TClientDataSet): Boolean;
              if not (dmGerenciador.AdicionarItensPreVenda(
                        dsCadastro.DataSet.FieldByName('id_prevenda').AsInteger,
                        dmGerenciador.cdsListaItens)) Then
               begin
                    dmGerenciador.Rollback('Erro ao tentar incluir itens!!!');
               End;
         End
         Else
         begin
              if not (dmGerenciador.AtualizarItensPreVenda(dsCadastro.DataSet.FieldByName('id_prevenda').AsInteger,
                      dmGerenciador.cdsListaItens)) Then
               begin
                    dmGerenciador.Rollback('Erro ao tentar atualizar itens!!!');
               End;
         End;
        // Grava
        dmGerenciador.Comit(dmGerenciador.Transc);
        //
        Application.MessageBox(PChar(uFuncoes.MSG_OK),
                'Concluído', MB_OK+MB_ICONINFORMATION +MB_APPLMODAL);
        //
        HabilitarControles(False);
     Except
         on e: exception do
           dmGerenciador.Rollback(e.Message);
     End;
end;

procedure TFrmPreSolicitacao.BuscaRegistro(aCodigo: String);
Var
   fValor : double;
   aUF, aNomeVendedor : String;
begin
     uFuncoes.FilterCDS(dmGerenciador.cdsPrevenda, fsInteger, aCodigo);
     //
     if not (dmGerenciador.cdsPrevenda.IsEmpty) Then
     begin
          LimparCamposReceita();
          LimparCamposProduto();
          // Carregar dados Receita
          edtNRCPF.Text  := dmGerenciador.cdsPrevendacpf_paciente.AsString;
          edtNMCLIE.Text := dmGerenciador.GetNomePaciente(dmGerenciador.cdsPrevendacpf_paciente.AsString);
          edtNRCRM.Text  := dmGerenciador.cdsPrevendacrm_medico.AsString;
          aUF := dmGerenciador.GetUFMedico(dmGerenciador.cdsPrevendacrm_medico.AsString);
          cmbUF.Clear;
          cmbUF.Items.Add(aUF);
          cmbUF.ItemIndex := 0;
          edtDTEMISSAO.Text := dmGerenciador.cdsPrevendadata_receita.AsString;
          cmbVendedores.Clear;
          aNomeVendedor := dmGerenciador.GetNomeVendedor(dmGerenciador.cdsPrevendaid_vendedor.AsInteger);
          cmbVendedores.Items.Add(aNomeVendedor);
          cmbVendedores.ItemIndex := 0;
          //cmbVendedores.Text :=
          gbxReceitas.Enabled := False;
          // Carregar Lista de Produtos
          dmGerenciador.CarregarItensPreVenda(StrtoInt(aCodigo), dmGerenciador.cdsListaItens);
          fValor := dmGerenciador.CalcularTotalItens(dmGerenciador.cdsListaItens);
          lblTotal.Caption := FormatFloat('###,##0.#0', fValor);
     End;
end;

procedure TFrmPreSolicitacao.edtCodigoExit(Sender: TObject);
begin
  inherited;
      if not uFuncoes.Empty(edtCodigo.Text) Then
       begin
            edtCodigo.Text := uFuncoes.StrZero(edtCodigo.Text ,13);
            if not (dmGerenciador.ProcurarValor(edtCodigo.Text, 'pro_barras', 'produtos')) Then
              begin
                   Application.MessageBox(PChar('Código de barras não cadastrado!!!'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
                   edtCodigo.SetFocus;
                   Exit;
              End;
              //
              If not (VerificarProdutoLista(edtCodigo.Text)) then
                  BuscaDadosProduto(edtCodigo.Text)
              Else
              begin
                   Application.MessageBox(PChar('Produto já foi lançado na lista!!!'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
                   edtCodigo.SetFocus;
                   Exit;
              End;
       End;
end;

procedure TFrmPreSolicitacao.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      if not( key in['0'..'9', #8, #13] ) then
       begin
           beep;
           key:=#0;
       end;
       //
       if (key = #13) and uFuncoes.Empty(edtCodigo.Text) Then
       begin
            key := #0;
            spLocProdutoClick(Sender);
       End;
       //
       if (key = #13) and not uFuncoes.Empty(edtCodigo.Text) Then
       begin
            key := #0;
            edtQuantidade.SetFocus;
       End;
end;

procedure TFrmPreSolicitacao.edtCodigoChange(Sender: TObject);
begin
  inherited;
     if uFuncoes.Empty(edtCodigo.Text) Then
        LimparCamposProduto();
end;

procedure TFrmPreSolicitacao.BuscaDadosProduto(aProduto: String);
Var
    MydataModulePlus : TdmPluspdv;
    texto : String;
    qryBanco : TSQLQuery;
begin
     LimparCamposProduto;
     //
     edtQuantidade.Value := 0;
     edtQuantPreescrita.Value := 1;
     if not (dmGerenciador.cdsConfigcfg_vinculo_sistema.AsBoolean) Then
      begin
          uFuncoes.FilterCDS(dmGerenciador.cdsProduto, fsString, uFuncoes.StrZero(aProduto, 13));
          If not (dmGerenciador.cdsProduto.IsEmpty) Then
           begin
                edtNMDESC.Text := dmGerenciador.cdsProdutopro_medicamento.AsString;
                edtValor.Value := dmGerenciador.cdsProdutopro_valorvenda.AsFloat;
           End;
      End  { Banco Pluspdv }
      Else
      begin
           MydataModulePlus := TdmPluspdv.Create(nil);
           Try
                texto  := 'Select p.id, p.descricao, p.cod_barras, p.medicamento, p.valor_farmacia_popular, p.quant_armaz ';
                texto  := texto + ' from produtos p where (p.cod_barras = :pbarras) ';
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
                       begin
                            edtNMDESC.Text := FieldByName('descricao').AsString;
                            edtValor.Value := FieldByName('valor_farmacia_popular').AsFloat;
                       End;
                 End;
           Finally
                 if (qryBanco <> nil) then
                    qryBanco.Free;
                 MydataModulePlus.Free;
           End;
      End;
end;

procedure TFrmPreSolicitacao.LimparCamposProduto;
begin
     edtQuantidade.Value := 0;
     edtQuantPreescrita.Value := 1;
     edtNMDESC.Clear;
     edtValor.Value := 0;
end;

procedure TFrmPreSolicitacao.FormShow(Sender: TObject);
begin
  inherited;
     HabilitarCamposData(false);
     dmGerenciador.AbrirDatasetItens();
     LimparCamposProduto();
     HabilitarControles(false);
end;

procedure TFrmPreSolicitacao.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
       if (key = #13) and not uFuncoes.Empty(edtQuantidade.Text)
         and (edtQuantidade.Value > 0) Then
       begin
            key := #0;
            edtQuantPreescrita.SetFocus;
       End;
end;

procedure TFrmPreSolicitacao.edtQuantPreescritaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
       if (key = #27) Then
        begin
             key := #0;
             if (edtCodigo.Enabled) Then
              begin
                  LimparCamposProduto();
                  edtCodigo.SetFocus;
              End;
        End;
        //
       if (key = #13) and not uFuncoes.Empty(edtQuantPreescrita.Text)
         and (edtQuantPreescrita.Value > 0) Then
       begin
            key := #0;
            edtCodigo.SetFocus;
       End;
end;

procedure TFrmPreSolicitacao.CentralizarPainelMensagem(bStatus: Boolean);
begin
     if (bStatus) Then
     begin
          pnlMensagem.top  := (self.Height div 2) - (pnlMensagem.height div 2);
          pnlMensagem.left := (self.Width div 2) - (pnlMensagem.width div 2);
          pnlMensagem.Visible := bStatus;
     End
     Else
         pnlMensagem.Visible := bStatus;
end;

procedure TFrmPreSolicitacao.edtQuantPreescritaExit(Sender: TObject);
Var
   fValor : Double;
begin
  inherited;
      // dmGerenciador.AddItemListaProdutos(idSequencia : Integer; aProduto, aDescricao: String;
      //  fQuantidade, fQuantPreescrita, fValorUnitario: Double): Boolean;
      if not ufuncoes.Empty(edtCodigo.Text)
         and (edtQuantidade.Value > 0)
         and (edtQuantPreescrita.Value > 0) Then
       begin
            if (dmGerenciador.AddItemListaProdutos(-1,
               edtCodigo.Text, edtNMDESC.Text, edtQuantidade.Value,
               edtQuantPreescrita.Value, edtValor.Value)) Then
            begin
                 fValor := dmGerenciador.CalcularTotalItens(dmGerenciador.cdsListaItens);
                 lblTotal.Caption := FormatFloat('###,##0.#0', fValor);
                 edtCodigo.Clear;
                 edtCodigo.SetFocus;
                 Exit;
            End;
       End;
end;

procedure TFrmPreSolicitacao.cmbVendedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     if (key = #13) and not uFuncoes.Empty(cmbVendedores.Text) Then
      begin
           Key := #0;
           if (edtCodigo.Enabled) then
              edtCodigo.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.edtNRCPFExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtNRCPF.Text) Then
     begin
        If uFuncoes.CPF(edtNRCPF.Text) = False Then
        Begin
            Application.MessageBox('CPF inválido!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtNRCPF.SetFocus;
            Exit;
        End;
        edtNMCLIE.Clear;
        // Busca nome Paciente
        edtNMCLIE.Text := dmGerenciador.GetNomePaciente(ufuncoes.RemoveChar(edtNRCPF.Text));
     End;
end;

procedure TFrmPreSolicitacao.NovoRegistro;
begin
       uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
       lblTotal.Caption := '0,00';
       dmGerenciador.AbrirDatasetItens();
       gbxReceitas.Enabled := True;
       BuscaRegistro('-1');
       if (dsCadastro.DataSet.Active) Then
           dsCadastro.DataSet.Append;
       //
       dsCadastro.DataSet.FieldByName('id_prevenda').AsInteger := dmGerenciador.cdsConfigid_prevenda.AsInteger + 1;
       LimparCamposReceita();
       LimparCamposProduto();    
       dmGerenciador.CarregarListaVendedores(cmbVendedores);
       HabilitarControles(true);
       if (gbxReceitas.Enabled) and (edtNRCPF.Enabled) then
          edtNRCPF.SetFocus;
end;

procedure TFrmPreSolicitacao.BtExcluirClick(Sender: TObject);
Var
   fValor : Double;
begin
 // inherited;
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
     begin
      If not (dsProdutos.DataSet.IsEmpty) and (dsProdutos.DataSet.RecordCount > 1) Then
        begin
             If Application.MessageBox(uFuncoes.MSG_PERGUTA, 'Excluir',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
               Begin
                    if (dsCadastro.DataSet.State = dsEdit) Then
                        dmGerenciador.ExcluirItemPrevenda(dsCadastro.DataSet.FieldByName('id_prevenda').AsInteger
                                            , dsProdutos.DataSet.FieldByName('CDS_PRODUTO').AsString );
                    //
                    dsProdutos.DataSet.Delete;
                    fValor := dmGerenciador.CalcularTotalItens(dmGerenciador.cdsListaItens);
                    lblTotal.Caption := FormatFloat('###,##0.#0', fValor);
              End;
       End;  // If not (dsProdutos.DataSet.IsEmpty) and (dsProdutos.DataSet.RecordCount > 1) Then
     End;    // if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
end;

procedure TFrmPreSolicitacao.dsProdutosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
       if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
          BtExcluir.Enabled := not (dsProdutos.DataSet.IsEmpty) and (dsProdutos.DataSet.RecordCount > 0)
       Else
          BtExcluir.Enabled := False;
end;

procedure TFrmPreSolicitacao.LimparCamposReceita;
begin
     edtNRCPF.Clear;
     edtNMCLIE.Clear;
     edtNRCRM.Clear;
     cmbUF.Text := dmGerenciador.cdsConfigcfg_ufempresa.AsString;
     edtDTEMISSAO.Clear;
     cmbVendedores.ItemIndex := -1;
end;

procedure TFrmPreSolicitacao.edtNRCRMExit(Sender: TObject);
begin
  inherited;
        if not ufuncoes.Empty(edtNRCRM.Text) Then
         begin
              edtNRCRM.Text := uFuncoes.StrZero(edtNRCRM.Text, 5);
         End;
end;

function TFrmPreSolicitacao.ValidarCampos: Boolean;
begin
     Result := False;
     // edtNRCPF
     if ufuncoes.Empty(ufuncoes.RemoveChar(edtNRCPF.Text)) Then
      begin
            Application.MessageBox('Campos CPF está vazio!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           edtNRCPF.SetFocus;
           Exit;
      End;
     // edtNMCLIE
     if ufuncoes.Empty(edtNMCLIE.Text) Then
      begin
            Application.MessageBox('Campos Nome do Paciente está vazio!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           edtNMCLIE.SetFocus;
           Exit;
      End;
     // edtNRCRM
     if ufuncoes.Empty(edtNRCRM.Text) Then
      begin
            Application.MessageBox('Campos CRM do médico está vazio!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           edtNRCRM.SetFocus;
           Exit;
      End;
     // cmbUF
     if ufuncoes.Empty(cmbUF.Text) Then
      begin
            Application.MessageBox('Campos UF do médico vazio!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           cmbUF.SetFocus;
           Exit;
      End;
     // edtDTEMISSAO
     if ufuncoes.Empty(ufuncoes.RemoveChar(edtDTEMISSAO.Text)) Then
      begin
           Application.MessageBox('Campos Data de Emissão da receita está vazio!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           edtDTEMISSAO.SetFocus;
           Exit;
      End;
     // cmbVendedores
     if ufuncoes.Empty(cmbVendedores.Text) Then
      begin
            Application.MessageBox('Selecione um vendedor!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           cmbVendedores.SetFocus;
           Exit;
      End;
     //
     if (dsProdutos.DataSet.IsEmpty) Then
      begin
           Application.MessageBox('Por favor lance os itens desse pré-solicitação!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           if (edtCodigo.Enabled) then
              edtCodigo.SetFocus;
           Exit;
      End;

     Result := True;
end;

function TFrmPreSolicitacao.VerificarProdutoLista(
  aProduto: String): Boolean;
begin
     result := dsProdutos.DataSet.Locate('CDS_PRODUTO', uFuncoes.StrZero(aProduto,13),[]);
end;

procedure TFrmPreSolicitacao.spLocProdutoClick(Sender: TObject);
Var
   MydataModulePlus : TdmPluspdv;
begin
  inherited;
       edtCodigo.SetFocus;
       if not (dmGerenciador.cdsConfigcfg_vinculo_sistema.AsBoolean) Then
       begin
            Application.CreateForm(TFrmPesquisaProdutos, FrmPesquisaProdutos);
            Try
                 if (FrmPesquisaProdutos.ShowModal = mrOk) Then
                  begin
                      edtCodigo.Text := FrmPesquisaProdutos.cdsConsultarpro_barras.AsString;
                      edtQuantidade.SetFocus;
                  End;
            Finally
                  FrmPesquisaProdutos.Free;
            End;
       End
       Else
       begin
            MydataModulePlus := TdmPluspdv.Create(nil);
            Application.CreateForm(TFrmPesqProdutosPlus, FrmPesqProdutosPlus);
            Try
                 if (FrmPesqProdutosPlus.ShowModal = mrOk) Then
                  begin
                      edtCodigo.Text := FrmPesqProdutosPlus.cdsConsultarcod_barras.AsString;
                      edtQuantidade.SetFocus;
                  End;
            Finally
                 FrmPesqProdutosPlus.free;
                 MydataModulePlus.Free;
            End;
       End;
end;

procedure TFrmPreSolicitacao.spLocClienteClick(Sender: TObject);
begin
  inherited;
       edtNRCPF.SetFocus;
       Application.CreateForm(TFrmPesquisaClientes, FrmPesquisaClientes);
       Try
            if (FrmPesquisaClientes.ShowModal = mrOk) Then
             begin
                 edtNRCPF.Text := FrmPesquisaClientes.cdsConsultarpac_cpf.AsString;
                 edtNMCLIE.SetFocus;
             End;
       Finally
             FrmPesquisaClientes.Free;
       End;
end;

procedure TFrmPreSolicitacao.edtNRCPFChange(Sender: TObject);
begin
  inherited;
       if uFuncoes.Empty(uFuncoes.RemoveChar(edtNRCPF.Text)) Then
          edtNMCLIE.Clear;
end;

procedure TFrmPreSolicitacao.HabilitarCamposData(bStatus: Boolean);
begin
     if (bStatus) Then
      begin
           edtConsultar.Visible := False;
           dbeInicio.Left := edtConsultar.Left;
           lblA.Left      := dbeInicio.Left + 128;
           dbeFinal.Left  := dbeInicio.Left + 144;
      End
      Else
      begin
           edtConsultar.Visible := True;
      End;
     dbeInicio.Visible := bStatus;
     lblA.Visible := bStatus;
     dbeFinal.Visible := bStatus;
     //

end;

procedure TFrmPreSolicitacao.rgConsultarClick(Sender: TObject);
begin
  //inherited;
  HabilitarCamposData(False);
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código Pré-Solicitação:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'CPF do Paciente:';
      edtConsultar.Clear;
    end;
    2:
    begin
      lblConsultar.Caption := 'Nome do Paciente:';
      edtConsultar.Clear;
    end;
    3:
    begin
      lblConsultar.Caption := 'Data Receita:';
      HabilitarCamposData(true);
      dbeInicio.Date := Date();
      dbeFinal.Date := Date();
    end;
  end;
  if (edtConsultar.Visible) and (edtConsultar.CanFocus) then
      edtConsultar.SetFocus;
  if (dbeInicio.Visible) and (dbeInicio.CanFocus) Then
      dbeInicio.SetFocus;
end;

procedure TFrmPreSolicitacao.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
//  inherited;
  if (key = #27) then
   begin
        key := #0;
        Close;
   End;
   //
  if (key = #13) and (edtConsultar.Visible) and not uFuncoes.Empty(edtConsultar.Text) Then
   begin
        key := #0;
        if (btnAlterar.Enabled) Then
            btnAlterar.SetFocus;
   End;
   //
  if (rgConsultar.ItemIndex <= 1)  then
  begin
    if not( key in['0'..'9', #8, #13] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
end;

procedure TFrmPreSolicitacao.BuscarDadosPreSolicitacao;
Var
   aTextoSQL : String;
begin
     aTextoSQL := 'Select pv.id_prevenda, pv.cpf_paciente, p.pac_nome, pv.crm_medico, m.med_uf, pv.id_vendedor, ';
     aTextoSQL := aTextoSQL + 'v.ven_nome, pv.situacao, pv.numero_autorizacao, pv.id_usuario, pv.data_receita from prevenda pv ';
     aTextoSQL := aTextoSQL + ' inner join medicos m on pv.crm_medico = m.med_crm  inner join pacientes p on pv.cpf_paciente = p.pac_cpf ';
     aTextoSQL := aTextoSQL + ' inner join vendedores v on pv.id_vendedor = v.ven_codigo ';
     case rgConsultar.ItemIndex of
       0 : aTextoSQL := aTextoSQL + ' where ( pv.id_prevenda = ' + QuotedStr(AnsiUpperCase(edtConsultar.Text))+') order by p.pac_nome ';
       1 : aTextoSQL := aTextoSQL + ' where ( pv.cpf_paciente = ' + QuotedStr(AnsiUpperCase(edtConsultar.Text))+') order by p.pac_nome ';
       2 : aTextoSQL := aTextoSQL + ' where UPPER(p.pac_nome) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%') + ' order by p.pac_nome ';
       3 :
          begin
               aTextoSQL := aTextoSQL + ' Where (pv.data_receita >= '+QuotedStr(dbeInicio.Text)+') ';
               if not ufuncoes.Empty(ufuncoes.RemoveChar(dbeFinal.Text)) Then
                   aTextoSQL := aTextoSQL + ' and (pv.data_receita <= '+QuotedStr(dbeFinal.Text)+') '
               Else
                   aTextoSQL := aTextoSQL + ' and (pv.data_receita <= '+QuotedStr(DatetoStr(Date))+') ';
               aTextoSQL := aTextoSQL + ' order by pv.data_receita ';
          End;
     End;  // case rgConsultar.ItemIndex of
     //    
      with cdsConsultar do
       begin
            Close;
            CommandText := aTextoSQL;
            Open;
       End;
end;

procedure TFrmPreSolicitacao.edtConsultarChange(Sender: TObject);
begin
  inherited;
     if not ufuncoes.Empty(edtConsultar.Text) Then
         BuscarDadosPreSolicitacao;
end;

procedure TFrmPreSolicitacao.dbeFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     if (key = #13) and not ufuncoes.Empty(ufuncoes.RemoveChar( dbeInicio.Text)) Then
      begin
           key := #0;
           BuscarDadosPreSolicitacao;
           //
           if not (dsConsultar.DataSet.IsEmpty) and (btnAlterar.Enabled) Then
               btnAlterar.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.dbeInicioExit(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(uFuncoes.RemoveChar(dbeInicio.Text)) Then
     Begin
        Try
            StrToDate(dbeInicio.Text);
            dbeInicio.Date := StrToDate(dbeInicio.Text);
            //
            If (dbeInicio.Date > Date()) Then
              begin
                   dbeInicio.SetFocus;
                   Exit;
              End;
        Except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               dbeInicio.SetFocus;
               Exit;
          End;
        end;
     End;
end;

procedure TFrmPreSolicitacao.dbeFinalExit(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(uFuncoes.RemoveChar(dbeFinal.Text)) Then
     Begin
        Try
            StrToDate(dbeFinal.Text);
            dbeFinal.Date := StrToDate(dbeFinal.Text);
            //
            If (dbeFinal.Date > Date()) Then
              begin
                   dbeFinal.SetFocus;
                   Exit;
              End;
        Except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               dbeFinal.SetFocus;
               Exit;
          End;
        end;
     End;
end;

procedure TFrmPreSolicitacao.grdConsultarDblClick(Sender: TObject);
begin
//  inherited;
      btnAlterarClick(Sender);
end;

procedure TFrmPreSolicitacao.btnAlterarClick(Sender: TObject);
begin
  inherited;
     If not(cdsConsultar.IsEmpty) Then
     begin
          BuscaRegistro(cdsConsultarid_prevenda.AsString);
          PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TFrmPreSolicitacao.BtEditarClick(Sender: TObject);
begin
//  inherited;
       if (dsCadastro.DataSet.State = dsBrowse) Then
       begin
            If (dsCadastro.DataSet.FieldByName('situacao').AsString = 'F') then
            begin
                 raise Exception.Create('Pré-Solicitação já foi fechada!!!');
            End;
            HabilitarControles(True);
            gbxReceitas.Enabled := False;
            dsCadastro.DataSet.Edit;
            //
            pnlProduto.Enabled := true;
            if (edtCodigo.Enabled) Then
               edtCodigo.SetFocus;
       End;
end;

procedure TFrmPreSolicitacao.dbeInicioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     if (key = #13) and not ufuncoes.Empty(ufuncoes.RemoveChar(dbeInicio.Text)) Then
      begin
          key := #0;
          dbeFinal.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.tsPesquisaShow(Sender: TObject);
begin
//   inherited;
      dsConsultar.DataSet.Close;
      if (rgConsultar.ItemIndex <> 3) then
      begin
           edtConsultar.Clear;
           edtConsultar.SetFocus;
      End
      Else
      begin
           dbeInicio.Date := Date();
           dbeFinal.Date := Date();
           dbeInicio.SetFocus;
      End;
end;

procedure TFrmPreSolicitacao.dbeInicioEnter(Sender: TObject);
begin
  inherited;
      if (btnAlterar.Enabled) Then
        btnAlterar.Enabled := false;
end;

procedure TFrmPreSolicitacao.dbeFinalEnter(Sender: TObject);
begin
  inherited;
      if (btnAlterar.Enabled) Then
        btnAlterar.Enabled := false;
end;

procedure TFrmPreSolicitacao.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //inherited;
      if not (dsConsultar.DataSet.IsEmpty) Then
       begin
            if (Key = VK_UP) and not (dsConsultar.DataSet.Bof) then
               dsConsultar.DataSet.Prior;
            if (Key = VK_DOWN ) and not (dsConsultar.DataSet.Eof) then
               dsConsultar.DataSet.Next;
       End;
end;

procedure TFrmPreSolicitacao.btnSolicitarClick(Sender: TObject);
begin
  inherited;
      If not (dsCadastro.DataSet.IsEmpty)
        and ((dsCadastro.DataSet.FieldByName('situacao').AsString = 'A')
          or (dsCadastro.DataSet.FieldByName('situacao').AsString = 'P'))Then
      begin
            If Not (Solicitacao()) Then
             begin
                  //
             End;
      End;
end;

function TFrmPreSolicitacao.Solicitacao: Boolean;
Var
    Service : ServicoSolicitacaoWS;
    ObjSolicitacao            : SolicitacaoDTO;
    ObjUsuarioFarmacia        : UsuarioFarmaciaDTO;
    ObjArrayMedicamento       : ArrayOfMedicamentoDTO;
    ObjAutorizacao            : AutorizacaoDTO;
    //
    aLoginFarmacia, aSenhaFarmacia, aLoginVendedor, aSenhaVendedor : String;
    idVendedor, J, I, idPrevenda : Integer;
    Comando  : String;
    TextoDna : TStringList;
Begin
     iTentativa := 1;
     uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
     idPrevenda     := dsCadastro.DataSet.FieldByName('id_prevenda').AsInteger;
     aLoginFarmacia := dmGerenciador.cdsConfigcfg_login_fpopular.AsString;
     aSenhaFarmacia := dmGerenciador.cdsConfigcfg_senha_fpopular.AsString;
     idVendedor     := dmGerenciador.GetIdVendedor(cmbVendedores.Text);
     uFuncoes.FilterCDS(dmGerenciador.cdsVendedor, fsInteger, InttoStr(idVendedor));
     If not (dmGerenciador.cdsVendedor.IsEmpty) Then
     begin
          aLoginVendedor := dmGerenciador.cdsVendedorven_login_fpopular.AsString;
          aSenhaVendedor := dmGerenciador.cdsVendedorven_senha_fpopular.AsString;
          dmGerenciador.cdsVendedor.Close;
     End
     Else
         raise Exception.Create('Erro ao carregar dados vendedor!!!');
     //
     btnSolicitar.Enabled := False;
     Application.ProcessMessages;
     Try
           Screen.Cursor := crHourGlass;

           Service := (dmGerenciador.HTTPRIO1 as ServicoSolicitacaoWS);
           dsProdutos.DataSet.First;
           i := 0;
           While not (dsProdutos.DataSet.Eof) do
           begin
                SetLength(ObjArrayMedicamento,Length(ObjArrayMedicamento)+1);
                ObjArrayMedicamento[i] := MedicamentoDTO.Create;
                ObjArrayMedicamento[i].coCodigoBarra      := dsProdutos.DataSet.FieldByName('CDS_PRODUTO').AsString;    // Código de barras
                ObjArrayMedicamento[i].qtSolicitada       := dsProdutos.DataSet.FieldByName('CDS_QUANTIDADE').AsFloat;     // Quantidade solicitada (em comprimidos)
                ObjArrayMedicamento[i].qtPrescrita        := dsProdutos.DataSet.FieldByName('CDS_QUANT_APRESENTACAO').AsFloat;   // Quantidade (diária) prescrita (Posologia)
                ObjArrayMedicamento[i].vlPrecoVenda       := dsProdutos.DataSet.FieldByName('CDS_VALOR_UNITARIO').AsCurrency;  // Valor de venda
                //
                i := i + 1;
                // Próximo
                dsProdutos.DataSet.Next;
           End; // While not (dsProdutos.DataSet.Eof) do

           //
           J := Length(ObjArrayMedicamento);
           //  Cria o objeto de Solicitação
              ObjSolicitacao := SolicitacaoDTO.Create;
              //  Carrega medicamento solicitado
              ObjSolicitacao.arrMedicamentoDTO := ObjArrayMedicamento;
              // Código da solicitação gerado pelo estabelecimento.
              ObjSolicitacao.coSolicitacaoFarmacia := InttoStr(idPrevenda);
              // Data de emissão da prescrição.
              {ObjSolicitacao.dtEmissaoReceita := TXSDateTime.Create;
              ObjSolicitacao.dtEmissaoReceita.AsDateTime := Strtodate(edtDTEMISSAO.Text) + time;}
              ObjSolicitacao.dtEmissaoReceita  := DateTimeToXSDateTime(edtDTEMISSAO.Date + time);
              // CNPJ do estabelecimento.
              ObjSolicitacao.nuCnpj  := dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString;  //    '03376317000115';
              // CPF do participante.
              ObjSolicitacao.nuCpf   := edtNRCPF.Text;
              // CRM do prescritor número
              ObjSolicitacao.nuCrm   := edtNRCRM.Text;
              // Unidade da Federação do prescritor.
              ObjSolicitacao.sgUfCrm := cmbUF.Text;
              //
              If FileExists('c:\infog2\dnaEstacao.txt') Then
                 DeleteFile('c:\infog2\dnaEstacao.txt');
              //
              Comando:='cmd.exe /c "c:\infog2\gbasmsb.exe --solicitacao ' +
               uFuncoes.RemoveChar(edtNRCPF.Text)+ ' ' + uFuncoes.RemoveChar(ufuncoes.Alltrim(dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString)) + ' ' + edtNRCRM.Text + ' ' +
               cmbUF.Text + ' ' + edtDTEMISSAO.Text +
                        ' > c:\infog2\dnaEstacao.txt"';
              {Comando:='--solicitacao ' +
               uFuncoes.RemoveChar(edtNRCPF.Text)+ ' ' + dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString + ' ' + edtNRCRM.Text + ' ' +
               cmbUF.Text + ' ' + edtDTEMISSAO.Text + TimetoStr(time);
              //
              ObjSolicitacao.dnaEstacao := Trim(GetDosOutput('c:\gbasmsb.exe ' + Comando));}
              dmGerenciador.ExecutaDna(pChar(Comando),SW_Hide);
              TextoDna:=TStringList.Create;
              TextoDna.Text:='';
              If FileExists('c:\infog2\dnaEstacao.txt') Then
              Begin
                 TextoDna.LoadFromFile('c:\infog2\dnaEstacao.txt');
                 DeleteFile('c:\infog2\dnaEstacao.txt');
              End;
              ObjSolicitacao.dnaEstacao := Trim(TextoDna.Text);
              FreeAndNil(TextoDna);
              // Cria o Usuário da farmacia
              ObjUsuarioFarmacia := UsuarioFarmaciaDTO.Create;
              // nova alterãção 28/03/2011
              pnlMensagem.Caption := '1ª Fase Pré-Solicitação... :: '+' Tentativa ('+InttoStr(iTentativa) +')';
              //
              if not (pnlMensagem.Visible) Then
                 pnlMensagem.Visible := True;
              Application.ProcessMessages;
              //
              ObjUsuarioFarmacia.usuarioFarmacia := uFuncoes.Alltrim(aLoginFarmacia);      //        Login da Farmácia
              ObjUsuarioFarmacia.senhaFarmacia   := uFuncoes.Alltrim(aSenhaFarmacia);      //       Senha da Farmácia
              ObjUsuarioFarmacia.usuarioVendedor := aLoginVendedor;
              ObjUsuarioFarmacia.senhaVendedor   := aSenhaVendedor;
              //    Executa serviço
              ObjAutorizacao := AutorizacaoDTO.Create;
              Application.ProcessMessages;
              Sleep(1);
              ObjAutorizacao := Service.executarSolicitacao(ObjSolicitacao, ObjUsuarioFarmacia);
              //
              If (ObjAutorizacao.inAutorizacaoSolicitacao = '00S')
                   or (ObjAutorizacao.inAutorizacaoSolicitacao = '01S') Then
              Begin
                    StatusBar1.Panels[1].Text := ObjAutorizacao.descMensagemErro;
                    // 03/01/2012
                    Try
                         dsProdutos.DataSet.First;
                         dsProdutos.DataSet.DisableControls;
                         i := 0;
                         //  Carregar os produtos
                         While not (dsProdutos.DataSet.Eof) do
                         begin
                              dsProdutos.DataSet.edit;
                              With ObjAutorizacao do
                              begin
                                   dsProdutos.DataSet.FieldByName('CDS_QUANT_AUTORIZADA').AsFloat    := arrMedicamentoDTO[i].qtAutorizada;                   // Quantidade autorizada (em comprimidos)
                                   dsProdutos.DataSet.FieldByName('CDS_VALOR_MS').AsFloat            := arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;             // Valor Pago MS
                                   {dsProdutos.DataSet.FieldByName('CDS_VALOR_CLIENTE').AsFloat       :=
                                                    dsProdutos.DataSet.FieldByName('PRO_SUBTOTAL').AsFloat - arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;}
                                   dsProdutos.DataSet.FieldByName('CDS_VALOR_CLIENTE').AsFloat     := arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;
                                   //arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;       // Valor Pago Cliente
                                   dsProdutos.DataSet.FieldByName('CDS_VALOR_UNITARIO').AsFloat       := arrMedicamentoDTO[i].vlPrecoVenda;
                                   dsProdutos.DataSet.FieldByName('CDS_MOTIVO').AsString              := arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                                   dsProdutos.DataSet.FieldByName('CDS_NRAUTORIZACAO').AsString       := ObjAutorizacao.nuAutorizacao;
                                   dsProdutos.DataSet.FieldByName('CDS_STATUS').AsString              := arrMedicamentoDTO[i].statusTransacao;

                                   If (arrMedicamentoDTO[i].qtAutorizada > 0) Then
                                    Begin
                                       dsProdutos.DataSet.FieldByName('CDS_SITUACAO').asString   := 'S';
                                       dsProdutos.DataSet.FieldByName('CDS_FLAUTORIZADO').AsBoolean    := true;
                                    End
                                   Else
                                       dsProdutos.DataSet.FieldByName('CDS_FLAUTORIZADO').AsBoolean    := false;
                              End;
                              dsProdutos.DataSet.post;
                              //
                              i := i + 1;
                              //
                              dsProdutos.DataSet.Next;
                         End;  //While not (dsProdutos.DataSet.Eof) do

                    Finally
                         dsProdutos.DataSet.EnableControls;
                    End;
             End;
     Finally
           btnSolicitar.Enabled := True;
           Screen.Cursor := crDefault;
     End;

     Application.ProcessMessages;
end;

End.
