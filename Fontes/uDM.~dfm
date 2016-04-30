object dmGerenciador: TdmGerenciador
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 320
  Top = 197
  Height = 406
  Width = 577
  object sqlConexao: TSQLConnection
    ConnectionName = 'Fpopular'
    DriverName = 'DevartPostgreSQL'
    GetDriverFunc = 'getSQLDriverPostgreSQL'
    LibraryName = 'dbexppgsql.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DevartPostgreSQL'
      'BlobSize=-1'
      'HostName=Localhost'
      'SchemaName='
      'DataBase=fpopular'
      'User_Name=postgres'
      'Password=admg2'
      'UseQuoteChar=False'
      'EnableBCD=True')
    VendorLib = 'dbexppgsql.dll'
    BeforeConnect = sqlConexaoBeforeConnect
    Left = 56
    Top = 24
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 184
    Top = 24
  end
  object dstConfig: TSQLDataSet
    CommandText = 'select * from config where (id = 1)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 48
    Top = 80
    object dstConfigid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstConfigcfg_cnpj_empresa: TStringField
      FieldName = 'cfg_cnpj_empresa'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstConfigcfg_venda: TIntegerField
      FieldName = 'cfg_venda'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_usuario: TIntegerField
      FieldName = 'cfg_usuario'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_vendedor: TIntegerField
      FieldName = 'cfg_vendedor'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_flproducao: TStringField
      FieldName = 'cfg_flproducao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstConfigid_prevenda: TIntegerField
      FieldName = 'id_prevenda'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_razaosocial: TStringField
      FieldName = 'cfg_razaosocial'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstConfigcfg_fantasia: TStringField
      FieldName = 'cfg_fantasia'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstConfigcfg_logradouro: TStringField
      FieldName = 'cfg_logradouro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstConfigcfg_logradouro_numero: TIntegerField
      FieldName = 'cfg_logradouro_numero'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_bairro: TStringField
      FieldName = 'cfg_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstConfigcfg_cep: TStringField
      FieldName = 'cfg_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstConfigcfg_cidade: TStringField
      FieldName = 'cfg_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstConfigcfg_ufempresa: TStringField
      FieldName = 'cfg_ufempresa'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstConfigcfg_fone_empresa: TStringField
      FieldName = 'cfg_fone_empresa'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dstConfigcfg_mensagem_cupom1: TStringField
      FieldName = 'cfg_mensagem_cupom1'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstConfigcfg_mensagem_cupom2: TStringField
      FieldName = 'cfg_mensagem_cupom2'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstConfigcfg_data_atual: TDateField
      FieldName = 'cfg_data_atual'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_login_fpopular: TStringField
      FieldName = 'cfg_login_fpopular'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_senha_fpopular: TStringField
      FieldName = 'cfg_senha_fpopular'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstConfigcfg_chave: TStringField
      FieldName = 'cfg_chave'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object dstConfigcfg_simulacao: TBooleanField
      FieldName = 'cfg_simulacao'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigcfg_vinculo_sistema: TBooleanField
      FieldName = 'cfg_vinculo_sistema'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstUsuario: TSQLDataSet
    CommandText = 'select * from usuarios where (id = :pid)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pid'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 48
    Top = 136
    object dstUsuarioid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstUsuariosen_nome: TStringField
      FieldName = 'sen_nome'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstUsuariosenha: TStringField
      FieldName = 'senha'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object dstUsuariosen_cargo: TStringField
      FieldName = 'sen_cargo'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstUsuariosen_dtatual: TDateField
      FieldName = 'sen_dtatual'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspConfig: TDataSetProvider
    DataSet = dstConfig
    Options = [poAllowCommandText]
    Left = 136
    Top = 80
  end
  object dspUsuario: TDataSetProvider
    DataSet = dstUsuario
    Options = [poAllowCommandText]
    Left = 136
    Top = 136
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig'
    Left = 216
    Top = 80
    object cdsConfigid: TIntegerField
      FieldName = 'id'
    end
    object cdsConfigcfg_cnpj_empresa: TStringField
      FieldName = 'cfg_cnpj_empresa'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsConfigcfg_venda: TIntegerField
      FieldName = 'cfg_venda'
    end
    object cdsConfigcfg_usuario: TIntegerField
      FieldName = 'cfg_usuario'
    end
    object cdsConfigcfg_vendedor: TIntegerField
      FieldName = 'cfg_vendedor'
    end
    object cdsConfigcfg_flproducao: TStringField
      FieldName = 'cfg_flproducao'
      FixedChar = True
      Size = 1
    end
    object cdsConfigcfg_simulacao: TBooleanField
      FieldName = 'cfg_simulacao'
    end
    object cdsConfigcfg_vinculo_sistema: TBooleanField
      FieldName = 'cfg_vinculo_sistema'
    end
    object cdsConfigid_prevenda: TIntegerField
      FieldName = 'id_prevenda'
    end
    object cdsConfigcfg_razaosocial: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'cfg_razaosocial'
      Size = 60
    end
    object cdsConfigcfg_fantasia: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'cfg_fantasia'
      Size = 50
    end
    object cdsConfigcfg_logradouro: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'cfg_logradouro'
      Size = 60
    end
    object cdsConfigcfg_logradouro_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'cfg_logradouro_numero'
    end
    object cdsConfigcfg_bairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'cfg_bairro'
      Size = 40
    end
    object cdsConfigcfg_cep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cfg_cep'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsConfigcfg_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cfg_cidade'
      Size = 30
    end
    object cdsConfigcfg_ufempresa: TStringField
      DisplayLabel = 'UF'
      FieldName = 'cfg_ufempresa'
      FixedChar = True
      Size = 2
    end
    object cdsConfigcfg_fone_empresa: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Telefone'
      FieldName = 'cfg_fone_empresa'
      EditMask = '(99) 9999-9999;0;_'
      Size = 11
    end
    object cdsConfigcfg_mensagem_cupom1: TStringField
      FieldName = 'cfg_mensagem_cupom1'
      Size = 40
    end
    object cdsConfigcfg_mensagem_cupom2: TStringField
      FieldName = 'cfg_mensagem_cupom2'
      Size = 40
    end
    object cdsConfigcfg_data_atual: TDateField
      FieldName = 'cfg_data_atual'
    end
    object cdsConfigcfg_login_fpopular: TStringField
      FieldName = 'cfg_login_fpopular'
    end
    object cdsConfigcfg_senha_fpopular: TStringField
      FieldName = 'cfg_senha_fpopular'
      Size = 10
    end
    object cdsConfigcfg_chave: TStringField
      FieldName = 'cfg_chave'
      Size = 32
    end
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pid'
        ParamType = ptInput
      end>
    ProviderName = 'dspUsuario'
    Left = 200
    Top = 136
    object cdsUsuarioid: TIntegerField
      FieldName = 'id'
      DisplayFormat = '000'
    end
    object cdsUsuariosen_nome: TStringField
      FieldName = 'sen_nome'
      Size = 40
    end
    object cdsUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 32
    end
    object cdsUsuariosen_cargo: TStringField
      FieldName = 'sen_cargo'
      Size = 30
    end
    object cdsUsuariosen_dtatual: TDateField
      FieldName = 'sen_dtatual'
    end
  end
  object dstVendedor: TSQLDataSet
    CommandText = 'select * from vendedores where (ven_codigo = :pcodigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pcodigo'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 48
    Top = 200
    object dstVendedorven_codigo: TIntegerField
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstVendedorven_nome: TStringField
      FieldName = 'ven_nome'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstVendedorven_login_fpopular: TStringField
      FieldName = 'ven_login_fpopular'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dstVendedorven_senha_fpopular: TStringField
      FieldName = 'ven_senha_fpopular'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dspVendedor: TDataSetProvider
    DataSet = dstVendedor
    Options = [poAllowCommandText]
    Left = 128
    Top = 200
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pcodigo'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendedor'
    Left = 208
    Top = 200
    object cdsVendedorven_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ven_codigo'
      DisplayFormat = '000'
    end
    object cdsVendedorven_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'ven_nome'
      Size = 30
    end
    object cdsVendedorven_login_fpopular: TStringField
      DisplayLabel = 'Login Farm'#225'cia Popular'
      FieldName = 'ven_login_fpopular'
      Size = 15
    end
    object cdsVendedorven_senha_fpopular: TStringField
      DisplayLabel = 'Senha Farm'#225'cia Popular'
      FieldName = 'ven_senha_fpopular'
      Size = 10
    end
  end
  object dstProduto: TSQLDataSet
    CommandText = 'select * from produtos where (pro_barras = :ppro_barras)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ppro_barras'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 48
    Top = 256
    object dstProdutopro_barras: TStringField
      FieldName = 'pro_barras'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 13
    end
    object dstProdutopro_medicamento: TStringField
      FieldName = 'pro_medicamento'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstProdutopro_quantidade_apresentacao: TFMTBCDField
      FieldName = 'pro_quantidade_apresentacao'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
    object dstProdutopro_valorvenda: TFMTBCDField
      FieldName = 'pro_valorvenda'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = dstProduto
    Options = [poAllowCommandText]
    Left = 120
    Top = 256
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'ppro_barras'
        ParamType = ptInput
      end>
    ProviderName = 'dspProduto'
    Left = 192
    Top = 256
    object cdsProdutopro_barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'pro_barras'
      Size = 13
    end
    object cdsProdutopro_medicamento: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pro_medicamento'
      Size = 60
    end
    object cdsProdutopro_quantidade_apresentacao: TFMTBCDField
      DisplayLabel = 'Quantidade de Apresenta'#231#227'o'
      FieldName = 'pro_quantidade_apresentacao'
      Precision = 15
      Size = 8
    end
    object cdsProdutopro_valorvenda: TFMTBCDField
      DisplayLabel = 'Valor de Venda'
      FieldName = 'pro_valorvenda'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 8
    end
  end
  object dstPrevendas: TSQLDataSet
    CommandText = 'select * from prevenda where (id_prevenda = :pprevenda)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pprevenda'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 288
    Top = 80
    object dstPrevendasid_prevenda: TIntegerField
      FieldName = 'id_prevenda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstPrevendascpf_paciente: TStringField
      FieldName = 'cpf_paciente'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dstPrevendascrm_medico: TStringField
      FieldName = 'crm_medico'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object dstPrevendasdata_receita: TDateField
      FieldName = 'data_receita'
      ProviderFlags = [pfInUpdate]
    end
    object dstPrevendasdata: TDateField
      FieldName = 'data'
      ProviderFlags = [pfInUpdate]
    end
    object dstPrevendashora: TStringField
      FieldName = 'hora'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object dstPrevendasid_vendedor: TIntegerField
      FieldName = 'id_vendedor'
      ProviderFlags = [pfInUpdate]
    end
    object dstPrevendassituacao: TStringField
      FieldName = 'situacao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPrevendasnumero_autorizacao: TStringField
      FieldName = 'numero_autorizacao'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstPrevendasid_usuario: TIntegerField
      FieldName = 'id_usuario'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstPrevendaItem: TSQLDataSet
    CommandText = 
      'select * from prevenda_itens where (id_prevenda = :pprevenda) or' +
      'der by id_item'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pprevenda'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 288
    Top = 136
    object dstPrevendaItemid_prevenda: TIntegerField
      FieldName = 'id_prevenda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstPrevendaItemid_item: TIntegerField
      FieldName = 'id_item'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstPrevendaItemproduto_codigo_barras: TStringField
      FieldName = 'produto_codigo_barras'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 13
    end
    object dstPrevendaItemquant_solicitada: TFMTBCDField
      FieldName = 'quant_solicitada'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
    object dstPrevendaItemquant_preescrita: TFMTBCDField
      FieldName = 'quant_preescrita'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
    object dstPrevendaItemquant_autorizada: TFMTBCDField
      FieldName = 'quant_autorizada'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
    object dstPrevendaItemvalor_venda: TFMTBCDField
      FieldName = 'valor_venda'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
    object dstPrevendaItemvalor_parcela_ms: TFMTBCDField
      FieldName = 'valor_parcela_ms'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
    object dstPrevendaItemvalor_parcela_cliente: TFMTBCDField
      FieldName = 'valor_parcela_cliente'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 8
    end
    object dstPrevendaItemstatus: TStringField
      FieldName = 'status'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object dstPrevendaItemmotivo: TStringField
      FieldName = 'motivo'
      ProviderFlags = [pfInUpdate]
      Size = 240
    end
  end
  object dspPrevendas: TDataSetProvider
    DataSet = dstPrevendas
    Options = [poAllowCommandText]
    Left = 376
    Top = 80
  end
  object dspPrevendaItens: TDataSetProvider
    DataSet = dstPrevendaItem
    Options = [poAllowCommandText]
    Left = 384
    Top = 136
  end
  object cdsPrevenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pprevenda'
        ParamType = ptInput
      end>
    ProviderName = 'dspPrevendas'
    OnCalcFields = cdsPrevendaCalcFields
    Left = 472
    Top = 80
    object cdsPrevendaid_prevenda: TIntegerField
      FieldName = 'id_prevenda'
      DisplayFormat = '0000000'
    end
    object cdsPrevendacpf_paciente: TStringField
      Alignment = taRightJustify
      FieldName = 'cpf_paciente'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsPrevendacrm_medico: TStringField
      FieldName = 'crm_medico'
      Size = 12
    end
    object cdsPrevendadata_receita: TDateField
      DisplayLabel = 'Data Receita'
      FieldName = 'data_receita'
    end
    object cdsPrevendadata: TDateField
      FieldName = 'data'
    end
    object cdsPrevendahora: TStringField
      FieldName = 'hora'
      Size = 6
    end
    object cdsPrevendaid_vendedor: TIntegerField
      FieldName = 'id_vendedor'
    end
    object cdsPrevendasituacao: TStringField
      FieldName = 'situacao'
      FixedChar = True
      Size = 1
    end
    object cdsPrevendanumero_autorizacao: TStringField
      FieldName = 'numero_autorizacao'
      Size = 30
    end
    object cdsPrevendaid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object cdsPrevendanome_vendedor: TStringField
      FieldKind = fkLookup
      FieldName = 'nome_vendedor'
      LookupDataSet = cdsListaVendedores
      LookupKeyFields = 'ven_codigo'
      LookupResultField = 'ven_nome'
      KeyFields = 'id_vendedor'
      Size = 30
      Lookup = True
    end
    object cdsPrevendaNome_Situacao: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Nome_Situacao'
      Size = 15
    end
  end
  object cdsPrevendaItens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pprevenda'
        ParamType = ptInput
      end>
    ProviderName = 'dspPrevendaItens'
    Left = 480
    Top = 144
    object cdsPrevendaItensid_prevenda: TIntegerField
      FieldName = 'id_prevenda'
    end
    object cdsPrevendaItensid_item: TIntegerField
      FieldName = 'id_item'
    end
    object cdsPrevendaItensproduto_codigo_barras: TStringField
      FieldName = 'produto_codigo_barras'
      Size = 13
    end
    object cdsPrevendaItensquant_solicitada: TFMTBCDField
      FieldName = 'quant_solicitada'
      Precision = 15
      Size = 8
    end
    object cdsPrevendaItensquant_preescrita: TFMTBCDField
      FieldName = 'quant_preescrita'
      Precision = 15
      Size = 8
    end
    object cdsPrevendaItensquant_autorizada: TFMTBCDField
      FieldName = 'quant_autorizada'
      Precision = 15
      Size = 8
    end
    object cdsPrevendaItensvalor_venda: TFMTBCDField
      FieldName = 'valor_venda'
      Precision = 15
      Size = 8
    end
    object cdsPrevendaItensvalor_parcela_ms: TFMTBCDField
      FieldName = 'valor_parcela_ms'
      Precision = 15
      Size = 8
    end
    object cdsPrevendaItensvalor_parcela_cliente: TFMTBCDField
      FieldName = 'valor_parcela_cliente'
      Precision = 15
      Size = 8
    end
    object cdsPrevendaItensstatus: TStringField
      FieldName = 'status'
      Size = 5
    end
    object cdsPrevendaItensmotivo: TStringField
      FieldName = 'motivo'
      Size = 240
    end
  end
  object dstPadrao: TSQLDataSet
    CommandText = 'select ven_codigo, ven_nome from vendedores order by ven_nome;'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 32
    Top = 312
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 104
    Top = 312
  end
  object cdsListaVendedores: TClientDataSet
    Aggregates = <>
    CommandText = 'select ven_codigo, ven_nome from vendedores order by ven_nome;'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 200
    object cdsListaVendedoresven_codigo: TIntegerField
      FieldName = 'ven_codigo'
      DisplayFormat = '000'
    end
    object cdsListaVendedoresven_nome: TStringField
      FieldName = 'ven_nome'
      Size = 30
    end
  end
  object cdsListaItens: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsListaItensCalcFields
    Left = 424
    Top = 24
    Data = {
      C20100009619E0BD01000000180000000F000000000003000000C20106434453
      5F494404000100000000000B4344535F50524F4455544F010049000000010005
      5749445448020002000E000D4344535F44455343524943414F01004900000001
      00055749445448020002003C000E4344535F5155414E54494441444508000400
      00000000164344535F5155414E545F4150524553454E544143414F0800040000
      000000104344535F515450524545534352495441080004000000000014434453
      5F5155414E545F4155544F52495A4144410800040000000000134344535F5155
      414E545F4553544F524E41444108000400000000000A4344535F535441545553
      01004900000001000557494454480200020005000A4344535F4D4F5449564F01
      0049000000010005574944544802000200F000124344535F56414C4F525F554E
      49544152494F08000400000000000C4344535F56414C4F525F4D530800040000
      000000114344535F56414C4F525F434C49454E544508000400000000000C4344
      535F534954554143414F01004900000001000557494454480200020001001143
      44535F4E524155544F52495A4143414F01004900000001000557494454480200
      02001E000000}
    object cdsListaItensCDS_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'CDS_ID'
    end
    object cdsListaItensCDS_PRODUTO: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'CDS_PRODUTO'
      Size = 14
    end
    object cdsListaItensCDS_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CDS_DESCRICAO'
      Size = 60
    end
    object cdsListaItensCDS_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'CDS_QUANTIDADE'
    end
    object cdsListaItensCDS_QUANT_APRESENTACAO: TFloatField
      DisplayLabel = 'Quant.Apresenta'#231#227'o'
      FieldName = 'CDS_QUANT_APRESENTACAO'
    end
    object cdsListaItensCDS_QTPREESCRITA: TFloatField
      DisplayLabel = 'Quant.Preescrita'
      FieldName = 'CDS_QTPREESCRITA'
    end
    object cdsListaItensCDS_QUANT_AUTORIZADA: TFloatField
      DisplayLabel = 'Quant. Autorizada'
      FieldName = 'CDS_QUANT_AUTORIZADA'
    end
    object cdsListaItensCDS_QUANT_ESTORNADA: TFloatField
      DisplayLabel = 'Quant. Estornada'
      FieldName = 'CDS_QUANT_ESTORNADA'
    end
    object cdsListaItensCDS_NRAUTORIZACAO: TStringField
      FieldName = 'CDS_NRAUTORIZACAO'
      Size = 30
    end
    object cdsListaItensCDS_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CDS_STATUS'
      Size = 5
    end
    object cdsListaItensCDS_MOTIVO: TStringField
      DisplayLabel = 'Motivo'
      FieldName = 'CDS_MOTIVO'
      Size = 240
    end
    object cdsListaItensCDS_VALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'CDS_VALOR_UNITARIO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaItensCDS_VALOR_MS: TFloatField
      DisplayLabel = 'Valor MS'
      FieldName = 'CDS_VALOR_MS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaItensCDS_VALOR_CLIENTE: TFloatField
      DisplayLabel = 'Valor Cliente'
      FieldName = 'CDS_VALOR_CLIENTE'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaItensCDS_SITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'CDS_SITUACAO'
      Size = 1
    end
    object cdsListaItensCDS_SUBTOTAL: TFloatField
      DisplayLabel = 'Subtotal'
      FieldKind = fkInternalCalc
      FieldName = 'CDS_SUBTOTAL'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaItensCDS_VALOR_DIREFERENCA: TFloatField
      DisplayLabel = 'Valor Difer'#234'n'#231'a'
      FieldKind = fkInternalCalc
      FieldName = 'CDS_VALOR_DIREFERENCA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaItensCDS_FLAUTORIZADO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CDS_FLAUTORIZADO'
    end
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 
      'https://200.214.130.55:9443/farmaciapopular/services/ServicoSoli' +
      'citacaoWS?wsdl'
    Service = 'ServicoSolicitacaoWSService'
    Port = 'ServicoSolicitacaoWS'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 296
    Top = 24
  end
end
