USE [master]
GO
/****** Object:  Database [LE_MIGRATION]    Script Date: 07/06/2024 08:29:03 p. m. ******/
CREATE DATABASE [LE_MIGRATION]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LE_MIGRATION', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LE_MIGRATION.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LE_MIGRATION_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LE_MIGRATION_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LE_MIGRATION] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LE_MIGRATION].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LE_MIGRATION] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET ARITHABORT OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LE_MIGRATION] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LE_MIGRATION] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LE_MIGRATION] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LE_MIGRATION] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LE_MIGRATION] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LE_MIGRATION] SET  MULTI_USER 
GO
ALTER DATABASE [LE_MIGRATION] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LE_MIGRATION] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LE_MIGRATION] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LE_MIGRATION] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LE_MIGRATION] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LE_MIGRATION] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LE_MIGRATION] SET QUERY_STORE = ON
GO
ALTER DATABASE [LE_MIGRATION] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LE_MIGRATION]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Usuario] [varchar](100) NULL,
	[Contraseña] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
	[Pais] [varchar](100) NULL,
	[rol] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservaciones]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservaciones](
	[ID_Reservacion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NULL,
	[ID_Viaje] [int] NULL,
	[Nombre_Reservacion] [varchar](100) NULL,
	[Precio] [decimal](18, 0) NULL,
	[Fecha_Inicio] [datetime] NULL,
	[Fecha_Final] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viajes]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viajes](
	[ID_Viaje] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Viaje] [varchar](255) NOT NULL,
	[Continente] [varchar](100) NOT NULL,
	[Pais] [varchar](150) NOT NULL,
	[Ciudad] [varchar](150) NOT NULL,
	[Alojamientos] [varchar](250) NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Imagen_URL] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Viaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ID_Usuario], [Nombre_Usuario], [Contraseña], [Correo], [Telefono], [Pais], [rol]) VALUES (1, N'Admin', N'control123', NULL, NULL, NULL, N'admin')
INSERT [dbo].[Clientes] ([ID_Usuario], [Nombre_Usuario], [Contraseña], [Correo], [Telefono], [Pais], [rol]) VALUES (2, N'david210', N'user503', N'cdavidrigoberto@gmail.com', N'75858936', N'El Salvador', N'user')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservaciones] ON 

