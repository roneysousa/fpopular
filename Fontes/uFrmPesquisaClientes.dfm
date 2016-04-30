inherited FrmPesquisaClientes: TFrmPesquisaClientes
  Caption = 'Pesquisa de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited lblConsultar: TLabel
      Width = 91
      Caption = 'Nome do Paciente:'
    end
    inherited rgConsultar: TRadioGroup
      Items.Strings = (
        'CPF'
        'Nome/Descri'#231#227'o')
    end
  end
  inherited plnGrid: TPanel
    inherited grdConsultar: TJvDBUltimGrid
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'pac_cpf'
          Title.Alignment = taCenter
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pac_nome'
          Title.Alignment = taCenter
          Width = 501
          Visible = True
        end>
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select pac_cpf, pac_nome from pacientes order by pac_nome'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConexao
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarpac_cpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'pac_cpf'
      Size = 11
    end
    object cdsConsultarpac_nome: TStringField
      DisplayLabel = 'Nome do Paciente'
      FieldName = 'pac_nome'
      Size = 60
    end
  end
end
