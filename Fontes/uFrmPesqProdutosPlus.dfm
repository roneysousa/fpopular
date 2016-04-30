inherited FrmPesqProdutosPlus: TFrmPesqProdutosPlus
  Caption = 'Pesquisa de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited plnGrid: TPanel
    inherited grdConsultar: TJvDBUltimGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_barras'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_farmacia_popular'
          Title.Alignment = taRightJustify
          Visible = True
        end>
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'Select p.id, p.descricao, p.cod_barras, p.valor_farmacia_popular' +
      ', p.quant_armaz from produtos p where (p.medicamento = true)'#13#10
    MaxBlobSize = -1
    SQLConnection = dmPluspdv.sqlConnplus
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarid: TIntegerField
      FieldName = 'id'
    end
    object cdsConsultardescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 60
    end
    object cdsConsultarcod_barras: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'cod_barras'
      Size = 14
    end
    object cdsConsultarvalor_farmacia_popular: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor_farmacia_popular'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsConsultarquant_armaz: TFMTBCDField
      FieldName = 'quant_armaz'
      Precision = 11
      Size = 3
    end
  end
end
