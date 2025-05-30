USE [master]
GO
/****** Object:  Database [Spa]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Appointments]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Invoices]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Notify]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[Settings]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[SpaService]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[SpaServiceRoom]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[SpaServiceStaff]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[SupportRequests]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/29/2025 10:10:16 AM ******/
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
/****** Object:  Table [dbo].[WorkSchedules]    Script Date: 5/29/2025 10:10:16 AM ******/
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
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([Id], [UserId], [ServiceId], [StaffId], [RoomId], [ScheduledAt], [Status], [CreatedAt]) VALUES (1, 1, 2, 2, 2, CAST(N'2025-05-28T11:14:43.903' AS DateTime), N'Pending', CAST(N'2025-05-28T11:14:43.907' AS DateTime))
INSERT [dbo].[Appointments] ([Id], [UserId], [ServiceId], [StaffId], [RoomId], [ScheduledAt], [Status], [CreatedAt]) VALUES (2, 1, 5, 1, 5, CAST(N'2025-05-28T14:08:26.287' AS DateTime), N'Pending', CAST(N'2025-05-28T14:08:26.287' AS DateTime))
INSERT [dbo].[Appointments] ([Id], [UserId], [ServiceId], [StaffId], [RoomId], [ScheduledAt], [Status], [CreatedAt]) VALUES (3, 1, 1, 2, 2, CAST(N'2025-05-28T14:22:35.157' AS DateTime), N'Pending', CAST(N'2025-05-28T14:22:35.157' AS DateTime))
INSERT [dbo].[Appointments] ([Id], [UserId], [ServiceId], [StaffId], [RoomId], [ScheduledAt], [Status], [CreatedAt]) VALUES (4, 1, 2, 2, 2, CAST(N'2025-05-29T09:19:09.477' AS DateTime), N'Success', CAST(N'2025-05-29T09:19:09.477' AS DateTime))
SET IDENTITY_INSERT [dbo].[Appointments] OFF
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

