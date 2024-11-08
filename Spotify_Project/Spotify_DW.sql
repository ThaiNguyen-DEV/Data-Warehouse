USE [master]
GO
/****** Object:  Database [Spotify_DW]    Script Date: 2024-11-03 1:15:17 PM ******/
CREATE DATABASE [Spotify_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Spotify_DW', FILENAME = N'F:\Program Files (x86)\Microsoft SQL Server\MSSQL16.MSSQLSERVER_DW\MSSQL\DATA\Spotify_DW.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Spotify_DW_log', FILENAME = N'F:\Program Files (x86)\Microsoft SQL Server\MSSQL16.MSSQLSERVER_DW\MSSQL\DATA\Spotify_DW_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Spotify_DW] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Spotify_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Spotify_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Spotify_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Spotify_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Spotify_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Spotify_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [Spotify_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Spotify_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Spotify_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Spotify_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Spotify_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Spotify_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Spotify_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Spotify_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Spotify_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Spotify_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Spotify_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Spotify_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Spotify_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Spotify_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Spotify_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Spotify_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Spotify_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Spotify_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [Spotify_DW] SET  MULTI_USER 
GO
ALTER DATABASE [Spotify_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Spotify_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Spotify_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Spotify_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Spotify_DW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Spotify_DW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Spotify_DW', N'ON'
GO
ALTER DATABASE [Spotify_DW] SET QUERY_STORE = ON
GO
ALTER DATABASE [Spotify_DW] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Spotify_DW]
GO
/****** Object:  User [viet]    Script Date: 2024-11-03 1:15:17 PM ******/
CREATE USER [viet] FOR LOGIN [viet] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[DATA_SOURCE]    Script Date: 2024-11-03 1:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_SOURCE](
	[row_id] [int] NOT NULL,
	[country_name] [nvarchar](255) NULL,
	[uri] [nvarchar](255) NULL,
	[popularity_score] [float] NULL,
	[title] [nvarchar](255) NULL,
	[artist_name] [nvarchar](255) NULL,
	[album_type] [nvarchar](255) NULL,
	[genre] [nvarchar](255) NULL,
	[artist_followers] [float] NULL,
	[explicit] [bit] NULL,
	[album_name] [nvarchar](255) NULL,
	[release_date] [datetime] NULL,
	[track_number] [float] NULL,
	[tracks_in_album] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_album]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_album](
	[album_id] [int] IDENTITY(1,1) NOT NULL,
	[album_name] [nvarchar](1000) NOT NULL,
	[artist_id] [int] NULL,
	[artist_name] [nvarchar](1000) NULL,
	[album_type] [nvarchar](1000) NULL,
	[tracks_in_album] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[album_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_artist]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_artist](
	[artist_id] [int] IDENTITY(1,1) NOT NULL,
	[artist_name] [nvarchar](1000) NOT NULL,
	[artist_followers] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_genre]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_genre](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_location]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_location](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_song]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_song](
	[song_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](1000) NOT NULL,
	[uri] [nvarchar](1000) NULL,
	[artist_id] [int] NULL,
	[album_name] [nvarchar](1000) NULL,
	[release_date] [datetime] NULL,
	[track_number] [float] NULL,
	[album_id] [int] NULL,
	[explicit] [bit] NULL,
	[genre_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_time]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_time](
	[date_id] [int] NOT NULL,
	[date] [date] NULL,
	[year] [int] NULL,
	[month] [int] NULL,
	[quarter] [int] NULL,
	[week_of_year] [int] NULL,
	[is_weekend] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_artist_popularity]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_artist_popularity](
	[artist_id] [int] NOT NULL,
	[artist_followers] [float] NULL,
	[album_count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_genre_popularity]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_genre_popularity](
	[country_id] [int] NULL,
	[genre_id] [int] NULL,
	[artist_followers] [float] NULL,
	[average_score] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_song_popularity]    Script Date: 2024-11-03 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_song_popularity](
	[song_id] [int] NULL,
	[artist_id] [int] NULL,
	[album_id] [int] NULL,
	[country_id] [int] NULL,
	[date_id] [int] NULL,
	[genre_id] [int] NULL,
	[popularity_score] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_album]  WITH CHECK ADD  CONSTRAINT [FK_artist_id] FOREIGN KEY([artist_id])
