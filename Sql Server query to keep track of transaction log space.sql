use staging
insert into SSISMetaData.dbo.dm_db_log_space_usage
SELECT (total_log_size_in_bytes - used_log_space_in_bytes)*1.0/1024/1024 AS [free log space in MB]  ,DB_NAME() databasename,getdate() created_at

FROM sys.dm_db_log_space_usage;

select * from  SSISMetaData.dbo.dm_db_log_space_usage order by created_at desc
