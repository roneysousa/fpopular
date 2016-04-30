unit uUsuario;

interface

Uses ActnList, SqlExpr, uDM, SysUtils, DB, Math, Dialogs, DBXpress, uFuncoes;

type
  TPermissao = record
    Incluir : Boolean;
    Excluir : Boolean;
    Alterar : Boolean;
    Consultar  : Boolean;
    Imprimir : Boolean;
  end;

  TUsuario = class
  private
    FID   : Integer;
    FSenha: String;
    FLogin: String;
    FNome : String;
    FPerfilID: Integer;
    FLogado: Boolean;
    FAcoes : TActionList;
    constructor CreatePrivate; 
    { private declarations }
  protected
    { protected declarations }
    //function LoadProfile : Boolean; virtual;
  public
    { public declarations }
     constructor Create;
     function Login(iIDUsuario : Integer; aSenha : String; Acoes : TActionList): Boolean;
     Function ChagePassword(strOldPassword, strNewPassword : String): boolean;
     class Function GetInstance : TUsuario;
  published
    { published declarations }
    Property ID : Integer read FID;
    property Nome : String read FNome;
    property Usuario : String read FLogin;
    property Senha : String read FSenha;
    property PerfilID: Integer read FPerfilID;
  end;

var FInstance: TUsuario;

implementation

{ TUsuario }

function TUsuario.ChagePassword(strOldPassword,
  strNewPassword: String): boolean;
Var
    Texto : String;
    QryAux : TSQLquery;
begin
   Result := False;
   If FLogado Then
   begin
       if FSenha = strOldPassword then
       begin
         try
              texto := 'Update usuarios SET senha = ' + QuotedStr(strNewPassword)
                     + ' Where id = '+ InttoStr(FID) ;
              QryAux := TSQLquery.Create(nil);
              try
                  With QryAux do
                   begin
                       SQLConnection := dmGerenciador.sqlConexao;
                       Close;
                       SQL.Add(Texto);
                       ExecSQL();
                       //
                       Result := True;
                   End;
              Finally
                   FreeAndNil(QryAux);
              End;
         Except
               Result := False;
         End;
      End   
      Else
         Messagedlg('Senha antiga não confere!!', mtWarning, [mbOK],0);
   End
   Else
      Messagedlg('E necessario está logado para invocar este método!!', mtWarning, [mbOK],0);
end;

constructor TUsuario.Create;
begin
     Raise Exception.Create('Para obter uma instancia de TUsuario utilize TUsuario.GetInstance');
end;

constructor TUsuario.CreatePrivate;
begin
     inherited Create;
end;

class function TUsuario.GetInstance: TUsuario;
begin
      If not Assigned(FInstance) Then
        FInstance := TUsuario.CreatePrivate;
      Result := FInstance;
end;

function TUsuario.Login(iIDUsuario: Integer; aSenha: String;
  Acoes: TActionList): Boolean;
Var
    Texto : String;
    QryAux : TSQLQuery;
    i : Integer;
begin
     Result := False;
     texto := 'Select * from usuarios Where id = ' + QuotedStr(InttoStr(iIDUsuario))
              + ' and senha = ' + QuotedStr(aSenha);
     QryAux := TSQLQuery.Create(nil);
     try
         With QryAux do
          begin
              sqlConnection := dmGerenciador.sqlConexao;
              Close;
              SQL.Add(Texto);
              Open;
              //
              If not (IsEmpty) Then
              begin
                   FID       := FieldByName('id').AsInteger;
                   //FPerfilID := FieldByName('sen_idperfil').AsInteger;
                   FNome     := FieldByName('sen_nome').AsString;
                   FLogin    := FieldByName('sen_nome').AsString;
                   FSenha    := FieldByName('senha').AsString;
                   FAcoes    := Acoes;
                   FLogado   := True;
                   Result    := True;
                   //
                   {If (FieldByName('usu_admin').AsString = 'F') Then
                   begin
                     if (LoadProfile) then
                       Result    := True
                     Else
                       Messagedlg('E necessario está logado para invocar este método!!', mtWarning, [mbOK],0);
                   End
                   Else
                    begin
                      Result    := True;
                      for i := 0 to Pred(FAcoes.ActionCount) do
                          TAction(FAcoes.Actions[I]).Enabled := True;
                    End;    }
               End;
          End;
     Finally
         FreeAndNil(QryAux);
     End;
end;

end.
