USE [ClinMedDc]
GO
/****** Object:  Table [dbo].[Diagnostico]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnostico](
	[idDiagnostico] [int] IDENTITY(1,1) NOT NULL,
	[idHistoriaClinica] [int] NOT NULL,
	[fechaEmision] [datetime] NULL,
	[observacion] [varchar](500) NULL,
	[estado] [bit] NULL,
	[recetaMedica] [varchar](500) NULL,
 CONSTRAINT [PK_Diagnostico] PRIMARY KEY CLUSTERED 
(
	[idDiagnostico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[idTipoEmpleado] [int] NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](20) NULL,
	[nroDocumento] [varchar](8) NULL,
	[estado] [bit] NULL,
	[imagen] [varchar](500) NULL,
	[usuario] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoriaClinica]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaClinica](
	[idHistoriaClinica] [int] IDENTITY(1,1) NOT NULL,
	[idPaciente] [int] NULL,
	[fechaApertura] [datetime] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_HistoriaClinica] PRIMARY KEY CLUSTERED 
(
	[idHistoriaClinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[idLaboratorio] [int] IDENTITY(1,1) NOT NULL,
	[nombreLaboratorio] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_idLaboratorio] PRIMARY KEY CLUSTERED 
(
	[idLaboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[idMedicamento] [int] IDENTITY(1,1) NOT NULL,
	[idLaboratorio] [int] NOT NULL,
	[nombreMedicamento] [varchar](50) NOT NULL,
	[fechaVencimiento] [date] NULL,
	[fechaEntrada] [date] NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [real] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_idMedicamento] PRIMARY KEY CLUSTERED 
(
	[idMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[isSubmenu] [bit] NOT NULL,
	[url] [varchar](200) NULL,
	[idMenuParent] [int] NULL,
	[estado] [bit] NULL,
	[mostrar] [bit] NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](20) NULL,
	[edad] [int] NULL,
	[sexo] [char](1) NULL,
	[nroDocumento] [varchar](8) NULL,
	[direccion] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[estado] [bit] NULL,
	[imagen] [varchar](500) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[idEmpleado] [int] NOT NULL,
	[idMenu] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC,
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[idTipoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[clave] [varchar](50) NOT NULL,
	[estado] [bit] NULL,
	[idEmpleado] [int] NOT NULL,
	[imagen] [varchar](50) NULL,
	[tipoUser] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Diagnostico]  WITH CHECK ADD  CONSTRAINT [FK_Diagnostico_HistoriaClinica] FOREIGN KEY([idHistoriaClinica])
REFERENCES [dbo].[HistoriaClinica] ([idHistoriaClinica])
GO
ALTER TABLE [dbo].[Diagnostico] CHECK CONSTRAINT [FK_Diagnostico_HistoriaClinica]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoEmpleado] FOREIGN KEY([idTipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoEmpleado]
GO
ALTER TABLE [dbo].[HistoriaClinica]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaClinica_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HistoriaClinica] CHECK CONSTRAINT [FK_HistoriaClinica_Paciente]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Laboratorio_Medicamento] FOREIGN KEY([idLaboratorio])
REFERENCES [dbo].[Laboratorio] ([idLaboratorio])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Laboratorio_Medicamento]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Empleado]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Especialidad]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Empleado]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Menu] FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Menu]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empleado]
GO
/****** Object:  StoredProcedure [dbo].[spAccesoSistema]    Script Date: 25/5/2022 15:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spAccesoSistema]
( @prmUser varchar(50),
  @prmPass varchar(50)
)
AS
	BEGIN
		SELECT E.idEmpleado, E.usuario, E.clave, E.nombres, E.apellidos, E.nroDocumento
		FROM Empleado E
		WHERE E.usuario = @prmUser AND E.clave = @prmPass
	END
GO
/****** Object:  StoredProcedure [dbo].[spAccesoSistemaUsuario]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAccesoSistemaUsuario]
( @prmUser varchar(50),
  @prmPass varchar(50)
)
AS
	BEGIN
		SELECT U.idUsuario, U.usuario, U.clave, E.nombres,E.apellidos,E.nroDocumento, U.tipoUser,E.idEmpleado
		FROM Usuario U
		INNER JOIN Empleado E ON (U.idEmpleado = E.idEmpleado)
		WHERE U.usuario = @prmUser AND U.clave = @prmPass AND U.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaMenu]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizaMenu]
(@prmIdMenu int ,
 @prmNombreMenu varchar(200),
 @prmUrlMenu varchar(200),
 @prmIdMenuParent int,
 @prmIsSubMenu bit,
 @prmEstado bit)
AS
	BEGIN
		UPDATE Menu
		SET nombre = @prmNombreMenu, 
		    url = @prmUrlMenu,
			idMenuParent = @prmIdMenuParent,
			isSubmenu = @prmIsSubMenu,
			estado = @prmEstado
		WHERE idMenu = @prmIdMenu
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosLaboratorio]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosLaboratorio]
(@prmIdLaboratorio int,
@prmDescripcion varchar(50),
@prmNombreLaboratorio varchar(300))
as
	begin
		update Laboratorio
		set Laboratorio.descripcion = @prmDescripcion, nombreLaboratorio = @prmNombreLaboratorio 
		where Laboratorio.idLaboratorio = @prmIdLaboratorio
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosMedicamento]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosMedicamento]
(@prmIdMedicamento int,
@prmNombreMedicamento varchar(50),
@prmCantidad INT,
@prmPrecio float(8))
as
	begin
		update Medicamentos
		set Medicamentos.nombreMedicamento = @prmNombreMedicamento, Cantidad = @prmCantidad, Precio = @prmPrecio 
		where Medicamentos.idMedicamento = @prmIdMedicamento
	end	
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosMedico]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosMedico]
(@prmIdMedico int,
@prmDocumento varchar(50)

)
as
	begin
	declare @idemple int;

	 set @idemple =  (select idEmpleado 
	from Medico where idMedico = @prmIdMedico)
		
		
		update Empleado
		set nroDocumento = @prmDocumento
		where Empleado.idEmpleado = @idemple
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosPaciente]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosPaciente]
(@prmIdPaciente int,
@prmDireccion varchar(300))
as
	begin
		update Paciente
		set Paciente.direccion = @prmDireccion
		where Paciente.idPaciente = @prmIdPaciente
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosUsuario]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosUsuario]
(@prmIdUsuario INT,
@prmUsuario VARCHAR(50),
@prmClave VARCHAR(50),
@prmTipUser VARCHAR(50)
)
as
	begin
	
		update Usuario
		set usuario = @prmUsuario,clave =@prmClave,tipoUser = @prmTipUser
		where idUsuario = @prmIdUsuario
	end
GO
/****** Object:  StoredProcedure [dbo].[spBuscarEmpleado]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarEmpleado]
(@prmNroDocumento varchar(8))
AS
	BEGIN
		SELECT E.idEmpleado
			 , E.nombres
			 , E.apellidos
			 , E.nroDocumento
			 , TE.descripcion
			 , E.usuario
		FROM Empleado E 
		INNER JOIN TipoEmpleado TE ON (E.idTipoEmpleado = TE.idTipoEmpleado)
		WHERE E.nroDocumento = @prmNroDocumento
	END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarLaboratorio]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarLaboratorio]
(@prmNombreLaboratorio varchar(50))
AS
	BEGIN
		SELECT E.idLaboratorio
			 , E.nombreLaboratorio
			 , E.descripcion
		FROM Laboratorio E 
		INNER JOIN Medicamentos M ON (E.idLaboratorio = M.idLaboratorio)
		WHERE E.nombreLaboratorio = @prmNombreLaboratorio
	END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarMedico]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spBuscarMedico] 
(@prmDni varchar(8))
AS
	BEGIN
		SELECT M.idMedico
			 , E.idEmpleado
			 , E.nombres as nombre
			 , E.apellidos
			 , ES.idEspecialidad
			 , ES.descripcion
			 , M.estado as estadoMedico
		FROM Medico M 
		INNER JOIN Empleado E ON (M.idEmpleado = E.idEmpleado)
		INNER JOIN Especialidad ES ON (M.idEspecialidad = ES.idEspecialidad)
		WHERE M.estado = 1
		AND E.nroDocumento = @prmDni
	END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarPacienteDNI]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarPacienteDNI]
(@prmDni varchar(10)
)
AS
	BEGIN
		SELECT P.idPaciente
		     , P.nombres AS Nombres
			 , P.apellidos AS Apellidos
			 , P.telefono AS Telefono
			 , P.edad AS Edad
			 , P.sexo AS Sexo
		FROM Paciente P
		WHERE nroDocumento = @prmDni
		and p.estado = 'True'
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarLaboratorio]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarLaboratorio]
(@prmIdLaboratorio int)
AS
	BEGIN
		UPDATE Laboratorio
		SET estado = 0
		WHERE idLaboratorio = @prmIdLaboratorio
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMedicamento]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMedicamento]
(@prmIdMedicamento int)
AS
	BEGIN
		UPDATE Medicamentos
		SET estado = 0
		WHERE idMedicamento = @prmIdMedicamento
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMedico]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMedico]
(@prmIdMedico int)
AS
	BEGIN
	    DECLARE @idem int;
	   set @idem =(Select idEmpleado from Medico
	   where idMedico = @prmIdMedico)

		UPDATE Medico
		SET estado = 0
		WHERE idMedico = @prmIdMedico

		UPDATE Empleado
		SET estado = 0
		WHERE idEmpleado = @idem
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMenu]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMenu]
(@prmIdMenu int)
AS
	BEGIN
		UPDATE Menu
		SET estado = 0
		WHERE idMenu = @prmIdMenu
	END

GO
/****** Object:  StoredProcedure [dbo].[spEliminarPaciente]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPaciente]
(@prmIdPaciente int)
AS
	BEGIN
		UPDATE Paciente
		SET estado = 0
		WHERE idPaciente = @prmIdPaciente
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarUsuario]
(@prmIdUsuario int)
AS
	BEGIN

		UPDATE Usuario
		SET estado = 0
		WHERE idUsuario = @prmIdUsuario
	END
GO
/****** Object:  StoredProcedure [dbo].[spListaMenuPrincipal]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListaMenuPrincipal]
AS
	BEGIN
		SELECT 0 idMenu, '-- Sin Menú --' nombre
		UNION
		SELECT idMenu, nombre
		FROM Menu
		WHERE url = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarEspecialidades]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarEspecialidades]
AS
	BEGIN
		SELECT E.idEspecialidad, E.descripcion
		FROM Especialidad E
		WHERE E.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarLaboratorio]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarLaboratorio]
AS
	BEGIN
		SELECT L.idLaboratorio
		     , L.nombreLaboratorio
			 , L.descripcion
		FROM Laboratorio L
		WHERE L.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicamentos]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMedicamentos]
AS
	BEGIN
		SELECT M.idMedicamento
			, ES.nombreLaboratorio
			, M.fechaVencimiento
			, M.fechaEntrada
		    , M.nombreMedicamento
			, M.Cantidad
			, M.Precio
		FROM Medicamentos M
		INNER JOIN Laboratorio ES on M.idLaboratorio = ES.idLaboratorio
		WHERE M.estado = 1 and Es.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicos]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMedicos]
AS
	BEGIN
		SELECT M.idMedico
		     , E.nombres
			 , E.apellidos
			 , E.nroDocumento
			 , ES.descripcion
		FROM Medico M
		INNER JOIN Empleado E ON M.idEmpleado = E.idEmpleado
		INNER JOIN Especialidad ES on M.idEspecialidad = ES.idEspecialidad
		WHERE M.estado = 1 and E.estado = 1 and Es.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarMenu]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMenu]
AS
	BEGIN
		SELECT idMenu, 
			   nombre, 
			   isSubmenu, 
			   ISNULL(url, '') url, 
			   ISNULL(idMenuParent, 0) idMenuParent, 
			   estado,
			   mostrar
		FROM Menu
		--WHERE estado = 1 
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarMenuPermisos]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMenuPermisos]
(@prmIdEmpleado INT,
 @prmOption INT)
AS
	SET NOCOUNT ON
	BEGIN
		CREATE TABLE #TMPPERMISOS( IDTMPPERMISOS INT IDENTITY(1,1) NOT NULL
								 , IDEMPLEADO INT
								 , ENOMBRES VARCHAR(50)
								 , TIPOEMPLEADO VARCHAR(100)
								 , IdMenu INT
								 , nombre VARCHAR(200)
								 , isSubMenu BIT
								 , url VARCHAR(200)
								 , idMenuParent INT
								 , orden INT)

		INSERT INTO #TMPPERMISOS(IDEMPLEADO, ENOMBRES, TIPOEMPLEADO, IdMenu, nombre, isSubMenu, url, idMenuParent, orden)
		SELECT E.idEmpleado
			 , E.nombres
			 , TE.descripcion
			 , M.idMenu
			 , M.nombre
			 , M.isSubmenu
			 , M.url
			 , ISNULL(M.idMenuParent, 0)
			 , M.orden
		FROM Empleado E 
		INNER JOIN TipoEmpleado TE ON (E.idTipoEmpleado = TE.idTipoEmpleado)
		INNER JOIN Permisos P ON(E.idEmpleado = P.idEmpleado)
		INNER JOIN Menu M ON (P.idMenu = M.idMenu)
		WHERE E.idEmpleado = @prmIdEmpleado AND E.estado = 1 AND M.estado = 1
		ORDER BY M.orden, M.idMenu


		IF @prmOption = 0
			BEGIN
				SELECT IdMenu
					 , nombre
					 , isSubMenu
					 , url
					 , idMenuParent
				FROM #TMPPERMISOS
			END
		ELSE
			BEGIN
				SELECT IdMenu
					 , nombre
					 , isSubMenu
					 , url
					 , ISNULL(idMenuParent, 0)idMenuParent
				FROM Menu
				WHERE idMenu NOT IN(SELECT IDMENU FROM #TMPPERMISOS)
			END

		DROP TABLE #TMPPERMISOS

	END

GO
/****** Object:  StoredProcedure [dbo].[spListarPacientes]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarPacientes]
AS
	BEGIN
		SELECT P.idPaciente
		     , P.nombres
			 , P.apellidos
			 , P.edad
			 , P.sexo
			 , P.nroDocumento
			 , P.direccion
			 ,p.telefono
		FROM Paciente P
		WHERE P.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarUsuarios]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarUsuarios]
AS
	BEGIN
		SELECT U.idUsuario
		     , E.nombres
			 , E.apellidos
		     , U.usuario
			 , U.clave
			 , E.nroDocumento
			 ,U.tipoUser
		FROM Usuario U
		INNER JOIN Empleado E ON e.idEmpleado = U.idEmpleado
		WHERE U.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spMenuPorEmpleado]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMenuPorEmpleado] 
(@prmIdEmpleado int)
AS
	BEGIN
		SELECT M.idMenu, 
			   M.nombre, M.url, 
			   M.isSubmenu, 
			   ISNULL(M.idMenuParent, 0) idMenuParent, 
			   M.estado MEstado,
			   P.estado,
			   M.mostrar
		FROM Menu M INNER JOIN 
			 Permisos P ON (M.idMenu = P.idMenu) INNER JOIN 
			 Empleado E ON (E.idEmpleado = P.idEmpleado)
		WHERE E.idEmpleado = @prmIdEmpleado 
		  AND P.estado = 1	
		ORDER BY M.orden
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarDiagnostico]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarDiagnostico]
(@prmIdPaciente INT,
 @prmObservacion VARCHAR(500),
 @prmDiagnostico VARCHAR(500)
 )
AS
	SET NOCOUNT ON
	BEGIN
		DECLARE @prmFecha DATETIME = GETDATE()
		DECLARE @prmEstado BIT = 1
		DECLARE @prmIdHistoriaClinica INT
		-- guardar la historia clinica
		IF NOT EXISTS(SELECT TOP 1 idHistoriaClinica FROM HistoriaClinica WHERE idPaciente = @prmIdPaciente)
			BEGIN
				INSERT INTO HistoriaClinica(idPaciente, fechaApertura, estado)
				VALUES(@prmIdPaciente, @prmFecha, @prmEstado)

				SET @prmIdHistoriaClinica = SCOPE_IDENTITY()
			END
		ELSE
			BEGIN
				SET @prmIdHistoriaClinica = (SELECT TOP 1 idHistoriaClinica FROM HistoriaClinica WHERE idPaciente = @prmIdPaciente)
			END

		-- guardar el diagnostico	
		INSERT INTO Diagnostico(idHistoriaClinica, fechaEmision, observacion, estado,recetaMedica)
		VALUES(@prmIdHistoriaClinica, @prmFecha, @prmDiagnostico, @prmEstado,@prmObservacion)	
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarEliminarPermiso]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarEliminarPermiso]
(@prmIdMenu int,
 @prmIdEmpleado int,
 @prmOpcion int)
AS
	SET NOCOUNT ON
	BEGIN
		IF @prmOpcion = 1  -- CREAR
			BEGIN
				
				IF NOT EXISTS(SELECT TOP 1 1 FROM Permisos WHERE idEmpleado = @prmIdEmpleado AND idMenu = @prmIdMenu)
					BEGIN
						INSERT INTO Permisos(idMenu, idEmpleado, estado)
						VALUES(@prmIdMenu, @prmIdEmpleado, 1)
					END
			END
		ELSE IF @prmOpcion = 0
			BEGIN		   -- ELIMINAR 
				DELETE FROM Permisos 
				WHERE idEmpleado = @prmIdEmpleado AND
					  idMenu = @prmIdMenu
			END
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarLaboratorio]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarLaboratorio]
(
@prmNombreLaboratorio VARCHAR(50),
@prmDescripcion VARCHAR(50),
@prmEstado bit
)
AS
	BEGIN
		INSERT INTO Laboratorio (nombreLaboratorio, descripcion,estado)
		VALUES(@prmNombreLaboratorio,@prmDescripcion,@prmEstado);
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMedicamento]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarMedicamento]
(
@prmidLaboratorio INT,
@prmNombreMedicamento VARCHAR(50),
@prmfechaVencimiento date,
@prmfechaEntrada date,
@prmCantidad INT,
@prmPrecio float (8),
@prmEstado bit
)
AS
	BEGIN

		INSERT INTO Medicamentos(idLaboratorio,nombreMedicamento,fechaVencimiento,fechaEntrada,Cantidad, Precio ,estado)
		VALUES(@prmidLaboratorio, @prmNombreMedicamento,@prmfechaVencimiento,@prmfechaEntrada,@prmCantidad,@prmPrecio,1);
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMedico]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarMedico]
(
@prmIdTipoEmp INT ,
@prmNombres VARCHAR(50),
@prmApellidos VARCHAR(50),
@prmEspecialidad INT,
@prmNroDoc VARCHAR(8), 
@prmEstado bit
)
AS
	BEGIN

	    DECLARE @idEmpleado int;

		INSERT INTO Empleado(idTipoEmpleado, nombres,apellidos,nroDocumento,estado)
		VALUES(@prmIdTipoEmp, @prmNombres,@prmApellidos,@prmNroDoc, @prmEstado);

		-- OBTENER EL ULTIMO REGISTRO INSERTADO EN LA TABLA 
			SET @idEmpleado= SCOPE_IDENTITY();

		INSERT INTO Medico(idEmpleado, idEspecialidad,estado)
		VALUES(@idEmpleado, @prmEspecialidad, @prmEstado);
		
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMenu]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarMenu]
(@prmNombre varchar(100),
 @prmIsSubmenu bit,
 @prmUrl varchar(200),
 @prmMenuParent int)
 AS
	BEGIN
		DECLARE @prmIdMenuParent INT
		IF @prmIsSubmenu = 0
			BEGIN
				
				IF @prmMenuParent = 0
				BEGIN SET @prmIdMenuParent = NULL 
				END 
				ELSE 
				BEGIN SET @prmIdMenuParent = @prmMenuParent 
				END

				INSERT INTO Menu(nombre, isSubmenu, url, idMenuParent, estado, mostrar, orden)
				VALUES(@prmNombre, @prmIsSubmenu, @prmUrl, @prmIdMenuParent, 1, 1, 7)
			END
		ELSE 
			BEGIN 
					INSERT INTO Menu(nombre, isSubmenu, url, idMenuParent, estado, mostrar, orden)
					VALUES(@prmNombre, @prmIsSubmenu, @prmUrl, @prmMenuParent, 1, 1, 7)
			END
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarPaciente]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarPaciente]
(
@prmNombres VARCHAR(50),
@prmApellidos VARCHAR(50),
@prmEdad INT,
@prmSexo CHAR(1),
@prmNroDoc VARCHAR(8), 
@prmDireccion VARCHAR(150),
@prmTelefono VARCHAR(20),
@prmEstado bit
)
AS
	BEGIN
		INSERT INTO Paciente(nombres, apellidos, edad, sexo, nroDocumento, direccion, telefono, estado)
		VALUES(@prmNombres,@prmApellidos, @prmEdad, @prmSexo, @prmNroDoc, @prmDireccion, @prmTelefono, @prmEstado);
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 25/5/2022 15:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarUsuario]
(
@prmUsuario VARCHAR(50),
@prmClave VARCHAR(50),
@prmIdEmpleado int ,
@prmTipUser VARCHAR(50),
@prmEstado bit
)
AS
	BEGIN

		INSERT INTO Usuario(usuario, clave,estado, idEmpleado,tipoUser)
		VALUES(@prmUsuario, @prmClave,1, @prmIdEmpleado,@prmTipUser);

	END
GO
