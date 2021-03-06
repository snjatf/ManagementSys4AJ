USE [N_Bers_aj]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_access](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[node_id] [int] NOT NULL,
	[level] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[module] [nvarchar](50) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_businessunit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [nvarchar](100) NOT NULL,
	[unit_fullname] [nvarchar](500) NULL,
	[pid] [int] NULL,
	[unit_auditorname] [nvarchar](50) NULL,
	[unit_auditor] [int] NULL,
	[createby] [int] NULL,
	[createon] [datetime] NULL,
	[unit_type] [int] NULL,
	[remark] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_form](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](255) NOT NULL,
	[create_time] [timestamp] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_group](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL DEFAULT ('0'),
	[status] [int] NOT NULL DEFAULT ('0'),
	[sort] [int] NOT NULL DEFAULT ('0'),
	[show] [int] NOT NULL DEFAULT ('0'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_node](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[title] [nvarchar](50) NULL DEFAULT (NULL),
	[status] [int] NULL DEFAULT ('0'),
	[remark] [nvarchar](255) NULL DEFAULT (NULL),
	[sort] [int] NULL DEFAULT (NULL),
	[pid] [int] NOT NULL,
	[level] [int] NOT NULL,
	[type] [int] NOT NULL DEFAULT ('0'),
	[group_id] [int] NULL DEFAULT ('0'),
	[url] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[pid] [int] NULL DEFAULT (NULL),
	[status] [int] NULL DEFAULT (NULL),
	[remark] [nvarchar](255) NULL DEFAULT (NULL),
	[ename] [nvarchar](5) NULL DEFAULT (NULL),
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role_user](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[role_id] [int] NULL DEFAULT (NULL),
	[user_id] [int] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/25 17:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_user](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[account] [nvarchar](64) NOT NULL,
	[nickname] [nvarchar](50) NOT NULL,
	[password] [char](32) NOT NULL,
	[bind_account] [varchar](50) NOT NULL,
	[last_login_time] [int] NULL DEFAULT ('0'),
	[last_login_ip] [varchar](40) NULL DEFAULT (NULL),
	[login_count] [int] NULL DEFAULT ('0'),
	[verify] [nvarchar](32) NULL DEFAULT (NULL),
	[email] [nvarchar](50) NOT NULL,
	[remark] [nvarchar](255) NOT NULL,
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
	[status] [int] NULL DEFAULT ('0'),
	[type_id] [int] NULL DEFAULT ('0'),
	[info] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_access] ON 

INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (1, 2, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (2, 2, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (3, 2, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (4, 3, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (5, 2, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (6, 2, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (7, 3, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (8, 1, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (9, 3, 7, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (10, 3, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (11, 2, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (12, 2, 49, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (13, 4, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (14, 4, 2, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (15, 4, 3, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (16, 4, 4, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (17, 4, 5, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (18, 4, 6, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (19, 4, 7, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (20, 4, 11, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (21, 5, 25, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (22, 5, 51, 2, 25, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (23, 1, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (24, 1, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (25, 1, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (26, 1, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (27, 1, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (28, 1, 49, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (29, 3, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (30, 3, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (31, 3, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (32, 1, 37, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (33, 1, 36, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (34, 1, 35, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (35, 1, 34, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (36, 1, 33, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (37, 1, 32, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (38, 1, 31, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (39, 2, 32, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (40, 2, 31, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (41, 7, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (42, 7, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (43, 7, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (44, 7, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (45, 7, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (46, 7, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (47, 7, 49, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (48, 2, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (49, 2, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (50, 2, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (51, 3, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (52, 2, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (53, 2, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (54, 3, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (55, 1, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (56, 3, 7, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (57, 3, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (58, 2, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (59, 2, 49, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (60, 4, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (61, 4, 2, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (62, 4, 3, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (63, 4, 4, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (64, 4, 5, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (65, 4, 6, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (66, 4, 7, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (67, 4, 11, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (68, 5, 25, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (69, 5, 51, 2, 25, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (70, 1, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (71, 1, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (72, 1, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (73, 1, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (74, 1, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (75, 1, 49, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (76, 3, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (77, 3, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (78, 3, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (79, 1, 37, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (80, 1, 36, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (81, 1, 35, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (82, 1, 34, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (83, 1, 33, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (84, 1, 32, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (85, 1, 31, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (86, 2, 32, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (87, 2, 31, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (88, 7, 1, 1, 0, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (89, 7, 30, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (90, 7, 40, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (91, 7, 69, 2, 1, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (92, 7, 50, 3, 40, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (93, 7, 39, 3, 30, NULL)
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id], [level], [pid], [module]) VALUES (94, 7, 49, 3, 30, NULL)
SET IDENTITY_INSERT [dbo].[nbers_access] OFF
SET IDENTITY_INSERT [dbo].[nbers_businessunit] ON 

INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_type], [remark]) VALUES (1, N'1', N'1', 0, NULL, NULL, 1, CAST(N'2016-10-23 22:26:26.093' AS DateTime), 0, N'4')
SET IDENTITY_INSERT [dbo].[nbers_businessunit] OFF
SET IDENTITY_INSERT [dbo].[nbers_group] ON 

INSERT [dbo].[nbers_group] ([id], [name], [title], [create_time], [update_time], [status], [sort], [show]) VALUES (2, N'App', N'应用中心', 1222841259, 0, 1, 0, 0)
INSERT [dbo].[nbers_group] ([id], [name], [title], [create_time], [update_time], [status], [sort], [show]) VALUES (6, N'menu', N'菜单权限', 0, 0, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[nbers_group] OFF
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (1, N'App', N'Rbac后台管理', 1, N'', NULL, 0, 1, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (2, N'Node', N'节点管理', 1, N'', 2, 1, 2, 0, 2, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (6, N'Role', N'角色管理', 1, N'', 3, 1, 2, 0, 2, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (7, N'User', N'后台用户', 1, N'', 4, 1, 2, 0, 2, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (30, N'Public', N'公共模块', 1, N'', 2, 1, 2, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (31, N'add', N'新增', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (32, N'insert', N'写入', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (33, N'edit', N'编辑', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (34, N'update', N'更新', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (35, N'foreverdelete', N'删除', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (36, N'forbid', N'禁用', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (37, N'resume', N'恢复', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (39, N'index', N'列表', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (40, N'Index', N'默认模块', 1, N'', 1, 1, 2, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (49, N'read', N'查看', 1, N'', NULL, 30, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (50, N'main', N'空白首页', 1, N'', NULL, 40, 3, 0, 0, NULL)
INSERT [dbo].[nbers_node] ([id], [name], [title], [status], [remark], [sort], [pid], [level], [type], [group_id], [url]) VALUES (69, N'Form', N'数据管理', 1, N'', 1, 1, 2, 0, 2, NULL)
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

INSERT [dbo].[nbers_role] ([id], [name], [pid], [status], [remark], [ename], [create_time], [update_time]) VALUES (1, N'领导组', 0, 1, N'', N'', 1208784792, 1254325558)
INSERT [dbo].[nbers_role] ([id], [name], [pid], [status], [remark], [ename], [create_time], [update_time]) VALUES (2, N'员工组', 0, 1, N'', N'', 1215496283, 1254325566)
INSERT [dbo].[nbers_role] ([id], [name], [pid], [status], [remark], [ename], [create_time], [update_time]) VALUES (7, N'演示组', 0, 1, N'', NULL, 1254325787, 0)
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
SET IDENTITY_INSERT [dbo].[nbers_role_user] ON 

INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (0, 4, 27)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (1, 4, 26)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (2, 5, 31)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (3, 3, 22)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (4, 3, 1)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (5, 1, 4)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (6, 2, 3)
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (7, 7, 2)
SET IDENTITY_INSERT [dbo].[nbers_role_user] OFF
SET IDENTITY_INSERT [dbo].[nbers_user] ON 

INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (1, N'admin', N'管理员', N'21232f297a57a5a743894a0e4a801fc3', N'', 1326335612, N'127.0.0.1', 888, N'8888', N'liu21st@gmail.com', N'备注信息', 1222907803, 1326266696, 1, 0, N'')
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (2, N'demo', N'演示', N'fe01ce2a7fbac8fafaed7c982a04e229', N'', 1254326091, N'127.0.0.1', 90, N'8888', N'', N'', 1239783735, 1254325770, 1, 0, N'')
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (3, N'member', N'员工', N'aa08769cdcb26674c6706093503ff0a3', N'', 1326266720, N'127.0.0.1', 17, N'', N'', N'', 1253514375, 1254325728, 1, 0, N'')
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (4, N'leader', N'领导', N'c444858e0aaeb727da73d2eae62321ad', N'', 1254325906, N'127.0.0.1', 15, N'', N'', N'领导', 1253514575, 1254325705, 1, 0, N'')
SET IDENTITY_INSERT [dbo].[nbers_user] OFF
