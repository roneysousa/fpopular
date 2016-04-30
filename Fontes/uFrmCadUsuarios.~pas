unit uFrmCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadModelo, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  StdCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  ComCtrls, Mask, DBCtrls;

type
  TFrmCadUsuarios = class(TFrmCadastro)
    Label1: TLabel;
    dbeNome: TDBEdit;
    Label2: TLabel;
    dbeCargo: TDBEdit;
    lbl_senha: TLabel;
    dbeSNATUA: TEdit;
    lbl_confirma: TLabel;
    edt_Confirma: TEdit;
    cdsConsultarid: TIntegerField;
    cdsConsultarsen_nome: TStringField;
    btnAlterarSenha: TBitBtn;
    procedure BtGravarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure edt_ConfirmaExit(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dbeCargoExit(Sender: TObject);
    procedure btnAlterarSenhaClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure Exibir_edites(bStatus : Boolean);
    Procedure BuscaRegistro(aCodigo : String);
  public
    { Public declarations }
  end;

var
  FrmCadUsuarios: TFrmCadUsuarios;

implementation

uses uDM, uFuncoes, uFrmAlteraSenha;

{$R *.dfm}

procedure TFrmCadUsuarios.BtGravarClick(Sender: TObject);
begin
     if ufuncoes.Empty(dbeNome.Text) Then
      begin
           Application.MessageBox(PChar('Digite o nome do usuário!!!'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
           dbeNome.SetFocus;
           Exit
      End;
      //
      If (dsCadastro.DataSet.State in [dsInsert]) Then
       begin
           If uFuncoes.Empty(dbeSNATUA.Text) Then
            Begin
                 Application.MessageBox('Digite sua senha!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeSNATUA.SetFocus;
                 Exit;
            End;
            //
            If uFuncoes.Empty(edt_Confirma.Text) Then
            Begin
                 Application.MessageBox('Digite a confirmação da senha!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edt_Confirma.SetFocus;
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
               dmGerenciador.cdsConfigcfg_usuario.AsInteger   := dmGerenciador.cdsConfigcfg_usuario.AsInteger + 1;
               dmGerenciador.cdsConfig.ApplyUpdates(0);
               dsCadastro.DataSet.FieldByName('id').AsInteger := dmGerenciador.cdsConfigcfg_usuario.AsInteger;
               dmGerenciador.Comit(dmGerenciador.Transc);
           Except
                 on e: exception do
                   dmGerenciador.Rollback(e.Message);
           End;
       End;
       // Gravar dados
     inherited;
     Exibir_edites(False);
end;

procedure TFrmCadUsuarios.BtAdicionarClick(Sender: TObject);
begin
      uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
      Ufuncoes.FilterCDS(dmGerenciador.cdsUsuario, fsInteger, '-1');
  inherited;
     dsCadastro.DataSet.FieldByName('id').AsInteger := dmGerenciador.cdsConfigcfg_usuario.AsInteger + 1;
     Exibir_edites(True);
     dbeNome.SetFocus;
end;

procedure TFrmCadUsuarios.dbeNomeExit(Sender: TObject);
begin
  inherited;
       if not uFuncoes.Empty(dbeNome.Text) Then
        begin
             dbeNome.Text := uFuncoes.TrocaCaracterEspecial(dbeNome.Text,false);
             if (dsCadastro.DataSet.State = dsInsert) Then
             begin
                  if (dmGerenciador.ProcurarValor(dbeNome.Text, 'sen_nome', 'usuarios')) Then
                  begin
                       Application.MessageBox(PChar('Nome de usuário já cadastrado!!!'),
                                 'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
                       dbeNome.SetFocus;
                       Exit;
                  End;
              End;
        End;   
end;

procedure TFrmCadUsuarios.edt_ConfirmaExit(Sender: TObject);
begin
  inherited;
      if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
         if  not uFuncoes.Empty(dbeSNATUA.Text) and not uFuncoes.Empty(edt_Confirma.Text) Then
          Begin
                //
                If ( edt_Confirma.Text = dbeSNATUA.Text) Then
                     dsCadastro.DataSet.FieldByName('senha').AsString :=  uFuncoes.MD5(edt_Confirma.Text)
                Else
                begin
                     Application.MessageBox( 'A senha incorreta!','ATENÇÃO',
                                   MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
                     edt_Confirma.Clear;
                     edt_Confirma.SetFocus;
                     Exit;
                End;
          End;
end;

procedure TFrmCadUsuarios.Exibir_edites(bStatus: Boolean);
begin
    lbl_senha.Visible    := bStatus;
    dbeSNATUA.Visible    := bStatus;
    lbl_confirma.Visible := bStatus;
    edt_Confirma.Visible := bStatus;
end;

procedure TFrmCadUsuarios.BtEditarClick(Sender: TObject);
begin
  inherited;
      if not (dsCadastro.DataSet.IsEmpty) Then
      begin
          Exibir_edites(True);
          dbeNome.SetFocus;
      End;
end;

procedure TFrmCadUsuarios.BtCancelarClick(Sender: TObject);
begin
  inherited;
       Exibir_edites(False);
end;

procedure TFrmCadUsuarios.BtPesquisarClick(Sender: TObject);
begin
     Exibir_edites(False);
  inherited;
end;

procedure TFrmCadUsuarios.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select id, sen_nome from usuarios ';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where id = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(sen_nome) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + ' order by sen_nome ';
               Open;
          End;   //fim-with
      End;    // fim-se
end;

procedure TFrmCadUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
     If not(cdsConsultar.IsEmpty) Then
     begin
          BuscaRegistro(cdsConsultarid.AsString);
          PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TFrmCadUsuarios.FormShow(Sender: TObject);
begin
  inherited;
       Exibir_edites(False);
       //
       BuscaRegistro('1');
       if (dmGerenciador.cdsUsuario.IsEmpty) Then
           BtAdicionarClick(Sender);
end;

procedure TFrmCadUsuarios.BuscaRegistro(aCodigo: String);
begin
    uFuncoes.FilterCDS(dmGerenciador.cdsUsuario, fsInteger, aCodigo);
    //
    if not (dmGerenciador.cdsUsuario.IsEmpty) Then
     begin

     End;
end;

procedure TFrmCadUsuarios.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
    if not (dsConsultar.DataSet.IsEmpty) Then
        btnAlterarClick(Sender);
end;

procedure TFrmCadUsuarios.dbeCargoExit(Sender: TObject);
begin
  inherited;
{      if (dsCadastro.DataSet.State in [dsInsert, dsEdit])
         and not ufuncoes.Empty(dbeCargo.Text)  Then
           dbeCargo.Text := uFuncoes.TrocaCaracterEspecial(dbeCargo.Text,false);}
end;

procedure TFrmCadUsuarios.btnAlterarSenhaClick(Sender: TObject);
begin
  inherited;
    Application.CreateForm( TfrmAlterarSenha, frmAlterarSenha);
    Try
        frmAlterarSenha.ShowModal;
    Finally
        frmAlterarSenha.Free;
    End;
end;

procedure TFrmCadUsuarios.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
     btnAlterarSenha.Visible := (dsCadastro.DataSet.State = dsBrowse);
end;

end.
