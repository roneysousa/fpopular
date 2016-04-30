unit uFrmPesquisaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TFrmPesquisaPadrao = class(TForm)
    Panel1: TPanel;
    plnGrid: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    grdConsultar: TJvDBUltimGrid;
    rgConsultar: TRadioGroup;
    lblConsultar: TLabel;
    edtConsultar: TEdit;
    btnOK: TBitBtn;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FrmPesquisaPadrao: TFrmPesquisaPadrao;

implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmPesquisaPadrao.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TFrmPesquisaPadrao.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #27) then
   begin
        key := #0;
        Close;
   End;
   //
  if (key = #13) and not uFuncoes.Empty(edtConsultar.Text) Then
   begin
        key := #0;
        if (btnOK.Enabled) Then
            btnOK.SetFocus;
   End;
   //
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8, #13] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
end;

procedure TFrmPesquisaPadrao.edtConsultarChange(Sender: TObject);
begin
     if uFuncoes.Empty(edtConsultar.Text) Then
         dsConsultar.DataSet.Close;
end;

procedure TFrmPesquisaPadrao.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.First;
end;

procedure TFrmPesquisaPadrao.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
         dsConsultar.DataSet.Prior;
end;

procedure TFrmPesquisaPadrao.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Next;
end;

procedure TFrmPesquisaPadrao.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Last;
end;

procedure TFrmPesquisaPadrao.btnOKClick(Sender: TObject);
begin
   if not (dsConsultar.DataSet.IsEmpty) then
       ModalResult := mrOk
   else
       edtConsultar.SetFocus;
end;

procedure TFrmPesquisaPadrao.FormShow(Sender: TObject);
begin
     btnOK.Enabled := False;
     edtConsultar.SetFocus;
end;

procedure TFrmPesquisaPadrao.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
     btnOK.Enabled := (dsConsultar.DataSet.Active) and not (dsConsultar.DataSet.IsEmpty) ;
end;

procedure TFrmPesquisaPadrao.grdConsultarDblClick(Sender: TObject);
begin
     if not (dsConsultar.DataSet.IsEmpty) Then
           btnOKClick(Sender);
end;

procedure TFrmPesquisaPadrao.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
      if not (dsConsultar.DataSet.IsEmpty) Then
       begin
            if (Key = VK_UP) and not (dsConsultar.DataSet.Bof) then
               dsConsultar.DataSet.Prior;
            if (Key = VK_DOWN ) and not (dsConsultar.DataSet.Eof) then
               dsConsultar.DataSet.Next;
       End;
end;

end.
