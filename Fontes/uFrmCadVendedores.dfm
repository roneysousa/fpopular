inherited FrmCadVendedores: TFrmCadVendedores
  Caption = 'Cadastro de Vendedores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tsDados: TTabSheet
      inherited DBText1: TDBText
        Left = 20
        DataField = 'ven_codigo'
      end
      object Label1: TLabel [2]
        Left = 20
        Top = 64
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNome
        Transparent = True
      end
      object Label2: TLabel [3]
        Left = 20
        Top = 104
        Width = 111
        Height = 13
        Caption = 'Login Farm'#225'cia Popular'
        FocusControl = dbeLogin
        Transparent = True
      end
      object Label3: TLabel [4]
        Left = 20
        Top = 144
        Width = 116
        Height = 13
        Caption = 'Senha Farm'#225'cia Popular'
        FocusControl = dbeSenha
        Transparent = True
      end
      object dbeNome: TDBEdit
        Left = 20
        Top = 80
        Width = 394
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'ven_nome'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 1
        OnExit = dbeNomeExit
      end
      object dbeLogin: TDBEdit
        Left = 20
        Top = 120
        Width = 150
        Height = 19
        Ctl3D = False
        DataField = 'ven_login_fpopular'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbeSenha: TDBEdit
        Left = 20
        Top = 160
        Width = 150
        Height = 19
        Ctl3D = False
        DataField = 'ven_senha_fpopular'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 3
      end
    end
    inherited tsPesquisa: TTabSheet
      inherited grdConsultar: TJvDBUltimGrid
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ven_codigo'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ven_nome'
            Width = 569
            Visible = True
          end>
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmGerenciador.cdsVendedor
    Left = 444
    Top = 185
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ven_codigo, ven_nome from vendedores order by ven_nome'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConexao
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarven_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ven_codigo'
      DisplayFormat = '000'
    end
    object cdsConsultarven_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'ven_nome'
      Size = 30
    end
  end
end
