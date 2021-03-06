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
ALTER TABLE [dbo].[nbers_role] DROP CONSTRAINT [DF__nbers_rol__ename__114A936A]
GO
ALTER TABLE [dbo].[nbers_role] DROP CONSTRAINT [DF__nbers_rol__remar__10566F31]
GO
ALTER TABLE [dbo].[nbers_role] DROP CONSTRAINT [DF__nbers_rol__statu__0F624AF8]
GO
ALTER TABLE [dbo].[nbers_role] DROP CONSTRAINT [DF__nbers_role__pid__0E6E26BF]
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
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_user]
GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_role_user]
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_role]
GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_node]
GO
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_group]
GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_form]
GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_businessunit]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/28 0:16:59 ******/
DROP TABLE [dbo].[nbers_access]
GO
USE [master]
GO
/****** Object:  Database [N_Bers_aj]    Script Date: 2016/10/28 0:16:59 ******/
DROP DATABASE [N_Bers_aj]
GO
/****** Object:  Database [N_Bers_aj]    Script Date: 2016/10/28 0:16:59 ******/
CREATE DATABASE [N_Bers_aj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'N_Bers_aj', FILENAME = N'D:\99CodeBitch\11DB\aj\N_Bers_aj.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'N_Bers_aj_log', FILENAME = N'D:\99CodeBitch\11DB\aj\N_Bers_aj_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [N_Bers_aj] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [N_Bers_aj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ARITHABORT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [N_Bers_aj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [N_Bers_aj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [N_Bers_aj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [N_Bers_aj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [N_Bers_aj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [N_Bers_aj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [N_Bers_aj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [N_Bers_aj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [N_Bers_aj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [N_Bers_aj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [N_Bers_aj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [N_Bers_aj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [N_Bers_aj] SET RECOVERY FULL 
GO
ALTER DATABASE [N_Bers_aj] SET  MULTI_USER 
GO
ALTER DATABASE [N_Bers_aj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [N_Bers_aj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [N_Bers_aj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [N_Bers_aj] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'N_Bers_aj', N'ON'
GO
USE [N_Bers_aj]
GO
/****** Object:  Table [dbo].[nbers_access]    Script Date: 2016/10/28 0:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_access](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[node_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_businessunit]    Script Date: 2016/10/28 0:16:59 ******/
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
	[unit_figure] [text] NULL,
	[unit_duty] [text] NULL,
	[unit_type] [nvarchar](50) NULL,
	[remark] [nvarchar](50) NULL,
 CONSTRAINT [PK__nbers_bu__3213E83FD4BE07E6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_form]    Script Date: 2016/10/28 0:16:59 ******/
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
/****** Object:  Table [dbo].[nbers_group]    Script Date: 2016/10/28 0:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_group](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
	[status] [int] NOT NULL,
	[sort] [int] NOT NULL,
	[show] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_node]    Script Date: 2016/10/28 0:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nbers_node](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[version] [bigint] NULL,
	[parentId] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[url] [varchar](500) NULL,
	[params] [varchar](200) NULL,
	[icon] [varchar](200) NULL,
	[levels] [int] NULL,
	[sortCode] [int] NULL,
	[moduleId] [varchar](32) NULL,
	[enable] [varchar](11) NULL,
	[group_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nbers_role]    Script Date: 2016/10/28 0:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[pid] [int] NULL,
	[status] [int] NULL,
	[remark] [nvarchar](255) NULL,
	[ename] [nvarchar](5) NULL,
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_role_user]    Script Date: 2016/10/28 0:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nbers_role_user](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[role_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nbers_user]    Script Date: 2016/10/28 0:16:59 ******/
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
	[last_login_time] [int] NULL,
	[last_login_ip] [varchar](40) NULL,
	[login_count] [int] NULL,
	[verify] [nvarchar](32) NULL,
	[email] [nvarchar](50) NOT NULL,
	[remark] [nvarchar](255) NOT NULL,
	[create_time] [int] NOT NULL,
	[update_time] [int] NOT NULL,
	[status] [int] NULL,
	[type_id] [int] NULL,
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

GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (2, 1, 2)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (3, 1, 3)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (4, 1, 4)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (5, 1, 5)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (6, 2, 4)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (7, 2, 5)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (8, 1, 6)
GO
INSERT [dbo].[nbers_access] ([id], [role_id], [node_id]) VALUES (9, 1, 10)
GO
SET IDENTITY_INSERT [dbo].[nbers_access] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_businessunit] ON 

GO
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [unit_type], [remark]) VALUES (1, N'安全部下级', N'安全部下级', 2, NULL, NULL, 1, CAST(0x0000A6AB01817C71 AS DateTime), N'a)	绩效考核办法。录入一些绩效考核的规章制度文件等。
b)	绩效考核。绩效考核分为月度考核、季度考核、年度考核，以绩效考核报告形式录入。
c)	工作计划。工作计划模块包括年度工作计划、月度工作计划、周工作计划。其中年度工作计划……。月度工作计划，录入月度工作计划报告，报告内容主要包括上月工作计划完成情况和本月预计完成工作计划。周工作计划。录入具体每周的工作内容，以文本形式录入；
d)	制度管理。录入一些制度文件。
e)	上级来文：录入上级发来的文件，比如“关于印发员工考勤管理办法的通知（文件）”。
（3）安全管理
安全管理中包含安全稽查、安全例会、考试考核、教育培训、资质审核、交通安全6个。
a)	安全稽查。安全稽查分为三个部分。稽查标准（录入文件，标准文档）、稽查计划（录入文本信息，计划内容）、稽查报告（录入文本信息，周报内容）。
b)	安全例会。本模块用于录入安全例会信息，例会信息分为三类，月度例会信息、季度例会信息和其他专题安全学习。录入内容是每次例会的报告，需要落款执行公司和时间、标题、地点、主持人、参加人员和内容。月度例会和季度例会类似，而其他专题安全歇息是以文件形式录入工作报告；
c)	安规考试。安规考试包括三类，分别是上级安规考试、本公司安规考试、安全事件考核。需录入相关文件；
d)	教育培训。类似安全考试，也是录入相关的文件。
e)	资质审核。资质审核内容有个人资质管理、项目管理、分包商管理三块内容。分别都是以上传文件形式提交数据。
f)	车辆管理。车辆管理模块包括车辆信息、驾驶员信息、车辆安全检查三部分，同样也是上传相关文件。
（4）质量管理
“三体系”建设。录入一些三体系的相关文件。
（5）分公司管理。
分公司管理模块包含分公司岗位人员信息、分公司安全稽查月报、工器具配置标准、工器具配置情况、分公司奖惩情况统计。
a)	岗位人员信息
b)	安全稽查通报
c)	工器具配置标准
d)	工器具评价管理
e)	分公司考核兑现
', N'系统非功能需求
4.1 不同客户端提供的服务差异性
系统平台的访问模式为B/S模式，提供基本功能。其优势在于访问方便，只需要输入网址即可实现基本功能。也方便远程办公、随时随地查看系统数据。
4.2 项目开发环境及技术
本系统打算采用asp.net技术和Sql server数据库（暂用），后台管理系统界面使用LigerUI框架搭建，前台界面自行设计。
', N'0', N'4')
GO
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [unit_type], [remark]) VALUES (2, N'安全部', N'安全部', 0, NULL, NULL, 1, CAST(0x0000A6AA01885F4E AS DateTime), NULL, N'231', N'农电', N'31231')
GO
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [unit_type], [remark]) VALUES (3, N'质检部', N'质检部', 0, NULL, NULL, 1, CAST(0x0000A6AA01834644 AS DateTime), NULL, NULL, N'0', N'')
GO
INSERT [dbo].[nbers_businessunit] ([id], [unit_name], [unit_fullname], [pid], [unit_auditorname], [unit_auditor], [createby], [createon], [unit_figure], [unit_duty], [unit_type], [remark]) VALUES (5, N'1231', N'1231', NULL, NULL, NULL, 1, CAST(0x0000A6AD0003C88C AS DateTime), N'1231', N'13', N'农电', NULL)
GO
SET IDENTITY_INSERT [dbo].[nbers_businessunit] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (1, 1, 0, N'系统设置', NULL, NULL, NULL, 1, 1, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (2, 1, 1, N'用户管理', N'/UserManage/UserIndex.aspx', NULL, NULL, 2, 1, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (3, 1, 1, N'角色管理', NULL, NULL, NULL, 2, 2, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (4, 1, 0, N'基础信息', NULL, NULL, NULL, 1, 2, N'base', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (5, 1, 4, N'部门', N'/UserManage/UnitIndex.aspx?nodeid=5', NULL, NULL, 2, 1, N'base', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (6, 1, 5, N'增加', NULL, NULL, NULL, 0, 1, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (8, 1, 5, N'修改', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (9, 1, 5, N'删除', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (10, 1, 2, N'增加', NULL, NULL, NULL, 0, 1, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (11, 1, 2, N'修改', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (12, 1, 2, N'删除', NULL, NULL, NULL, 0, 2, NULL, N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

GO
INSERT [dbo].[nbers_role] ([id], [name], [pid], [status], [remark], [ename], [create_time], [update_time]) VALUES (1, N'管理员', 0, 1, N'', N'', 1208784792, 1254325558)
GO
INSERT [dbo].[nbers_role] ([id], [name], [pid], [status], [remark], [ename], [create_time], [update_time]) VALUES (2, N'系统测试员', 0, 1, N'', N'', 1215496283, 1254325566)
GO
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] ON 

GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (8, 1, 1)
GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (9, 2, 2)
GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (10, 2, 3)
GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (11, 2, 4)
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_user] ON 

GO
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (1, N'admin', N'管理员AA', N'21232f297a57a5a743894a0e4a801fc3', N'', 1326335612, N'127.0.0.1', 888, N'8888', N'liu21st@gmail.com', N'备注信息', 1222907803, 1326266696, 1, 0, N'')
GO
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (2, N'demo', N'演示', N'fe01ce2a7fbac8fafaed7c982a04e229', N'', 1254326091, N'127.0.0.1', 90, N'8888', N'', N'', 1239783735, 1254325770, 1, 0, N'')
GO
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (3, N'member', N'员工', N'aa08769cdcb26674c6706093503ff0a3', N'', 1326266720, N'127.0.0.1', 17, N'', N'', N'', 1253514375, 1254325728, 1, 0, N'')
GO
INSERT [dbo].[nbers_user] ([id], [account], [nickname], [password], [bind_account], [last_login_time], [last_login_ip], [login_count], [verify], [email], [remark], [create_time], [update_time], [status], [type_id], [info]) VALUES (4, N'leader', N'领导', N'c444858e0aaeb727da73d2eae62321ad', N'', 1254325906, N'127.0.0.1', 15, N'', N'', N'领导', 1253514575, 1254325705, 1, 0, N'')
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
ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [pid]
GO
ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [remark]
GO
ALTER TABLE [dbo].[nbers_role] ADD  DEFAULT (NULL) FOR [ename]
GO
ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [role_id]
GO
ALTER TABLE [dbo].[nbers_role_user] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [last_login_time]
GO
ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT (NULL) FOR [last_login_ip]
GO
ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [login_count]
GO
ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT (NULL) FOR [verify]
GO
ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[nbers_user] ADD  DEFAULT ('0') FOR [type_id]
GO
USE [master]
GO
ALTER DATABASE [N_Bers_aj] SET  READ_WRITE 
GO
