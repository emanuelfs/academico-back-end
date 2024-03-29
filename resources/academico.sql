USE [master]
GO
CREATE DATABASE [academico]
GO
USE [academico]
GO
/****** Object:  Table [dbo].[tb_aluno]    Script Date: 14/03/2022 20:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_aluno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb-aluno] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_avaliacao]    Script Date: 14/03/2022 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_avaliacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[conceito] [varchar](1) NOT NULL,
	[id_aluno_turma] [int] NOT NULL,
 CONSTRAINT [PK_tb_avaliacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_disciplina]    Script Date: 14/03/2022 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_disciplina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb-disciplina] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_professor]    Script Date: 14/03/2022 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_professor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb-professor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_turma]    Script Date: 14/03/2022 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_turma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ano] [int] NOT NULL,
	[semestre] [int] NOT NULL,
	[id_disciplina] [int] NOT NULL,
	[id_professor] [int] NOT NULL,
 CONSTRAINT [PK_tb-turma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_tb_turma] UNIQUE NONCLUSTERED 
(
	[ano] ASC,
	[semestre] ASC,
	[id_disciplina] ASC,
	[id_professor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbr_aluno_turma]    Script Date: 14/03/2022 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbr_aluno_turma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[situacao] [varchar](1) NOT NULL,
	[conceito_final] [varchar](1) NOT NULL,
	[id_aluno] [int] NOT NULL,
	[id_turma] [int] NOT NULL,
 CONSTRAINT [PK_tbr_aluno_turma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_tbr_aluno_turma] UNIQUE NONCLUSTERED 
(
	[id_aluno] ASC,
	[id_turma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_tb_avaliacao_tbr_aluno_turma] FOREIGN KEY([id_aluno_turma])
REFERENCES [dbo].[tbr_aluno_turma] ([id])
GO
ALTER TABLE [dbo].[tb_avaliacao] CHECK CONSTRAINT [FK_tb_avaliacao_tbr_aluno_turma]
GO
ALTER TABLE [dbo].[tb_turma]  WITH CHECK ADD  CONSTRAINT [FK_tb_turma_tb_disciplina] FOREIGN KEY([id_disciplina])
REFERENCES [dbo].[tb_disciplina] ([id])
GO
ALTER TABLE [dbo].[tb_turma] CHECK CONSTRAINT [FK_tb_turma_tb_disciplina]
GO
ALTER TABLE [dbo].[tb_turma]  WITH CHECK ADD  CONSTRAINT [FK_tb_turma_tb_professor] FOREIGN KEY([id_professor])
REFERENCES [dbo].[tb_professor] ([id])
GO
ALTER TABLE [dbo].[tb_turma] CHECK CONSTRAINT [FK_tb_turma_tb_professor]
GO
ALTER TABLE [dbo].[tbr_aluno_turma]  WITH CHECK ADD  CONSTRAINT [FK_tbr_aluno_turma_tb_turma] FOREIGN KEY([id_turma])
REFERENCES [dbo].[tb_turma] ([id])
GO
ALTER TABLE [dbo].[tbr_aluno_turma] CHECK CONSTRAINT [FK_tbr_aluno_turma_tb_turma]
GO
ALTER TABLE [dbo].[tbr_aluno_turma]  WITH CHECK ADD  CONSTRAINT [FK_tbr_aluno_turma_tbr_aluno_turma] FOREIGN KEY([id_aluno])
REFERENCES [dbo].[tb_aluno] ([id])
GO
ALTER TABLE [dbo].[tbr_aluno_turma] CHECK CONSTRAINT [FK_tbr_aluno_turma_tbr_aluno_turma]
GO
