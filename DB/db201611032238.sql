USE [N_Bers_aj]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__type___1CBC4616]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__statu__1BC821DD]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__verif__1AD3FDA4]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__login__19DFD96B]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__last___18EBB532]
GO
ALTER TABLE [dbo].[nbers_user] DROP CONSTRAINT [DF__nbers_use__last___17F790F9]
GO
ALTER TABLE [dbo].[nbers_role_user] DROP CONSTRAINT [DF__nbers_rol__user___151B244E]
GO
ALTER TABLE [dbo].[nbers_role_user] DROP CONSTRAINT [DF__nbers_rol__role___14270015]
GO
ALTER TABLE [dbo].[nbers_role] DROP CONSTRAINT [DF__nbers_rol__statu__32AB8735]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__group__0B91BA14]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__enabl__0A9D95DB]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__modul__09A971A2]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__sortC__08B54D69]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__level__07C12930]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_node__icon__06CD04F7]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__param__05D8E0BE]
GO
ALTER TABLE [dbo].[nbers_node] DROP CONSTRAINT [DF__nbers_nod__versi__04E4BC85]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__show__208CD6FA]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_grou__sort__1F98B2C1]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__statu__1EA48E88]
GO
ALTER TABLE [dbo].[nbers_group] DROP CONSTRAINT [DF__nbers_gro__updat__1DB06A4F]
GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_user]
GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_role_user]
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_role]
GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_node]
GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_group]
GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_form]
GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_businessunit]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/11/3 22:38:29 ******/
DROP TABLE [dbo].[nbers_access]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/11/3 22:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_access]
    (
      [id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [role_id] [INT] NOT NULL ,
      [node_id] [INT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/11/3 22:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_businessunit]
    (
      [id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [unit_name] [NVARCHAR](100) NOT NULL ,
      [unit_fullname] [NVARCHAR](500) NULL ,
      [pid] [INT] NULL ,
      [unit_type] [INT] NULL ,
      [child_type] [NVARCHAR](50) NULL ,
      [unit_auditorname] [NVARCHAR](50) NULL ,
      [unit_auditor] [INT] NULL ,
      [createby] [INT] NULL ,
      [createon] [DATETIME] NULL ,
      [unit_figure] [TEXT] NULL ,
      [unit_duty] [TEXT] NULL ,
      [remark] [NVARCHAR](50) NULL ,
      CONSTRAINT [PK__nbers_bu__3213E83FD4BE07E6] PRIMARY KEY CLUSTERED
        ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/11/3 22:38:29 ******/
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
      [status] [INT] NOT NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/11/3 22:38:29 ******/
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

GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/11/3 22:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_node]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [version] [BIGINT] NULL ,
      [parentId] [INT] NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [url] [VARCHAR](500) NULL ,
      [params] [VARCHAR](200) NULL ,
      [icon] [VARCHAR](200) NULL ,
      [levels] [INT] NULL ,
      [sortCode] [INT] NULL ,
      [moduleId] [VARCHAR](32) NULL ,
      [enable] [VARCHAR](11) NULL ,
      [group_id] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/11/3 22:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [name] [NVARCHAR](20) NOT NULL ,
      [status] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/11/3 22:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role_user]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [role_id] [INT] NULL ,
      [user_id] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/11/3 22:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_user]
    (
      [id] [INT] IDENTITY(0, 1)
                 NOT NULL ,
      [account] [NVARCHAR](64) NOT NULL ,
      [nickname] [NVARCHAR](50) NOT NULL ,
      [password] [CHAR](32) NOT NULL ,
      [bind_account] [VARCHAR](50) NULL ,
      [last_login_time] [INT] NULL ,
      [last_login_ip] [VARCHAR](40) NULL ,
      [login_count] [INT] NULL ,
      [verify] [NVARCHAR](32) NULL ,
      [email] [NVARCHAR](50) NULL ,
      [remark] [NVARCHAR](255) NULL ,
      [create_time] [INT] NULL ,
      [update_time] [INT] NULL ,
      [status] [INT] NULL ,
      [type_id] [INT] NULL ,
      [info] [TEXT] NULL ,
      [phone] [NVARCHAR](11) NULL ,
      [is_admin] [TINYINT] NULL ,
      [unit_id] [INT] NULL ,
      [isdisable] [TINYINT] NULL ,
      CONSTRAINT [PK__nbers_us__3213E83F5D436D18] PRIMARY KEY CLUSTERED
        ( [id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_access] ON 

GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 1, 1, 1 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 2, 1, 2 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 3, 1, 3 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 4, 1, 4 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 5, 1, 5 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 6, 2, 4 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 7, 2, 5 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 8, 1, 6 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 9, 1, 10 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 11, 1, 13 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 12, 1, 14 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 13, 1, 15 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 14, 1, 17 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 15, 1, 8 )
GO
INSERT  [dbo].[nbers_access]
        ( [id], [role_id], [node_id] )
VALUES  ( 16, 1, 9 )
GO
SET IDENTITY_INSERT [dbo].[nbers_access] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_businessunit] ON 

GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 1 ,
          N'安质管理工程局' ,
          N'1231' ,
          NULL ,
          0 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B1018A2467 AS DATETIME) ,
          N'3123' ,
          N'312' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 2 ,
          N'质量管理部' ,
          N'3132131' ,
          1 ,
          1 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B1018A343E AS DATETIME) ,
          N'312' ,
          N'32' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 3 ,
          N'安全管理部' ,
          N'安全管理部' ,
          1 ,
          1 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B301486793 AS DATETIME) ,
          N'312' ,
          N'123' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 4 ,
          N'主任' ,
          N'3' ,
          3 ,
          2 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          N'123' ,
          N'312' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 5 ,
          N'副主任' ,
          N'3131231' ,
          3 ,
          2 ,
          N'长工' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B30174E0A2 AS DATETIME) ,
          N'3123' ,
          N'31231' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 6 ,
          N'安质专责' ,
          NULL ,
          3 ,
          2 ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 7 ,
          N'综合专责' ,
          NULL ,
          3 ,
          2 ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 8 ,
          N'测试部门' ,
          NULL ,
          1 ,
          1 ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          CAST(0x0000A6B3015B7956 AS DATETIME) ,
          NULL ,
          NULL ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 19 ,
          N'新增部门' ,
          N'新增部门_1103' ,
          1 ,
          1 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B30160B85C AS DATETIME) ,
          N'阿飞士大夫撒旦发' ,
          N'企鹅企鹅' ,
          NULL
        )
