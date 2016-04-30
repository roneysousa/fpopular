unit udmPluspdv;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, IniFiles, Forms, Windows;

type
  TdmPluspdv = class(TDataModule)
    sqlConnplus: TSQLConnection;
    procedure sqlConnplusBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPluspdv: TdmPluspdv;

implementation

{$R *.dfm}

procedure TdmPluspdv.sqlConnplusBeforeConnect(Sender: TObject);
Var
	ConfigIni : TIniFile;
	Path, aFile, aHabilitarVenda : String;
begin
  try
      aFile := ExtractFilePath(ParamStr(0)) + 'dbexppgsql.dll';
      sqlConnplus.VendorLib := aFile;
    	ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
      if not FileExists(ExtractFilePath(ParamStr(0)) + 'Config.ini') Then
      begin
           Application.MessageBox(PChar('Arquivo de configuração não encontrado!!!'),
                         'Atenção', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           raise Exception.Create('Erro arquivo de configuração.'+#13+'Aplicação encerrada.');
      End;
      //
      sqlConnplus.Params.Values['HostName'] := ConfigIni.ReadString('PLUSPDV','SERVIDOR','');
    	sqlConnplus.Params.Values['Database'] := ConfigIni.ReadString('PLUSPDV','DATABASE','');
      sqlConnplus.Params.Values['User_Name'] := ConfigIni.ReadString('PLUSPDV','USUARIO','');
      sqlConnplus.Params.Values['Password'] := ConfigIni.ReadString('PLUSPDV','PASS','');
      sqlConnplus.Params.Values['PostgreSQL.UseUnicode'] := 'false';
      sqlConnplus.Params.Values['Charset'] := 'win1252';
      //
  Finally
    	ConfigIni.Free;
  End;    
end;

procedure TdmPluspdv.DataModuleCreate(Sender: TObject);
begin
     Try
          sqlConnplus.Connected := False;
          sqlConnplus.Connected := True;
          //
     Except
         on e: exception do
          begin
              Application.MessageBox(PChar('Erro na abertura do sistema! Erro:' + e.message),
                      'ATENÇÃO', MB_OK+MB_ICONERROR +MB_APPLMODAL);
              sqlConnplus.Connected := false;
              Application.Terminate;
          End;
     End;
end;

procedure TdmPluspdv.DataModuleDestroy(Sender: TObject);
begin
     sqlConnplus.Connected := false;
end;

end.
