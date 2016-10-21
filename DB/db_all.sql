USE [N_Bers_aj]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/21 14:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[nbers_access]')
                        AND type IN ( N'U' ) )
    BEGIN
        CREATE TABLE [dbo].[nbers_access]
            (
              [role_id] [INT] NOT NULL ,
              [node_id] [INT] NOT NULL ,
              [level] [INT] NOT NULL ,
              [pid] [INT] NOT NULL ,
              [module] [NVARCHAR](50) NULL
            )
        ON  [PRIMARY]
    END
GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/21 14:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[nbers_form]')
                        AND type IN ( N'U' ) )
    BEGIN
        CREATE TABLE [dbo].[nbers_form]
            (
              [id] [INT] IDENTITY(0, 1)
                         NOT NULL ,
              [title] [NVARCHAR](255) NOT NULL ,
              [content] [NVARCHAR](255) NOT NULL ,
              [create_time] [TIMESTAMP] NOT NULL ,
              [status] [INT] NOT NULL ,
              PRIMARY KEY CLUSTERED ( [id] ASC )
                WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
                       IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                       ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
            )
        ON  [PRIMARY]
    END
GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/21 14:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[nbers_group]')
                        AND type IN ( N'U' ) )
    BEGIN
        CREATE TABLE [dbo].[nbers_group]
            (
              [id] [INT] IDENTITY(0, 1)
                         NOT NULL ,
              [name] [NVARCHAR](25) NOT NULL ,
              [title] [NVARCHAR](50) NOT NULL ,
              [create_time] [INT] NOT NULL ,
              [update_time] [INT] NOT NULL ,
              [status] [INT] NOT NULL ,
              [sort] [INT] NOT NULL ,
              [show] [INT] NOT NULL ,
              PRIMARY KEY CLUSTERED ( [id] ASC )
                WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
                       IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                       ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
            )
        ON  [PRIMARY]
    END
GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/21 14:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[nbers_node]')
                        AND type IN ( N'U' ) )
    BEGIN
        CREATE TABLE [dbo].[nbers_node]
            (
              [id] [INT] IDENTITY(0, 1)
                         NOT NULL ,
              [name] [NVARCHAR](20) NOT NULL ,
              [title] [NVARCHAR](50) NULL ,
              [status] [INT] NULL ,
              [remark] [NVARCHAR](255) NULL ,
              [sort] [INT] NULL ,
              [pid] [INT] NOT NULL ,
              [level] [INT] NOT NULL ,
              [type] [INT] NOT NULL ,
              [group_id] [INT] NULL
            )
        ON  [PRIMARY]
    END
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/21 14:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[nbers_role]')
                        AND type IN ( N'U' ) )
    BEGIN
        CREATE TABLE [dbo].[nbers_role]
            (
              [id] [INT] IDENTITY(0, 1)
                         NOT NULL ,
              [name] [NVARCHAR](20) NOT NULL ,
              [pid] [INT] NULL ,
              [status] [INT] NULL ,
              [remark] [NVARCHAR](255) NULL ,
              [ename] [NVARCHAR](5) NULL ,
              [create_time] [INT] NOT NULL ,
              [update_time] [INT] NOT NULL
            )
        ON  [PRIMARY]
    END
GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/21 14:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[nbers_role_user]')
                        AND type IN ( N'U' ) )
    BEGIN
        CREATE TABLE [dbo].[nbers_role_user]
            (
              [role_id] [INT] NULL ,
              [user_id] [CHAR](32) NULL
            )
        ON  [PRIMARY]
    END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/21 14:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[nbers_user]')
                        AND type IN ( N'U' ) )
    BEGIN
        CREATE TABLE [dbo].[nbers_user]
            (
              [id] [INT] IDENTITY(0, 1)
                         NOT NULL ,
              [account] [NVARCHAR](64) NOT NULL ,
              [nickname] [NVARCHAR](50) NOT NULL ,
              [password] [CHAR](32) NOT NULL ,
              [bind_account] [VARCHAR](50) NOT NULL ,
              [last_login_time] [INT] NULL ,
              [last_login_ip] [VARCHAR](40) NULL ,
              [login_count] [INT] NULL ,
              [verify] [NVARCHAR](32) NULL ,
              [email] [NVARCHAR](50) NOT NULL ,
              [remark] [NVARCHAR](255) NOT NULL ,
              [create_time] [INT] NOT NULL ,
              [update_time] [INT] NOT NULL ,
              [status] [INT] NULL ,
              [type_id] [INT] NULL ,
              [info] [TEXT] NOT NULL ,
              PRIMARY KEY CLUSTERED ( [id] ASC )
                WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
                       IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                       ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
            )
        ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    END
