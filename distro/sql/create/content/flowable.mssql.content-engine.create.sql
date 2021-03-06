
CREATE TABLE [ACT_CO_DATABASECHANGELOG] ([ID] [nvarchar](255) NOT NULL, [AUTHOR] [nvarchar](255) NOT NULL, [FILENAME] [nvarchar](255) NOT NULL, [DATEEXECUTED] [datetime2](3) NOT NULL, [ORDEREXECUTED] [int] NOT NULL, [EXECTYPE] [nvarchar](10) NOT NULL, [MD5SUM] [nvarchar](35), [DESCRIPTION] [nvarchar](255), [COMMENTS] [nvarchar](255), [TAG] [nvarchar](255), [LIQUIBASE] [nvarchar](20), [CONTEXTS] [nvarchar](255), [LABELS] [nvarchar](255), [DEPLOYMENT_ID] [nvarchar](10))
GO

CREATE TABLE [ACT_CO_CONTENT_ITEM] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255) NOT NULL, [MIME_TYPE_] [varchar](255), [TASK_ID_] [varchar](255), [PROC_INST_ID_] [varchar](255), [CONTENT_STORE_ID_] [varchar](255), [CONTENT_STORE_NAME_] [varchar](255), [FIELD_] [varchar](400), [CONTENT_AVAILABLE_] [bit] CONSTRAINT [DF_ACT_CO_CONTENT_ITEM_CONTENT_AVAILABLE_] DEFAULT 0, [CREATED_] [datetime], [CREATED_BY_] [varchar](255), [LAST_MODIFIED_] [datetime], [LAST_MODIFIED_BY_] [varchar](255), [CONTENT_SIZE_] [bigint] CONSTRAINT [DF_ACT_CO_CONTENT_ITEM_CONTENT_SIZE_] DEFAULT 0, [TENANT_ID_] [varchar](255), CONSTRAINT [PK_ACT_CO_CONTENT_ITEM] PRIMARY KEY ([ID_]))
GO

CREATE NONCLUSTERED INDEX idx_contitem_taskid ON [ACT_CO_CONTENT_ITEM]([TASK_ID_])
GO

CREATE NONCLUSTERED INDEX idx_contitem_procid ON [ACT_CO_CONTENT_ITEM]([PROC_INST_ID_])
GO

INSERT INTO [ACT_CO_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', GETDATE(), 1, '7:a17df43ed0c96adfef5271e1781aaed2', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.5.3', '7878884702')
GO

