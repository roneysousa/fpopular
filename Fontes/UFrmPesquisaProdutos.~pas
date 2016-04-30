unit UFrmPesquisaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPesquisaPadrao, FMTBcd, DBClient, Provider, DB, SqlExpr,
  Buttons, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, StdCtrls,
  ExtCtrls;

type
  TFrmPesquisaProdutos = class(TFrmPesquisaPadrao)
    cdsConsultarpro_barras: TStringField;
    cdsConsultarpro_medicamento: TStringField;
    cdsConsultarpro_valorvenda: TFMTBCDField;
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaProdutos: TFrmPesquisaProdutos;

implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmPesquisaProdutos.edtConsultarChange(Sender: TObject);
begin
  inherited;
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

procedure TFrmPesquisaProdutos.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmPesquisaProdutos.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
//
end;

End.
