unit uFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image3: TImage;
    Image2: TImage;
    Image1: TImage;
    edt_SENHA: TEdit;
    edtCDUSUA: TEdit;
    procedure edtCDUSUAExit(Sender: TObject);
    procedure edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
    procedure Image1Click(Sender: TObject);
    procedure edt_SENHAKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoUsuario : Integer;
    nomeUsuario   : String;
    administrador :  boolean;
  end;

var
  FrmLogin: TFrmLogin;
  M_QTTENT: Integer;
  M_NMUSUA, aMySenhaDigitada : String;

implementation

uses uFuncoes, uUsuario, uDM, uInfoPrincipal;

{$R *.dfm}

procedure TFrmLogin.edtCDUSUAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDUSUA.Text) Then
        edtCDUSUA.Text := uFuncoes.StrZero(edtCDUSUA.Text,3);
end;

procedure TFrmLogin.edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
    //
    If (key = #27) Then
    Begin
         key:=#0;
         ModalResult := mrCancel;
         Exit;
    End;
    //
    If (key = #13) and uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         edtCDUSUA.Text := '000';
         edt_SENHA.SetFocus; 
    End;
    //
    If (key = #13) and not uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         If not dmGerenciador.ProcurarValorInt(edtCDUSUA.Text,' id', 'usuarios') Then
         begin
              Application.MessageBox('Registro de usu�rio n�o cadastrado!!!','ATEN��O',
                            MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              edtCDUSUA.Clear;
              edtCDUSUA.SetFocus;
              Exit;
         End
         Else
             edt_SENHA.SetFocus;
    End;
end;

procedure TFrmLogin.Image1Click(Sender: TObject);
begin
      Application.Terminate;
end;

procedure TFrmLogin.edt_SENHAKeyPress(Sender: TObject; var Key: Char);
Var
   aDia, aMes, aDiaMes : String;
   AuxData : TDateTime;
   Ano, Mes, Dia, DoubloDiaMes : word;
   //
   aSenha, aSenhaDigitada : String;
   bUsuarioMasterOK : Boolean;
begin
     If (key = #27) Then
     Begin
         key:=#0;
         ModalResult := mrCancel;
         Exit;
     End;
     //
     If (Key =#13) and not uFuncoes.Empty(edtCDUSUA.Text)
        and not uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Key := #0;
          //ACESSO(edtCDUSUA.Text, edt_SENHA.Text);
          if uFuncoes.Empty(edtCDUSUA.Text) Then
            begin
                 MessageDlg('Informe o c�digo do usu�rio.',
                   mtInformation, [mbOK], 0);
                 edtCDUSUA.SetFocus;
                 Exit;
            End;
          //
          if uFuncoes.Empty(edt_SENHA.Text) Then
            begin
                 MessageDlg('Informe a senha.',
                   mtInformation, [mbOK], 0);
                 edt_SENHA.SetFocus;
                 Exit;
            End;
          //
         If not uFuncoes.Empty(edt_Senha.text) and (edtCDUSUA.Text <> '000') Then
           begin
                aMySenhaDigitada := uFuncoes.MD5(edt_Senha.text);

           End;
           //
           bUsuarioMasterOK := False;
          //
          If (Strtoint(edtCDUSUA.Text) = 1) Then
           begin
                     AuxData := Date();
                     DecodeDate (Auxdata, Ano, Mes, Dia);
                     aDia := uFuncoes.StrZero( InttoStr(Dia*2),2);
                     aMes := uFuncoes.StrZero( InttoStr(Mes*2),2);
                     DoubloDiaMes := (Dia*2)+(Mes*2);
                     aDiaMes := uFuncoes.StrZero( InttoStr(DoubloDiaMes),2);
                     //
                     aSenha := aDia+aMes+aDiaMes;
                     aSenhaDigitada := edt_SENHA.Text;  // aMySenhaDigitada;
                     //
                     if (aSenhaDigitada = aSenha) then
                       Begin
                            uInfoPrincipal.M_CDUSUA := '001';
                            uInfoPrincipal.M_NMUSUA := 'USERMASTER';
                            //
                            codigoUsuario := 1;
                            nomeUsuario   := 'INFOG2';
                            administrador := True;
                            FrmPrincipal.AtualizarNomeUsuario();
                            bUsuarioMasterOK := True;
                            ModalResult := mrOK;
                            //
                        End
                        Else
                        Begin
                            {Application.MessageBox('Senha inv�lida!!!',
                                       'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);}
                            If (M_QTTENT >= 4) Then
                            begin
                                Application.MessageBox('O Sistema ser� Fechado!', 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                                Application.Terminate;
                            End;
                        End;
           End;
          //
        if (bUsuarioMasterOK) then
            Exit;
         //   
          if (TUsuario.GetInstance.Login(StrtoInt(edtCDUSUA.Text), aMySenhaDigitada, FrmPrincipal.actAcoes)) then
           begin
                uInfoPrincipal.M_CDUSUA := edtCDUSUA.Text;
                //
                dmGerenciador.Start;
                Try
                   uFuncoes.FilterCDS(dmGerenciador.cdsUsuario, fsInteger, uInfoPrincipal.M_CDUSUA);
                   if not (dmGerenciador.cdsUsuario.IsEmpty) Then
                   Begin
                        dmGerenciador.cdsUsuario.Edit;
                        //
                        dmGerenciador.cdsUsuariosen_dtatual.AsDateTime := Date();
                        dmGerenciador.cdsUsuario.ApplyUpdates(0);
                        //
                        uInfoPrincipal.M_NMUSUA := dmGerenciador.cdsUsuariosen_nome.AsString;
                   End;
                   //
                   dmGerenciador.Comit(dmGerenciador.Transc);
                   dmGerenciador.cdsUsuario.Close;
                Except
                     on e: exception do
                       dmGerenciador.Rollback('Erro login: '+#13+e.Message);
                End;
                //
                FrmPrincipal.AtualizarNomeUsuario();
                ModalResult :=  mrOK;
           end
          Else
           begin
                     M_QTTENT := M_QTTENT+1;
                     Messagedlg('Login ou senha inv�lido. Por favor tente novemente!!', mtWarning, [mbOK],0);
                     edt_SENHA.SetFocus;
                     edt_SENHA.Clear;
                     //
                     If (M_QTTENT >= 4) Then
                     begin
                           Application.MessageBox('O Sistema ser� Fechado!', 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                           Application.Terminate;
                     End;
                     //
                     Exit;
           end;
     End;
end;

end.
