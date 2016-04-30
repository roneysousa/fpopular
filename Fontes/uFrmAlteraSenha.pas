unit uFrmAlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmAlterarSenha = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblUsuario: TLabel;
    Label1: TLabel;
    dbeSenhaAnterior: TEdit;
    Label2: TLabel;
    dbeSenhaNova: TEdit;
    txtUsuario: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbeSenhaAnteriorKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSenhaNovaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSenhaAnteriorEnter(Sender: TObject);
    procedure dbeSenhaNovaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;
  aSenhaMD5 : String;

implementation

uses uUsuario, uFuncoes, uDM;

{$R *.dfm}

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
     txtUsuario.Text := TUsuario.GetInstance.Nome;
end;

procedure TfrmAlterarSenha.BitBtn1Click(Sender: TObject);
Var
    aSenhaAnt, aSenhaNova, aSenhaTMP : String;
    iUsuario : Integer;
begin
     if uFuncoes.Empty(dbeSenhaNova.Text) Then
      begin
           Messagedlg('Digite sua nova senha.', mtInformation, [mbOK],0);
           dbeSenhaNova.SetFocus;
           Exit;
      End;

     aSenhaAnt := uFuncoes.MD5(dbeSenhaAnterior.Text);
     //
     iUsuario := TUsuario.GetInstance.ID;
     // aSenhaTMP := uFuncoes.StrZero(InttoStr(iUsuario),3)+uFuncoes.Alltrim(dbeSenhaNova.Text)+uDmdados.M_CNPJ_INFOG2;
     //aSenhaNova := dbeSenhaNova.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(dbeSenhaNova.Text));
     aSenhaNova := dbeSenhaNova.Text;
     aSenhaNova := ufuncoes.MD5(aSenhaNova);
     //
     if TUsuario.GetInstance.ChagePassword(aSenhaAnt, aSenhaNova) then
       begin
         {aSenhaMD5 := FrmMainTaxi.MD5(aSenhaTMP);
         dmDados.SetSenhaMD5(iUsuario , aSenhaMD5);}
         Messagedlg('Senha alterada com Sucesso!!!', mtInformation, [mbOK],0); 
         Close;
       end
     Else
      begin
         Messagedlg('Não foi possivel alterar senha. Tente novamente mais tarde!!!', mtError, [mbOK],0);
         dbeSenhaAnterior.SetFocus;
      End;
end;

procedure TfrmAlterarSenha.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmAlterarSenha.dbeSenhaAnteriorKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) and not ufuncoes.Empty(dbeSenhaAnterior.Text) then
      begin
          key := #0;
          dbeSenhaNova.SetFocus;
      End;
end;

procedure TfrmAlterarSenha.dbeSenhaNovaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) and not ufuncoes.Empty(dbeSenhaNova.Text) then
      begin
          key := #0;
          if (BitBtn1.Enabled) Then
             BitBtn1.SetFocus;
      End;
end;

procedure TfrmAlterarSenha.dbeSenhaAnteriorEnter(Sender: TObject);
begin
     aSenhaMD5 := '';
end;

procedure TfrmAlterarSenha.dbeSenhaNovaEnter(Sender: TObject);
begin
    aSenhaMD5 := '';
end;

end.