INSERT [dbo].[Reservaciones] ([ID_Reservacion], [ID_Usuario], [ID_Viaje], [Nombre_Reservacion], [Precio], [Fecha_Inicio], [Fecha_Final]) VALUES (2, 2, 14, N'David Castillo', CAST(2300 AS Decimal(18, 0)), CAST(N'2024-05-28T12:52:00.000' AS DateTime), CAST(N'2024-05-31T12:52:00.000' AS DateTime))
INSERT [dbo].[Reservaciones] ([ID_Reservacion], [ID_Usuario], [ID_Viaje], [Nombre_Reservacion], [Precio], [Fecha_Inicio], [Fecha_Final]) VALUES (3, 2, 2, N'David Castillo', CAST(1200 AS Decimal(18, 0)), CAST(N'2024-05-29T13:32:00.000' AS DateTime), CAST(N'2024-05-31T13:32:00.000' AS DateTime))
INSERT [dbo].[Reservaciones] ([ID_Reservacion], [ID_Usuario], [ID_Viaje], [Nombre_Reservacion], [Precio], [Fecha_Inicio], [Fecha_Final]) VALUES (4, 2, 2, N'David Castillo', CAST(1200 AS Decimal(18, 0)), CAST(N'2024-06-04T18:09:00.000' AS DateTime), CAST(N'2024-06-13T18:09:00.000' AS DateTime))
INSERT [dbo].[Reservaciones] ([ID_Reservacion], [ID_Usuario], [ID_Viaje], [Nombre_Reservacion], [Precio], [Fecha_Inicio], [Fecha_Final]) VALUES (5, 2, 1, N'David Castillo', CAST(1000 AS Decimal(18, 0)), CAST(N'2024-06-04T18:14:00.000' AS DateTime), CAST(N'2024-06-28T18:14:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reservaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Viajes] ON 

INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (1, N'Vacaciones en Barcelona', N'Europa', N'España', N'Barcelona', N'Hotel Catalunya', CAST(1000.00 AS Decimal(10, 2)), N'url_imagen_1')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (2, N'Aventura en Machu Picchu', N'América del Sur', N'Perú', N'Cusco', N'Hotel Machu Picchu', CAST(1200.00 AS Decimal(10, 2)), N'url_imagen_2')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (3, N'Explorando París', N'Europa', N'Francia', N'París', N'Hotel Eiffel', CAST(1500.00 AS Decimal(10, 2)), N'url_imagen_3')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (4, N'Relax en las Playas de Tailandia', N'Asia', N'Tailandia', N'Phuket', N'Resort Paradise', CAST(2000.00 AS Decimal(10, 2)), N'url_imagen_4')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (5, N'Escapada a Roma', N'Europa', N'Italia', N'Roma', N'Hotel Coliseo', CAST(1300.00 AS Decimal(10, 2)), N'url_imagen_5')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (6, N'Aventura en el Gran Cañón', N'América del Norte', N'Estados Unidos', N'Arizona', N'Hotel Grand Canyon Lodge', CAST(1800.00 AS Decimal(10, 2)), N'url_imagen_6')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (7, N'Descubriendo Tokio', N'Asia', N'Japón', N'Tokio', N'Hotel Tokyo Tower', CAST(1700.00 AS Decimal(10, 2)), N'url_imagen_7')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (8, N'Vacaciones en Ámsterdam', N'Europa', N'Países Bajos', N'Ámsterdam', N'Hotel Amsterdam Central', CAST(1100.00 AS Decimal(10, 2)), N'url_imagen_8')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (9, N'Exploración en el Amazonas', N'América del Sur', N'Brasil', N'Manaus', N'Lodge Amazonía', CAST(2200.00 AS Decimal(10, 2)), N'url_imagen_9')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (10, N'City Break en Nueva York', N'América del Norte', N'Estados Unidos', N'Nueva York', N'Hotel Manhattan', CAST(1900.00 AS Decimal(10, 2)), N'url_imagen_10')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (11, N'Maravillas de Estambul', N'Asia', N'Turquía', N'Estambul', N'Hotel Sultanahmet', CAST(1600.00 AS Decimal(10, 2)), N'url_imagen_11')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (12, N'Safari en Serengeti', N'África', N'Tanzania', N'Arusha', N'Lodge Serengeti', CAST(2500.00 AS Decimal(10, 2)), N'url_imagen_12')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (13, N'Cultura en Kioto', N'Asia', N'Japón', N'Kioto', N'Hotel Gion', CAST(1400.00 AS Decimal(10, 2)), N'url_imagen_13')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (14, N'Aventura en la Patagonia', N'América del Sur', N'Argentina', N'El Calafate', N'Hotel Patagonia', CAST(2300.00 AS Decimal(10, 2)), N'url_imagen_14')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (15, N'Explorando Petra', N'Asia', N'Jordania', N'Petra', N'Hotel Petra View', CAST(2000.00 AS Decimal(10, 2)), N'url_imagen_15')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (16, N'Descanso en las Islas Griegas', N'Europa', N'Grecia', N'Santorini', N'Hotel Santorini Bliss', CAST(1700.00 AS Decimal(10, 2)), N'url_imagen_16')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (17, N'Tour por la Gran Muralla China', N'Asia', N'China', N'Pekín', N'Hotel Forbidden City', CAST(2100.00 AS Decimal(10, 2)), N'url_imagen_17')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (18, N'Vacaciones en Dubái', N'Asia', N'Emiratos Árabes Unidos', N'Dubái', N'Hotel Burj Khalifa', CAST(2200.00 AS Decimal(10, 2)), N'url_imagen_18')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (19, N'Descubriendo la Ciudad del Vaticano', N'Europa', N'Vaticano', N'Ciudad del Vaticano', N'Hotel Vatican Gardens', CAST(1400.00 AS Decimal(10, 2)), N'url_imagen_19')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (20, N'Aventura en la Selva Amazónica', N'América del Sur', N'Perú', N'Iquitos', N'Lodge Amazon Jungle', CAST(2400.00 AS Decimal(10, 2)), N'url_imagen_20')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (21, N'Maravillas de Sydney', N'Oceanía', N'Australia', N'Sydney', N'Hotel Sydney Harbour', CAST(1900.00 AS Decimal(10, 2)), N'url_imagen_21')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (22, N'Descanso en las Maldivas', N'Asia', N'Maldivas', N'Malé', N'Resort Maldives Paradise', CAST(2500.00 AS Decimal(10, 2)), N'url_imagen_22')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (23, N'Aventura en la Ruta 66', N'América del Norte', N'Estados Unidos', N'California', N'Motel Route 66', CAST(1800.00 AS Decimal(10, 2)), N'url_imagen_23')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (24, N'Explorando la Antigua Roma', N'Europa', N'Italia', N'Roma', N'Hotel Pantheon', CAST(1600.00 AS Decimal(10, 2)), N'url_imagen_24')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (25, N'Vacaciones en Río de Janeiro', N'América del Sur', N'Brasil', N'Río de Janeiro', N'Hotel Copacabana Palace', CAST(2000.00 AS Decimal(10, 2)), N'url_imagen_25')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (26, N'Escapada a Santorini', N'Europa', N'Grecia', N'Santorini', N'Hotel Santorini View', CAST(1700.00 AS Decimal(10, 2)), N'url_imagen_26')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (27, N'Descanso en Bali', N'Asia', N'Indonesia', N'Bali', N'Resort Bali Paradise', CAST(2200.00 AS Decimal(10, 2)), N'url_imagen_27')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (28, N'Explorando la Gran Barrera de Coral', N'Oceanía', N'Australia', N'Queensland', N'Hotel Coral Reef', CAST(2300.00 AS Decimal(10, 2)), N'url_imagen_28')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (29, N'Vacaciones en Cancún', N'América del Norte', N'México', N'Cancún', N'Resort Cancun Beach', CAST(1900.00 AS Decimal(10, 2)), N'url_imagen_29')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (30, N'City Break en Londres', N'Europa', N'Reino Unido', N'Londres', N'Hotel London Eye', CAST(1500.00 AS Decimal(10, 2)), N'url_imagen_30')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (31, N'Aventura en el Desierto del Sáhara', N'África', N'Marruecos', N'Merzouga', N'Campamento Sahara', CAST(2100.00 AS Decimal(10, 2)), N'url_imagen_31')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (32, N'Explorando la Gran Muralla China', N'Asia', N'China', N'Pekín', N'Hotel Great Wall', CAST(2000.00 AS Decimal(10, 2)), N'url_imagen_32')
INSERT [dbo].[Viajes] ([ID_Viaje], [Nombre_Viaje], [Continente], [Pais], [Ciudad], [Alojamientos], [Precio], [Imagen_URL]) VALUES (39, N'San Salvador', N'America del norte', N'El Salvador', N'Cancun', N'Hotel de cancun', CAST(1000.00 AS Decimal(10, 2)), N'url_imagen_34')
SET IDENTITY_INSERT [dbo].[Viajes] OFF
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ('user') FOR [rol]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reservaciones_Clientes] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Clientes] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FK_Reservaciones_Clientes]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reservaciones_Viajes] FOREIGN KEY([ID_Viaje])
REFERENCES [dbo].[Viajes] ([ID_Viaje])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FK_Reservaciones_Viajes]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarViaje]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ActualizarViaje]
    @ID_Viaje INT,
    @Nombre_Viaje VARCHAR(255),
    @Continente VARCHAR(100),
    @Pais VARCHAR(150),
    @Ciudad VARCHAR(150),
    @Alojamientos VARCHAR(250),
    @Precio DECIMAL(10, 2),
    @Imagen_URL VARCHAR(255)
