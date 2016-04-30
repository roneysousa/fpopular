unit uFrmCadVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadModelo, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  StdCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  ComCtrls, DBCtrls, Mask;

type
  TFrmCadVendedores = class(TFrmCadastro)
    Label1: TLabel;
    dbeNome: TDBEdit;
    Label2: TLabel;
    dbeLogin: TDBEdit;
    Label3: TLabel;
    dbeSenha: TDBEdit;
    cdsConsultarven_codigo: TIntegerField;
    cdsConsultarven_nome: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure BuscaRegistro(aCodigo : String);
  public
    { Public declarations }
  end;

var
  FrmCadVendedores: TFrmCadVendedores;

implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmCadVendedores.BtAdicionarClick(Sender: TObject);
begin
      uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
      Ufuncoes.FilterCDS(dmGerenciador.cdsVendedor, fsInteger, '-1');
  inherited;
     dsCadastro.DataSet.FieldByName('ven_codigo').AsInteger := dmGerenciador.cdsConfigcfg_vendedor.AsInteger + 1;
     dbeNome.SetFocus;
end;

procedure TFrmCadVendedores.BtEditarClick(Sender: TObject);
begin
  inherited;
      if not (dsCadastro.DataSet.IsEmpty) Then
          dbeNome.SetFocus;
end;

procedure TFrmCadVendedores.BtGravarClick(Sender: TObject);
begin
     if ufuncoes.Empty(dbeNome.Text) Then
      begin
           Application.MessageBox(PChar('Digite o nome do vendedor!!!'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
           dbeNome.SetFocus;
           Exit
      End;
      //
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
       begin
           If uFuncoes.Empty(dbeLogin.Text) Then
            Begin
                 Application.MessageBox('Digite seu login!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeLogin.SetFocus;
                 Exit;
            End;
            //
            If uFuncoes.Empty(dbeSenha.Text) Then
            Begin
                 Application.MessageBox('Digite sua senha!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeSenha.SetFocus;
                 Exit;
            End;
      End;
      //
      if (dsCadastro.DataSet.State = dsInsert) Then
       begin
           dmGerenciador.Start;
           uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
           Try
               dmGerenciador.cdsConfig.Edit;
               dmGerenciador.cdsConfigcfg_vendedor.AsInteger   := dmGerenciador.cdsConfigcfg_vendedor.AsInteger + 1;
               dmGerenciador.cdsConfig.ApplyUpdates(0);
               dsCadastro.DataSet.FieldByName('ven_codigo').AsInteger := dmGerenciador.cdsConfigcfg_vendedor.AsInteger;
               dmGerenciador.Comit(dmGerenciador.Transc);
           Except
                 on e: exception do
                   dmGerenciador.Rollback(e.Message);
           End;
       End;
       // Gravar dados
  inherited;
end;

procedure TFrmCadVendedores.BuscaRegistro(aCodigo: String);
begin
     uFuncoes.FilterCDS(dmGerenciador.cdsVendedor, fsInteger, aCodigo);
end;

procedure TFrmCadVendedores.FormShow(Sender: TObject);
begin
  inherited;
       BuscaRegistro('1');
       if (dmGerenciador.cdsVendedor.IsEmpty) Then
           BtAdicionarClick(Sender);
end;

procedure TFrmCadVendedores.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'select ven_codigo, ven_nome from vendedores ';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where ven_codigo = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(ven_nome) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + ' order by ven_nome ';
               Open;
          End;   //fim-with
      End;    // fim-se
end;

procedure TFrmCadVendedores.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
    if not (dsConsultar.DataSet.IsEmpty) Then
        btnAlterarClick(Sender);
end;

procedure TFrmCadVendedores.dbeNomeExit(Sender: TObject);
begin
  inherited;
       if (dsCadastro.DataSet.State = dsInsert) and not uFuncoes.Empty(dbeNome.Text) Then
        begin
             dbeNome.Text := uFuncoes.TrocaCaracterEspecial(dbeNome.Text,false);
             if (dmGerenciador.ProcurarValor(dbeNome.Text, 'ven_nome', 'vendedores')) Then
              begin
                   Application.MessageBox(PChar('Nome de vendedor já cadastrado!!!'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
                   dbeNome.SetFocus;
                   Exit;
              End;
        End;
end;

procedure TFrmCadVendedores.btnAlterarClick(Sender: TObject);
begin
  inherited;
     If not(cdsConsultar.IsEmpty) Then
     begin
          BuscaRegistro(cdsConsultarven_codigo.AsString);
          PageControl1.ActivePageIndex := 0;
     End;
end;

end.
