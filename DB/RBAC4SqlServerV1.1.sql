USE energy
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/21 13:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_access]
    (
      [role_id] [INT] NOT NULL ,
      [node_id] [INT] NOT NULL ,
      [level] [INT] NOT NULL ,
      [pid] [INT] NOT NULL ,
      [module] [NVARCHAR](50) NULL
                              DEFAULT ( NULL )
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/21 13:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_form]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [title] [NVARCHAR](255) NOT NULL ,
      [content] [NVARCHAR](255) NOT NULL ,
      [create_time] [TIMESTAMP] NOT NULL ,
      [status] [int] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/21 13:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_group]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [name] [NVARCHAR](25) NOT NULL ,
      [title] [NVARCHAR](50) NOT NULL ,
      [create_time] [INT] NOT NULL ,
      [update_time] [INT] NOT NULL
                          DEFAULT ( '0' ) ,
      [status] [int] NOT NULL
                         DEFAULT ( '0' ) ,
      [sort] [int] NOT NULL
                       DEFAULT ( '0' ) ,
      [show] [int] NOT NULL
                       DEFAULT ( '0' ) ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/21 13:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_node]
    (
      [id] [int] IDENTITY(0, 1)
                     NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [title] [NVARCHAR](50) NULL
                             DEFAULT ( NULL ) ,
      [status] [int] NULL
                         DEFAULT ( '0' ) ,
      [remark] [NVARCHAR](255) NULL
                               DEFAULT ( NULL ) ,
      [sort] [int] NULL
                       DEFAULT ( NULL ) ,
      [pid] [int] NOT NULL ,
      [level] [int] NOT NULL ,
      [type] [int] NOT NULL
                       DEFAULT ( '0' ) ,
      [group_id] [int] NULL
                           DEFAULT ( '0' )
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/21 13:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role]
    (
      [id] [int] IDENTITY(0, 1)
                     NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [pid] [int] NULL
                      DEFAULT ( NULL ) ,
      [status] [int] NULL
                         DEFAULT ( NULL ) ,
      [remark] [NVARCHAR](255) NULL
                               DEFAULT ( NULL ) ,
      [ename] [NVARCHAR](5) NULL
                            DEFAULT ( NULL ) ,
      [create_time] [INT] NOT NULL ,
      [update_time] [INT] NOT NULL
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/21 13:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_role_user]
    (
      [role_id] [INT] NULL
                      DEFAULT ( NULL ) ,
      [user_id] [CHAR](32) NULL
                           DEFAULT ( NULL )
    )
ON  [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/21 13:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_user]
    (
      [id] [int] IDENTITY(0, 1)
                     NOT NULL ,
      [account] [NVARCHAR](64) NOT NULL ,
      [nickname] [NVARCHAR](50) NOT NULL ,
      [password] [CHAR](32) NOT NULL ,
      [bind_account] [VARCHAR](50) NOT NULL ,
      [last_login_time] [INT] NULL
                              DEFAULT ( '0' ) ,
      [last_login_ip] [VARCHAR](40) NULL
                                    DEFAULT ( NULL ) ,
      [login_count] [INT] NULL
                          DEFAULT ( '0' ) ,
      [verify] [NVARCHAR](32) NULL
                              DEFAULT ( NULL ) ,
      [email] [NVARCHAR](50) NOT NULL ,
      [remark] [NVARCHAR](255) NOT NULL ,
      [create_time] [INT] NOT NULL ,
      [update_time] [INT] NOT NULL ,
      [status] [int] NULL
                         DEFAULT ( '0' ) ,
      [type_id] [int] NULL
                          DEFAULT ( '0' ) ,
      [info] [TEXT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

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
SET IDENTITY_INSERT [dbo].[nbers_group] ON 

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
SET IDENTITY_INSERT [dbo].[nbers_group] OFF
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

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
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

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
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'27                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'26                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'30                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 5 ,
          N'31                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'22                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'1                               '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 1 ,
          N'4                               '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 2 ,
          N'3                               '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 7 ,
          N'2                               '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'27                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'26                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 4 ,
          N'30                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 5 ,
          N'31                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'22                              '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 3 ,
          N'1                               '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 1 ,
          N'4                               '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 2 ,
          N'3                               '
        )
INSERT  [dbo].[nbers_role_user]
        ( [role_id] ,
          [user_id]
        )
VALUES  ( 7 ,
          N'2                               '
        )
SET IDENTITY_INSERT [dbo].[nbers_user] ON 

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
SET IDENTITY_INSERT [dbo].[nbers_user] OFF