AS
BEGIN
    UPDATE Viajes
    SET 
        Nombre_Viaje = @Nombre_Viaje,
        Continente = @Continente,
        Pais = @Pais,
        Ciudad = @Ciudad,
        Alojamientos = @Alojamientos,
        Precio = @Precio,
        Imagen_URL = @Imagen_URL
    WHERE 
        ID_Viaje = @ID_Viaje;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_borrarReservacion]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_borrarReservacion]
@id int
AS
BEGIN
	DELETE FROM Reservaciones where ID_Reservacion = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarViaje]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_EliminarViaje]
    @ID_Viaje INT
AS
BEGIN
    DELETE FROM Viajes
    WHERE ID_Viaje = @ID_Viaje;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_encontrarProducto]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_encontrarProducto]
@id int
AS
BEGIN
	SELECT * FROM Viajes where ID_Viaje = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRol]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetRol]
	@id int
AS
BEGIN
	IF(EXISTS (SELECT * FROM Clientes where ID_Usuario = @id ))
		SELECT rol FROM Clientes where ID_Usuario = @id
	ELSE
		SELECT '0'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_historialReservaciones]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_historialReservaciones]
	@id int
AS
BEGIN
SELECT r.ID_Reservacion, r.ID_Usuario,r.ID_Viaje,v.Nombre_Viaje,r.Nombre_Reservacion,r.precio,r.Fecha_Inicio,r.Fecha_Final FROM Reservaciones r
INNER JOIN Viajes v on v.ID_Viaje = r.ID_Viaje
WHERE ID_Usuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarReservaciones]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarReservaciones]
@ID_Usuario int,
@ID_Viaje int,
@Nombre_Reservacion varchar(100),
@Precio decimal,
@Fecha_Inicio datetime,
@Fecha_Final datetime
AS
BEGIN
	INSERT INTO Reservaciones(ID_Usuario,ID_Viaje,Nombre_Reservacion,Precio,Fecha_Inicio,Fecha_Final) VALUES 
	(@ID_Usuario,@ID_Viaje,@Nombre_Reservacion,@Precio,@Fecha_Inicio,@Fecha_Final)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarViaje]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_InsertarViaje]
    @Nombre_Viaje VARCHAR(255),
    @Continente VARCHAR(100),
    @Pais VARCHAR(150),
    @Ciudad VARCHAR(150),
    @Alojamientos VARCHAR(250),
    @Precio DECIMAL(10, 2),
    @Imagen_URL VARCHAR(255)
