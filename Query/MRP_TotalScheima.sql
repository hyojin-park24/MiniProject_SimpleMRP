USE [MRP]
GO
/****** Object:  Table [dbo].[Process]    Script Date: 2021-07-01 오후 2:01:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process](
	[PrcIdx] [int] IDENTITY(1,1) NOT NULL,
	[SchIdx] [int] NOT NULL,
	[PrcCD] [char](14) NOT NULL,
	[PrcDate] [date] NOT NULL,
	[PrcLoadTime] [int] NULL,
	[PrcStartTime] [time](7) NULL,
	[PrcEndTime] [time](7) NULL,
	[PrcFacilityID] [char](8) NULL,
	[PrcResult] [bit] NOT NULL,
	[ModID] [varchar](20) NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
 CONSTRAINT [PK_Process] PRIMARY KEY CLUSTERED 
(
	[PrcIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 2021-07-01 오후 2:01:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[SchIdx] [int] IDENTITY(1,1) NOT NULL,
	[PlantCode] [char](8) NOT NULL,
	[SchDate] [date] NOT NULL,
	[LoadTime] [int] NOT NULL,
	[SchStartTime] [time](7) NULL,
	[SchEndTime] [time](7) NULL,
	[SchFacilityID] [char](8) NULL,
	[SchAmount] [int] NOT NULL,
	[ModID] [varchar](20) NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[SchIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2021-07-01 오후 2:01:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[BasicCode] [char](8) NOT NULL,
	[CodeName] [nvarchar](100) NOT NULL,
	[CodeDesc] [nvarchar](max) NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[BasicCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Process] ON 

INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [ModID], [RegDate], [RegID], [ModDate]) VALUES (1, 6, N'PRC20210629001', CAST(N'2021-06-29' AS Date), 5, NULL, NULL, N'FAC10002', 1, NULL, NULL, N'MRP', NULL)
SET IDENTITY_INSERT [dbo].[Process] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [LoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [ModID], [RegDate], [RegID], [ModDate]) VALUES (1, N'PC010001', CAST(N'2021-06-17' AS Date), 10, CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time), N'FAC10001', 21, N'MRP', CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'SYS', CAST(N'2021-06-25T11:56:02.780' AS DateTime))
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [LoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [ModID], [RegDate], [RegID], [ModDate]) VALUES (2, N'PC010002', CAST(N'2021-06-25' AS Date), 12, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), N'FAC10002', 24, NULL, CAST(N'2021-06-25T13:47:42.963' AS DateTime), N'MRP', NULL)
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [LoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [ModID], [RegDate], [RegID], [ModDate]) VALUES (3, N'PC010002', CAST(N'2021-06-25' AS Date), 10, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), N'FAC10002', 40, NULL, CAST(N'2021-06-28T09:17:29.257' AS DateTime), N'MRP', NULL)
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [LoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [ModID], [RegDate], [RegID], [ModDate]) VALUES (4, N'PC010002', CAST(N'2021-06-28' AS Date), 10, NULL, NULL, N'FAC10002', 45, N'MRP', CAST(N'2021-06-28T09:21:00.737' AS DateTime), N'MRP', CAST(N'2021-06-28T13:59:44.437' AS DateTime))
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [LoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [ModID], [RegDate], [RegID], [ModDate]) VALUES (5, N'PC010004', CAST(N'2021-06-28' AS Date), 10, NULL, NULL, N'FAC10002', 44, NULL, CAST(N'2021-06-28T09:32:13.397' AS DateTime), N'MRP', NULL)
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [LoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [ModID], [RegDate], [RegID], [ModDate]) VALUES (6, N'PC010002', CAST(N'2021-06-29' AS Date), 5, NULL, NULL, N'FAC10002', 30, NULL, CAST(N'2021-06-29T09:14:25.070' AS DateTime), N'MRP', NULL)
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'FAC10001', N'설비1', N'생산설비1', CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'FAC10002', N'설비2', N'생산설비2', CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'PC010001', N'수원', N'수원공장(코드)', CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'SYS', NULL, NULL)
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'PC010002', N'부산', N'부산공장(코드)', CAST(N'2021-06-24T13:58:03.453' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'PC010004', N'대전', N'대전공장(코드)', CAST(N'2021-06-24T13:57:19.800' AS DateTime), N'MRP', NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Process_PrcCD]    Script Date: 2021-07-01 오후 2:01:58 ******/
ALTER TABLE [dbo].[Process] ADD  CONSTRAINT [UK_Process_PrcCD] UNIQUE NONCLUSTERED 
(
	[PrcCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Process]  WITH NOCHECK ADD  CONSTRAINT [FK_Process_Schedules] FOREIGN KEY([SchIdx])
REFERENCES [dbo].[Schedules] ([SchIdx])
GO
ALTER TABLE [dbo].[Process] NOCHECK CONSTRAINT [FK_Process_Schedules]
GO
ALTER TABLE [dbo].[Schedules]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedules_Settings] FOREIGN KEY([PlantCode])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Schedules] NOCHECK CONSTRAINT [FK_Schedules_Settings]
GO
ALTER TABLE [dbo].[Schedules]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedules_Settings1] FOREIGN KEY([SchFacilityID])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Schedules] NOCHECK CONSTRAINT [FK_Schedules_Settings1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공정계획 순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchIdx'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공정코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'PlantCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공정계획일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'로드타임(초)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'LoadTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시작시간(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchStartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'종료시간(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchEndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생산설비ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchFacilityID'
GO
