object DmlCad: TDmlCad
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 280
  Width = 377
  object FDCon: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=D:\MKDATA\banco\MKDATATESTE.fdb'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDQClientes: TFDQuery
    Connection = FDCon
    SQL.Strings = (
      'SELECT * FROM CAD_CLIENTES')
    Left = 40
    Top = 88
    object FDQClientesIDCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQClientesDTCAD_CLI: TSQLTimeStampField
      DisplayLabel = 'DT. Cad.'
      FieldName = 'DTCAD_CLI'
      Origin = 'DTCAD_CLI'
    end
    object FDQClientesTIPO_CLI: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_CLI'
      Origin = 'TIPO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDQClientesCPFCNPJ_CLI: TStringField
      DisplayLabel = 'CPF\CNPJ'
      FieldName = 'CPFCNPJ_CLI'
      Origin = 'CPFCNPJ_CLI'
      Required = True
    end
    object FDQClientesNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object FDQClientesRGIE_CLI: TStringField
      DisplayLabel = 'RG/IE'
      FieldName = 'RGIE_CLI'
      Origin = 'RGIE_CLI'
    end
    object FDQClientesATIVO_CLI: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO_CLI'
      Origin = 'ATIVO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDQClientesDTUALT_CLI: TSQLTimeStampField
      DisplayLabel = #218'lt. Alt.'
      FieldName = 'DTUALT_CLI'
      Origin = 'DTUALT_CLI'
    end
  end
  object FDTransaction: TFDTransaction
    Connection = FDCon
    Left = 104
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    DriverID = 'FB'
    Left = 192
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 296
    Top = 24
  end
  object FDQContatos: TFDQuery
    IndexFieldNames = 'ID_CLIENTE'
    MasterSource = DSClientes
    MasterFields = 'IDCLIENTE'
    DetailFields = 'ID_CLIENTE'
    Connection = FDCon
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM CAD_CONTATOS WHERE ID_CLIENTE = :IDCLIENTE')
    Left = 40
    Top = 144
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQContatosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQContatosSEQ_CTO: TIntegerField
      FieldName = 'SEQ_CTO'
      Origin = 'SEQ_CTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQContatosDTCAD_CTO: TSQLTimeStampField
      FieldName = 'DTCAD_CTO'
      Origin = 'DTCAD_CTO'
    end
    object FDQContatosDESCR_CTO: TStringField
      FieldName = 'DESCR_CTO'
      Origin = 'DESCR_CTO'
      Required = True
      Size = 30
    end
    object FDQContatosDDD_CTO: TStringField
      FieldName = 'DDD_CTO'
      Origin = 'DDD_CTO'
      Size = 3
    end
    object FDQContatosNUM_CTO: TStringField
      FieldName = 'NUM_CTO'
      Origin = 'NUM_CTO'
      Size = 15
    end
    object FDQContatosEMAIL_CTO: TStringField
      FieldName = 'EMAIL_CTO'
      Origin = 'EMAIL_CTO'
      Size = 255
    end
    object FDQContatosDTUALT_CTO: TSQLTimeStampField
      FieldName = 'DTUALT_CTO'
      Origin = 'DTUALT_CTO'
    end
  end
  object FDQEnderecos: TFDQuery
    IndexFieldNames = 'ID_CLIENTE'
    MasterSource = DSClientes
    MasterFields = 'IDCLIENTE'
    DetailFields = 'ID_CLIENTE'
    Connection = FDCon
    SQL.Strings = (
      'SELECT * FROM CAD_ENDERECOS'
      'WHERE ID_CLIENTE = :ID_CLIENTE')
    Left = 40
    Top = 208
    ParamData = <
      item
        Name = 'ID_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQEnderecosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQEnderecosSEQ_END: TIntegerField
      FieldName = 'SEQ_END'
      Origin = 'SEQ_END'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQEnderecosDTCAD_END: TSQLTimeStampField
      DisplayLabel = 'DT. Cad.'
      FieldName = 'DTCAD_END'
      Origin = 'DTCAD_END'
    end
    object FDQEnderecosDEF_END: TStringField
      DisplayLabel = 'Principal'
      FieldName = 'DEF_END'
      Origin = 'DEF_END'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDQEnderecosDESCR_END: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_END'
      Origin = 'DESCR_END'
      Required = True
      Size = 30
    end
    object FDQEnderecosPAIS_END: TStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS_END'
      Origin = 'PAIS_END'
      Required = True
      Size = 30
    end
    object FDQEnderecosUF_END: TStringField
      DisplayLabel = 'UF'
      FieldName = 'UF_END'
      Origin = 'UF_END'
      Required = True
      FixedChar = True
      Size = 2
    end
    object FDQEnderecosCEP_END: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_END'
      Origin = 'CEP_END'
      Required = True
      Size = 8
    end
    object FDQEnderecosEND_END: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_END'
      Origin = 'END_END'
      Required = True
      Size = 60
    end
    object FDQEnderecosCOMPL_END: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPL_END'
      Origin = 'COMPL_END'
      Required = True
      Size = 30
    end
    object FDQEnderecosCID_END: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_END'
      Origin = 'CID_END'
      Required = True
      Size = 60
    end
    object FDQEnderecosBAI_END: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAI_END'
      Origin = 'BAI_END'
      Size = 40
    end
    object FDQEnderecosLOGRA_END: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRA_END'
      Origin = 'LOGRA_END'
      Required = True
    end
    object FDQEnderecosDTUALT_END: TSQLTimeStampField
      DisplayLabel = #218'lt. Alt.'
      FieldName = 'DTUALT_END'
      Origin = 'DTUALT_END'
    end
  end
  object DSClientes: TDataSource
    DataSet = FDQClientes
    Left = 112
    Top = 88
  end
  object DSContatos: TDataSource
    DataSet = FDQContatos
    Left = 112
    Top = 144
  end
  object DSEnderecos: TDataSource
    DataSet = FDQEnderecos
    Left = 112
    Top = 208
  end
end
