program InfoGereciador;

uses
  Forms,
  Windows,
  Dialogs,
  Controls,
  SysUtils,
  uInfoPrincipal in 'uInfoPrincipal.pas' {FrmPrincipal},
  uDM in 'uDM.pas' {dmGerenciador: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  UrlMon in 'UrlMon.pas',
  uFrmCadModelo in 'uFrmCadModelo.pas' {FrmCadastro},
  wcrypt2 in 'wcrypt2.pas',
  uFrmCadUsuarios in 'uFrmCadUsuarios.pas' {FrmCadUsuarios},
  uFrmCadVendedores in 'uFrmCadVendedores.pas' {FrmCadVendedores},
  uFrmCadProdutos in 'uFrmCadProdutos.pas' {FrmCadProdutos},
  uFrmConfig in 'uFrmConfig.pas' {FrmConfig},
  uFrmPreSolicitacao in 'uFrmPreSolicitacao.pas' {FrmPreSolicitacao},
  uFrmPesquisaPadrao in 'uFrmPesquisaPadrao.pas' {FrmPesquisaPadrao},
  UFrmPesquisaProdutos in 'UFrmPesquisaProdutos.pas' {FrmPesquisaProdutos},
  uFrmPesquisaClientes in 'uFrmPesquisaClientes.pas' {FrmPesquisaClientes},
  uUsuario in 'uUsuario.pas',
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uFrmAlteraSenha in 'uFrmAlteraSenha.pas' {frmAlterarSenha},
  ServicoSolicitacaoWS1 in 'ServicoSolicitacaoWS1.pas',
  uFPopular in 'uFPopular.pas',
  udmPluspdv in 'udmPluspdv.pas' {dmPluspdv: TDataModule},
  uFrmPesqProdutosPlus in 'uFrmPesqProdutosPlus.pas' {FrmPesqProdutosPlus};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGerenciador, dmGerenciador);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  frmLogin := TfrmLogin.Create(nil);
  if frmLogin.ShowModal = mrOk then
   begin
        FreeAndNil(frmLogin);
        Application.Run;
   end
   else
   begin
        FreeAndNil(dmGerenciador);
        //
        Application.Terminate;
   End;
end.
