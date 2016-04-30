inherited FrmCadProdutos: TFrmCadProdutos
  Caption = 'Cadastro de Produtos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tsDados: TTabSheet
      inherited lblCodigo: TLabel
        Left = 212
        Visible = False
      end
      inherited DBText1: TDBText
        Left = 269
        Top = 8
        Visible = False
      end
      object Label1: TLabel [2]
        Left = 20
        Top = 16
        Width = 81
        Height = 13
        Caption = 'C'#243'digo de Barras'
        FocusControl = dbeBarras
        Transparent = True
      end
      object Label2: TLabel [3]
        Left = 20
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [4]
        Left = 20
        Top = 104
        Width = 139
        Height = 13
        Caption = 'Quantidade de Apresenta'#231#227'o'
        FocusControl = dbeQuantidade
        Transparent = True
      end
      object Label4: TLabel [5]
        Left = 20
        Top = 144
        Width = 73
        Height = 13
        Caption = 'Valor de Venda'
        FocusControl = dbeValor
        Transparent = True
      end
      object dbeBarras: TDBEdit
        Left = 20
        Top = 32
        Width = 150
        Height = 19
        Ctl3D = False
        DataField = 'pro_barras'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 1
        OnExit = dbeBarrasExit
        OnKeyPress = dbeBarrasKeyPress
      end
      object dbeDescricao: TDBEdit
        Left = 20
        Top = 80
        Width = 500
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'pro_medicamento'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 2
        OnExit = dbeDescricaoExit
      end
      object dbeQuantidade: TDBEdit
        Left = 20
        Top = 120
        Width = 150
        Height = 19
        Ctl3D = False
        DataField = 'pro_quantidade_apresentacao'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeValor: TDBEdit
        Left = 20
        Top = 160
        Width = 150
        Height = 19
        Ctl3D = False
        DataField = 'pro_valorvenda'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 4
      end
    end
    inherited tsPesquisa: TTabSheet
      inherited grdConsultar: TJvDBUltimGrid
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'pro_barras'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Barras'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_medicamento'
            Width = 384
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_valorvenda'
            Title.Alignment = taRightJustify
            Width = 110
            Visible = True
          end>
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmGerenciador.cdsProduto
    Left = 468
    Top = 193
  end
  inherited dsConsultar: TDataSource
    Left = 188
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select pro_barras, pro_medicamento, pro_valorvenda from produtos' +
      ' order by pro_valorvenda'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConexao
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarpro_barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'pro_barras'
      Size = 13
    end
    object cdsConsultarpro_medicamento: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pro_medicamento'
      Size = 60
    end
    object cdsConsultarpro_valorvenda: TFMTBCDField
      DisplayLabel = 'Valor de Venda'
      FieldName = 'pro_valorvenda'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 8
    end
  end
end
