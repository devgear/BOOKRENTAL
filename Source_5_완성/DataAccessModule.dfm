object dmDataAccess: TdmDataAccess
  OldCreateOrder = False
  Height = 417
  Width = 702
  object conBookRental: TFDConnection
    Params.Strings = (
      'Database=D:\Projects\BookRental\DB\BOOKRENTAL.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = conBookRentalBeforeConnect
    Left = 128
    Top = 88
  end
  object qryBook: TFDQuery
    Active = True
    OnCalcFields = qryBookCalcFields
    Connection = conBookRental
    UpdateOptions.AutoIncFields = 'BOOK_SEQ'
    SQL.Strings = (
      'SELECT * FROM BOOK')
    Left = 128
    Top = 176
    object qryBookBOOK_SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryBookBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'BOOK_TITLE'
      Required = True
      Size = 400
    end
    object qryBookBOOK_ISBN: TStringField
      FieldName = 'BOOK_ISBN'
      Origin = 'BOOK_ISBN'
      FixedChar = True
      Size = 13
    end
    object qryBookBOOK_AUTHOR: TWideStringField
      FieldName = 'BOOK_AUTHOR'
      Origin = 'BOOK_AUTHOR'
      Required = True
      Size = 120
    end
    object qryBookBOOK_PRICE: TIntegerField
      FieldName = 'BOOK_PRICE'
      Origin = 'BOOK_PRICE'
      DisplayFormat = '#,##0'
    end
    object qryBookBOOK_LINK: TWideStringField
      FieldName = 'BOOK_LINK'
      Origin = 'BOOK_LINK'
      Size = 1020
    end
    object qryBookBOOK_RENT_YN: TStringField
      FieldName = 'BOOK_RENT_YN'
      Origin = 'BOOK_RENT_YN'
      FixedChar = True
      Size = 1
    end
    object qryBookBOOK_IMAGE: TBlobField
      FieldName = 'BOOK_IMAGE'
      Origin = 'BOOK_IMAGE'
    end
    object qryBookBOOK_DESCRIPTION: TWideMemoField
      FieldName = 'BOOK_DESCRIPTION'
      Origin = 'BOOK_DESCRIPTION'
      BlobType = ftWideMemo
    end
    object qryBookBOOK_RENT: TStringField
      FieldKind = fkCalculated
      FieldName = 'BOOK_RENT'
      Calculated = True
    end
  end
  object qryDuplicatedBook: TFDQuery
    Connection = conBookRental
    SQL.Strings = (
      'SELECT BOOK_SEQ FROM BOOK WHERE BOOK_ISBN = :ISBN')
    Left = 128
    Top = 248
    ParamData = <
      item
        Name = 'ISBN'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 13
        Value = Null
      end>
  end
  object qryUser: TFDQuery
    Active = True
    OnCalcFields = qryUserCalcFields
    Connection = conBookRental
    UpdateOptions.AutoIncFields = 'USER_SEQ'
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 224
    Top = 176
    object qryUserUSER_SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'USER_SEQ'
      Origin = 'USER_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryUserUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Required = True
      Size = 120
    end
    object qryUserUSER_BIRTH: TDateField
      FieldName = 'USER_BIRTH'
      Origin = 'USER_BIRTH'
    end
    object qryUserUSER_SEX: TStringField
      FieldName = 'USER_SEX'
      Origin = 'USER_SEX'
      FixedChar = True
      Size = 1
    end
    object qryUserUSER_PHONE: TStringField
      FieldName = 'USER_PHONE'
      Origin = 'USER_PHONE'
      Size = 15
    end
    object qryUserUSER_MAIL: TWideStringField
      FieldName = 'USER_MAIL'
      Origin = 'USER_MAIL'
      Size = 1020
    end
    object qryUserUSER_IMAGE: TBlobField
      FieldName = 'USER_IMAGE'
      Origin = 'USER_IMAGE'
    end
    object qryUserUSER_REG_DATE: TDateField
      FieldName = 'USER_REG_DATE'
      Origin = 'USER_REG_DATE'
    end
    object qryUserUSER_OUT_YN: TStringField
      FieldName = 'USER_OUT_YN'
      Origin = 'USER_OUT_YN'
      FixedChar = True
      Size = 1
    end
    object qryUserUSER_OUT_DATE: TDateField
      FieldName = 'USER_OUT_DATE'
      Origin = 'USER_OUT_DATE'
    end
    object qryUserUSER_RENT_COUNT: TIntegerField
      FieldName = 'USER_RENT_COUNT'
      Origin = 'USER_RENT_COUNT'
    end
    object qryUserUSER_SEX_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER_SEX_STR'
      Calculated = True
    end
    object qryUserUSER_OUT: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER_OUT'
      Calculated = True
    end
  end
  object qryDuplicatedUser: TFDQuery
    Connection = conBookRental
    SQL.Strings = (
      'SELECT USER_SEQ FROM USERS'
      'WHERE USER_NAME = :NAME AND USER_BIRTH = :BIRTH')
    Left = 224
    Top = 248
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 120
        Value = Null
      end
      item
        Name = 'BIRTH'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object qryRent: TFDQuery
    Active = True
    OnCalcFields = qryRentCalcFields
    Connection = conBookRental
    UpdateOptions.AutoIncFields = 'RENT_SEQ'
    UpdateObject = usRent
    SQL.Strings = (
      
        'SELECT BOOK.BOOK_TITLE, USERS.USER_NAME, RENT.* FROM RENT, BOOK,' +
        ' USERS'
      'WHERE'
      '  RENT.BOOK_SEQ = BOOK.BOOK_SEQ AND'
      '  RENT.USER_SEQ = USERS.USER_SEQ')
    Left = 392
    Top = 184
    object qryRentBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'BOOK_TITLE'
      ReadOnly = True
      Size = 400
    end
    object qryRentUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      ReadOnly = True
      Size = 120
    end
    object qryRentRENT_SEQ: TFDAutoIncField
      FieldName = 'RENT_SEQ'
      Origin = 'RENT_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryRentUSER_SEQ: TIntegerField
      FieldName = 'USER_SEQ'
      Origin = 'USER_SEQ'
      Required = True
    end
    object qryRentBOOK_SEQ: TIntegerField
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      Required = True
    end
    object qryRentRENT_DATE: TDateField
      FieldName = 'RENT_DATE'
      Origin = 'RENT_DATE'
    end
    object qryRentRENT_RETURN_DATE: TDateField
      FieldName = 'RENT_RETURN_DATE'
      Origin = 'RENT_RETURN_DATE'
    end
    object qryRentRENT_RETURN_YN: TStringField
      FieldName = 'RENT_RETURN_YN'
      Origin = 'RENT_RETURN_YN'
      FixedChar = True
      Size = 1
    end
    object qryRentRENT_RETURN: TStringField
      FieldKind = fkCalculated
      FieldName = 'RENT_RETURN'
      Calculated = True
    end
  end
  object qryRentBook: TFDQuery
    Active = True
    IndexFieldNames = 'BOOK_SEQ'
    MasterSource = dsRent
    MasterFields = 'BOOK_SEQ'
    Connection = conBookRental
    SQL.Strings = (
      'SELECT * FROM BOOK')
    Left = 392
    Top = 264
    object qryRentBookBOOK_SEQ: TIntegerField
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRentBookBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'BOOK_TITLE'
      Required = True
      Size = 400
    end
    object qryRentBookBOOK_ISBN: TStringField
      FieldName = 'BOOK_ISBN'
      Origin = 'BOOK_ISBN'
      FixedChar = True
      Size = 13
    end
    object qryRentBookBOOK_AUTHOR: TWideStringField
      FieldName = 'BOOK_AUTHOR'
      Origin = 'BOOK_AUTHOR'
      Required = True
      Size = 120
    end
    object qryRentBookBOOK_PRICE: TIntegerField
      FieldName = 'BOOK_PRICE'
      Origin = 'BOOK_PRICE'
      DisplayFormat = '#,##0'
    end
    object qryRentBookBOOK_LINK: TWideStringField
      FieldName = 'BOOK_LINK'
      Origin = 'BOOK_LINK'
      Size = 1020
    end
    object qryRentBookBOOK_RENT_YN: TStringField
      FieldName = 'BOOK_RENT_YN'
      Origin = 'BOOK_RENT_YN'
      FixedChar = True
      Size = 1
    end
    object qryRentBookBOOK_IMAGE: TBlobField
      FieldName = 'BOOK_IMAGE'
      Origin = 'BOOK_IMAGE'
    end
    object qryRentBookBOOK_DESCRIPTION: TWideMemoField
      FieldName = 'BOOK_DESCRIPTION'
      Origin = 'BOOK_DESCRIPTION'
      BlobType = ftWideMemo
    end
  end
  object qryRentUser: TFDQuery
    Active = True
    IndexFieldNames = 'USER_SEQ'
    MasterSource = dsRent
    MasterFields = 'USER_SEQ'
    Connection = conBookRental
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 472
    Top = 264
  end
  object dsRent: TDataSource
    DataSet = qryRent
    Left = 472
    Top = 184
  end
  object usRent: TFDUpdateSQL
    Connection = conBookRental
    InsertSQL.Strings = (
      'INSERT INTO RENT'
      '(RENT_SEQ, USER_SEQ, BOOK_SEQ, RENT_DATE, '
      '  RENT_RETURN_DATE, RENT_RETURN_YN)'
      
        'VALUES (:NEW_RENT_SEQ, :NEW_USER_SEQ, :NEW_BOOK_SEQ, :NEW_RENT_D' +
        'ATE, '
      '  :NEW_RENT_RETURN_DATE, :NEW_RENT_RETURN_YN)')
    ModifySQL.Strings = (
      'UPDATE RENT'
      
        'SET RENT_SEQ = :NEW_RENT_SEQ, USER_SEQ = :NEW_USER_SEQ, BOOK_SEQ' +
        ' = :NEW_BOOK_SEQ, '
      
        '  RENT_DATE = :NEW_RENT_DATE, RENT_RETURN_DATE = :NEW_RENT_RETUR' +
        'N_DATE, '
      '  RENT_RETURN_YN = :NEW_RENT_RETURN_YN'
      'WHERE RENT_SEQ = :OLD_RENT_SEQ')
    DeleteSQL.Strings = (
      'DELETE FROM RENT'
      'WHERE RENT_SEQ = :OLD_RENT_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT RENT_SEQ, USER_SEQ, BOOK_SEQ, RENT_DATE, RENT_RETURN_DATE' +
        ', RENT_RETURN_YN'
      'FROM RENT'
      'WHERE RENT_SEQ = :RENT_SEQ')
    Left = 544
    Top = 184
  end
  object qryFindUser: TFDQuery
    Active = True
    OnCalcFields = qryFindUserCalcFields
    Connection = conBookRental
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 392
    Top = 344
    object qryFindUserUSER_SEQ: TIntegerField
      FieldName = 'USER_SEQ'
      Origin = 'USER_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFindUserUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Required = True
      Size = 120
    end
    object qryFindUserUSER_BIRTH: TDateField
      FieldName = 'USER_BIRTH'
      Origin = 'USER_BIRTH'
    end
    object qryFindUserUSER_SEX: TStringField
      FieldName = 'USER_SEX'
      Origin = 'USER_SEX'
      FixedChar = True
      Size = 1
    end
    object qryFindUserUSER_PHONE: TStringField
      FieldName = 'USER_PHONE'
      Origin = 'USER_PHONE'
      Size = 15
    end
    object qryFindUserUSER_MAIL: TWideStringField
      FieldName = 'USER_MAIL'
      Origin = 'USER_MAIL'
      Size = 1020
    end
    object qryFindUserUSER_IMAGE: TBlobField
      FieldName = 'USER_IMAGE'
      Origin = 'USER_IMAGE'
    end
    object qryFindUserUSER_REG_DATE: TDateField
      FieldName = 'USER_REG_DATE'
      Origin = 'USER_REG_DATE'
    end
    object qryFindUserUSER_OUT_YN: TStringField
      FieldName = 'USER_OUT_YN'
      Origin = 'USER_OUT_YN'
      FixedChar = True
      Size = 1
    end
    object qryFindUserUSER_OUT_DATE: TDateField
      FieldName = 'USER_OUT_DATE'
      Origin = 'USER_OUT_DATE'
    end
    object qryFindUserUSER_RENT_COUNT: TIntegerField
      FieldName = 'USER_RENT_COUNT'
      Origin = 'USER_RENT_COUNT'
    end
    object qryFindUserUSER_SEX_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER_SEX_STR'
      Calculated = True
    end
  end
  object qryFindBook: TFDQuery
    Active = True
    Connection = conBookRental
    SQL.Strings = (
      'SELECT * FROM BOOK'
      'WHERE BOOK_RENT_YN = '#39'N'#39)
    Left = 480
    Top = 344
    object qryFindBookBOOK_SEQ: TIntegerField
      FieldName = 'BOOK_SEQ'
      Origin = 'BOOK_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFindBookBOOK_TITLE: TWideStringField
      FieldName = 'BOOK_TITLE'
      Origin = 'BOOK_TITLE'
      Required = True
      Size = 400
    end
    object qryFindBookBOOK_ISBN: TStringField
      FieldName = 'BOOK_ISBN'
      Origin = 'BOOK_ISBN'
      FixedChar = True
      Size = 13
    end
    object qryFindBookBOOK_AUTHOR: TWideStringField
      FieldName = 'BOOK_AUTHOR'
      Origin = 'BOOK_AUTHOR'
      Required = True
      Size = 120
    end
    object qryFindBookBOOK_PRICE: TIntegerField
      FieldName = 'BOOK_PRICE'
      Origin = 'BOOK_PRICE'
      DisplayFormat = '#,##0'
    end
    object qryFindBookBOOK_LINK: TWideStringField
      FieldName = 'BOOK_LINK'
      Origin = 'BOOK_LINK'
      Size = 1020
    end
    object qryFindBookBOOK_RENT_YN: TStringField
      FieldName = 'BOOK_RENT_YN'
      Origin = 'BOOK_RENT_YN'
      FixedChar = True
      Size = 1
    end
    object qryFindBookBOOK_IMAGE: TBlobField
      FieldName = 'BOOK_IMAGE'
      Origin = 'BOOK_IMAGE'
    end
    object qryFindBookBOOK_DESCRIPTION: TWideMemoField
      FieldName = 'BOOK_DESCRIPTION'
      Origin = 'BOOK_DESCRIPTION'
      BlobType = ftWideMemo
    end
  end
  object qryUpdateBookState: TFDQuery
    Connection = conBookRental
    SQL.Strings = (
      'UPDATE BOOK SET'
      'BOOK_RENT_YN = :RENT_YN'
      'WHERE BOOK_SEQ = :SEQ')
    Left = 416
    Top = 64
    ParamData = <
      item
        Name = 'RENT_YN'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'SEQ'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryUpdateUserRentCount: TFDQuery
    Connection = conBookRental
    SQL.Strings = (
      'UPDATE USERS SET '
      
        'USER_RENT_COUNT = (SELECT COUNT(*) FROM RENT WHERE USER_SEQ = :S' +
        'EQ AND RENT_RETURN_YN = '#39'N'#39')'
      'WHERE USER_SEQ = :SEQ')
    Left = 536
    Top = 64
    ParamData = <
      item
        Name = 'SEQ'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
