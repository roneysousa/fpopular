unit uInfoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, Menus, ActnList, ExtCtrls, Buttons, IdTCPClient,
  IdHTTP;

type
  TFrmPrincipal = class(TForm)
    Info: TStatusBar;
    actAcoes: TActionList;
    actPreSolicitacao: TAction;
    actVenda: TAction;
    actCancelamento: TAction;
    actSite: TAction;
    actSair: TAction;
    actPesquisa: TAction;
    actUsuario: TAction;
    actProduto: TAction;
    actVendedor: TAction;
    actConfig: TAction;
    actSobre: TAction;
    MainMenu1: TMainMenu;
    mnuMovimento: TMenuItem;
    mnuPreSolicitaoItem: TMenuItem;
    mnuVendasItem: TMenuItem;
    mnuCancelamentoItem: TMenuItem;
    N1: TMenuItem;
    mnuSiteFarmciaPopular: TMenuItem;
    N2: TMenuItem;
    mnuSair: TMenuItem;
    C1: TMenuItem;
    mnuPesquisaItem: TMenuItem;
    U1: TMenuItem;
    mnuProdutosItem: TMenuItem;
    mnuVendedoresItem: TMenuItem;
    mnuUsuariosItem: TMenuItem;
    N3: TMenuItem;
    mnuConfiguracoesItem: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuSobreItem: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    pnlBotoes: TPanel;
    spPreSolicitacao: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    imgLogon: TImage;
    Image3: TImage;
    procedure actSobreExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSiteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actPreSolicitacaoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actUsuarioExecute(Sender: TObject);
    procedure actVendedorExecute(Sender: TObject);
    procedure actProdutoExecute(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Byte);
  public
    { Public declarations }
    Function ExisteForm(pForm:TForm):boolean;
    procedure DisplayHint(Sender: TObject);
    function IsWebSiteUP( AURL: String): Boolean;
    procedure AbreForm(aClasseForm: TComponentClass; aForm: TForm);
    Procedure AtualizarNomeUsuario();
    Procedure MenuCadProdutos();
  end;


Const
  M_CODIGO_MASTER = '001';
  M_SNMASTER   = 'ADMG2';

var
  FrmPrincipal: TFrmPrincipal;
  M_CDUSUA, M_NMUSUA, M_SNATUA, M_NMAQUI, M_FLVINC, aArquivoLogo : String;

implementation

uses uDM, UrlMon, uFuncoes, uFrmCadUsuarios, uFrmCadVendedores,
  uFrmCadProdutos, uFrmConfig, uFrmPreSolicitacao;

{$R *.dfm}

procedure TFrmPrincipal.actSobreExecute(Sender: TObject);
begin
     ShowMessage('Modulo não incluido!!!');
end;