INSERT [dbo].[Post] ([ID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL], [CategoryID]) VALUES (1, N'The Healing Power of Aromatherapy', N'Regular massage therapy offers a wide array of benefits for both physical and mental well-being, moving beyond a simple indulgence to become a powerful tool for health management. Consistency is key to experiencing the cumulative and lasting positive effects.

Here are some of the key benefits of regular massage:

Physical Benefits:

Pain Relief: Regular massages can effectively alleviate various types of pain, including chronic back pain, headaches, muscle soreness, and discomfort from conditions like arthritis or fibromyalgia. It works by reducing muscle tension, improving blood flow, and releasing the body''s natural painkillers (endorphins).
Reduced Muscle Stiffness and Tension: Massage helps to loosen tight muscles and connective tissues, which can result from prolonged sitting, physical activity, or stress. This leads to decreased stiffness and a feeling of release.
Improved Circulation: Manipulation of soft tissues during a massage enhances blood flow, delivering more oxygen and nutrients to muscles and tissues. This also aids in the removal of metabolic waste and toxins.
Increased Flexibility and Range of Motion: By working on stiffened muscles and soft tissues, massage therapy can improve joint mobility and flexibility, which is beneficial for everyone from sedentary workers to athletes.
Quicker Recovery: For those who engage in physical activity, regular massages can help speed up recovery between workouts by reducing muscle soreness and supporting the body''s healing processes.Better Posture: Addressing muscle imbalances and tension caused by poor posture (e.g., from prolonged sitting) can help realign the body, alleviating pain and preventing future problems.
Strengthened Immune Response: Studies suggest that massage therapy can boost the immune system by reducing stress hormones (like cortisol) and increasing the activity of natural killer T cells, which fight off viruses.
Lower Blood Pressure: Regular massage sessions have been linked to reduced blood pressure levels, contributing to better cardiovascular health.
Mental and Emotional Benefits:

Stress Reduction: Massage is highly effective in reducing stress by lowering cortisol levels (the primary stress hormone) and increasing the production of "feel-good" hormones like serotonin, dopamine, and oxytocin. This promotes a sense of calm and tranquility.
Improved Relaxation: The physical act of massage and the subsequent hormonal changes induce a deep state of relaxation, helping to calm the nervous system.
Enhanced Mood: The release of endorphins and serotonin during a massage contributes to an improved mood, helping to alleviate symptoms of anxiety and depression.
Decreased Anxiety and Depression: Regular sessions provide a consistent opportunity for mental reset and can help manage symptoms of anxiety and depression, fostering emotional resilience.
Better Quality of Sleep: By reducing tension in the body and mind, calming the nervous system, and regulating sleep cycles, massage can significantly improve sleep quality, making it easier to fall asleep and stay asleep.
Increased Energy and Vitality: With reduced stress, better sleep, and improved physical comfort, individuals often report feeling more energetic and vital after regular massages.
Heightened Mental Alertness and Focus: As stress diminishes and the body relaxes, the mind often follows suit, leading to improved mental clarity, focus, and productivity.
Increased Feeling of Wellness: Regular massage contributes to an overall sense of well-being, fostering a positive outlook and promoting self-care.
Mind-Body Connection: Massage can promote a stronger connection between the mind and body, allowing individuals to become more aware of and release stored emotional tension.
To maximize the benefits, many experts recommend incorporating regular massage into your wellness routine, with frequency depending on individual needs, lifestyle, and specific health goals.', 0, CAST(N'2025-05-26T14:45:05.467' AS DateTime), 1, N'https://wallpapercave.com/wp/wp4085249.jpg', 6)
INSERT [dbo].[Post] ([ID], [Title], [Content], [IsDeleted], [CreatedAt], [CreatedBy], [imgURL], [CategoryID]) VALUES (2, N'Benefits of Regular Massage', N'Regular massage therapy offers a wide array of benefits for both physical and mental well-being, moving beyond a simple indulgence to become a powerful tool for health management. Consistency is key to experiencing the cumulative and lasting positive effects.

Here are some of the key benefits of regular massage:

Physical Benefits:

Pain Relief: Regular massages can effectively alleviate various types of pain, including chronic back pain, headaches, muscle soreness, and discomfort from conditions like arthritis or fibromyalgia. It works by reducing muscle tension, improving blood flow, and releasing the body''s natural painkillers (endorphins).
Reduced Muscle Stiffness and Tension: Massage helps to loosen tight muscles and connective tissues, which can result from prolonged sitting, physical activity, or stress. This leads to decreased stiffness and a feeling of release.
Improved Circulation: Manipulation of soft tissues during a massage enhances blood flow, delivering more oxygen and nutrients to muscles and tissues. This also aids in the removal of metabolic waste and toxins.
Increased Flexibility and Range of Motion: By working on stiffened muscles and soft tissues, massage therapy can improve joint mobility and flexibility, which is beneficial for everyone from sedentary workers to athletes.
Quicker Recovery: For those who engage in physical activity, regular massages can help speed up recovery between workouts by reducing muscle soreness and supporting the body''s healing processes.Better Posture: Addressing muscle imbalances and tension caused by poor posture (e.g., from prolonged sitting) can help realign the body, alleviating pain and preventing future problems.
Strengthened Immune Response: Studies suggest that massage therapy can boost the immune system by reducing stress hormones (like cortisol) and increasing the activity of natural killer T cells, which fight off viruses.
Lower Blood Pressure: Regular massage sessions have been linked to reduced blood pressure levels, contributing to better cardiovascular health.
Mental and Emotional Benefits:

Stress Reduction: Massage is highly effective in reducing stress by lowering cortisol levels (the primary stress hormone) and increasing the production of "feel-good" hormones like serotonin, dopamine, and oxytocin. This promotes a sense of calm and tranquility.
Improved Relaxation: The physical act of massage and the subsequent hormonal changes induce a deep state of relaxation, helping to calm the nervous system.
Enhanced Mood: The release of endorphins and serotonin during a massage contributes to an improved mood, helping to alleviate symptoms of anxiety and depression.
Decreased Anxiety and Depression: Regular sessions provide a consistent opportunity for mental reset and can help manage symptoms of anxiety and depression, fostering emotional resilience.
Better Quality of Sleep: By reducing tension in the body and mind, calming the nervous system, and regulating sleep cycles, massage can significantly improve sleep quality, making it easier to fall asleep and stay asleep.
Increased Energy and Vitality: With reduced stress, better sleep, and improved physical comfort, individuals often report feeling more energetic and vital after regular massages.
Heightened Mental Alertness and Focus: As stress diminishes and the body relaxes, the mind often follows suit, leading to improved mental clarity, focus, and productivity.
Increased Feeling of Wellness: Regular massage contributes to an overall sense of well-being, fostering a positive outlook and promoting self-care.
Mind-Body Connection: Massage can promote a stronger connection between the mind and body, allowing individuals to become more aware of and release stored emotional tension.
To maximize the benefits, many experts recommend incorporating regular massage into your wellness routine, with frequency depending on individual needs, lifestyle, and specific health goals.', 0, CAST(N'2025-05-26T14:45:05.467' AS DateTime), 2, N'https://wallpapercave.com/wp/wp4085249.jpg', 2)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (1, N'Khách hàng', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (2, N'Chuyên viên tr? li?u', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (3, N'L? tân', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
INSERT [dbo].[Role] ([ID], [Name], [IsDeleted], [CreatedAt]) VALUES (4, N'Qu?n tr? viên', 0, CAST(N'2025-05-26T11:10:36.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (1, N'Room 101 - Full Body Relaxation Massage', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (2, N'Room 102 - Dry Sauna', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (3, N'Room 103 - Hot Stone Therapy', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (4, N'Room 104 - Advanced Facial Treatment', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (5, N'Room 105 - Couple Room', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (6, N'Room 106 - Full Body Scrub', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (7, N'Room 107 - Aromatherapy Session', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (8, N'Room 108 - After Sun Skin Recovery', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (9, N'Room 109 - Nail & Hand Care', 1)
INSERT [dbo].[Rooms] ([Id], [Name], [IsAvailable]) VALUES (10, N'Room 110 - VIP Suite (Massage + Sauna + Therapy)', 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[SpaService] ON 

INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (1, N'Swedish Massage', N'A full-body massage using long, gliding strokes to relax muscles.', 60, CAST(70.00 AS Decimal(10, 2)), 1, 2, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (2, N'Deep Cleansing Facial', N'A rejuvenating facial treatment for all skin types.', 45, CAST(50.00 AS Decimal(10, 2)), 1, 3, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (3, N'Hot Stone Therapy', N'Smooth, heated stones are placed on key points of the body.', 75, CAST(90.00 AS Decimal(10, 2)), 1, 8, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (5, N'Relaxing Body Massage', N'A full body massage to relieve stress and tension.', 60, CAST(49.99 AS Decimal(10, 2)), 1, 2, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (6, N'Manicure & Pedicure', N'Complete nail care and polish.', 50, CAST(29.99 AS Decimal(10, 2)), 1, 4, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (7, N'Aromatherapy Massage', N'Massage using essential oils for relaxation.', 60, CAST(55.00 AS Decimal(10, 2)), 1, 2, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (8, N'Rejuvenating Facial', N'Our Rejuvenating Facial is a transformative treatment that deeply cleanses, exfoliates, and hydrates your skin. It includes steam, extractions, a personalized mask, and a soothing massage using premium botanical products. This facial targets dullness, uneven tone, and dryness, restoring your skin’s natural glow. Ideal for all skin types, it enhances skin elasticity and promotes a youthful, smooth appearance. You’ll leave the spa feeling not only refreshed but confident in your radiant skin.', 45, CAST(350000.00 AS Decimal(10, 2)), 1, 3, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (9, N'Coffee Body Scrub', N'This invigorating treatment uses finely ground coffee beans to exfoliate and rejuvenate your skin. The natural caffeine stimulates circulation, tightens the skin, and reduces the appearance of cellulite. A blend of nourishing oils and soothing massage techniques ensures that your skin is left soft, glowing, and hydrated. Ideal for all skin types, this scrub not only polishes your body but also awakens your senses and boosts your energy.', 40, CAST(300000.00 AS Decimal(10, 2)), 1, 4, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (10, N'Organic Waxing - Full Legs', N'Using natural, skin-friendly wax derived from organic ingredients, this service ensures effective hair removal with minimal irritation. Ideal for sensitive skin, it leaves the legs smooth and hair-free for weeks. Our professional estheticians ensure a hygienic and quick process, with pre- and post-treatment care for best results. Say goodbye to razors and enjoy long-lasting smoothness.', 30, CAST(250000.00 AS Decimal(10, 2)), 1, 5, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (11, N'Lavender Aromatherapy Massage', N'Immerse yourself in the calming scent of lavender as skilled hands apply gentle massage techniques to melt away stress. This treatment enhances mood, relieves tension, and improves sleep quality. Lavender’s therapeutic properties are ideal for clients suffering from anxiety or restlessness. Combined with a peaceful atmosphere and soft music, the experience leaves you emotionally uplifted and physically relaxed.', 60, CAST(470000.00 AS Decimal(10, 2)), 1, 6, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (12, N'Deluxe Spa Pedicure', N'Treat your feet with our Deluxe Spa Pedicure, which includes a warm soak, exfoliation, callus treatment, nail shaping, cuticle care, and a relaxing foot massage. Finished with your choice of polish, this treatment revitalizes tired feet and leaves them soft and beautiful. We use only the best sanitary practices and high-quality products for a luxurious experience.', 60, CAST(280000.00 AS Decimal(10, 2)), 1, 7, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (13, N'Hot Stone Full Body Massage', N'Smooth, heated stones are placed on key points of your body to melt away tension and stress. Combined with deep massage, this treatment improves circulation and energy flow. The penetrating heat and expert strokes provide relief from chronic pain, muscle tightness, and fatigue. Ideal for deep relaxation and recovery.', 75, CAST(600000.00 AS Decimal(10, 2)), 1, 8, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (14, N'Herbal Steam Detox', N'This full-body steam treatment uses herbal infusions to help open pores, flush toxins, and improve breathing. It’s perfect before or after a massage to boost circulation and relax muscles. The natural steam also helps clear skin and support metabolism. You’ll emerge refreshed, light, and energized.', 30, CAST(220000.00 AS Decimal(10, 2)), 1, 9, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (15, N'Body Slimming Wrap', N'A detoxifying and slimming body wrap that targets stubborn fat and water retention. Using mineral-rich mud and firming gel, the treatment encourages inch loss while nourishing the skin. The wrap stimulates circulation and metabolism, making it a great addition to a weight-loss journey. Repeated sessions may enhance long-term effects.', 60, CAST(500000.00 AS Decimal(10, 2)), 1, 10, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (16, N'Anti-Aging Gold Facial', N'This luxurious facial uses 24K gold-infused products that help boost collagen, improve elasticity, and reduce fine lines. The treatment involves cleansing, exfoliation, mask, and facial massage, leaving skin glowing, firmer, and visibly younger. Ideal for mature skin or anyone wanting to preserve a youthful look.', 60, CAST(700000.00 AS Decimal(10, 2)), 1, 11, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (17, N'Sports Recovery Massage', N'Designed for athletes or those with an active lifestyle, this massage focuses on muscle recovery, injury prevention, and flexibility. Techniques include deep tissue pressure, assisted stretching, and trigger point therapy. It helps reduce inflammation, increase range of motion, and restore peak physical condition.', 75, CAST(550000.00 AS Decimal(10, 2)), 1, 2, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (18, N'Brightening Facial', N'A specialized facial that targets pigmentation, dark spots, and uneven skin tone using advanced brightening serums and vitamin C. The result is a luminous, balanced complexion with reduced discoloration. Ideal for dull or sun-damaged skin.', 50, CAST(390000.00 AS Decimal(10, 2)), 1, 3, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (19, N'Himalayan Salt Scrub', N'A detoxifying full-body scrub using pink Himalayan salt crystals blended with nourishing oils to exfoliate and renew your skin. It promotes circulation, clears pores, and leaves your body feeling fresh and polished.', 40, CAST(330000.00 AS Decimal(10, 2)), 1, 4, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (20, N'Underarm Waxing', N'A quick and efficient hair removal service using gentle wax suitable for sensitive skin. Leaves the underarm area clean and smooth for weeks, with minimal discomfort and long-lasting results.', 15, CAST(150000.00 AS Decimal(10, 2)), 1, 5, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (21, N'Eucalyptus Aromatherapy', N'A rejuvenating massage enhanced with eucalyptus essential oil to clear the respiratory system, reduce muscle soreness, and refresh the senses. Great for those feeling congested or fatigued.', 60, CAST(480000.00 AS Decimal(10, 2)), 1, 6, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (22, N'Gel Manicure', N'A long-lasting gel manicure that includes nail trimming, cuticle care, buffing, and polish with UV curing for high-gloss finish. Stays chip-free for up to two weeks. Perfect for everyday wear or special occasions.', 45, CAST(220000.00 AS Decimal(10, 2)), 1, 7, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (23, N'Stone Reflexology', N'Combining reflexology with hot stones, this treatment stimulates pressure points on the feet to improve overall wellness and energy flow. It also helps reduce headaches, fatigue, and digestive issues.', 45, CAST(370000.00 AS Decimal(10, 2)), 1, 8, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (24, N'Steam Herbal Facial', N'A facial that combines herbal steam therapy to open pores and infuse the skin with healing botanical extracts. Great for detoxifying and prepping the skin for extraction or mask treatments.', 45, CAST(320000.00 AS Decimal(10, 2)), 1, 9, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (25, N'Slimming Cupping Massage', N'A modern take on traditional cupping therapy, used to target fatty areas and stimulate lymphatic drainage. Often paired with essential oils for enhanced detox and slimming effects.', 60, CAST(520000.00 AS Decimal(10, 2)), 1, 10, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
INSERT [dbo].[SpaService] ([Id], [Name], [Description], [DurationMinutes], [Price], [IsActive], [CategoryID], [Image]) VALUES (26, N'Collagen Boost Facial', N'A cutting-edge anti-aging facial that uses collagen-boosting serums and firming techniques to lift and tone the skin. Reduces fine lines, firms sagging areas, and promotes a youthful glow.', 60, CAST(680000.00 AS Decimal(10, 2)), 1, 11, N'https://www.communityamenitymanagement.com/wp-content/uploads/2022/05/93546969_presentation-wide.jpg')
SET IDENTITY_INSERT [dbo].[SpaService] OFF
GO
SET IDENTITY_INSERT [dbo].[SpaServiceRoom] ON 

INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (11, 1, 1)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (12, 1, 2)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (13, 1, 3)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (14, 2, 2)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (15, 2, 3)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (16, 2, 4)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (17, 3, 3)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (18, 3, 4)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (19, 3, 5)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (20, 5, 5)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (21, 5, 6)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (22, 5, 7)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (23, 6, 6)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (24, 6, 7)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (25, 6, 8)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (26, 7, 7)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (27, 7, 8)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (28, 7, 9)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (29, 8, 8)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (30, 8, 9)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (31, 8, 10)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (34, 9, 1)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (32, 9, 9)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (33, 9, 10)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (36, 10, 1)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (37, 10, 2)
INSERT [dbo].[SpaServiceRoom] ([Id], [SpaServiceId], [RoomId]) VALUES (35, 10, 10)
SET IDENTITY_INSERT [dbo].[SpaServiceRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[SpaServiceStaff] ON 

INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (1, 1, 1)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (2, 1, 2)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (3, 2, 2)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (4, 2, 3)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (5, 3, 3)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (6, 3, 4)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (7, 5, 1)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (8, 5, 3)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (9, 6, 2)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (10, 6, 4)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (11, 7, 1)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (12, 7, 2)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (13, 8, 3)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (14, 8, 4)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (15, 9, 1)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (16, 9, 4)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (17, 10, 2)
INSERT [dbo].[SpaServiceStaff] ([Id], [SpaServiceId], [UserId]) VALUES (18, 10, 3)
SET IDENTITY_INSERT [dbo].[SpaServiceStaff] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (1, N'khachhang01@gmail.com', N'123456', N'Nguyễn Thị Hoa', N'Male', N'THon 84', N'0901234567', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'data:image/png;base64,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', NULL, 1)
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (2, N'therapist01@spa.vn', N'123456', N'Phạm Văn Minh', N'1', N'45 Hai Bà Trung, Hà N?i', N'0912345678', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'https://static.vecteezy.com/system/resources/previews/036/280/651/original/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg', NULL, 2)
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (3, N'letan01@spa.vn', N'123456', N'Lê Thu Hồng', N'0', N'88 Nguy?n Hu?, Ðà N?ng', N'0923456789', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'https://static.vecteezy.com/system/resources/previews/036/280/651/original/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg', NULL, 3)
INSERT [dbo].[User] ([ID], [Email], [Password], [Fullname], [Gender], [Address], [Phone], [IsDeleted], [CreatedAt], [CreatedBy], [Avatar], [ChangeHistory], [RoleId]) VALUES (4, N'admin@spa.vn', N'admin123', N'Trần Quốc Bảo', N'1', N'60 Pasteur, Q.3, TP.HCM', N'0934567890', 0, CAST(N'2025-05-26T11:14:44.117' AS DateTime), 1, N'https://static.vecteezy.com/system/resources/previews/036/280/651/original/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg', NULL, 4)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [UQ_SpaServiceRoom]    Script Date: 5/29/2025 10:10:16 AM ******/
ALTER TABLE [dbo].[SpaServiceRoom] ADD  CONSTRAINT [UQ_SpaServiceRoom] UNIQUE NONCLUSTERED 
(
	[SpaServiceId] ASC,
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_SpaServiceUser]    Script Date: 5/29/2025 10:10:16 AM ******/
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
