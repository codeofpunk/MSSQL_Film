USE [master]
GO
/****** Object:  Database [Odev_Filmler]    Script Date: 25.01.2021 17:35:20 ******/
CREATE DATABASE [Odev_Filmler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Odev_Filmler', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Odev_Filmler.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Odev_Filmler_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Odev_Filmler_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Odev_Filmler] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Odev_Filmler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Odev_Filmler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Odev_Filmler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Odev_Filmler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Odev_Filmler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Odev_Filmler] SET ARITHABORT OFF 
GO
ALTER DATABASE [Odev_Filmler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Odev_Filmler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Odev_Filmler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Odev_Filmler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Odev_Filmler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Odev_Filmler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Odev_Filmler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Odev_Filmler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Odev_Filmler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Odev_Filmler] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Odev_Filmler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Odev_Filmler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Odev_Filmler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Odev_Filmler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Odev_Filmler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Odev_Filmler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Odev_Filmler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Odev_Filmler] SET RECOVERY FULL 
GO
ALTER DATABASE [Odev_Filmler] SET  MULTI_USER 
GO
ALTER DATABASE [Odev_Filmler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Odev_Filmler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Odev_Filmler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Odev_Filmler] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Odev_Filmler] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Odev_Filmler] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Odev_Filmler', N'ON'
GO
ALTER DATABASE [Odev_Filmler] SET QUERY_STORE = OFF
GO
USE [Odev_Filmler]
GO
/****** Object:  Table [dbo].[Oyuncu]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
	[SoyAdi] [varchar](50) NOT NULL,
	[DogumTarihi] [date] NOT NULL,
 CONSTRAINT [PK_Oyuncu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Karakter]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Karakter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdiSoyadi] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Karakter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
	[YapimYili] [date] NOT NULL,
	[Gisesi] [float] NOT NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filmoyuncu]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filmoyuncu](
	[filmid] [int] NOT NULL,
	[oyuncuid] [int] NOT NULL,
 CONSTRAINT [PK_filmoyuncu] PRIMARY KEY CLUSTERED 
(
	[filmid] ASC,
	[oyuncuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwGenelBilgi]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwGenelBilgi]
as
select f.Adi [Film], f.YapimYili [Yapım Yılı], o.Adi+' '+o.SoyAdi [Oyuncu], o.DogumTarihi [Doğum Tarihi], k.AdiSoyadi [Karakter] from Film f inner join filmoyuncu fo on f.Id = fo.filmid
inner join Oyuncu o on o.Id = f.Id
inner join Karakter k on k.Id = f.Id
GO
/****** Object:  Table [dbo].[filmyonetmen]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filmyonetmen](
	[filmid] [int] NOT NULL,
	[yonetmenid] [int] NOT NULL,
 CONSTRAINT [PK_filmyonetmen] PRIMARY KEY CLUSTERED 
(
	[filmid] ASC,
	[yonetmenid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[karakteroyuncu]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[karakteroyuncu](
	[karakterid] [int] NOT NULL,
	[oyuncuid] [int] NOT NULL,
 CONSTRAINT [PK_karakteroyuncu] PRIMARY KEY CLUSTERED 
(
	[karakterid] ASC,
	[oyuncuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tur]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tur](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turfilm]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turfilm](
	[turid] [int] NOT NULL,
	[filmid] [int] NOT NULL,
 CONSTRAINT [PK_turfilm] PRIMARY KEY CLUSTERED 
(
	[turid] ASC,
	[filmid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetmen]    Script Date: 25.01.2021 17:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetmen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NOT NULL,
	[SoyAdi] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Yonetmen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[filmoyuncu]  WITH CHECK ADD  CONSTRAINT [FK_filmoyuncu_Film] FOREIGN KEY([filmid])
REFERENCES [dbo].[Film] ([Id])
GO
ALTER TABLE [dbo].[filmoyuncu] CHECK CONSTRAINT [FK_filmoyuncu_Film]
GO
ALTER TABLE [dbo].[filmoyuncu]  WITH CHECK ADD  CONSTRAINT [FK_filmoyuncu_Oyuncu] FOREIGN KEY([oyuncuid])
REFERENCES [dbo].[Oyuncu] ([Id])
GO
ALTER TABLE [dbo].[filmoyuncu] CHECK CONSTRAINT [FK_filmoyuncu_Oyuncu]
GO
ALTER TABLE [dbo].[filmyonetmen]  WITH CHECK ADD  CONSTRAINT [FK_filmyonetmen_Film] FOREIGN KEY([filmid])
REFERENCES [dbo].[Film] ([Id])
GO
ALTER TABLE [dbo].[filmyonetmen] CHECK CONSTRAINT [FK_filmyonetmen_Film]
GO
ALTER TABLE [dbo].[filmyonetmen]  WITH CHECK ADD  CONSTRAINT [FK_filmyonetmen_Yonetmen] FOREIGN KEY([yonetmenid])
REFERENCES [dbo].[Yonetmen] ([Id])
GO
ALTER TABLE [dbo].[filmyonetmen] CHECK CONSTRAINT [FK_filmyonetmen_Yonetmen]
GO
ALTER TABLE [dbo].[karakteroyuncu]  WITH CHECK ADD  CONSTRAINT [FK_karakteroyuncu_Karakter] FOREIGN KEY([karakterid])
REFERENCES [dbo].[Karakter] ([Id])
GO
ALTER TABLE [dbo].[karakteroyuncu] CHECK CONSTRAINT [FK_karakteroyuncu_Karakter]
GO
ALTER TABLE [dbo].[karakteroyuncu]  WITH CHECK ADD  CONSTRAINT [FK_karakteroyuncu_Oyuncu] FOREIGN KEY([oyuncuid])
REFERENCES [dbo].[Oyuncu] ([Id])
GO
ALTER TABLE [dbo].[karakteroyuncu] CHECK CONSTRAINT [FK_karakteroyuncu_Oyuncu]
GO
ALTER TABLE [dbo].[turfilm]  WITH CHECK ADD  CONSTRAINT [FK_turfilm_Film] FOREIGN KEY([filmid])
REFERENCES [dbo].[Film] ([Id])
GO
ALTER TABLE [dbo].[turfilm] CHECK CONSTRAINT [FK_turfilm_Film]
GO
ALTER TABLE [dbo].[turfilm]  WITH CHECK ADD  CONSTRAINT [FK_turfilm_Tur] FOREIGN KEY([turid])
REFERENCES [dbo].[Tur] ([Id])
GO
ALTER TABLE [dbo].[turfilm] CHECK CONSTRAINT [FK_turfilm_Tur]
GO
USE [master]
GO
ALTER DATABASE [Odev_Filmler] SET  READ_WRITE 
GO
