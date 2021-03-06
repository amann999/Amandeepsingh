USE [bell_field_services]
GO
/****** Object:  User [abc]    Script Date: 01-03-2020 10:14:51 AM ******/
CREATE USER [abc] FOR LOGIN [abc] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [abc]
GO
/****** Object:  Table [dbo].[emp_dept]    Script Date: 01-03-2020 10:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_dept](
	[dept] [varchar](255) NOT NULL,
	[emp_name] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 01-03-2020 10:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[requested_by] [varchar](255) NOT NULL,
	[department] [varchar](255) NOT NULL,
	[doc] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Division of Telecommunications Extranet Development', N'Roma Marcell')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Extranet Multimedia Connectivity and Security Division', N'Hugo Wess')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Branch of Extranet Implementation', N'Kelvin Lahr')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Division of Telecommunications Extranet Development', N'Janelle Newberg')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Branch of Intranet Computer Maintenance and E-Commerce PC Programming', N'Mellie Lombard')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Wireless Extranet Backup Team', N'Reita Abshire')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Database Programming Branch', N'Dalila Vickrey')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Branch of Extranet Implementation', N'Idella Dallman')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Hardware Backup Department', N'Farah Eldridge')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Hardware Backup Department', N'Lana Montes')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Extranet Multimedia Connectivity and Security Division', N'Leola Thornburg')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Database Programming Branch', N'Marcelo Paris')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Multimedia Troubleshooting and Maintenance Team', N'Ione Tomlin')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Multimedia Troubleshooting and Maintenance Team', N'Hilario Masterson')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Wireless Extranet Backup Team', N'Janice Skipper')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Office of Statistical Data Connectivity', N'Keren Gillespi')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Division of Telecommunications Extranet Development', N'Linh Leitzel')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Division of Application Security', N'Rosalia Ayoub')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Branch of Intranet Computer Maintenance and E-Commerce PC Programming', N'Shawna Hood')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Network Maintenance and Multimedia Implementation Committee', N'Wilfredo Stumpf')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Office of Statistical Data Connectivity', N'Alexandra Brendle')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Mainframe PC Development and Practacal Source Code Acquisition Team', N'Luciano Riddell')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Network Maintenance and Multimedia Implementation Committee', N'Boyce Perales')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Division of Telecommunications Extranet Development', N'Alissa Perlman')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Network Maintenance and Multimedia Implementation Committee', N'Latoyia Kremer')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Wireless Extranet Backup Team', N'Tawna Blackmore')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Hardware Backup Department', N'Claudine Valderrama')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Network Maintenance and Multimedia Implementation Committee', N'Katheryn Lepak')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Multimedia Troubleshooting and Maintenance Team', N'Sage Bow')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Hardware Backup Department', N'Altha Rudisill')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Division of Application Security', N'Olympia Vien')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'PC Maintenance Department', N'Olene Pyron')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Extranet Multimedia Connectivity and Security Division', N'Delorse Searle')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Bureau of Business-Oriented PC Backup and Wireless Telecommunications Control', N'Greta Quigg')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Branch of Intranet Computer Maintenance and E-Commerce PC Programming', N'Kenneth Bowie')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Hardware Backup Department', N'Colton Kranz')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Multimedia Troubleshooting and Maintenance Team', N'Kasie Barclay')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Extranet Multimedia Connectivity and Security Division', N'Thresa Levins')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Software Technology and Networking Department', N'Diego Hasbrouck')
INSERT [dbo].[emp_dept] ([dept], [emp_name]) VALUES (N'Database Programming Branch', N'Tomoko Gale')
