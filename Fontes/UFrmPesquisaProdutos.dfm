inherited FrmPesquisaProdutos: TFrmPesquisaProdutos
  Caption = 'Pesquisar Produtos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited plnGrid: TPanel
    inherited grdConsultar: TJvDBUltimGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'pro_barras'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pro_medicamento'
          Title.Alignment = taCenter
          Width = 421
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pro_valorvenda'
          Title.Alignment = taRightJustify
          Visible = True
        end>
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select pro_barras, pro_medicamento, pro_valorvenda from produtos'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConexao
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarpro_barras: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd.Barras'
      FieldName = 'pro_barras'
      Size = 13
    end
    object cdsConsultarpro_medicamento: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pro_medicamento'
      Size = 60
    end
    object cdsConsultarpro_valorvenda: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'pro_valorvenda'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 8
    end
  end
end
