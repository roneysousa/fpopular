inherited FrmCadUsuarios: TFrmCadUsuarios
  Caption = 'Tabela de Usu'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tsDados: TTabSheet
      object Label1: TLabel [1]
        Left = 21
        Top = 64
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNome
        Transparent = True
      end
      object Label2: TLabel [2]
        Left = 21
        Top = 102
        Width = 28
        Height = 13
        Caption = 'Cargo'
        FocusControl = dbeCargo
        Transparent = True
      end
      object lbl_senha: TLabel [3]
        Left = 21
        Top = 139
        Width = 31
        Height = 13
        Caption = 'Senha'
        Transparent = True
      end
      object lbl_confirma: TLabel [4]
        Left = 21
        Top = 175
        Width = 41
        Height = 13
        Caption = 'Confirma'
        Transparent = True
      end
      inherited DBText1: TDBText
        DataField = 'id'
      end
      inherited Panel2: TPanel
        inherited BtExcluir: TBitBtn
          Visible = False
        end
        inherited BtCancelar: TBitBtn
          Left = 445
        end
        inherited BtGravar: TBitBtn
          Left = 525
        end
        inherited BtSair: TBitBtn
          Left = 621
        end
        object btnAlterarSenha: TBitBtn
          Left = 347
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Alterar Senha'
          TabOrder = 7
          OnClick = btnAlterarSenhaClick
        end
      end
      object dbeNome: TDBEdit
        Left = 21
        Top = 80
        Width = 500
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'sen_nome'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 1
        OnExit = dbeNomeExit
      end
      object dbeCargo: TDBEdit
        Left = 21
        Top = 118
        Width = 500
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'sen_cargo'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 2
        OnExit = dbeCargoExit
      end
      object dbeSNATUA: TEdit
        Left = 21
        Top = 153
        Width = 121
        Height = 19
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        PasswordChar = '*'
        TabOrder = 3
      end
      object edt_Confirma: TEdit
        Left = 21
        Top = 189
        Width = 121
        Height = 19
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        PasswordChar = '*'
        TabOrder = 4
        OnExit = edt_ConfirmaExit
      end
    end
    inherited tsPesquisa: TTabSheet
      inherited grdConsultar: TJvDBUltimGrid
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sen_nome'
            Width = 544
            Visible = True
          end>
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmGerenciador.cdsUsuario
    Left = 452
    Top = 193
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'Select id, sen_nome from usuarios order by sen_nome'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConexao
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      DisplayFormat = '000'
    end
    object cdsConsultarsen_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'sen_nome'
      Size = 40
    end
  end
end
