unit uFrmConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient;

type
  TFrmConfig = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtEditar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    dbeRazao: TDBEdit;
    dsCadastro: TDataSource;
    Label2: TLabel;
    dbeFantasia: TDBEdit;
    Label3: TLabel;
    dbeCnpj: TDBEdit;
    Label4: TLabel;
    dbeLogradouro: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    dbeBairro: TDBEdit;
    Label7: TLabel;
    dbeCidade: TDBEdit;
    cmbUF: TDBComboBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    dbeLogin: TDBEdit;
    Label12: TLabel;
    dbeSenha: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    ClientDataSet1: TClientDataSet;
    procedure BtSairClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeCnpjExit(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure dbeRazaoExit(Sender: TObject);
    procedure dbeFantasiaExit(Sender: TObject);
    procedure dbeLogradouroExit(Sender: TObject);
    procedure dbeBairroExit(Sender: TObject);
    procedure dbeCidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmConfig.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmConfig.BtEditarClick(Sender: TObject);
begin
     dsCadastro.DataSet.Edit;
     dbeRazao.SetFocus;
end;

procedure TFrmConfig.FormShow(Sender: TObject);
begin
     uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
end;

procedure TFrmConfig.BtCancelarClick(Sender: TObject);
begin
     dsCadastro.DataSet.Cancel;
end;

procedure TFrmConfig.BtGravarClick(Sender: TObject);
begin
     //
     If uFuncoes.Empty(dbeRazao.Text) Then
     begin
          Application.MessageBox(PChar('Digite a razão social!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeRazao.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeFantasia.Text) Then
     begin
          Application.MessageBox(PChar('Digite o nome de fantasia da empressa!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeFantasia.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeCnpj.Text) Then
     begin
          Application.MessageBox(PChar('Digite a razão social!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCnpj.SetFocus;
          Exit;
     End;

     dmGerenciador.Start;
     Try
           dsCadastro.DataSet.Post;
           TClientDataSet(dsCadastro.DataSet).ApplyUpdates(0);
           dmGerenciador.Comit(dmGerenciador.Transc);
     Except
            on e: exception do
              dmGerenciador.Rollback(e.Message);
     End;

end;

procedure TFrmConfig.dbeCnpjExit(Sender: TObject);
begin
    If (dsCadastro.DataSet.State in [dsEdit]) Then
     If not uFuncoes.Empty(dbeCnpj.Text) Then
        If not uFuncoes.CGC(dbeCnpj.Text) Then
         Begin
              Application.MessageBox('CNPJ inválido!!!',
                  'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
              dbeCnpj.SetFocus;
              Exit;
         End;
end;

procedure TFrmConfig.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
    BtEditar.Enabled    := (dsCadastro.DataSet.State in [dsBrowse]) and not (dsCadastro.DataSet.IsEmpty);
    BtCancelar.Enabled  := dsCadastro.DataSet.State in [dsInsert, dsEdit];
    BtGravar.Enabled    := dsCadastro.DataSet.State in [dsInsert, dsEdit];
    BtSair.Enabled      := dsCadastro.DataSet.State in [dsBrowse];
end;

procedure TFrmConfig.dbeRazaoExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State = dsEdit) and
        not uFuncoes.Empty(dbeRazao.Text) Then
          dbeRazao.Text := uFuncoes.TrocaCaracterEspecial(dbeRazao.Text,false);
end;

procedure TFrmConfig.dbeFantasiaExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State = dsEdit) and
        not uFuncoes.Empty(dbeFantasia.Text) Then
          dbeFantasia.Text := uFuncoes.TrocaCaracterEspecial(dbeFantasia.Text,false);
end;

procedure TFrmConfig.dbeLogradouroExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State = dsEdit) and
        not uFuncoes.Empty(dbeLogradouro.Text) Then
          dbeLogradouro.Text := uFuncoes.TrocaCaracterEspecial(dbeLogradouro.Text,false);
end;

procedure TFrmConfig.dbeBairroExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State = dsEdit) and
        not uFuncoes.Empty(dbeBairro.Text) Then
          dbeBairro.Text := uFuncoes.TrocaCaracterEspecial(dbeBairro.Text,false);
end;

procedure TFrmConfig.dbeCidadeExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State = dsEdit) and
        not uFuncoes.Empty(dbeCidade.Text) Then
          dbeCidade.Text := uFuncoes.TrocaCaracterEspecial(dbeCidade.Text,false);
end;

end.
