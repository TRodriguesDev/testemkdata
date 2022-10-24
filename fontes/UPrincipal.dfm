object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'PROJETO TESTE MKDATA - ORIENTADO A EVENTOS'
  ClientHeight = 525
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pctrlModulos: TPageControl
    Left = 0
    Top = 41
    Width = 632
    Height = 443
    ActivePage = TabClientes
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabClientes: TTabSheet
      Caption = 'Clientes'
      object pCtrlCad: TPageControl
        Left = 0
        Top = 0
        Width = 604
        Height = 435
        ActivePage = TabPesqCli
        Align = alClient
        TabOrder = 0
        object TabPesqCli: TTabSheet
          Caption = 'Pesquisar'
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 596
            Height = 50
            Align = alTop
            BevelKind = bkFlat
            BevelOuter = bvNone
            TabOrder = 0
            object Label27: TLabel
              Left = 8
              Top = 4
              Width = 48
              Height = 13
              Caption = 'CPF/CNPJ'
            end
            object Label28: TLabel
              Left = 136
              Top = 4
              Width = 27
              Height = 13
              Caption = 'Nome'
            end
            object SpeedButton1: TSpeedButton
              Left = 561
              Top = 8
              Width = 29
              Height = 34
              Flat = True
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333300003333333333333333333300003333373333333333333300003333
                07733333333333330000333000773333333333330000330F0007733333333333
                00003330F000777777733333000033330F000000007733330000333330F00788
                87077333000033333300788FF870773300003333330788888F87073300003333
                3308888888F80733000033333307888888F807330000333333078FF888880733
                0000333333777FF8888773330000333333307788887033330000333333330777
                7703333300003333333337000733333300003333333333333333333300003333
                33333333333333330000}
              OnClick = SpeedButton1Click
            end
            object edtPesqDocto: TEdit
              Left = 8
              Top = 21
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              NumbersOnly = True
              TabOrder = 0
            end
            object edtPesqNome: TEdit
              Left = 135
              Top = 21
              Width = 266
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object RgPesq: TRadioGroup
              Left = 407
              Top = 6
              Width = 151
              Height = 36
              Caption = ' Ativos? '
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                'Sim'
                'N'#227'o'
                'Todos')
              TabOrder = 2
            end
          end
          object stBarPesq: TStatusBar
            Left = 0
            Top = 388
            Width = 596
            Height = 19
            Panels = <
              item
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Width = 0
              end>
          end
          object DBGPesq: TDBGrid
            Left = 0
            Top = 50
            Width = 596
            Height = 338
            Align = alClient
            DataSource = DmlCad.DSClientes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = DBGPesqDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'IDCLIENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_CLI'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CPFCNPJ_CLI'
                Title.Caption = 'CPF/CNPJ'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_CLI'
                Title.Caption = 'Nome'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RGIE_CLI'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ATIVO_CLI'
                Title.Caption = 'Ativo?'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTCAD_CLI'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTUALT_CLI'
                Width = 120
                Visible = True
              end>
          end
        end
        object Cadastro: TTabSheet
          Caption = 'Cadastro'
          ImageIndex = 1
          object Label1: TLabel
            Left = 16
            Top = 40
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 267
            Top = 40
            Width = 43
            Height = 13
            Caption = 'DT. Cad.'
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 84
            Top = 40
            Width = 20
            Height = 13
            Caption = 'Tipo'
          end
          object Label4: TLabel
            Left = 16
            Top = 88
            Width = 48
            Height = 13
            Caption = 'CPF/CNPJ'
            FocusControl = edtCpfCnpf
          end
          object Label5: TLabel
            Left = 487
            Top = 88
            Width = 28
            Height = 13
            Caption = 'RG/IE'
            FocusControl = edtRgIE
          end
          object Label7: TLabel
            Left = 393
            Top = 40
            Width = 37
            Height = 13
            Caption = #218'lt. Alt.'
            FocusControl = edtNome
          end
          object Label8: TLabel
            Left = 142
            Top = 88
            Width = 97
            Height = 13
            Caption = 'Nome / Raz'#227'o Social'
            FocusControl = edtCpfCnpf
          end
          object pCtrlDets: TPageControl
            Left = 0
            Top = 146
            Width = 596
            Height = 261
            ActivePage = tabContatos
            Align = alBottom
            TabOrder = 0
            object tabContatos: TTabSheet
              Caption = 'Contatos'
              object Label6: TLabel
                Left = 12
                Top = 48
                Width = 22
                Height = 13
                Caption = 'Seq.'
                FocusControl = DBEdit3
              end
              object Label9: TLabel
                Left = 321
                Top = 48
                Width = 43
                Height = 13
                Caption = 'DT. Cad.'
                FocusControl = DBEdit6
              end
              object Label10: TLabel
                Left = 12
                Top = 92
                Width = 46
                Height = 13
                Caption = 'Descri'#231#227'o'
                FocusControl = DBEdit8
              end
              object Label11: TLabel
                Left = 412
                Top = 92
                Width = 21
                Height = 13
                Caption = 'DDD'
                FocusControl = DBEdit9
              end
              object Label12: TLabel
                Left = 461
                Top = 92
                Width = 37
                Height = 13
                Caption = 'N'#250'mero'
                FocusControl = DBEdit10
              end
              object Label13: TLabel
                Left = 12
                Top = 140
                Width = 28
                Height = 13
                Caption = 'E-mail'
                FocusControl = DBEdit11
              end
              object Label14: TLabel
                Left = 449
                Top = 48
                Width = 37
                Height = 13
                Caption = #218'lt. Alt.'
                FocusControl = DBEdit12
              end
              object DBEdit3: TDBEdit
                Left = 12
                Top = 64
                Width = 60
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SEQ_CTO'
                DataSource = DmlCad.DSContatos
                TabOrder = 0
              end
              object DBEdit6: TDBEdit
                Left = 321
                Top = 64
                Width = 120
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DTCAD_CTO'
                DataSource = DmlCad.DSContatos
                TabOrder = 1
              end
              object DBEdit8: TDBEdit
                Left = 12
                Top = 108
                Width = 394
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DESCR_CTO'
                DataSource = DmlCad.DSContatos
                TabOrder = 2
              end
              object DBEdit9: TDBEdit
                Left = 412
                Top = 108
                Width = 43
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DDD_CTO'
                DataSource = DmlCad.DSContatos
                TabOrder = 3
                OnKeyPress = edtCpfCnpfKeyPress
              end
              object DBEdit10: TDBEdit
                Left = 461
                Top = 108
                Width = 108
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NUM_CTO'
                DataSource = DmlCad.DSContatos
                TabOrder = 4
                OnKeyPress = edtCpfCnpfKeyPress
              end
              object DBEdit11: TDBEdit
                Left = 12
                Top = 156
                Width = 557
                Height = 21
                CharCase = ecUpperCase
                DataField = 'EMAIL_CTO'
                DataSource = DmlCad.DSContatos
                TabOrder = 5
              end
              object DBEdit12: TDBEdit
                Left = 449
                Top = 64
                Width = 120
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DTUALT_CTO'
                DataSource = DmlCad.DSContatos
                TabOrder = 6
              end
              object DBNavigator3: TDBNavigator
                Left = 12
                Top = 3
                Width = 225
                Height = 25
                DataSource = DmlCad.DSContatos
                VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
                TabOrder = 7
              end
              object DBNavigator4: TDBNavigator
                Left = 404
                Top = 3
                Width = 172
                Height = 25
                DataSource = DmlCad.DSContatos
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                TabOrder = 8
              end
            end
            object Endereços: TTabSheet
              Caption = 'Endere'#231'os'
              ImageIndex = 1
              object Label15: TLabel
                Left = 263
                Top = 44
                Width = 43
                Height = 13
                Caption = 'DT. Cad.'
                FocusControl = DBEdit13
              end
              object Label16: TLabel
                Left = 389
                Top = 44
                Width = 37
                Height = 13
                Caption = #218'lt. Alt.'
                FocusControl = DBEdit14
              end
              object Label17: TLabel
                Left = 12
                Top = 97
                Width = 46
                Height = 13
                Caption = 'Descri'#231#227'o'
                FocusControl = DBEdit16
              end
              object Label18: TLabel
                Left = 295
                Top = 97
                Width = 19
                Height = 13
                Caption = 'Pais'
                FocusControl = DBEdit17
              end
              object Label19: TLabel
                Left = 539
                Top = 188
                Width = 13
                Height = 13
                Caption = 'UF'
                FocusControl = edtUF
              end
              object Label20: TLabel
                Left = 461
                Top = 97
                Width = 19
                Height = 13
                Caption = 'CEP'
                FocusControl = edtCEP
              end
              object Label21: TLabel
                Left = 178
                Top = 140
                Width = 45
                Height = 13
                Caption = 'Endere'#231'o'
                FocusControl = edtEnd
              end
              object Label22: TLabel
                Left = 12
                Top = 140
                Width = 55
                Height = 13
                Caption = 'Logradouro'
                FocusControl = edtLogra
              end
              object Label23: TLabel
                Left = 434
                Top = 140
                Width = 65
                Height = 13
                Caption = 'Complemento'
                FocusControl = DBEdit22
              end
              object Label24: TLabel
                Left = 318
                Top = 188
                Width = 33
                Height = 13
                Caption = 'Cidade'
                FocusControl = edtCidade
              end
              object Label25: TLabel
                Left = 12
                Top = 188
                Width = 28
                Height = 13
                Caption = 'Bairro'
                FocusControl = edtBairro
              end
              object Label26: TLabel
                Left = 12
                Top = 44
                Width = 22
                Height = 13
                Caption = 'Seq.'
                FocusControl = DBEdit25
              end
              object DBEdit13: TDBEdit
                Left = 263
                Top = 60
                Width = 120
                Height = 21
                DataField = 'DTCAD_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 0
              end
              object DBEdit14: TDBEdit
                Left = 389
                Top = 60
                Width = 120
                Height = 21
                DataField = 'DTUALT_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 1
              end
              object DBCheckBox2: TDBCheckBox
                Left = 516
                Top = 62
                Width = 58
                Height = 17
                Caption = 'Principal'
                DataField = 'DEF_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 2
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBEdit16: TDBEdit
                Left = 12
                Top = 113
                Width = 280
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DESCR_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 3
              end
              object DBEdit17: TDBEdit
                Left = 295
                Top = 113
                Width = 160
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PAIS_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 4
              end
              object edtUF: TDBEdit
                Left = 539
                Top = 204
                Width = 30
                Height = 21
                CharCase = ecUpperCase
                DataField = 'UF_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 5
              end
              object edtCEP: TDBEdit
                Left = 461
                Top = 113
                Width = 108
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CEP_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 6
                OnExit = edtCEPExit
              end
              object edtEnd: TDBEdit
                Left = 178
                Top = 156
                Width = 250
                Height = 21
                CharCase = ecUpperCase
                DataField = 'END_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 7
              end
              object edtLogra: TDBEdit
                Left = 12
                Top = 156
                Width = 160
                Height = 21
                CharCase = ecUpperCase
                DataField = 'LOGRA_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 8
              end
              object DBEdit22: TDBEdit
                Left = 434
                Top = 156
                Width = 135
                Height = 21
                CharCase = ecUpperCase
                DataField = 'COMPL_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 9
              end
              object edtCidade: TDBEdit
                Left = 318
                Top = 204
                Width = 215
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CID_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 10
              end
              object edtBairro: TDBEdit
                Left = 12
                Top = 204
                Width = 300
                Height = 21
                CharCase = ecUpperCase
                DataField = 'BAI_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 11
              end
              object DBNavigator5: TDBNavigator
                Left = 12
                Top = 3
                Width = 225
                Height = 25
                DataSource = DmlCad.DSEnderecos
                VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
                TabOrder = 12
              end
              object DBNavigator6: TDBNavigator
                Left = 404
                Top = 3
                Width = 172
                Height = 25
                DataSource = DmlCad.DSEnderecos
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                TabOrder = 13
              end
              object DBEdit25: TDBEdit
                Left = 12
                Top = 60
                Width = 60
                Height = 21
                DataField = 'SEQ_END'
                DataSource = DmlCad.DSEnderecos
                TabOrder = 14
              end
            end
          end
          object DBEdit1: TDBEdit
            Left = 16
            Top = 56
            Width = 60
            Height = 21
            DataField = 'IDCLIENTE'
            DataSource = DmlCad.DSClientes
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 267
            Top = 56
            Width = 120
            Height = 21
            DataField = 'DTCAD_CLI'
            DataSource = DmlCad.DSClientes
            TabOrder = 3
          end
          object edtCpfCnpf: TDBEdit
            Left = 16
            Top = 104
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CPFCNPJ_CLI'
            DataSource = DmlCad.DSClientes
            TabOrder = 4
            OnExit = edtCpfCnpfExit
            OnKeyPress = edtCpfCnpfKeyPress
          end
          object edtRgIE: TDBEdit
            Left = 487
            Top = 104
            Width = 90
            Height = 21
            CharCase = ecUpperCase
            DataField = 'RGIE_CLI'
            DataSource = DmlCad.DSClientes
            TabOrder = 5
            OnExit = edtRgIEExit
          end
          object edtNome: TDBEdit
            Left = 142
            Top = 104
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME_CLI'
            DataSource = DmlCad.DSClientes
            TabOrder = 6
          end
          object DBCTipo: TDBComboBox
            Left = 84
            Top = 56
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO_CLI'
            DataSource = DmlCad.DSClientes
            Items.Strings = (
              'F - F'#205'SICA'
              'J - JUR'#205'DICA')
            TabOrder = 2
            OnExit = DBCTipoExit
          end
          object DBCheckBox1: TDBCheckBox
            Left = 528
            Top = 58
            Width = 49
            Height = 17
            Caption = 'Ativo'
            DataField = 'ATIVO_CLI'
            DataSource = DmlCad.DSClientes
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit15: TDBEdit
            Left = 393
            Top = 56
            Width = 120
            Height = 21
            DataField = 'DTUALT_CLI'
            DataSource = DmlCad.DSClientes
            TabOrder = 8
          end
          object DBNavigator1: TDBNavigator
            Left = 410
            Top = 1
            Width = 172
            Height = 25
            DataSource = DmlCad.DSClientes
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            TabOrder = 9
          end
          object DBNavigator2: TDBNavigator
            Left = 16
            Top = 1
            Width = 225
            Height = 25
            DataSource = DmlCad.DSClientes
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
            TabOrder = 10
          end
        end
      end
    end
    object TabProdutos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 1
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 41
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 484
    Width = 632
    Height = 41
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object RESTClient: TRESTClient
    BaseURL = 'http://viacep.com.br/ws/13470170/json'
    Params = <>
    Left = 168
    Top = 264
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    Left = 216
    Top = 264
  end
  object RESTResponse: TRESTResponse
    Left = 280
    Top = 264
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 416
    Top = 8
  end
end