GO
SET ANSI_PADDING OFF
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          7 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          49 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          2 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          3 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          4 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          5 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          6 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          7 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          11 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 5 ,
          25 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 5 ,
          51 ,
          2 ,
          25 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          49 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          37 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          36 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          35 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          34 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          33 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          32 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          31 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          32 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          31 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          49 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          7 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          49 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          2 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          3 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          4 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          5 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          6 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          7 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 4 ,
          11 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 5 ,
          25 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 5 ,
          51 ,
          2 ,
          25 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          49 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 3 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          37 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          36 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          35 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          34 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          33 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          32 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 1 ,
          31 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          32 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 2 ,
          31 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          1 ,
          1 ,
          0 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          30 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          40 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          69 ,
          2 ,
          1 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          50 ,
          3 ,
          40 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          39 ,
          3 ,
          30 ,
          NULL
        )
GO
INSERT  [dbo].[nbers_access]
        ( [role_id] ,
          [node_id] ,
          [level] ,
          [pid] ,
          [module]
        )
VALUES  ( 7 ,
          49 ,
          3 ,
          30 ,
          NULL
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_group] ON 

GO
INSERT  [dbo].[nbers_group]
        ( [id] ,
          [name] ,
          [title] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [sort] ,
          [show]
        )
VALUES  ( 2 ,
          N'App' ,
          N'应用中心' ,
          1222841259 ,
          0 ,
          1 ,
          0 ,
          0
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_group] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 49 ,
          N'read' ,
          N'查看' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 40 ,
          N'Index' ,
          N'默认模块' ,
          1 ,
          N'' ,
          1 ,
          1 ,
          2 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 39 ,
          N'index' ,
          N'列表' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 37 ,
          N'resume' ,
          N'恢复' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 36 ,
          N'forbid' ,
          N'禁用' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 35 ,
          N'foreverdelete' ,
          N'删除' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 34 ,
          N'update' ,
          N'更新' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 33 ,
          N'edit' ,
          N'编辑' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 32 ,
          N'insert' ,
          N'写入' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 31 ,
          N'add' ,
          N'新增' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 30 ,
          N'Public' ,
          N'公共模块' ,
          1 ,
          N'' ,
          2 ,
          1 ,
          2 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 69 ,
          N'Form' ,
          N'数据管理' ,
          1 ,
          N'' ,
          1 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 7 ,
          N'User' ,
          N'后台用户' ,
          1 ,
          N'' ,
          4 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 6 ,
          N'Role' ,
          N'角色管理' ,
          1 ,
          N'' ,
          3 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 2 ,
          N'Node' ,
          N'节点管理' ,
          1 ,
          N'' ,
          2 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 1 ,
          N'App' ,
          N'Rbac后台管理' ,
          1 ,
          N'' ,
          NULL ,
          0 ,
          1 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 50 ,
          N'main' ,
          N'空白首页' ,
          1 ,
          N'' ,
          NULL ,
          40 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 49 ,
          N'read' ,
          N'查看' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 40 ,
          N'Index' ,
          N'默认模块' ,
          1 ,
          N'' ,
          1 ,
          1 ,
          2 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 39 ,
          N'index' ,
          N'列表' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 37 ,
          N'resume' ,
          N'恢复' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 36 ,
          N'forbid' ,
          N'禁用' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 35 ,
          N'foreverdelete' ,
          N'删除' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 34 ,
          N'update' ,
          N'更新' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 33 ,
          N'edit' ,
          N'编辑' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 32 ,
          N'insert' ,
          N'写入' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 31 ,
          N'add' ,
          N'新增' ,
          1 ,
          N'' ,
          NULL ,
          30 ,
          3 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 30 ,
          N'Public' ,
          N'公共模块' ,
          1 ,
          N'' ,
          2 ,
          1 ,
          2 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 69 ,
          N'Form' ,
          N'数据管理' ,
          1 ,
          N'' ,
          1 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 7 ,
          N'User' ,
          N'后台用户' ,
          1 ,
          N'' ,
          4 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 6 ,
          N'Role' ,
          N'角色管理' ,
          1 ,
          N'' ,
          3 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 2 ,
          N'Node' ,
          N'节点管理' ,
          1 ,
          N'' ,
          2 ,
          1 ,
          2 ,
          0 ,
          2
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 1 ,
          N'App' ,
          N'Rbac后台管理' ,
          1 ,
          N'' ,
          NULL ,
          0 ,
          1 ,
          0 ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [name] ,
          [title] ,
          [status] ,
          [remark] ,
          [sort] ,
          [pid] ,
          [level] ,
          [type] ,
          [group_id]
        )
VALUES  ( 50 ,
          N'main' ,
          N'空白首页' ,
          1 ,
          N'' ,
          NULL ,
          40 ,
          3 ,
          0 ,
          0
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 1 ,
          N'领导组' ,
          0 ,
          1 ,
          N'' ,
          N'' ,
          1208784792 ,
          1254325558
        )
GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 2 ,
          N'员工组' ,
          0 ,
          1 ,
          N'' ,
          N'' ,
          1215496283 ,
          1254325566
        )
GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 7 ,
          N'演示组' ,
          0 ,
          1 ,
          N'' ,
          NULL ,
          1254325787 ,
          0
        )
GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 1 ,
          N'领导组' ,
          0 ,
          1 ,
          N'' ,
          N'' ,
          1208784792 ,
          1254325558
        )
GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 2 ,
          N'员工组' ,
          0 ,
          1 ,
          N'' ,
          N'' ,
          1215496283 ,
          1254325566
        )
GO
INSERT  [dbo].[nbers_role]
        ( [id] ,
          [name] ,
          [pid] ,
          [status] ,
          [remark] ,
          [ename] ,
          [create_time] ,
          [update_time]
        )
VALUES  ( 7 ,
          N'演示组' ,
          0 ,
          1 ,
          N'' ,
          NULL ,
          1254325787 ,
          0
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'27                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'26                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'30                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 5 ,
          N'31                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'22                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'1                               '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 1 ,
          N'4                               '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 2 ,
          N'3                               '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 7 ,
          N'2                               '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'27                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'26                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'30                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 5 ,
          N'31                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'22                              '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'1                               '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 1 ,
          N'4                               '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 2 ,
          N'3                               '
        )
GO
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 7 ,
          N'2                               '
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_user] ON 

GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 1 ,
          N'admin' ,
          N'管理员' ,
          N'21232f297a57a5a743894a0e4a801fc3' ,
          N'' ,
          1326335612 ,
          N'127.0.0.1' ,
          888 ,
          N'8888' ,
          N'liu21st@gmail.com' ,
          N'备注信息' ,
          1222907803 ,
          1326266696 ,
          1 ,
          0 ,
          N''
        )
GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 2 ,
          N'demo' ,
          N'演示' ,
          N'fe01ce2a7fbac8fafaed7c982a04e229' ,
          N'' ,
          1254326091 ,
          N'127.0.0.1' ,
          90 ,
          N'8888' ,
          N'' ,
          N'' ,
          1239783735 ,
          1254325770 ,
          1 ,
          0 ,
          N''
        )
GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 3 ,
          N'member' ,
          N'员工' ,
          N'aa08769cdcb26674c6706093503ff0a3' ,
          N'' ,
          1326266720 ,
          N'127.0.0.1' ,
          17 ,
          N'' ,
          N'' ,
          N'' ,
          1253514375 ,
          1254325728 ,
          1 ,
          0 ,
          N''
        )
GO
INSERT  [dbo].[nbers_user]
        ( [id] ,
          [account] ,
          [nickname] ,
          [password] ,
          [bind_account] ,
          [last_login_time] ,
          [last_login_ip] ,
          [login_count] ,
          [verify] ,
          [email] ,
          [remark] ,
          [create_time] ,
          [update_time] ,
          [status] ,
          [type_id] ,
          [info]
        )
VALUES  ( 4 ,
          N'leader' ,
          N'领导' ,
          N'c444858e0aaeb727da73d2eae62321ad' ,
          N'' ,
          1254325906 ,
          N'127.0.0.1' ,
          15 ,
          N'' ,
          N'' ,
          N'领导' ,
          1253514575 ,
          1254325705 ,
          1 ,
          0 ,
          N''
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_user] OFF
GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_acc__modul__0F975522]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_access] ADD  DEFAULT (NULL) FOR [module]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_gro__updat__145C0A3F]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [update_time]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_gro__statu__15502E78]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [status]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_grou__sort__164452B1]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [sort]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_grou__show__173876EA]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [show]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_nod__title__1920BF5C]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [title]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_nod__statu__1A14E395]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT ('0') FOR [status]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_nod__remar__1B0907CE]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [remark]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_node__sort__1BFD2C07]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [sort]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_node__type__1CF15040]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT ('0') FOR [type]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_nod__group__1DE57479]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT ('0') FOR [group_id]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_role__pid__1FCDBCEB]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [pid]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_rol__statu__20C1E124]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [status]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_rol__remar__21B6055D]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [remark]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_rol__ename__22AA2996]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [ename]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_rol__role___24927208]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [role_id]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_rol__user___25869641]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [user_id]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_use__last___286302EC]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [last_login_time]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_use__last___29572725]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT (NULL) FOR [last_login_ip]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_use__login__2A4B4B5E]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [login_count]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_use__verif__2B3F6F97]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT (NULL) FOR [verify]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_use__statu__2C3393D0]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [status]
    END

GO
IF NOT EXISTS ( SELECT  *
                FROM    dbo.sysobjects
                WHERE   id = OBJECT_ID(N'[dbo].[DF__nbers_use__type___2D27B809]')
                        AND type = 'D' )
    BEGIN
        ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [type_id]
    END

GO
