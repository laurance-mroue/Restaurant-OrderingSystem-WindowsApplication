USE [master]
GO
/****** Object:  Database [CSCI370_FinalProject]    Script Date: 6/3/2023 6:30:16 PM ******/
CREATE DATABASE [CSCI370_FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSCI370_FinalProject', FILENAME = N'D:\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\CSCI370_FinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CSCI370_FinalProject_log', FILENAME = N'D:\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\CSCI370_FinalProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CSCI370_FinalProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSCI370_FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSCI370_FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSCI370_FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSCI370_FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSCI370_FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSCI370_FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CSCI370_FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [CSCI370_FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSCI370_FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSCI370_FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSCI370_FinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSCI370_FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSCI370_FinalProject] SET QUERY_STORE = OFF
GO
USE [CSCI370_FinalProject]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/3/2023 6:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 6/3/2023 6:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [varchar](300) NOT NULL,
	[price] [float] NOT NULL,
	[CatId] [int] NOT NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/3/2023 6:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustName] [nvarchar](50) NULL,
	[FoodID] [int] NULL,
	[Quantity] [int] NULL,
	[orderDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sign_In]    Script Date: 6/3/2023 6:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sign_In](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sign_In] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [description]) VALUES (1, N'Burger')
INSERT [dbo].[Category] ([id], [description]) VALUES (2, N'Pizza')
INSERT [dbo].[Category] ([id], [description]) VALUES (3, N'Dessert')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Foods] ON 

INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (1, N'BIG KING', N'Flame Grilled 100% Beef Patty, Crispy Lettuce, Fresh Onion, Pickles, 1 Cheese Slice, Big King Sauce', 430000, 1)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (2, N'BIG KING XXL', N'Flame Grilled 100% Beef Patty, Crispy Lettuce, Fresh Onion, Pickles, 4 Cheese Slices, Big King Sauce', 750000, 1)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (3, N'DOUBLE CHEESE BURGER', N'Flame Grilled 100% Beef Patty, Pickles, Ketchup, 2 Cheese Slices, Mustard', 430000, 1)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (4, N'HAMBURGER', N'Flame Grilled 100% Beef Patty, Ketchup, Mustard, Pickles', 190000, 1)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (6, N'STEAKHOUSE', N'Flame Grilled 100% Beef Patty, Mayo, Crispy Lettuce, Fresh Tomatoes, 2 Cheese Slices, 4 Slices Beef Bacon, Crispy Onion, Bbq Sauce', 590000, 1)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (7, N'WHOPPER', N'Flame Grilled 100% Beef Patty, Crispy Lettuce, Fresh Onion, Fresh Tomatoes, Pickles, Mayo, Ketchup', 460000, 1)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (8, N'SUNDAE STRAWBERRY', N'Layer upon layer of strawberry sweet.', 200000, 3)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (9, N'ICE CREAM CONE', N'A simply sweet & classic treat.', 100000, 3)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (10, N'SUNDAE CHOCOLATE', N'A chocolaty dream', 200000, 3)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (11, N'SUNDAE CARAMEL', N'A cool collision of caramel.', 200000, 3)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (12, N'DONUT', N'1 Pc Chocolate Donut', 85000, 3)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (13, N'COOKIE', N'1 Pc Chocolate Cookie', 135000, 3)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (14, N'chicken legend', N'Grilled Chicken breast, Onions,
Mozzarella, American cheese,
Oregano and BBQ Sauce', 400000, 2)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (15, N'veggie', N'Green Peppers, Onions,
Mushrooms, Black Olives,
Mozzarella & Signature
Marinara sauce', 450000, 2)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (16, N'italiano', N'Beef Pepperoni, Mushrooms, Italian Sausage, Mozzarella &
Marinara sauce', 450000, 2)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (17, N'lebanese', N'Sliced Beef Ham, Fresh
Mushrooms & Black Olives.', 400000, 2)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (18, N'margherita', N'A rich laver of 100% real
Mozzarella cheese. Enjoy it on
its own...', 350000, 2)
INSERT [dbo].[Foods] ([id], [name], [description], [price], [CatId]) VALUES (19, N'pepperoni', N'Beef Pepperoni, Mozzarella &
Signature Marinara sauce', 500000, 2)
SET IDENTITY_INSERT [dbo].[Foods] OFF
GO
INSERT [dbo].[Sign_In] ([username], [password]) VALUES (N'admin', N'123')
INSERT [dbo].[Sign_In] ([username], [password]) VALUES (N'lama', N'345')
INSERT [dbo].[Sign_In] ([username], [password]) VALUES (N'laura', N'567')
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD  CONSTRAINT [FK_Foods_Category] FOREIGN KEY([CatId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Foods] CHECK CONSTRAINT [FK_Foods_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Foods] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Foods] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Foods]
GO
USE [master]
GO
ALTER DATABASE [CSCI370_FinalProject] SET  READ_WRITE 
GO
