EXECUTE sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NETWORK SERVICE';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'NETWORK SERVICE';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'NETWORK SERVICE';