AS
BEGIN
    INSERT INTO Viajes (Nombre_Viaje, Continente, Pais, Ciudad, Alojamientos, Precio, Imagen_URL)
    VALUES (@Nombre_Viaje, @Continente, @Pais, @Ciudad, @Alojamientos, @Precio, @Imagen_URL);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarReservacion]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_modificarReservacion]
@fecha_inicio datetime,
@fecha_final datetime,
@id int
AS
BEGIN
	UPDATE Reservaciones SET Fecha_Inicio = @fecha_inicio , Fecha_Final = @fecha_final where ID_Reservacion = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_registrarUsuario]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_registrarUsuario]
@user varchar(50),
@email varchar(150),
@password varchar(50),
@telefono varchar(15),
@pais varchar(100)
AS
BEGIN
	INSERT INTO Clientes(Nombre_Usuario,contraseña,correo,Telefono,Pais)
	VALUES (@user,@password,@email,@telefono,@pais)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_verificarCuenta]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_verificarCuenta]
	@user varchar(50),
	@password varchar(50)
	
AS
BEGIN
	IF(EXISTS (SELECT * FROM Clientes where Nombre_Usuario = @user 
	and Contraseña = @password ))
		SELECT ID_Usuario FROM Clientes where Nombre_Usuario = @user 
		and Contraseña = @password
	ELSE
		SELECT '0'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_viajesPrincipales]    Script Date: 07/06/2024 08:29:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_viajesPrincipales]
as
begin
	SELECT Top(8) * from Viajes;
end
GO
USE [master]
GO
ALTER DATABASE [LE_MIGRATION] SET  READ_WRITE 
GO