procedure TFrmPrincipal.actSairExecute(Sender: TObject);
begin
    If Application.MessageBox('Sair do Programa?',
        'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
            Application.Terminate;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := False;
     If Application.MessageBox('Sair do Programa?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     begin
          CanClose := True;
          Application.Terminate;
     End;
end;

procedure TFrmPrincipal.actSiteExecute(Sender: TObject);
Var
  sAmbiente : String;
begin
    sAmbiente := dmGerenciador.GetAmbienteFPopular();
    If (sAmbiente = 'P') Then
        HlinkNavigateString(nil,'https://aplicacao.saude.gov.br/portalfarmacia/login.jsf')
    Else
        HlinkNavigateString(nil,'http://189.28.128.37/portalfarmacia/login.jsf');
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
    if not DirectoryExists(uFuncoes.M_PASTA_REQ) then
        ForceDirectories(uFuncoes.M_PASTA_REQ);

    if not DirectoryExists(uFuncoes.M_PASTA_RESP) then
        ForceDirectories(uFuncoes.M_PASTA_RESP);

     ShortDateFormat := 'dd/mm/yyyy';
     //
     {Image1.Left := (FrmPrincipal.Width Div 2) - (Image1.Width Div 2);
     Image1.Top := (FrmPrincipal.Height Div 2) - (Image1.Height Div 2 + Info.Height);}
     //
     Application.OnHint := DisplayHint;
     //
     aArquivoLogo := ExtractFilePath( Application.ExeName) +'logo.bmp';
      if FileExists(aArquivoLogo) Then
          imgLogon.Picture.LoadFromFile(aArquivoLogo);
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
    If (Timer1.Enabled = True) Then
     begin
         //
         M_NMAQUI := uFuncoes.M_PASTA_REQ+'\POPREQ.TXT';
         If (fileexists(M_NMAQUI)) then
          begin
             //Showwindow(application.handle,SW_SHOWMAXIMIZED);
             Showwindow(application.handle,SW_RESTORE);
             //application.BringToFront;
          End;
     End;
end;

procedure TFrmPrincipal.actPreSolicitacaoExecute(Sender: TObject);
begin
      AbreForm(TFrmPreSolicitacao, FrmPreSolicitacao);
end;

procedure TFrmPrincipal.SetJustify(Menu: TMenu; MenuItem: TMenuItem;
  Justify: Byte);
var
    ItemInfo: TMenuItemInfo;
    Buffer: array[0..80] of Char;
begin
     ItemInfo.cbSize := SizeOf(TMenuItemInfo);
     ItemInfo.fMask := MIIM_TYPE;
     ItemInfo.dwTypeData := Buffer;
     ItemInfo.cch := SizeOf(Buffer);
     //
     GetMenuItemInfo(MainMenu1.Handle, MenuItem.Command, False, ItemInfo);
     if Justify = 1 then
        ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
     SetMenuItemInfo(MainMenu1.Handle, MenuItem.Command, False, ItemInfo);
end;

procedure TFrmPrincipal.DisplayHint(Sender: TObject);
begin
     Info.Panels[1].Text := Application.Hint;
end;

function TFrmPrincipal.ExisteForm(pForm: TForm): boolean;
Var
    I:integer;
begin
    ExisteForm := False;
    For I:= 0 to Screen.FormCount -1 do
        If Screen.Forms[I] = pForm Then
        begin
            ExisteForm := True;
            Break;
        End;
end;

function TFrmPrincipal.IsWebSiteUP(AURL: String): Boolean;
var
  HTTP: TidHTTP;
begin
  Result := True;
  HTTP := TidHTTP.Create(nil);
  try
    HTTP.Get( AURL);
    // See the table below for standard HTTP response 
    // codes.
    // Modify this case statement to handle the others
    // that you want to catch.
    case HTTP.ResponseCode of
    400..505:
      begin
        Result := False;
      end;
    end; {case}
  finally
    HTTP.Free;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    // Barra de status
     Info.Panels[0].Text := uFuncoes.StrZero(M_CDUSUA,3) + ' - '+ M_NMUSUA;
     //
     SetJustify(MainMenu1,mnuAjuda,1);
     //
     MenuCadProdutos();
     // IMAGEM_LOGO;
     //
     imgLogon.Left := (FrmPrincipal.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top := (FrmPrincipal.Height Div 2) - (imgLogon.Height Div 2 + Info.Height);
end;

procedure TFrmPrincipal.AbreForm(aClasseForm: TComponentClass;
  aForm: TForm);
begin
      Application.CreateForm(aClasseForm, aForm);
      try
           aForm.ShowModal;
      Finally
          aForm.Free;
      End;
end;

procedure TFrmPrincipal.actUsuarioExecute(Sender: TObject);
begin
     AbreForm(TFrmCadUsuarios, FrmCadUsuarios);
end;

procedure TFrmPrincipal.actVendedorExecute(Sender: TObject);
begin
     AbreForm(TFrmCadVendedores, FrmCadVendedores);
end;

procedure TFrmPrincipal.actProdutoExecute(Sender: TObject);
begin
     AbreForm(TFrmCadProdutos, FrmCadProdutos);
end;

procedure TFrmPrincipal.actConfigExecute(Sender: TObject);
begin
      AbreForm(TFrmConfig, FrmConfig);
      //
      MenuCadProdutos();
end;

procedure TFrmPrincipal.AtualizarNomeUsuario;
begin
    if not uFuncoes.Empty(M_CDUSUA) Then
    begin
         M_NMUSUA := dmGerenciador.GetNomeUsuario(StrtoInt(M_CDUSUA));
         Info.Panels[0].Text := uFuncoes.StrZero(M_CDUSUA,3) + ' - '+ M_NMUSUA;
    End;
end;

procedure TFrmPrincipal.MenuCadProdutos;
begin
     mnuProdutosItem.Visible := True;
     ufuncoes.RefreshCDS(dmGerenciador.cdsConfig);
     if (dmGerenciador.cdsConfigcfg_vinculo_sistema.AsBoolean) then
          mnuProdutosItem.Visible := False;
end;

end.
