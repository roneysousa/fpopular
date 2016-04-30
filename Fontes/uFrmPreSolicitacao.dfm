inherited FrmPreSolicitacao: TFrmPreSolicitacao
  Left = 224
  Top = 137
  Caption = 'Pr'#233'-Solicita'#231#227'o'
  ClientHeight = 596
  ClientWidth = 1086
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1086
    inherited Image1: TImage
      Width = 1084
    end
  end
  inherited PageControl1: TPageControl
    Width = 1086
    Height = 555
    inherited tsDados: TTabSheet
      inherited DBText1: TDBText
        Left = 29
        Top = 16
      end
      inherited Panel2: TPanel
        Top = 465
        Width = 1078
        Height = 62
        inherited BtCancelar: TBitBtn
          Left = 768
        end
        inherited BtGravar: TBitBtn
          Left = 848
        end
        inherited BtSair: TBitBtn
          Left = 968
        end
        object btnSolicitar: TBitBtn
          Left = 376
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Solicitar'
          TabOrder = 7
          OnClick = btnSolicitarClick
        end
        object StatusBar1: TStatusBar
          Left = 1
          Top = 42
          Width = 1076
          Height = 19
          Panels = <
            item
              Width = 400
            end
            item
              Width = 50
            end>
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1078
        Height = 153
        Align = alTop
        Color = clWhite
        TabOrder = 1
        object gbxReceitas: TGroupBox
          Left = 1
          Top = 1
          Width = 1076
          Height = 144
          Align = alTop
          Caption = '[ Dados da Receita ]'
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 16
            Width = 65
            Height = 13
            Caption = 'CPF P&aciente'
            FocusControl = edtNRCPF
            Transparent = True
          end
          object spLocCliente: TSpeedButton
            Left = 113
            Top = 31
            Width = 23
            Height = 22
            Hint = 'Localizar Cliente'
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777770077777777777770FF077777777777077FF07777
              7777770777FF077777777770777FFF00777777790777F1111077777790771117
              0B77777770799170B77777777709990B77777777770990B77777777777090B77
              777777777770B777777777777777777777777777777777777777}
            OnClick = spLocClienteClick
          end
          object Label8: TLabel
            Left = 150
            Top = 16
            Width = 88
            Height = 13
            Caption = 'N&ome do Paciente'
            FocusControl = edtNMCLIE
            Transparent = True
          end
          object Label2: TLabel
            Left = 16
            Top = 59
            Width = 77
            Height = 13
            Caption = 'CRM do &M'#233'dico'
            FocusControl = edtNRCRM
            Transparent = True
          end
          object Label11: TLabel
            Left = 150
            Top = 59
            Width = 66
            Height = 13
            Caption = '&UF do m'#233'dico'
            FocusControl = cmbUF
            Transparent = True
          end
          object Label3: TLabel
            Left = 16
            Top = 100
            Width = 78
            Height = 13
            Caption = '&Data da Receita'
            FocusControl = edtDTEMISSAO
            Transparent = True
          end
          object Label10: TLabel
            Left = 150
            Top = 100
            Width = 49
            Height = 13
            Caption = 'Vendedor:'
            Transparent = True
          end
          object lblPreSolicitacao: TLabel
            Left = 904
            Top = 16
            Width = 87
            Height = 13
            Caption = 'Pr'#233'-Solicita'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object DBText2: TDBText
            Left = 904
            Top = 30
            Width = 79
            Height = 22
            AutoSize = True
            Color = clBtnFace
            DataField = 'id_prevenda'
            DataSource = dsCadastro
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object DBText3: TDBText
            Left = 904
            Top = 72
            Width = 50
            Height = 13
            AutoSize = True
            DataField = 'Nome_Situacao'
            DataSource = dsCadastro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 904
            Top = 55
            Width = 51
            Height = 13
            Caption = 'Situa'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtNRCPF: TMaskEdit
            Left = 16
            Top = 32
            Width = 95
            Height = 19
            Hint = 'CPF do paciente.'
            CharCase = ecUpperCase
            Ctl3D = False
            EditMask = '999.999.999-99;0;_'
            MaxLength = 14
            ParentCtl3D = False
            TabOrder = 0
            OnChange = edtNRCPFChange
            OnExit = edtNRCPFExit
            OnKeyPress = edtNRCPFKeyPress
          end
          object edtNMCLIE: TEdit
            Left = 150
            Top = 32
            Width = 449
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            MaxLength = 79
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = edtNMCLIEKeyPress
          end
          object edtNRCRM: TEdit
            Left = 16
            Top = 75
            Width = 121
            Height = 19
            Hint = 'CRM do m'#233'dico que emitiu a prescri'#231#227'o.'
            Ctl3D = False
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 2
            OnExit = edtNRCRMExit
            OnKeyPress = edtNRCRMKeyPress
          end
          object cmbUF: TComboBox
            Left = 150
            Top = 75
            Width = 90
            Height = 22
            Hint = 'Unidade Federativa que emitiu o CRM do m'#233'dico prescritor.'
            BevelKind = bkFlat
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 16
            ParentCtl3D = False
            TabOrder = 3
            OnKeyPress = cmbUFKeyPress
            Items.Strings = (
              'AC'
              'AL'
              'AM'
              'AP'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MS'
              'MT'
              'PA'
              'PB'
              'PE'
              'PR'
              'PI'
              'RJ'
              'RN'
              'RO'
              'RR'
              'RS'
              'SC'
              'SE'
              'SP'
              'TO')
          end
          object edtDTEMISSAO: TDateEdit
            Left = 16
            Top = 116
            Width = 121
            Height = 19
            Hint = 'Data de emiss'#227'o da prescri'#231#227'o. N'#227'o pode ser superior a 180 dias.'
            Ctl3D = False
            NumGlyphs = 2
            ParentCtl3D = False
            TabOrder = 4
            OnExit = edtDTEMISSAOExit
            OnKeyPress = edtDTEMISSAOKeyPress
          end
          object cmbVendedores: TComboBox
            Left = 150
            Top = 116
            Width = 355
            Height = 22
            BevelKind = bkFlat
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 16
            ParentCtl3D = False
            TabOrder = 5
            OnKeyPress = cmbVendedoresKeyPress
          end
        end
      end
      object pnlProduto: TPanel
        Left = 0
        Top = 387
        Width = 1078
        Height = 78
        Align = alBottom
        Color = clWhite
        TabOrder = 2
        DesignSize = (
          1078
          78)
        object spLocProduto: TSpeedButton
          Left = 132
          Top = 17
          Width = 23
          Height = 22
          Hint = 'Localizar Cliente'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777770077777777777770FF077777777777077FF07777
            7777770777FF077777777770777FFF00777777790777F1111077777790771117
            0B77777770799170B77777777709990B77777777770990B77777777777090B77
            777777777770B777777777777777777777777777777777777777}
          OnClick = spLocProdutoClick
        end
        object Label4: TLabel
          Left = 8
          Top = 2
          Width = 37
          Height = 13
          Caption = '&Produto'
          FocusControl = edtCodigo
          Transparent = True
        end
        object Label5: TLabel
          Left = 164
          Top = 2
          Width = 55
          Height = 13
          Caption = '&Quantidade'
          FocusControl = edtQuantidade
          Transparent = True
        end
        object Label7: TLabel
          Left = 292
          Top = 2
          Width = 85
          Height = 13
          Caption = 'Quantidade Di'#225'ria'
          FocusControl = edtQuantPreescrita
          Transparent = True
        end
        object Label6: TLabel
          Left = 420
          Top = 2
          Width = 24
          Height = 13
          Caption = 'Valor'
          Transparent = True
        end
        object edtCodigo: TEdit
          Left = 8
          Top = 18
          Width = 121
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 0
          OnChange = edtCodigoChange
          OnExit = edtCodigoExit
          OnKeyPress = edtCodigoKeyPress
        end
        object edtQuantidade: TCurrencyEdit
          Left = 164
          Top = 18
          Width = 121
          Height = 21
          AutoSize = False
          Ctl3D = False
          DisplayFormat = ',0.00;'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = edtQuantidadeKeyPress
        end
        object edtQuantPreescrita: TCurrencyEdit
          Left = 292
          Top = 18
          Width = 121
          Height = 21
          AutoSize = False
          Ctl3D = False
          DisplayFormat = '0;'
          MaxLength = 7
          ParentCtl3D = False
          TabOrder = 2
          OnExit = edtQuantPreescritaExit
          OnKeyPress = edtQuantPreescritaKeyPress
        end
        object edtNMDESC: TEdit
          Left = 9
          Top = 43
          Width = 532
          Height = 19
          Hint = 'Descri'#231#227'o do produto'
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 13
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtValor: TCurrencyEdit
          Left = 420
          Top = 18
          Width = 121
          Height = 21
          Hint = 'Valor unit'#225'rio de venda da apresenta'#231#227'o.'
          TabStop = False
          AutoSize = False
          Color = clSilver
          Ctl3D = False
          DisplayFormat = ',0.00;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object lblTotal: TPanel
          Left = 728
          Top = 5
          Width = 347
          Height = 71
          Alignment = taRightJustify
          Anchors = [akTop, akRight, akBottom]
          BevelInner = bvRaised
          BevelWidth = 2
          BorderStyle = bsSingle
          Caption = '0,00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -48
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
      end
      object JvGridDados: TJvDBUltimGrid
        Left = 0
        Top = 153
        Width = 1078
        Height = 234
        Align = alClient
        DataSource = dsProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold]
        OnDblClick = grdConsultarDblClick
        AlternateRowColor = clMenu
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CDS_PRODUTO'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CDS_DESCRICAO'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CDS_QUANT_APRESENTACAO'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CDS_QUANTIDADE'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CDS_VALOR_UNITARIO'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CDS_SUBTOTAL'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CDS_STATUS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CDS_MOTIVO'
            Visible = False
          end>
      end
      object pnlMensagem: TPanel
        Left = 520
        Top = 200
        Width = 529
        Height = 41
        Caption = 'Enviando Confirma'#231#227'o de Venda...'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
    end
    inherited tsPesquisa: TTabSheet
      inherited grdConsultar: TJvDBUltimGrid
        Top = 105
        Width = 1044
        Height = 422
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id_prevenda'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_receita'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf_paciente'
            Title.Alignment = taCenter
            Title.Caption = 'CPF'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pac_nome'
            Title.Alignment = taCenter
            Width = 346
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'numero_autorizacao'
            Title.Alignment = taCenter
            Width = 147
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'crm_medico'
            Title.Alignment = taCenter
            Title.Caption = 'CRM'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'med_uf'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ven_nome'
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'situacao'
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Width = 1078
        Height = 105
        inherited lblConsultar: TLabel
          Left = 161
          Top = 20
        end
        object lblA: TLabel [1]
          Left = 856
          Top = 36
          Width = 6
          Height = 13
          Caption = #224
          Transparent = True
          Visible = False
        end
        inherited rgConsultar: TRadioGroup
          Width = 144
          Height = 80
          Items.Strings = (
            'C'#243'digo Pr'#233'-Solicita'#231#227'o'
            'CPF do Paciente'
            'Nome do Paciente'
            'Data Receita')
        end
        inherited edtConsultar: TEdit
          Left = 160
          Top = 36
        end
        inherited btnAlterar: TBitBtn
          Left = 627
          Top = 32
        end
        object dbeInicio: TDateEdit
          Left = 728
          Top = 35
          Width = 121
          Height = 19
          Hint = 'Data de emiss'#227'o da prescri'#231#227'o. N'#227'o pode ser superior a 180 dias.'
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 3
          Visible = False
          OnEnter = dbeInicioEnter
          OnExit = dbeInicioExit
          OnKeyPress = dbeInicioKeyPress
        end
        object dbeFinal: TDateEdit
          Left = 872
          Top = 35
          Width = 121
          Height = 19
          Hint = 'Data de emiss'#227'o da prescri'#231#227'o. N'#227'o pode ser superior a 180 dias.'
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 4
          Visible = False
          OnEnter = dbeFinalEnter
          OnExit = dbeFinalExit
          OnKeyPress = dbeFinalKeyPress
        end
      end
      inherited Panel4: TPanel
        Left = 1044
        Top = 105
        Height = 422
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmGerenciador.cdsPrevenda
    Left = 860
    Top = 145
  end
  inherited dsConsultar: TDataSource
    Left = 556
    Top = 146
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'Select pv.id_prevenda, pv.cpf_paciente, p.pac_nome, pv.crm_medic' +
      'o, m.med_uf, pv.id_vendedor, v.ven_nome, pv.situacao, pv.numero_' +
      'autorizacao, '#13#10'pv.id_usuario, pv.data_receita from prevenda pv'#13#10 +
      'inner join medicos m on pv.crm_medico = m.med_crm'#13#10'inner join pa' +
      'cientes p on pv.cpf_paciente = p.pac_cpf'#13#10'inner join vendedores ' +
      'v on pv.id_vendedor = v.ven_codigo'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConexao
    Left = 636
    Top = 146
  end
  inherited dspConsultar: TDataSetProvider
    Left = 716
    Top = 146
  end
  inherited cdsConsultar: TClientDataSet
    Left = 788
    Top = 146
    object cdsConsultarid_prevenda: TIntegerField
      DisplayLabel = 'Pr'#233'-Solicita'#231#227'o'
      FieldName = 'id_prevenda'
      DisplayFormat = '0000000'
    end
    object cdsConsultarcpf_paciente: TStringField
      Alignment = taCenter
      DisplayLabel = 'CPF do Paciente'
      FieldName = 'cpf_paciente'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsConsultarpac_nome: TStringField
      DisplayLabel = 'Nome do Paciente'
      FieldName = 'pac_nome'
      Size = 60
    end
    object cdsConsultarcrm_medico: TStringField
      DisplayLabel = 'CRM do m'#233'dico'
      FieldName = 'crm_medico'
      Size = 12
    end
    object cdsConsultarmed_uf: TStringField
      DisplayLabel = 'UF do m'#233'dico'
      FieldName = 'med_uf'
      FixedChar = True
      Size = 2
    end
    object cdsConsultarid_vendedor: TIntegerField
      FieldName = 'id_vendedor'
    end
    object cdsConsultarven_nome: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'ven_nome'
      Size = 30
    end
    object cdsConsultarsituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao'
      FixedChar = True
      Size = 1
    end
    object cdsConsultarnumero_autorizacao: TStringField
      DisplayLabel = 'N'#186'. Autoriza'#231#227'o MS'
      FieldName = 'numero_autorizacao'
      Size = 30
    end
    object cdsConsultarid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object cdsConsultardata_receita: TDateField
      DisplayLabel = 'Data da Receita'
      FieldName = 'data_receita'
    end
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dmGerenciador.cdsListaItens
    OnDataChange = dsProdutosDataChange
    Left = 364
    Top = 305
  end
end
