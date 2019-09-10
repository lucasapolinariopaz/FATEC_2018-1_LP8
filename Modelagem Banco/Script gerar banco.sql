USE [Seguradora]
GO
/****** Object:  Table [dbo].[acidente]    Script Date: 10/05/2018 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[acidente](
	[cod_aci] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[data] [varchar](50) NOT NULL,
	[hora] [varchar](50) NOT NULL,
	[cod_carro] [int] NOT NULL,
 CONSTRAINT [PK_acidente] PRIMARY KEY CLUSTERED 
(
	[cod_aci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[apolice]    Script Date: 10/05/2018 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[apolice](
	[cod_apolice] [int] IDENTITY(1,1) NOT NULL,
	[valor] [float] NOT NULL,
	[vigencia] [varchar](50) NOT NULL,
	[franquia] [float] NOT NULL,
	[cod_corretor] [int] NULL,
	[cod_cli] [int] NULL,
 CONSTRAINT [PK_apolice] PRIMARY KEY CLUSTERED 
(
	[cod_apolice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[carro]    Script Date: 10/05/2018 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carro](
	[chassi] [int] IDENTITY(1,1) NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[cor] [varchar](50) NOT NULL,
	[ano_fabricao] [int] NOT NULL,
	[ano_modelo] [int] NOT NULL,
 CONSTRAINT [PK_carro] PRIMARY KEY CLUSTERED 
(
	[chassi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 10/05/2018 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[cod_cli] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[data_nasc] [varchar](50) NOT NULL,
	[telefone] [varchar](50) NOT NULL,
	[endereco] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[cod_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[corretor]    Script Date: 10/05/2018 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[corretor](
	[cod_corretor] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[endereco] [varchar](50) NOT NULL,
	[telefone] [varchar](50) NOT NULL,
	[cod_empresa] [int] NULL,
 CONSTRAINT [PK_corretor] PRIMARY KEY CLUSTERED 
(
	[cod_corretor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 10/05/2018 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empresa](
	[cod_empresa] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[razao_social] [varchar](50) NOT NULL,
 CONSTRAINT [PK_empresa] PRIMARY KEY CLUSTERED 
(
	[cod_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[acidente]  WITH CHECK ADD  CONSTRAINT [FK_acidente_carro] FOREIGN KEY([cod_carro])
REFERENCES [dbo].[carro] ([chassi])
GO
ALTER TABLE [dbo].[acidente] CHECK CONSTRAINT [FK_acidente_carro]
GO
ALTER TABLE [dbo].[apolice]  WITH CHECK ADD  CONSTRAINT [FK_apolice_cliente] FOREIGN KEY([cod_cli])
REFERENCES [dbo].[cliente] ([cod_cli])
GO
ALTER TABLE [dbo].[apolice] CHECK CONSTRAINT [FK_apolice_cliente]
GO
ALTER TABLE [dbo].[apolice]  WITH CHECK ADD  CONSTRAINT [FK_apolice_corretor] FOREIGN KEY([cod_corretor])
REFERENCES [dbo].[corretor] ([cod_corretor])
GO
ALTER TABLE [dbo].[apolice] CHECK CONSTRAINT [FK_apolice_corretor]
GO
ALTER TABLE [dbo].[corretor]  WITH CHECK ADD  CONSTRAINT [FK_corretor_empresa] FOREIGN KEY([cod_empresa])
REFERENCES [dbo].[empresa] ([cod_empresa])
GO
ALTER TABLE [dbo].[corretor] CHECK CONSTRAINT [FK_corretor_empresa]
GO
