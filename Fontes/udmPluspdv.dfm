object dmPluspdv: TdmPluspdv
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 386
  Top = 317
  Height = 173
  Width = 253
  object sqlConnplus: TSQLConnection
    ConnectionName = 'PLUSPDV'
    DriverName = 'DevartPostgreSQL'
    GetDriverFunc = 'getSQLDriverPostgreSQL'
    LibraryName = 'dbexppgsql.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DevartPostgreSQL'
      'BlobSize=-1'
      'HostName=localhost'
      'SchemaName='
      'DataBase=pluspdvnew'
      'User_Name=postgres'
      'Password=admg2'
      'UseQuoteChar=False'
      'EnableBCD=True')
    VendorLib = 'dbexppgsql.dll'
    BeforeConnect = sqlConnplusBeforeConnect
    Left = 56
    Top = 24
  end
end
