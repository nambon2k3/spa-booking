﻿USE [master]
GO
/****** Object:  Database [Spa]    Script Date: 5/27/2025 11:06:50 AM ******/
CREATE DATABASE [Spa]
GO
ALTER DATABASE [Spa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Spa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Spa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Spa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Spa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Spa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Spa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Spa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Spa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Spa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Spa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Spa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Spa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Spa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Spa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Spa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Spa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Spa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Spa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Spa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Spa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Spa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Spa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Spa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Spa] SET RECOVERY FULL 
GO
ALTER DATABASE [Spa] SET  MULTI_USER 
GO
ALTER DATABASE [Spa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Spa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Spa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Spa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Spa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Spa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Spa', N'ON'
GO
ALTER DATABASE [Spa] SET QUERY_STORE = ON
GO
ALTER DATABASE [Spa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Spa]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ServiceId] [int] NULL,
	[StaffId] [int] NULL,
	[RoomId] [int] NULL,
	[ScheduledAt] [datetime] NULL,
	[Status] [nvarchar](30) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Rating] [int] NULL,
	[Responded] [bit] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[VatIncluded] [bit] NULL,
	[PointsChange] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notify]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notify](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NULL,
	[actionUrl] [nvarchar](500) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [text] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[imgURL] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IsAvailable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Value] [varchar](150) NULL,
	[Order] [int] NULL,
	[CreatedBy] [int] NULL,
	[isDeleted] [bit] NULL,
	[description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaService]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[DurationMinutes] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[IsActive] [bit] NULL,
	[CategoryID] [int] NULL,
	[Image] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaServiceRoom]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaServiceRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpaServiceId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaServiceStaff]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaServiceStaff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpaServiceId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupportRequests]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupportRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Subject] [nvarchar](255) NULL,
	[Message] [nvarchar](max) NULL,
	[Status] [nvarchar](20) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Fullname] [nvarchar](255) NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Avatar] [text] NULL,
	[ChangeHistory] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkSchedules]    Script Date: 5/27/2025 11:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkSchedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NULL,
	[DayOfWeek] [nvarchar](10) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (2, N'Massage Therapy', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, N'https://florida-academy.edu/wp-content/uploads/2019/11/MassageTherapyFAQs-FloridaAcademy-1500x1000.jpeg')
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (3, N'Facial Treatments', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, N'https://cdn.prod.website-files.com/618c2d9666a1e4c15855f5a2/61b429b4e5b5815eaca788f2_Facials-scaled.jpeg')
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (4, N'Body Scrub', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, N'https://irp.cdn-website.com/3ec89f3b/dms3rep/multi/blog4.jpg')
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (5, N'Hair Removal', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, N'https://static.wixstatic.com/media/bd9dce_e97b01d1040c411cb71104d02fbee886~mv2.jpg/v1/fill/w_640,h_400,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/bd9dce_e97b01d1040c411cb71104d02fbee886~mv2.jpg')
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (6, N'Aromatherapy', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7nroU8VaiAz-ch4__IOiBVn9rOaRDg14LLw&s')
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (7, N'Manicure & Pedicure', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, N'https://skylashnailspa.com/wp-content/uploads/2023/02/spa-2.jpg')
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (8, N'Hot Stone Therapy', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, NULL)
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (9, N'Sauna & Steam Bath', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, NULL)
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (10, N'Slimming Treatments', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, NULL)
INSERT [dbo].[Category] ([ID], [Name], [IsDeleted], [CreatedAt], [CreatedBy], [Image]) VALUES (11, N'Anti-Aging Treatments', 0, CAST(N'2025-05-26T11:21:54.033' AS DateTime), 4, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [UserId], [Content], [Rating], [Responded], [CreatedAt]) VALUES (1, 1, N'The massage therapy was incredibly relaxing. Highly recommend!', 5, 1, CAST(N'2025-05-26T14:46:16.953' AS DateTime))
INSERT [dbo].[Feedback] ([Id], [UserId], [Content], [Rating], [Responded], [CreatedAt]) VALUES (2, 2, N'The facial treatment left my skin glowing. Excellent service!', 4, 0, CAST(N'2025-05-26T14:46:16.953' AS DateTime))
INSERT [dbo].[Feedback] ([Id], [UserId], [Content], [Rating], [Responded], [CreatedAt]) VALUES (3, 3, N'Nice ambiance and friendly staff. Steam bath was refreshing!', 5, 1, CAST(N'2025-05-26T14:46:16.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([ID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL], [CategoryID]) VALUES (1, N'The Healing Power of Aromatherapy', N'Aromatherapy treatments can reduce stress and boost mood naturally.', 0, CAST(N'2025-05-26T14:45:05.467' AS DateTime), 1, N'https://assets.canyonranch.com/system/uploads/fae/image/asset/39522/xxl_md_Web_Page_Hero_Vertical-gold-hydralifting-facial-spa-service-ftw-canton-ranch-1500x1875.jpg', 6)
INSERT [dbo].[Post] ([ID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL], [CategoryID]) VALUES (2, N'Benefits of Regular Massage', N'Massage therapy improves circulation, reduces pain, and promotes relaxation.', 0, CAST(N'2025-05-26T14:45:05.467' AS DateTime), 2, N'https://th.bing.com/th/id/OIP.6t-Ejs5syOJK2F-1MhFxIQD6D6?w=169&h=180&c=7&r=0&o=5&dpr=2&pid=1.7', 2)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (1, N'Khách hàng', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (2, N'Chuyên viên tr? li?u', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (3, N'L? tân', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (4, N'Qu?n tr? viên', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[SpaService] ON 

INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (1, N'Swedish Massage', N'A full-body massage using long, gliding strokes to relax muscles.', 60, CAST(70.00 AS Decimal(10, 2)), 1, 2, N'https://th.bing.com/th/id/OIP.k4a7-CszzreqsR0r3syK9QAAAA?w=111&h=180&c=7&r=0&o=5&dpr=2&pid=1.7')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (2, N'Deep Cleansing Facial', N'A rejuvenating facial treatment for all skin types.', 45, CAST(50.00 AS Decimal(10, 2)), 1, 3, N'https://assets.canyonranch.com/system/uploads/fae/image/asset/39522/xxl_md_Web_Page_Hero_Vertical-gold-hydralifting-facial-spa-service-ftw-canton-ranch-1500x1875.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (3, N'Hot Stone Therapy', N'Smooth, heated stones are placed on key points of the body.', 75, CAST(90.00 AS Decimal(10, 2)), 1, 8, N'https://th.bing.com/th/id/OIP.9NFdMRJ3-m2a2RS9RldpGAHaHa?w=151&h=180&c=7&r=0&o=5&dpr=2&pid=1.7')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (5, N'Relaxing Body Massage', N'A full body massage to relieve stress and tension.', 60, CAST(49.99 AS Decimal(10, 2)), 1, 2, N'https://th.bing.com/th/id/OIP._doahX5laRznmne2Tz8iOgHaIJ?w=139&h=180&c=7&r=0&o=5&dpr=2&pid=1.7')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (6, N'Manicure & Pedicure', N'Complete nail care and polish.', 50, CAST(29.99 AS Decimal(10, 2)), 1, 4, N'https://th.bing.com/th/id/OIP.V1lqgcBsiwuBMS6NVPAaVAHaKf?w=115&h=180&c=7&r=0&o=5&dpr=2&pid=1.7')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (7, N'Aromatherapy Massage', N'Massage using essential oils for relaxation.', 60, CAST(55.00 AS Decimal(10, 2)), 1, 2, N'https://th.bing.com/th/id/OIP.OWHM6lF2QwNZktCTYdKeNAHaLH?w=115&h=180&c=7&r=0&o=5&dpr=2&pid=1.7')
SET IDENTITY_INSERT [dbo].[SpaService] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (1, N'khachhang01@gmail.com', N'123456', N'Nguyễn Thị Hoa', N'0', N'123 Lê L?i, Q.1, TP.HCM', N'0901234567', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'https://static.vecteezy.com/system/resources/previews/036/280/651/original/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg', NULL, 1)
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (2, N'therapist01@spa.vn', N'123456', N'Phạm Văn Minh', N'1', N'45 Hai Bà Trung, Hà N?i', N'0912345678', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'https://static.vecteezy.com/system/resources/previews/036/280/651/original/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg', NULL, 2)
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (3, N'letan01@spa.vn', N'123456', N'Lê Thu Hồng', N'0', N'88 Nguy?n Hu?, Ðà N?ng', N'0923456789', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'https://static.vecteezy.com/system/resources/previews/036/280/651/original/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg', NULL, 3)
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (4, N'admin@spa.vn', N'admin123', N'Trần Quốc Bảo', N'1', N'60 Pasteur, Q.3, TP.HCM', N'0934567890', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'https://static.vecteezy.com/system/resources/previews/036/280/651/original/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg', NULL, 4)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [UQ_SpaServiceRoom]    Script Date: 5/27/2025 11:06:50 AM ******/
ALTER TABLE [dbo].[SpaServiceRoom] ADD  CONSTRAINT [UQ_SpaServiceRoom] UNIQUE NONCLUSTERED 
(
	[SpaServiceId] ASC,
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_SpaServiceUser]    Script Date: 5/27/2025 11:06:50 AM ******/
ALTER TABLE [dbo].[SpaServiceStaff] ADD  CONSTRAINT [UQ_SpaServiceUser] UNIQUE NONCLUSTERED 
(
	[SpaServiceId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ('pending') FOR [Status]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ((0)) FOR [Responded]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notify] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Notify] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[SpaService] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SupportRequests] ADD  DEFAULT ('open') FOR [Status]
GO
ALTER TABLE [dbo].[SupportRequests] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('https://www.svgrepo.com/show/452030/avatar-default.svg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([ServiceId])
REFERENCES [dbo].[SpaService] ([Id])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([Id])
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SpaService]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[SpaServiceRoom]  WITH CHECK ADD  CONSTRAINT [FK_SpaServiceRoom_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[SpaServiceRoom] CHECK CONSTRAINT [FK_SpaServiceRoom_Room]
GO
ALTER TABLE [dbo].[SpaServiceRoom]  WITH CHECK ADD  CONSTRAINT [FK_SpaServiceRoom_SpaService] FOREIGN KEY([SpaServiceId])
REFERENCES [dbo].[SpaService] ([Id])
GO
ALTER TABLE [dbo].[SpaServiceRoom] CHECK CONSTRAINT [FK_SpaServiceRoom_SpaService]
GO
ALTER TABLE [dbo].[SpaServiceStaff]  WITH CHECK ADD  CONSTRAINT [FK_SpaServiceUser_SpaService] FOREIGN KEY([SpaServiceId])
REFERENCES [dbo].[SpaService] ([Id])
GO
ALTER TABLE [dbo].[SpaServiceStaff] CHECK CONSTRAINT [FK_SpaServiceUser_SpaService]
GO
ALTER TABLE [dbo].[SpaServiceStaff]  WITH CHECK ADD  CONSTRAINT [FK_SpaServiceUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SpaServiceStaff] CHECK CONSTRAINT [FK_SpaServiceUser_User]
GO
ALTER TABLE [dbo].[SupportRequests]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[WorkSchedules]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [Spa] SET  READ_WRITE 
GO