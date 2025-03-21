USE [ProductionSchedulingSystem_DB]
GO
/****** Object:  Table [dbo].[Attendances]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[atid] [int] IDENTITY(1,1) NOT NULL,
	[waid] [int] NULL,
	[actualquantity] [int] NOT NULL,
	[alpha] [float] NOT NULL,
	[note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[atid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[did] [int] IDENTITY(1,1) NOT NULL,
	[dname] [nvarchar](100) NOT NULL,
	[type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[eid] [int] IDENTITY(1,1) NOT NULL,
	[ename] [nvarchar](100) NOT NULL,
	[did] [int] NULL,
	[phonenumber] [nvarchar](15) NULL,
	[address] [nvarchar](255) NULL,
	[sid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[fid] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NOT NULL,
	[url] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDetails]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDetails](
	[pdid] [int] IDENTITY(1,1) NOT NULL,
	[phid] [int] NULL,
	[sid] [int] NULL,
	[date] [date] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__PlanDeta__B7E745CD265F44B2] PRIMARY KEY CLUSTERED 
(
	[pdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanHeaders]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanHeaders](
	[phid] [int] IDENTITY(1,1) NOT NULL,
	[plid] [int] NULL,
	[pid] [int] NULL,
	[quantity] [int] NULL,
	[estimatedeffort] [float] NULL,
 CONSTRAINT [PK__PlanHead__80E19250AEF340F1] PRIMARY KEY CLUSTERED 
(
	[phid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plans]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[plid] [int] IDENTITY(1,1) NOT NULL,
	[plname] [nvarchar](100) NOT NULL,
	[startdate] [date] NOT NULL,
	[enddate] [date] NOT NULL,
	[did] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[plid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK__Products__B40CC6ED36CCA5BF] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeatures]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeatures](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeatures] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[rname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salaries]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salaries](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[slevel] [nvarchar](10) NOT NULL,
	[salary] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sname] [nvarchar](10) NOT NULL,
	[starttime] [time](7) NOT NULL,
	[endtime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[uid] [int] NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[active] [bit] NOT NULL,
	[email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkAssignments]    Script Date: 10/16/2024 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkAssignments](
	[waid] [int] IDENTITY(1,1) NOT NULL,
	[pdid] [int] NULL,
	[eid] [int] NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[waid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([did], [dname], [type]) VALUES (1, N'Administration Department', N'Head Office')
INSERT [dbo].[Departments] ([did], [dname], [type]) VALUES (2, N'Human Resources Department', N'Head Office')
INSERT [dbo].[Departments] ([did], [dname], [type]) VALUES (3, N'Planning Department', N'Head Office')
INSERT [dbo].[Departments] ([did], [dname], [type]) VALUES (4, N'Accounting Department', N'Head Office')
INSERT [dbo].[Departments] ([did], [dname], [type]) VALUES (5, N'Production Workshop No. 1', N'Production')
INSERT [dbo].[Departments] ([did], [dname], [type]) VALUES (6, N'Production Workshop No. 2', N'Production')
INSERT [dbo].[Departments] ([did], [dname], [type]) VALUES (7, N'Production Workshop No. 3', N'Production')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (1, N'Alice Johnson', 1, N'0123456789', N'123 Main St, City A', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (2, N'Bob Smith', 2, N'0987654321', N'456 Elm St, City A', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (3, N'Charlie Brown', 3, N'0112233445', N'789 Oak St, City A', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (4, N'Diana Prince', 4, N'0223344556', N'101 Pine St, City A', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (5, N'Eve Adams', 5, N'0334455667', N'111 Maple St, City B', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (6, N'Frank Castle', 5, N'0445566778', N'222 Birch St, City B', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (7, N'Grace Lee', 5, N'0556677889', N'333 Cedar St, City B', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (8, N'Helen Hunt', 5, N'0667788990', N'444 Willow St, City B', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (9, N'Henry Ford', 6, N'0778899001', N'555 Walnut St, City C', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (10, N'Isla Fisher', 6, N'0889900112', N'666 Fir St, City C', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (11, N'Jack Sparrow', 6, N'0990011223', N'777 Chestnut St, City C', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (12, N'Kurt Russell', 6, N'1101122334', N'888 Oak St, City C', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (13, N'Luke Skywalker', 7, N'1212233445', N'999 Ash St, City D', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (14, N'Mia Wallace', 7, N'1323344556', N'101 Elm St, City D', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (15, N'Nathan Drake', 7, N'1434455667', N'202 Pine St, City D', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (16, N'Olivia Wilde', 7, N'1545566778', N'303 Cedar St, City D', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (17, N'John Doe', 5, N'0334455668', N'222 Oak St, City B', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (18, N'Alice Smith', 5, N'0334455669', N'333 Pine St, City B', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (19, N'Michael Brown', 5, N'0334455670', N'444 Cedar St, City B', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (20, N'Laura Davis', 5, N'0334455671', N'555 Birch St, City B', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (21, N'Daniel Garcia', 5, N'0334455672', N'666 Elm St, City B', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (22, N'Sophia Wilson', 5, N'0334455673', N'777 Walnut St, City B', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (23, N'James Martinez', 6, N'0344455674', N'888 Chestnut St, City C', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (24, N'Isabella Clark', 6, N'0344455675', N'999 Redwood St, City C', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (25, N'William Lopez', 6, N'0344455676', N'1010 Fir St, City C', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (26, N'Mia Gonzalez', 6, N'0344455677', N'1111 Spruce St, City C', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (27, N'Benjamin Walker', 6, N'0344455678', N'1212 Poplar St, City C', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (28, N'Emily Lee', 6, N'0344455679', N'1313 Cypress St, City C', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (29, N'Olivia Harris', 7, N'0354455680', N'1414 Palm St, City D', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (30, N'Alexander Young', 7, N'0354455681', N'1515 Olive St, City D', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (31, N'Chloe King', 7, N'0354455682', N'1616 Holly St, City D', 3)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (32, N'Liam Scott', 7, N'0354455683', N'1717 Willow St, City D', 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (33, N'Ava Green', 7, N'0354455684', N'1818 Ash St, City D', 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [phonenumber], [address], [sid]) VALUES (34, N'Noah Baker', 7, N'0354455685', N'1919 Dogwood St, City D', 3)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (1, N'Add Employee', N'/employee/add')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (2, N'Update Employee', N'/employee/update')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (3, N'View Employee List', N'/employee/view')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (4, N'Delete Employee', N'/employee/delete')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (5, N'Create Production Plan', N'/plan/create')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (6, N'Update Production Plan', N'/plan/update')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (7, N'Delete Production Plan', N'/plan/delete')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (8, N'View Production Plan', N'/plan/view')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (9, N'View Efficiency Reports', N'/plan/report')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (10, N'Create Daily Production Plan', N'/plandetails/create')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (11, N'Update Daily Production Plan', N'/plandetails/update')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (12, N'View Daily Production Plan', N'/plandetails/view')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (13, N'Assign Work to Employee', N'/work/assign')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (14, N'Take Attendance', N'/attendance/take')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (15, N'Update Attendance', N'/attendance/update')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (16, N'View Attendance Report', N'/attendance/view')
INSERT [dbo].[Features] ([fid], [fname], [url]) VALUES (17, N'Generate Salary Report', N'/salary/report')
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanDetails] ON 

INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (1, 1, 1, CAST(N'2024-10-01' AS Date), 5)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (2, 2, 1, CAST(N'2024-10-01' AS Date), 3)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (3, 3, 1, CAST(N'2024-10-01' AS Date), 2)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (4, 1, 2, CAST(N'2024-10-01' AS Date), 5)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (5, 2, 2, CAST(N'2024-10-01' AS Date), 3)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (6, 3, 2, CAST(N'2024-10-01' AS Date), 2)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (7, 1, 3, CAST(N'2024-10-01' AS Date), 5)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (8, 2, 3, CAST(N'2024-10-01' AS Date), 3)
INSERT [dbo].[PlanDetails] ([pdid], [phid], [sid], [date], [quantity]) VALUES (9, 3, 3, CAST(N'2024-10-01' AS Date), 2)
SET IDENTITY_INSERT [dbo].[PlanDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanHeaders] ON 

INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (1, 1, 1, 100, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (2, 1, 2, 60, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (3, 1, 3, 50, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (4, 2, 1, 120, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (5, 2, 2, 130, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (6, 3, 2, 155, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (7, 3, 3, 80, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (8, 4, 1, 100, 1)
INSERT [dbo].[PlanHeaders] ([phid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (9, 4, 2, 200, 2)
SET IDENTITY_INSERT [dbo].[PlanHeaders] OFF
GO
SET IDENTITY_INSERT [dbo].[Plans] ON 

INSERT [dbo].[Plans] ([plid], [plname], [startdate], [enddate], [did]) VALUES (1, N'Test Plan for 1st Week of October', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-07' AS Date), 5)
INSERT [dbo].[Plans] ([plid], [plname], [startdate], [enddate], [did]) VALUES (2, N'Test Plan for 2nd Week of October', CAST(N'2024-10-08' AS Date), CAST(N'2024-10-14' AS Date), 6)
INSERT [dbo].[Plans] ([plid], [plname], [startdate], [enddate], [did]) VALUES (3, N'Test Plan for 3rd Week of October', CAST(N'2024-10-15' AS Date), CAST(N'2024-10-21' AS Date), 7)
INSERT [dbo].[Plans] ([plid], [plname], [startdate], [enddate], [did]) VALUES (4, N'Plan Stupid for WS3', CAST(N'2024-10-17' AS Date), CAST(N'2024-10-19' AS Date), 7)
SET IDENTITY_INSERT [dbo].[Plans] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([pid], [pname], [description]) VALUES (1, N'Product A', N'Description for Product A')
INSERT [dbo].[Products] ([pid], [pname], [description]) VALUES (2, N'Product B', N'Description for Product B')
INSERT [dbo].[Products] ([pid], [pname], [description]) VALUES (3, N'Product C', N'Description for Product C')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (1, 8)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (1, 9)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (1, 12)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (1, 16)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (1, 17)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (2, 1)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (2, 2)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (2, 3)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (2, 4)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (3, 5)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (3, 6)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (3, 7)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (3, 8)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (3, 9)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (4, 3)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (4, 17)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 8)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 10)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 11)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 12)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 13)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 14)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 15)
INSERT [dbo].[RoleFeatures] ([rid], [fid]) VALUES (5, 16)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([rid], [rname]) VALUES (1, N'Administration Manager')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (2, N'HR Manager')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (3, N'Planning Manager')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (4, N'Accounting Manager')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (5, N'Production Workshop Manager')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Salaries] ON 

INSERT [dbo].[Salaries] ([sid], [slevel], [salary]) VALUES (1, N'Level 1', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([sid], [slevel], [salary]) VALUES (2, N'Level 2', CAST(7000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([sid], [slevel], [salary]) VALUES (3, N'Level 3', CAST(9000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Salaries] OFF
GO
SET IDENTITY_INSERT [dbo].[Shifts] ON 

INSERT [dbo].[Shifts] ([sid], [sname], [starttime], [endtime]) VALUES (1, N'K1', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Shifts] ([sid], [sname], [starttime], [endtime]) VALUES (2, N'K2', CAST(N'16:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Shifts] ([sid], [sname], [starttime], [endtime]) VALUES (3, N'K3', CAST(N'00:00:00' AS Time), CAST(N'08:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Shifts] OFF
GO
INSERT [dbo].[UserRoles] ([uid], [rid]) VALUES (1, 1)
INSERT [dbo].[UserRoles] ([uid], [rid]) VALUES (2, 2)
INSERT [dbo].[UserRoles] ([uid], [rid]) VALUES (3, 3)
INSERT [dbo].[UserRoles] ([uid], [rid]) VALUES (4, 4)
INSERT [dbo].[UserRoles] ([uid], [rid]) VALUES (5, 5)
INSERT [dbo].[UserRoles] ([uid], [rid]) VALUES (6, 5)
INSERT [dbo].[UserRoles] ([uid], [rid]) VALUES (7, 5)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([uid], [eid], [username], [password], [active], [email]) VALUES (1, 1, N'admin', N'123', 1, N'admin@example.com')
INSERT [dbo].[Users] ([uid], [eid], [username], [password], [active], [email]) VALUES (2, 2, N'hr', N'123', 1, N'hr@example.com')
INSERT [dbo].[Users] ([uid], [eid], [username], [password], [active], [email]) VALUES (3, 3, N'plan', N'123', 1, N'planning@example.com')
INSERT [dbo].[Users] ([uid], [eid], [username], [password], [active], [email]) VALUES (4, 4, N'account', N'123', 1, N'accounting@example.com')
INSERT [dbo].[Users] ([uid], [eid], [username], [password], [active], [email]) VALUES (5, 5, N'workshop1', N'123', 1, N'workshop1@example.com')
INSERT [dbo].[Users] ([uid], [eid], [username], [password], [active], [email]) VALUES (6, 9, N'workshop2', N'123', 1, N'workshop2@example.com')
INSERT [dbo].[Users] ([uid], [eid], [username], [password], [active], [email]) VALUES (7, 13, N'workshop3', N'123', 1, N'workshop3@example.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkAssignments] ON 

INSERT [dbo].[WorkAssignments] ([waid], [pdid], [eid], [quantity]) VALUES (1, 1, 6, 2)
INSERT [dbo].[WorkAssignments] ([waid], [pdid], [eid], [quantity]) VALUES (2, 1, 7, 2)
INSERT [dbo].[WorkAssignments] ([waid], [pdid], [eid], [quantity]) VALUES (3, 1, 8, 1)
INSERT [dbo].[WorkAssignments] ([waid], [pdid], [eid], [quantity]) VALUES (4, 2, 6, 1)
INSERT [dbo].[WorkAssignments] ([waid], [pdid], [eid], [quantity]) VALUES (5, 2, 8, 2)
INSERT [dbo].[WorkAssignments] ([waid], [pdid], [eid], [quantity]) VALUES (6, 3, 7, 1)
INSERT [dbo].[WorkAssignments] ([waid], [pdid], [eid], [quantity]) VALUES (7, 3, 8, 1)
SET IDENTITY_INSERT [dbo].[WorkAssignments] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK6dotkott2kjsp8vw4d0m25fb7]    Script Date: 10/16/2024 11:53:45 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK6dotkott2kjsp8vw4d0m25fb7] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKr43af9ap4edm43mmtq01oddj6]    Script Date: 10/16/2024 11:53:45 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UKr43af9ap4edm43mmtq01oddj6] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC5725D50F6F0]    Script Date: 10/16/2024 11:53:45 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD FOREIGN KEY([waid])
REFERENCES [dbo].[WorkAssignments] ([waid])
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [FK__Employees__Depar__01142BA1] FOREIGN KEY([did])
REFERENCES [dbo].[Departments] ([did])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Depar__01142BA1]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [FK_Employee_Salary] FOREIGN KEY([sid])
REFERENCES [dbo].[Salaries] ([sid])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employee_Salary]
GO
ALTER TABLE [dbo].[PlanDetails]  WITH CHECK ADD  CONSTRAINT [FK__PlanDetai__PlanH__0E6E26BF] FOREIGN KEY([phid])
REFERENCES [dbo].[PlanHeaders] ([phid])
GO
ALTER TABLE [dbo].[PlanDetails] CHECK CONSTRAINT [FK__PlanDetai__PlanH__0E6E26BF]
GO
ALTER TABLE [dbo].[PlanDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlanDetails_Shifts] FOREIGN KEY([sid])
REFERENCES [dbo].[Shifts] ([sid])
GO
ALTER TABLE [dbo].[PlanDetails] CHECK CONSTRAINT [FK_PlanDetails_Shifts]
GO
ALTER TABLE [dbo].[PlanHeaders]  WITH CHECK ADD  CONSTRAINT [FK__PlanHeade__Produ__0B91BA14] FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
ALTER TABLE [dbo].[PlanHeaders] CHECK CONSTRAINT [FK__PlanHeade__Produ__0B91BA14]
GO
ALTER TABLE [dbo].[PlanHeaders]  WITH CHECK ADD  CONSTRAINT [FK__PlanHeader__plid__5BE2A6F2] FOREIGN KEY([plid])
REFERENCES [dbo].[Plans] ([plid])
GO
ALTER TABLE [dbo].[PlanHeaders] CHECK CONSTRAINT [FK__PlanHeader__plid__5BE2A6F2]
GO
ALTER TABLE [dbo].[Plans]  WITH CHECK ADD FOREIGN KEY([did])
REFERENCES [dbo].[Departments] ([did])
GO
ALTER TABLE [dbo].[RoleFeatures]  WITH NOCHECK ADD  CONSTRAINT [FK_RoleFeatures_Features] FOREIGN KEY([fid])
REFERENCES [dbo].[Features] ([fid])
GO
ALTER TABLE [dbo].[RoleFeatures] CHECK CONSTRAINT [FK_RoleFeatures_Features]
GO
ALTER TABLE [dbo].[RoleFeatures]  WITH NOCHECK ADD  CONSTRAINT [FK_RoleFeatures_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[RoleFeatures] CHECK CONSTRAINT [FK_RoleFeatures_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD FOREIGN KEY([eid])
REFERENCES [dbo].[Employees] ([eid])
GO
ALTER TABLE [dbo].[WorkAssignments]  WITH CHECK ADD  CONSTRAINT [FK__WorkAssig__PlanD__1332DBDC] FOREIGN KEY([pdid])
REFERENCES [dbo].[PlanDetails] ([pdid])
GO
ALTER TABLE [dbo].[WorkAssignments] CHECK CONSTRAINT [FK__WorkAssig__PlanD__1332DBDC]
GO
