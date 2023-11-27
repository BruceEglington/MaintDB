object dmR: TdmR
  Height = 561
  Width = 676
  object sqlcMaintDB: TSQLConnection
    ConnectionName = 'bromo2_MaintDB'
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\maintdb2011v25.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver260.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver260.bpl'
      'DriverUnit=DbxDevartInterBase')
    Left = 32
    Top = 14
  end
  object Query1: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select EquipDetails.Equipment, Issues.IssueId, Issues.ProblemSho' +
        'rt,'
      '  Issues.DateEntered, Issues.DateRepaired, Issues.Complete'
      
        'from ISSUES, EQUIPDETAILS, CATEGORIES, MANUFACTURERS, COMPANIES,' +
        ' ROOMS, TECHNICIANS'
      'where Issues.EquipmentId=EquipDetails.ID'
      'and Issues.CategoryID=Categories.ID'
      'and EquipDetails.ManufacturerID=Manufacturers.ManufacturerID'
      'and Issues.TechnicianID=Technicians.TechnicianID'
      'and EquipDetails.RoomID=Rooms.ID'
      'and Rooms.CompanyID=Companies.SetupID')
    SQLConnection = sqlcMaintDB
    Left = 124
    Top = 14
    object Query1ISSUEID: TIntegerField
      FieldName = 'ISSUEID'
      Required = True
    end
    object Query1PROBLEMSHORT: TStringField
      FieldName = 'PROBLEMSHORT'
      Size = 100
    end
    object Query1DATEENTERED: TSQLTimeStampField
      FieldName = 'DATEENTERED'
    end
    object Query1COMPLETE: TStringField
      FieldName = 'COMPLETE'
      FixedChar = True
      Size = 1
    end
    object Query1EQUIPMENT: TStringField
      FieldName = 'EQUIPMENT'
      Required = True
      Size = 255
    end
    object Query1DATEREPAIRED: TSQLTimeStampField
      FieldName = 'DATEREPAIRED'
    end
  end
  object dspQuery1: TDataSetProvider
    DataSet = Query1
    Left = 154
    Top = 14
  end
  object cdsQuery1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1'
    Left = 182
    Top = 14
    object cdsQuery1ISSUEID: TIntegerField
      DisplayLabel = 'Issue ID'
      FieldName = 'ISSUEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuery1PROBLEMSHORT: TStringField
      DisplayLabel = 'Problem (abbreviated description)'
      FieldName = 'PROBLEMSHORT'
      Size = 100
    end
    object cdsQuery1DATEREPAIRED: TSQLTimeStampField
      DisplayLabel = 'Date repaired'
      FieldName = 'DATEREPAIRED'
      DisplayFormat = 'ddddd'
    end
    object cdsQuery1DATEENTERED: TSQLTimeStampField
      DisplayLabel = 'Date entered'
      FieldName = 'DATEENTERED'
      DisplayFormat = 'ddddd'
    end
    object cdsQuery1COMPLETE: TStringField
      DisplayLabel = 'Complete (Y/N)'
      FieldName = 'COMPLETE'
      FixedChar = True
      Size = 1
    end
    object cdsQuery1EQUIPMENT: TStringField
      DisplayLabel = 'Equipment'
      FieldName = 'EQUIPMENT'
      Required = True
      Size = 255
    end
  end
  object dsQuery1: TDataSource
    DataSet = cdsQuery1
    Left = 210
    Top = 14
  end
  object qCategories: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Categories'
      'order by Category')
    SQLConnection = sqlcMaintDB
    Left = 26
    Top = 94
    object qCategoriesID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object qCategoriesCATEGORY: TStringField
      FieldName = 'CATEGORY'
      Required = True
      Size = 50
    end
  end
  object qCompanies: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Companies'
      'order by CompanyName')
    SQLConnection = sqlcMaintDB
    Left = 24
    Top = 158
    object qCompaniesSETUPID: TIntegerField
      FieldName = 'SETUPID'
      Required = True
    end
    object qCompaniesCOMPANYNAME: TStringField
      FieldName = 'COMPANYNAME'
      Required = True
      Size = 50
    end
  end
  object qEquipment: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from EquipDetails'
      'order by Equipment')
    SQLConnection = sqlcMaintDB
    Left = 22
    Top = 216
    object qEquipmentID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object qEquipmentEQUIPMENT: TStringField
      FieldName = 'EQUIPMENT'
      Required = True
      Size = 255
    end
    object qEquipmentROOMID: TSmallintField
      FieldName = 'ROOMID'
      Required = True
    end
    object qEquipmentMANUFACTURERID: TSmallintField
      FieldName = 'MANUFACTURERID'
      Required = True
    end
    object qEquipmentCELL: TStringField
      FieldName = 'CELL'
      Size = 50
    end
    object qEquipmentPHONE: TStringField
      FieldName = 'PHONE'
      Size = 50
    end
    object qEquipmentFAX: TStringField
      FieldName = 'FAX'
      Size = 50
    end
    object qEquipmentCONTACT: TStringField
      FieldName = 'CONTACT'
      Size = 50
    end
    object qEquipmentEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qEquipmentCOMMENTS: TBlobField
      FieldName = 'COMMENTS'
      Size = 1
    end
  end
  object qManufacturers: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Manufacturers'
      'order by Manufacturer')
    SQLConnection = sqlcMaintDB
    Left = 24
    Top = 276
    object qManufacturersMANUFACTURERID: TSmallintField
      FieldName = 'MANUFACTURERID'
      Required = True
    end
    object qManufacturersMANUFACTURER: TStringField
      FieldName = 'MANUFACTURER'
      Required = True
      Size = 255
    end
    object qManufacturersCITY: TStringField
      FieldName = 'CITY'
      Size = 50
    end
    object qManufacturersSTATEPROV: TStringField
      FieldName = 'STATEPROV'
      Size = 50
    end
    object qManufacturersCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 50
    end
    object qManufacturersCELL: TStringField
      FieldName = 'CELL'
      Size = 50
    end
    object qManufacturersPHONE: TStringField
      FieldName = 'PHONE'
      Size = 50
    end
    object qManufacturersFAX: TStringField
      FieldName = 'FAX'
      Size = 50
    end
    object qManufacturersEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object qManufacturersWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Size = 50
    end
    object qManufacturersCONTACT: TStringField
      FieldName = 'CONTACT'
      Size = 50
    end
    object qManufacturersCOMMENTS: TBlobField
      FieldName = 'COMMENTS'
      Size = 1
    end
  end
  object qRooms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CompanyID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select * from Rooms'
      'where CompanyID=:CompanyID'
      'order by Room')
    SQLConnection = sqlcMaintDB
    Left = 20
    Top = 336
    object qRoomsID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object qRoomsROOM: TStringField
      FieldName = 'ROOM'
      Required = True
      Size = 255
    end
    object qRoomsCOMPANYID: TSmallintField
      FieldName = 'COMPANYID'
      Required = True
    end
  end
  object qTechnicians: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Technicians'
      'order by Technician')
    SQLConnection = sqlcMaintDB
    Left = 22
    Top = 392
    object qTechniciansTECHNICIANID: TSmallintField
      FieldName = 'TECHNICIANID'
      Required = True
    end
    object qTechniciansTECHNICIAN: TStringField
      FieldName = 'TECHNICIAN'
      Required = True
      Size = 50
    end
  end
  object dspCategories: TDataSetProvider
    DataSet = qCategories
    Left = 54
    Top = 94
  end
  object dspCompanies: TDataSetProvider
    DataSet = qCompanies
    Left = 52
    Top = 158
  end
  object dspEquipment: TDataSetProvider
    DataSet = qEquipment
    Left = 50
    Top = 216
  end
  object dspManufacturers: TDataSetProvider
    DataSet = qManufacturers
    Left = 50
    Top = 276
  end
  object dspRooms: TDataSetProvider
    DataSet = qRooms
    Left = 48
    Top = 336
  end
  object dspTechnicians: TDataSetProvider
    DataSet = qTechnicians
    Left = 52
    Top = 392
  end
  object cdsCategories: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCategories'
    Left = 82
    Top = 94
    object cdsCategoriesID: TSmallintField
      DisplayLabel = 'Category ID'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCategoriesCATEGORY: TStringField
      DisplayLabel = 'Category'
      FieldName = 'CATEGORY'
      Required = True
      Size = 50
    end
  end
  object cdsCompanies: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompanies'
    Left = 80
    Top = 158
    object cdsCompaniesSETUPID: TIntegerField
      DisplayLabel = 'Company ID'
      FieldName = 'SETUPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompaniesCOMPANYNAME: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANYNAME'
      Required = True
      Size = 50
    end
  end
  object cdsEquipment: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEquipment'
    Left = 78
    Top = 216
    object cdsEquipmentID: TSmallintField
      DisplayLabel = 'Equipment ID'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEquipmentEQUIPMENT: TStringField
      DisplayLabel = 'Equipment'
      FieldName = 'EQUIPMENT'
      Required = True
      Size = 255
    end
    object cdsEquipmentROOMID: TSmallintField
      DisplayLabel = 'Room ID'
      FieldName = 'ROOMID'
      Required = True
    end
    object cdsEquipmentMANUFACTURERID: TSmallintField
      DisplayLabel = 'Manufacturer ID'
      FieldName = 'MANUFACTURERID'
      Required = True
    end
    object cdsEquipmentCELL: TStringField
      DisplayLabel = 'Cell'
      FieldName = 'CELL'
      Size = 50
    end
    object cdsEquipmentPHONE: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE'
      Size = 50
    end
    object cdsEquipmentFAX: TStringField
      DisplayLabel = 'Telefax'
      FieldName = 'FAX'
      Size = 50
    end
    object cdsEquipmentCONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'CONTACT'
      Size = 50
    end
    object cdsEquipmentEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsEquipmentCOMMENTS: TBlobField
      DisplayLabel = 'Comments'
      FieldName = 'COMMENTS'
      Size = 1
    end
  end
  object cdsManufacturers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManufacturers'
    Left = 78
    Top = 276
    object cdsManufacturersMANUFACTURERID: TSmallintField
      DisplayLabel = 'Manufacturer ID'
      FieldName = 'MANUFACTURERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsManufacturersMANUFACTURER: TStringField
      DisplayLabel = 'Manufacturer'
      FieldName = 'MANUFACTURER'
      Required = True
      Size = 255
    end
    object cdsManufacturersCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 50
    end
    object cdsManufacturersSTATEPROV: TStringField
      DisplayLabel = 'State / Prov.'
      FieldName = 'STATEPROV'
      Size = 50
    end
    object cdsManufacturersCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 50
    end
    object cdsManufacturersCELL: TStringField
      DisplayLabel = 'Cell'
      FieldName = 'CELL'
      Size = 50
    end
    object cdsManufacturersPHONE: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE'
      Size = 50
    end
    object cdsManufacturersFAX: TStringField
      DisplayLabel = 'Telefax'
      FieldName = 'FAX'
      Size = 50
    end
    object cdsManufacturersEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsManufacturersWEBSITE: TStringField
      DisplayLabel = 'Website'
      FieldName = 'WEBSITE'
      Size = 50
    end
    object cdsManufacturersCONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'CONTACT'
      Size = 50
    end
    object cdsManufacturersCOMMENTS: TBlobField
      DisplayLabel = 'Comments'
      FieldName = 'COMMENTS'
      Size = 1
    end
  end
  object cdsRooms: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRooms'
    Left = 76
    Top = 336
    object cdsRoomsID: TSmallintField
      DisplayLabel = 'Room ID'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRoomsROOM: TStringField
      DisplayLabel = 'Room'
      FieldName = 'ROOM'
      Required = True
      Size = 255
    end
    object cdsRoomsCOMPANYID: TSmallintField
      DisplayLabel = 'Company ID'
      FieldName = 'COMPANYID'
      Required = True
    end
  end
  object cdsTechnicians: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTechnicians'
    Left = 78
    Top = 392
    object cdsTechniciansTECHNICIANID: TSmallintField
      DisplayLabel = 'Tech. ID'
      FieldName = 'TECHNICIANID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTechniciansTECHNICIAN: TStringField
      DisplayLabel = 'Technician'
      FieldName = 'TECHNICIAN'
      Required = True
      Size = 50
    end
  end
  object dsCategories: TDataSource
    DataSet = cdsCategories
    Left = 110
    Top = 94
  end
  object dsCompanies: TDataSource
    DataSet = cdsCompanies
    Left = 108
    Top = 158
  end
  object dsEquipment: TDataSource
    DataSet = cdsEquipment
    Left = 106
    Top = 216
  end
  object dsManufacturers: TDataSource
    DataSet = cdsManufacturers
    Left = 106
    Top = 276
  end
  object dsRooms: TDataSource
    DataSet = cdsRooms
    Left = 104
    Top = 336
  end
  object dsTechnicians: TDataSource
    DataSet = cdsTechnicians
    Left = 106
    Top = 392
  end
  object qIssueDetails: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IssueID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from Issues'
      'where IssueID=:IssueID')
    SQLConnection = sqlcMaintDB
    Left = 270
    Top = 104
    object qIssueDetailsISSUEID: TIntegerField
      FieldName = 'ISSUEID'
      Required = True
    end
    object qIssueDetailsPROBLEMSHORT: TStringField
      FieldName = 'PROBLEMSHORT'
      Size = 100
    end
    object qIssueDetailsPROBLEM: TBlobField
      FieldName = 'PROBLEM'
      Size = 1
    end
    object qIssueDetailsEQUIPMENTID: TSmallintField
      FieldName = 'EQUIPMENTID'
      Required = True
    end
    object qIssueDetailsTECHNICIANID: TSmallintField
      FieldName = 'TECHNICIANID'
      Required = True
    end
    object qIssueDetailsSOLUTION: TMemoField
      FieldName = 'SOLUTION'
      BlobType = ftMemo
      Size = 1
    end
    object qIssueDetailsDATEREPAIRED: TSQLTimeStampField
      DefaultExpression = 'ddddd'
      FieldName = 'DATEREPAIRED'
    end
    object qIssueDetailsDATEENTERED: TSQLTimeStampField
      DefaultExpression = 'ddddd'
      FieldName = 'DATEENTERED'
    end
    object qIssueDetailsCATEGORYID: TSmallintField
      FieldName = 'CATEGORYID'
      Required = True
    end
    object qIssueDetailsCOMPLETE: TStringField
      FieldName = 'COMPLETE'
      FixedChar = True
      Size = 1
    end
  end
  object dspIssueDetails: TDataSetProvider
    DataSet = qIssueDetails
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 298
    Top = 104
  end
  object cdsIssueDetails: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIssueDetails'
    Left = 326
    Top = 104
    object cdsIssueDetailsISSUEID: TIntegerField
      DisplayLabel = 'Issue ID'
      FieldName = 'ISSUEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIssueDetailsPROBLEMSHORT: TStringField
      DisplayLabel = 'Problem (abbreviated)'
      FieldName = 'PROBLEMSHORT'
      Size = 100
    end
    object cdsIssueDetailsPROBLEM: TBlobField
      DisplayLabel = 'Problem'
      FieldName = 'PROBLEM'
      Size = 1
    end
    object cdsIssueDetailsEQUIPMENTID: TSmallintField
      DisplayLabel = 'Equipment'
      FieldName = 'EQUIPMENTID'
      Required = True
    end
    object cdsIssueDetailsTECHNICIANID: TSmallintField
      DisplayLabel = 'Technician'
      FieldName = 'TECHNICIANID'
      Required = True
    end
    object cdsIssueDetailsSOLUTION: TMemoField
      DisplayLabel = 'Solution'
      FieldName = 'SOLUTION'
      BlobType = ftMemo
      Size = 1
    end
    object cdsIssueDetailsDATEREPAIRED: TSQLTimeStampField
      DisplayLabel = 'Date repaired'
      FieldName = 'DATEREPAIRED'
      DisplayFormat = 'ddddd'
    end
    object cdsIssueDetailsDATEENTERED: TSQLTimeStampField
      DisplayLabel = 'Date entered'
      FieldName = 'DATEENTERED'
      DisplayFormat = 'ddddd'
    end
    object cdsIssueDetailsCATEGORYID: TSmallintField
      DisplayLabel = 'Category'
      FieldName = 'CATEGORYID'
      Required = True
    end
    object cdsIssueDetailsCOMPLETE: TStringField
      DisplayLabel = 'Complete'
      FieldName = 'COMPLETE'
      FixedChar = True
      Size = 1
    end
  end
  object dsIssueDetails: TDataSource
    DataSet = cdsIssueDetails
    Left = 354
    Top = 104
  end
  object qYesNo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from YesNo')
    SQLConnection = sqlcMaintDB
    Left = 22
    Top = 440
    object qYesNoYESNOID: TStringField
      FieldName = 'YESNOID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qYesNoYESNO: TStringField
      FieldName = 'YESNO'
      Required = True
      Size = 3
    end
  end
  object dspYesNo: TDataSetProvider
    DataSet = qYesNo
    Left = 50
    Top = 440
  end
  object cdsYesNo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspYesNo'
    Left = 78
    Top = 440
    object cdsYesNoYESNOID: TStringField
      DisplayLabel = 'YesNoID'
      FieldName = 'YESNOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsYesNoYESNO: TStringField
      DisplayLabel = 'Yes / No'
      FieldName = 'YESNO'
      Required = True
      Size = 3
    end
  end
  object dsYesNo: TDataSource
    DataSet = cdsYesNo
    Left = 106
    Top = 440
  end
  object qMaxIssue: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select Max(IssueID)'
      'from Issues')
    SQLConnection = sqlcMaintDB
    Left = 268
    Top = 158
    object qMaxIssueMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object dspMaxIssue: TDataSetProvider
    DataSet = qMaxIssue
    Left = 296
    Top = 156
  end
  object cdsMaxIssue: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaxIssue'
    Left = 322
    Top = 156
    object cdsMaxIssueMAX: TIntegerField
      FieldName = 'MAX'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object dsMaxIssue: TDataSource
    DataSet = cdsMaxIssue
    Left = 350
    Top = 158
  end
  object qMaxEquip: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select Max(ID)'
      'from EquipDetails'
      '')
    SQLConnection = sqlcMaintDB
    Left = 272
    Top = 216
    object qMaxEquipMAX: TSmallintField
      FieldName = 'MAX'
    end
  end
  object dspMaxEquip: TDataSetProvider
    DataSet = qMaxEquip
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 300
    Top = 216
  end
  object cdsMaxEquip: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaxEquip'
    Left = 328
    Top = 216
    object cdsMaxEquipMAX: TSmallintField
      FieldName = 'MAX'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object dsMaxEquip: TDataSource
    DataSet = cdsMaxEquip
    Left = 356
    Top = 216
  end
  object SQLMonitor1: TSQLMonitor
    Left = 504
    Top = 104
  end
end
