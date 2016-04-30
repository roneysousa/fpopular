unit uFrmPesqProdutosPlus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPesquisaPadrao, FMTBcd, DBClient, Provider, DB, SqlExpr,
  Buttons, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, StdCtrls,
  ExtCtrls;

type
  TFrmPesqProdutosPlus = class(TFrmPesquisaPadrao)
    cdsConsultarid: TIntegerField;
    cdsConsultardescricao: TStringField;
    cdsConsultarcod_barras: TStringField;
    cdsConsultarvalor_farmacia_popular: TFMTBCDField;
    cdsConsultarquant_armaz: TFMTBCDField;
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqProdutosPlus: TFrmPesqProdutosPlus;

implementation

uses udmPluspdv, uFuncoes;

{$R *.dfm}

procedure TFrmPesqProdutosPlus.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select p.id, p.descricao, p.cod_barras, p.valor_farmacia_popular, p.quant_armaz from produtos p where (p.medicamento = true) ';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' and p.cod_barras = ' + QuotedStr(AnsiUpperCase(uFuncoes.StrZero(edtConsultar.Text,13)));
                 1: CommandText := CommandText + ' and UPPER(p.descricao) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + ' order by p.descricao ';
               Open;
          End;   //fim-with
      End;    // fim-se
end;

procedure TFrmPesqProdutosPlus.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmPesqProdutosPlus.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
//
end;

end.