REFERENCES [dbo].[dim_artist] ([artist_id])
GO
ALTER TABLE [dbo].[dim_album] CHECK CONSTRAINT [FK_artist_id]
GO
ALTER TABLE [dbo].[dim_song]  WITH CHECK ADD  CONSTRAINT [FK_album_id] FOREIGN KEY([album_id])
REFERENCES [dbo].[dim_album] ([album_id])
GO
ALTER TABLE [dbo].[dim_song] CHECK CONSTRAINT [FK_album_id]
GO
ALTER TABLE [dbo].[dim_song]  WITH CHECK ADD  CONSTRAINT [FK_artist_id2] FOREIGN KEY([artist_id])
REFERENCES [dbo].[dim_artist] ([artist_id])
GO
ALTER TABLE [dbo].[dim_song] CHECK CONSTRAINT [FK_artist_id2]
GO
ALTER TABLE [dbo].[dim_song]  WITH CHECK ADD  CONSTRAINT [FK_genre_id] FOREIGN KEY([genre_id])
REFERENCES [dbo].[dim_genre] ([genre_id])
GO
ALTER TABLE [dbo].[dim_song] CHECK CONSTRAINT [FK_genre_id]
GO
ALTER TABLE [dbo].[fact_artist_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Artist_fact] FOREIGN KEY([artist_id])
REFERENCES [dbo].[dim_artist] ([artist_id])
GO
ALTER TABLE [dbo].[fact_artist_popularity] CHECK CONSTRAINT [FK_Artist_fact]
GO
ALTER TABLE [dbo].[fact_genre_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Country_fact2] FOREIGN KEY([country_id])
REFERENCES [dbo].[dim_location] ([country_id])
GO
ALTER TABLE [dbo].[fact_genre_popularity] CHECK CONSTRAINT [FK_Country_fact2]
GO
ALTER TABLE [dbo].[fact_genre_popularity]  WITH CHECK ADD  CONSTRAINT [FK_genre2] FOREIGN KEY([genre_id])
REFERENCES [dbo].[dim_genre] ([genre_id])
GO
ALTER TABLE [dbo].[fact_genre_popularity] CHECK CONSTRAINT [FK_genre2]
GO
ALTER TABLE [dbo].[fact_song_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Album] FOREIGN KEY([album_id])
REFERENCES [dbo].[dim_album] ([album_id])
GO
ALTER TABLE [dbo].[fact_song_popularity] CHECK CONSTRAINT [FK_Album]
GO
ALTER TABLE [dbo].[fact_song_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Artist] FOREIGN KEY([artist_id])
REFERENCES [dbo].[dim_artist] ([artist_id])
GO
ALTER TABLE [dbo].[fact_song_popularity] CHECK CONSTRAINT [FK_Artist]
GO
ALTER TABLE [dbo].[fact_song_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[dim_location] ([country_id])
GO
ALTER TABLE [dbo].[fact_song_popularity] CHECK CONSTRAINT [FK_Country]
GO
ALTER TABLE [dbo].[fact_song_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Date_fact] FOREIGN KEY([date_id])
REFERENCES [dbo].[dim_time] ([date_id])
GO
ALTER TABLE [dbo].[fact_song_popularity] CHECK CONSTRAINT [FK_Date_fact]
GO
ALTER TABLE [dbo].[fact_song_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Genre] FOREIGN KEY([genre_id])
REFERENCES [dbo].[dim_genre] ([genre_id])
GO
ALTER TABLE [dbo].[fact_song_popularity] CHECK CONSTRAINT [FK_Genre]
GO
ALTER TABLE [dbo].[fact_song_popularity]  WITH CHECK ADD  CONSTRAINT [FK_Song] FOREIGN KEY([song_id])
REFERENCES [dbo].[dim_song] ([song_id])
GO
ALTER TABLE [dbo].[fact_song_popularity] CHECK CONSTRAINT [FK_Song]
GO
USE [master]
GO
ALTER DATABASE [Spotify_DW] SET  READ_WRITE 
GO
