unit uFrmCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadModelo, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  StdCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  DBCtrls, ComCtrls, Mask;

type
  TFrmCadProdutos = class(TFrmCadastro)
    Label1: TLabel;
    dbeBarras: TDBEdit;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    dbeQuantidade: TDBEdit;
    Label4: TLabel;
    dbeValor: TDBEdit;
    cdsConsultarpro_barras: TStringField;
    cdsConsultarpro_medicamento: TStringField;
    cdsConsultarpro_valorvenda: TFMTBCDField;
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dbeBarrasExit(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
    procedure dbeBarrasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Procedure BuscaRegistro(aCodigo : String);
  public
    { Public declarations }
  end;

var
  FrmCadProdutos: TFrmCadProdutos;

implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmCadProdutos.BuscaRegistro(aCodigo: String);
begin
     uFuncoes.FilterCDS(dmGerenciador.cdsProduto, fsString, uFuncoes.StrZero(aCodigo, 13));
end;

procedure TFrmCadProdutos.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      dbeBarras.Enabled := (dsCadastro.DataSet.State = dsInsert);
end;

procedure TFrmCadProdutos.FormShow(Sender: TObject);
Var
   aProduto : String;
begin
  inherited;
       aProduto := dmGerenciador.mscodigo('pro_barras', 'produtos');
       BuscaRegistro(aProduto);
       if (dmGerenciador.cdsProduto.IsEmpty) Then
           BtAdicionarClick(Sender);
end;

procedure TFrmCadProdutos.BtAdicionarClick(Sender: TObject);
begin
      uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
      Ufuncoes.FilterCDS(dmGerenciador.cdsProduto, fsString, '-1');
  inherited;
      dbeBarras.SetFocus;
end;

procedure TFrmCadProdutos.BtEditarClick(Sender: TObject);
begin
  inherited;
     if not (dsCadastro.DataSet.IsEmpty) Then
          dbeDescricao.SetFocus;
end;

procedure TFrmCadProdutos.BtGravarClick(Sender: TObject);
begin
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) and ufuncoes.Empty(dbeBarras.Text) Then
      begin
           Application.MessageBox(PChar('Digite o código de barras!!!'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
           dbeBarras.SetFocus;
           Exit
      End;
      //
      If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
            Application.MessageBox('Digite uma descrição!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dbeDescricao.SetFocus;
            Exit;
       End;
       //
       If uFuncoes.Empty(dbeQuantidade.Text) Then
        Begin
             Application.MessageBox('Digite a quantidade de apresentação!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbeQuantidade.SetFocus;
             Exit;
        End;
        //
       If uFuncoes.Empty(dbeValor.Text) Then
        Begin
             Application.MessageBox('Digite o valor!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbeValor.SetFocus;
             Exit;
        End;
       // Gravar dados
  inherited;
end;

procedure TFrmCadProdutos.edtConsultarChange(Sender: TObject);
begin
  inherited;
//  order by
     If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'select pro_barras, pro_medicamento, pro_valorvenda from produtos ';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where pro_barras = ' + QuotedStr(AnsiUpperCase(uFuncoes.StrZero(edtConsultar.Text,13)));
                 1: CommandText := CommandText + ' where UPPER(pro_medicamento) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + ' order by pro_medicamento ';
               Open;
          End;   //fim-with
      End;    // fim-se
end;

procedure TFrmCadProdutos.btnAlterarClick(Sender: TObject);
begin
  inherited;
     If not(cdsConsultar.IsEmpty) Then
     begin
          BuscaRegistro(cdsConsultarpro_barras.AsString);
          PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TFrmCadProdutos.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
    if not (dsConsultar.DataSet.IsEmpty) Then
        btnAlterarClick(Sender);
end;

procedure TFrmCadProdutos.dbeBarrasExit(Sender: TObject);
begin
  inherited;
       if (dsCadastro.DataSet.State = dsInsert) and not uFuncoes.Empty(dbeBarras.Text) Then
        begin
             if (dmGerenciador.ProcurarValor(dbeBarras.Text, 'pro_barras', 'produtos')) Then
              begin
                   Application.MessageBox(PChar('Código já cadastrado!!!'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
                   dbeBarras.SetFocus;
                   Exit;
              End;
              //
              dbeBarras.Text := uFuncoes.StrZero(dbeBarras.Text,13);
        End;
end;

procedure TFrmCadProdutos.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
    if not uFuncoes.Empty(dbeDescricao.Text) Then
        begin
             dbeDescricao.Text := uFuncoes.TrocaCaracterEspecial(dbeDescricao.Text,false);
             If (dsCadastro.DataSet.State = dsInsert) Then
             begin
                 if (dmGerenciador.ProcurarValor(dbeDescricao.Text, 'pro_medicamento', 'produtos')) Then
                  begin
                      Application.MessageBox(PChar('Descrição já cadastrada!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
                      dbeDescricao.SetFocus;
                      Exit;
                  End;
              End;
        End;
end;

procedure TFrmCadProdutos.dbeBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      if not( key in['0'..'9', #8, #13] ) then
       begin
           beep;
           key:=#0;
       end;
end;

end.
