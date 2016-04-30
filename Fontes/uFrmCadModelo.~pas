unit uFrmCadModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, StdCtrls, Buttons, DB, Mask, DBCtrls, FMTBcd, DBClient,
  Provider, SqlExpr;

type
  TFrmCadastro = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tsDados: TTabSheet;
    tsPesquisa: TTabSheet;
    grdConsultar: TJvDBUltimGrid;
    dsCadastro: TDataSource;
    Panel3: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    btnAlterar: TBitBtn;
    Panel2: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    Image1: TImage;
    lblCodigo: TLabel;
    DBText1: TDBText;
    procedure FormShow(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure rgConsultarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure tsPesquisaShow(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure habilitaCampos(const tof: Boolean);
  protected
    strOper : Char;
  public
    { Public declarations }
  end;

var
  FrmCadastro: TFrmCadastro;


implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmCadastro.FormShow(Sender: TObject);
begin
      KeyPreview := True;
      PageControl1.ActivePageIndex := 0;
      habilitaCampos(false);
end;

procedure TFrmCadastro.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
    BtAdicionar.Enabled := dsCadastro.DataSet.State in [dsBrowse];
    BtEditar.Enabled    := (dsCadastro.DataSet.State in [dsBrowse]) and not (dsCadastro.DataSet.IsEmpty);
    BtExcluir.Enabled   := (dsCadastro.DataSet.State in [dsBrowse]) and not (dsCadastro.DataSet.IsEmpty);
    BtPesquisar.Enabled := dsCadastro.DataSet.State in [dsBrowse];
    BtCancelar.Enabled  := dsCadastro.DataSet.State in [dsInsert, dsEdit];
    BtGravar.Enabled    := dsCadastro.DataSet.State in [dsInsert, dsEdit];
    BtSair.Enabled      := dsCadastro.DataSet.State in [dsBrowse];
    //
    tsPesquisa.TabVisible := dsCadastro.DataSet.State in [dsBrowse];
end;

procedure TFrmCadastro.habilitaCampos(const tof: Boolean);
var
  i : Integer;
  cor : TColor;
begin
  if tof then
    cor := clWindow
  else
    cor := clBtnFace;
  for i := 0 to PageControl1.Pages[0].ControlCount - 1 do
  begin
    if (PageControl1.Pages[0].Controls[i] is TEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TComboBox).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TMaskEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TDBLookupComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Color := cor;
    end
    Else
    if (PageControl1.Pages[0].Controls[i] is TDBEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TRadioGroup) then
      (PageControl1.Pages[0].Controls[i] as TRadioGroup).Enabled := tof
    else
    if (PageControl1.Pages[0].Controls[i] is TCheckBox) then
      (PageControl1.Pages[0].Controls[i] as TCheckBox).Enabled := tof;
  end;

end;

procedure TFrmCadastro.rgConsultarClick(Sender: TObject);
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

procedure TFrmCadastro.BtPesquisarClick(Sender: TObject);
begin
      PageControl1.ActivePageIndex := 1;
end;

procedure TFrmCadastro.edtConsultarChange(Sender: TObject);
begin
     if uFuncoes.Empty(edtConsultar.Text) Then
         dsConsultar.DataSet.Close;
end;

procedure TFrmCadastro.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.First;
end;

procedure TFrmCadastro.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
         dsConsultar.DataSet.Prior;
end;

procedure TFrmCadastro.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Next;
end;

procedure TFrmCadastro.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Last;
end;

procedure TFrmCadastro.grdConsultarDblClick(Sender: TObject);
begin
    strOper := 'A';
end;

procedure TFrmCadastro.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) and not uFuncoes.Empty(edtConsultar.Text) Then
   begin
        key := #0;
        if (btnAlterar.Enabled) Then
            btnAlterar.SetFocus;
   End;
   //
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
  //

end;

procedure TFrmCadastro.BtAdicionarClick(Sender: TObject);
begin
     strOper := 'I';
     if dsConsultar.DataSet.Active then
       dsConsultar.DataSet.Close;
     //
     if (dsCadastro.DataSet.Active) and not (dsCadastro.DataSet.IsEmpty) then
      begin
          habilitaCampos(True);
          dsCadastro.DataSet.Append;
      End;
end;

procedure TFrmCadastro.BtEditarClick(Sender: TObject);
begin
    If not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) Then
     begin
         strOper := 'A';
         habilitaCampos(True);  
         dsCadastro.DataSet.Edit;
     End;
end;

procedure TFrmCadastro.BtExcluirClick(Sender: TObject);
begin
      If not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) Then
        begin
             If Application.MessageBox(uFuncoes.MSG_PERGUTA, 'Excluir',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
               Begin
                    dmGerenciador.Start;
                    Try
                        dsCadastro.DataSet.Delete;
                        TClientDataSet(dsCadastro.DataSet).ApplyUpdates(0);
                        dmGerenciador.Comit(dmGerenciador.Transc);
                        Application.MessageBox(PChar('Registro excluído com sucesso.'),
                             'ATENÇÃO', MB_OK+MB_ICONINFORMATION +MB_APPLMODAL);
                        strOper := 'C';
                    Except
                        on e: exception do
                           dmGerenciador.Rollback(e.Message);
                    End;
               End;
        End
        Else
             Application.MessageBox(PChar('Não há registro para ser excluído!!!'),
                'Concluído', MB_OK+MB_ICONSTOP +MB_APPLMODAL);
end;

procedure TFrmCadastro.BtCancelarClick(Sender: TObject);
begin
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
         dsCadastro.DataSet.Cancel;
     strOper := 'C';
     habilitaCampos(False);
end;

procedure TFrmCadastro.BtGravarClick(Sender: TObject);
begin
     dmGerenciador.Start;
     Try
          dsCadastro.DataSet.Post;
          TClientDataSet(dsCadastro.DataSet).ApplyUpdates(0);
          
          dmGerenciador.Comit(dmGerenciador.Transc);
          Application.MessageBox(PChar(uFuncoes.MSG_OK),
                'Concluído', MB_OK+MB_ICONINFORMATION +MB_APPLMODAL);
          strOper := 'C';
          habilitaCampos(False);
     Except
          on e: exception do
              dmGerenciador.Rollback(e.Message);
     End;
end;

procedure TFrmCadastro.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if (dsCadastro.DataSet.Active) Then
         dsCadastro.DataSet.Close;
end;

procedure TFrmCadastro.btnAlterarClick(Sender: TObject);
begin
    //
    habilitaCampos(false);
end;

procedure TFrmCadastro.tsPesquisaShow(Sender: TObject);
begin
      dsConsultar.DataSet.Close;
      edtConsultar.Clear;
      edtConsultar.SetFocus;
end;

procedure TFrmCadastro.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
     btnAlterar.Enabled := (dsConsultar.DataSet.Active) and not (dsConsultar.DataSet.IsEmpty);
end;

procedure TFrmCadastro.edtConsultarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
