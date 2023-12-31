USE [master]
GO
/****** Object:  Database [Mercadito]    Script Date: 08/09/2023 12:12:06 p. m. ******/
CREATE DATABASE [Mercadito]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mercadito', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Mercadito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mercadito_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Mercadito_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Mercadito] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mercadito].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mercadito] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mercadito] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mercadito] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mercadito] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mercadito] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mercadito] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mercadito] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mercadito] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mercadito] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mercadito] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mercadito] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mercadito] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mercadito] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mercadito] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mercadito] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mercadito] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mercadito] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mercadito] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mercadito] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mercadito] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mercadito] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mercadito] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mercadito] SET RECOVERY FULL 
GO
ALTER DATABASE [Mercadito] SET  MULTI_USER 
GO
ALTER DATABASE [Mercadito] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mercadito] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mercadito] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mercadito] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mercadito] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mercadito] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mercadito', N'ON'
GO
ALTER DATABASE [Mercadito] SET QUERY_STORE = ON
GO
ALTER DATABASE [Mercadito] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Mercadito]
GO
/****** Object:  Table [dbo].[ContactoRequest]    Script Date: 08/09/2023 12:12:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactoRequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[mensaje] [nvarchar](max) NULL,
	[asunto] [nvarchar](20) NULL,
	[contactar] [bit] NULL,
	[noticias] [bit] NULL,
	[prioridad] [tinyint] NULL,
 CONSTRAINT [PK_ContactoRequest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Frutas]    Script Date: 08/09/2023 12:12:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frutas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[precioKg] [money] NOT NULL,
	[imgUri] [nvarchar](200) NOT NULL,
	[stockKg] [decimal](11, 2) NOT NULL,
	[latitude] [decimal](18, 15) NOT NULL,
	[longitude] [decimal](18, 15) NOT NULL,
	[videoUri_1] [nvarchar](200) NOT NULL,
	[videoUri_2] [nvarchar](200) NOT NULL,
	[videoUri_3] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Frutas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Frutas] ON 

INSERT [dbo].[Frutas] ([id], [nombre], [descripcion], [precioKg], [imgUri], [stockKg], [latitude], [longitude], [videoUri_1], [videoUri_2], [videoUri_3]) VALUES (3, N'Fresa', N'Fresa deliciosa de Guanajuato', 100.0000, N'../media/images/img_fresa.jpg', CAST(100.00 AS Decimal(11, 2)), CAST(21.019240061025215 AS Decimal(18, 15)), CAST(-101.257750721983500 AS Decimal(18, 15)), N'../media/videos/Fresa_1.mp4', N'../media/videos/Fresa_2.mp4', N'../media/videos/Fresa_3.mp4')
INSERT [dbo].[Frutas] ([id], [nombre], [descripcion], [precioKg], [imgUri], [stockKg], [latitude], [longitude], [videoUri_1], [videoUri_2], [videoUri_3]) VALUES (4, N'Mango', N'Mango delicioso y petacón de Veracrúz', 40.0000, N'../media/images/img_mango.jpg', CAST(400.00 AS Decimal(11, 2)), CAST(19.171938586222176 AS Decimal(18, 15)), CAST(-96.138900666420620 AS Decimal(18, 15)), N'../media/videos/Mango_1.mp4', N'../media/videos/Mango_2.mp4', N'../media/videos/Mango_3.mp4')
INSERT [dbo].[Frutas] ([id], [nombre], [descripcion], [precioKg], [imgUri], [stockKg], [latitude], [longitude], [videoUri_1], [videoUri_2], [videoUri_3]) VALUES (5, N'Uva', N'Uva verde deliciosa sin semilla de Baja California', 80.0000, N'../media/images/img_uva.jpg', CAST(200.00 AS Decimal(11, 2)), CAST(30.789753932330840 AS Decimal(18, 15)), CAST(-115.327697839555210 AS Decimal(18, 15)), N'../media/videos/Uva_1.mp4', N'../media/videos/Uva_2.mp4', N'../media/videos/Uva_3.mp4')
INSERT [dbo].[Frutas] ([id], [nombre], [descripcion], [precioKg], [imgUri], [stockKg], [latitude], [longitude], [videoUri_1], [videoUri_2], [videoUri_3]) VALUES (6, N'Melón', N'Melón chino delicioso de Torreón Coahuila', 20.0000, N'../media/images/img_melon.jpg', CAST(800.00 AS Decimal(11, 2)), CAST(28.220432077995447 AS Decimal(18, 15)), CAST(-101.381146639630190 AS Decimal(18, 15)), N'../media/videos/Melon_1.mp4', N'../media/videos/Melon_1.mp4', N'../media/videos/Melon_1.mp4')
INSERT [dbo].[Frutas] ([id], [nombre], [descripcion], [precioKg], [imgUri], [stockKg], [latitude], [longitude], [videoUri_1], [videoUri_2], [videoUri_3]) VALUES (7, N'Pera', N'Pera deliciosa para los chiles en nogada de Puebla', 60.0000, N'../media/images/img_pera.jpg', CAST(1000.00 AS Decimal(11, 2)), CAST(19.049060709908960 AS Decimal(18, 15)), CAST(-98.219771197161720 AS Decimal(18, 15)), N'../media/videos/Pera_1.mp4', N'../media/videos/Pera_2.mp4', N'../media/videos/Pera_2.mp4')
INSERT [dbo].[Frutas] ([id], [nombre], [descripcion], [precioKg], [imgUri], [stockKg], [latitude], [longitude], [videoUri_1], [videoUri_2], [videoUri_3]) VALUES (9, N'Kiwi', N'Kiwi', 100.0000, N'../media/images/img_pera.jpg', CAST(1000.00 AS Decimal(11, 2)), CAST(19.049060709908960 AS Decimal(18, 15)), CAST(-98.219771197161720 AS Decimal(18, 15)), N'../media/videos/Kiwi_1.mp4', N'../media/videos/Kiwi_2.mp4', N'../media/videos/Kiwi_3.mp4')
INSERT [dbo].[Frutas] ([id], [nombre], [descripcion], [precioKg], [imgUri], [stockKg], [latitude], [longitude], [videoUri_1], [videoUri_2], [videoUri_3]) VALUES (10, N'prueba', N'prueba', 0.0000, N'prueba@prueba.com', CAST(0.00 AS Decimal(11, 2)), CAST(0.000000000000000 AS Decimal(18, 15)), CAST(0.000000000000000 AS Decimal(18, 15)), N'prueba@prueba.com', N'prueba@prueba.com', N'prueba@prueba.com')
SET IDENTITY_INSERT [dbo].[Frutas] OFF
GO
USE [master]
GO
ALTER DATABASE [Mercadito] SET  READ_WRITE 
GO