GO
INSERT  [dbo].[nbers_businessunit]
        ( [id] ,
          [unit_name] ,
          [unit_fullname] ,
          [pid] ,
          [unit_type] ,
          [child_type] ,
          [unit_auditorname] ,
          [unit_auditor] ,
          [createby] ,
          [createon] ,
          [unit_figure] ,
          [unit_duty] ,
          [remark]
        )
VALUES  ( 20 ,
          N'新增岗位' ,
          N'新增岗位_1103' ,
          19 ,
          2 ,
          N'农电' ,
          NULL ,
          NULL ,
          1 ,
          CAST(0x0000A6B30160E69B AS DATETIME) ,
          N'qrqwr' ,
          N'rqerwerqerw' ,
          NULL
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_businessunit] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 1 ,
          1 ,
          0 ,
          N'系统设置' ,
          NULL ,
          NULL ,
          NULL ,
          1 ,
          1 ,
          N'system' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 2 ,
          1 ,
          1 ,
          N'用户管理' ,
          N'/UserManage/UserIndex.aspx' ,
          NULL ,
          N'' ,
          2 ,
          1 ,
          N'system' ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 3 ,
          1 ,
          1 ,
          N'角色管理' ,
          N'/SystemManage/RoleIndex.aspx?nodeid=3' ,
          NULL ,
          NULL ,
          2 ,
          2 ,
          N'system' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 4 ,
          1 ,
          0 ,
          N'基础信息' ,
          NULL ,
          NULL ,
          NULL ,
          1 ,
          2 ,
          N'base' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 5 ,
          1 ,
          4 ,
          N'部门管理' ,
          N'/UserManage/UnitIndex.aspx?nodeid=5' ,
          NULL ,
          NULL ,
          2 ,
          1 ,
          N'base' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 6 ,
          1 ,
          5 ,
          N'新增' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          1 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 8 ,
          1 ,
          5 ,
          N'编辑' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 9 ,
          1 ,
          5 ,
          N'删除' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 10 ,
          1 ,
          2 ,
          N'新增' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          1 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 11 ,
          1 ,
          2 ,
          N'编辑' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 12 ,
          1 ,
          2 ,
          N'删除' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          3 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 13 ,
          1 ,
          1 ,
          N'菜单管理' ,
          N'/SystemManage/MenuIndex.aspx?nodeid=13' ,
          NULL ,
          NULL ,
          2 ,
          3 ,
          N'system' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 14 ,
          1 ,
          13 ,
          N'新增' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          1 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 15 ,
          1 ,
          13 ,
          N'编辑' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          2 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 17 ,
          1 ,
          13 ,
          N'删除' ,
          NULL ,
          NULL ,
          NULL ,
          0 ,
          3 ,
          NULL ,
          N'1' ,
          1
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 18 ,
          1 ,
          4 ,
          N'用户管理' ,
          N'/UserManage/UserIndex.aspx?nodeid=18' ,
          NULL ,
          N'' ,
          2 ,
          2 ,
          N'base' ,
          N'1' ,
          0
        )
