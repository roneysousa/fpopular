unit uFrmPesquisaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPesquisaPadrao, FMTBcd, DBClient, Provider, DB, SqlExpr,
  Buttons, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, StdCtrls,
  ExtCtrls;

type
  TFrmPesquisaClientes = class(TFrmPesquisaPadrao)
    cdsConsultarpac_cpf: TStringField;
    cdsConsultarpac_nome: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaClientes: TFrmPesquisaClientes;

implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmPesquisaClientes.edtConsultarChange(Sender: TObject);
begin
  inherited;
//
  If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'select pac_cpf, pac_nome from pacientes ';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where pac_cpf = ' + QuotedStr(AnsiUpperCase(edtConsultar.Text));
                 1: CommandText := CommandText + ' where UPPER(pac_nome) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + ' order by pac_nome ';
               Open;
          End;   //fim-with
      End;    // fim-se
end;

procedure TFrmPesquisaClientes.btnOKClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmPesquisaClientes.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmPesquisaClientes.rgConsultarClick(Sender: TObject);
begin
 // inherited;
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'CPF do Paciente:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome do Paciente:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

end.