GO
INSERT  [dbo].[nbers_node]
        ( [id] ,
          [version] ,
          [parentId] ,
          [name] ,
          [url] ,
          [params] ,
          [icon] ,
          [levels] ,
          [sortCode] ,
          [moduleId] ,
          [enable] ,
          [group_id]
        )
VALUES  ( 20 ,
          1 ,
          4 ,
          N'岗位管理' ,
          N'/UserManage/StationIndex.aspx?nodeid=20' ,
          NULL ,
          NULL ,
          2 ,
          1 ,
          N'base' ,
          N'1' ,
          0
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

GO
INSERT  [dbo].[nbers_role]
        ( [id], [name], [status] )
VALUES  ( 1, N'管理员', 1 )
GO
INSERT  [dbo].[nbers_role]
        ( [id], [name], [status] )
VALUES  ( 2, N'系统测试员', 1 )
GO
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] ON 

GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 8, 1, 1 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 9, 2, 2 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 10, 2, 3 )
GO
INSERT  [dbo].[nbers_role_user]
        ( [id], [role_id], [user_id] )
VALUES  ( 11, 2, 4 )
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] OFF
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
        )
VALUES  ( 1 ,
          N'admin' ,
          N'管理员AA' ,
          N'21232F297A57A5A743894A0E4A801FC3' ,
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
          N'2312' ,
          N'231' ,
          NULL ,
          4 ,
          NULL
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
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
          N'' ,
          N'231' ,
          NULL ,
          7 ,
          NULL
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
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
          N'' ,
          N'0' ,
          NULL ,
          5 ,
          NULL
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
          [info] ,
          [phone] ,
          [is_admin] ,
          [unit_id] ,
          [isdisable]
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
          N'' ,
          N'231' ,
          NULL ,
          20 ,
          NULL
        )
GO
SET IDENTITY_INSERT [dbo].[nbers_user] OFF
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [update_time]
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [sort]
GO
ALTER TABLE [dbo].[nbers_group] ADD  DEFAULT ('0') FOR [show]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [version]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [params]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [icon]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT ('0') FOR [levels]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [sortCode]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [moduleId]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT (NULL) FOR [enable]
GO
ALTER TABLE [dbo].[nbers_node] ADD  DEFAULT ('0') FOR [group_id]
GO
ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [role_id]
GO
ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__last___17F790F9]  DEFAULT ('0') FOR [last_login_time]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__last___18EBB532]  DEFAULT (NULL) FOR [last_login_ip]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__login__19DFD96B]  DEFAULT ('0') FOR [login_count]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__verif__1AD3FDA4]  DEFAULT (NULL) FOR [verify]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__statu__1BC821DD]  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[nbers_user] ADD  CONSTRAINT [DF__nbers_use__type___1CBC4616]  DEFAULT ('0') FOR [type_id]
GO
