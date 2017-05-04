
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/04/2017 17:48:32
-- Generated from EDMX file: C:\Users\G6S2AW\canales\WebApplication1\WebApplication1\TelegramDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Test];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_Comentarios_dbo_Post_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_dbo_Comentarios_dbo_Post_Id];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Comentario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comentario];
GO
IF OBJECT_ID(N'[dbo].[Post]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Post];
GO
IF OBJECT_ID(N'[TestModelStoreContainer].[database_firewall_rules]', 'U') IS NOT NULL
    DROP TABLE [TestModelStoreContainer].[database_firewall_rules];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Comentario'
CREATE TABLE [dbo].[Comentario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Id_Post] int  NOT NULL,
    [Texto] nvarchar(250)  NULL,
    [Fecha] datetime  NULL
);
GO

-- Creating table 'Post'
CREATE TABLE [dbo].[Post] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Canal] nvarchar(250)  NULL,
    [Texto] nvarchar(max)  NULL,
    [Img] nvarchar(250)  NULL,
    [Fecha] datetime  NULL,
    [idPost] nvarchar(max)  NULL
);
GO

-- Creating table 'database_firewall_rules'
CREATE TABLE [dbo].[database_firewall_rules] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(128)  NOT NULL,
    [start_ip_address] varchar(45)  NOT NULL,
    [end_ip_address] varchar(45)  NOT NULL,
    [create_date] datetime  NOT NULL,
    [modify_date] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Comentario'
ALTER TABLE [dbo].[Comentario]
ADD CONSTRAINT [PK_Comentario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [PK_Post]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id], [name], [start_ip_address], [end_ip_address], [create_date], [modify_date] in table 'database_firewall_rules'
ALTER TABLE [dbo].[database_firewall_rules]
ADD CONSTRAINT [PK_database_firewall_rules]
    PRIMARY KEY CLUSTERED ([id], [name], [start_ip_address], [end_ip_address], [create_date], [modify_date] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id_Post] in table 'Comentario'
ALTER TABLE [dbo].[Comentario]
ADD CONSTRAINT [FK_dbo_Comentarios_dbo_Post_Id]
    FOREIGN KEY ([Id_Post])
    REFERENCES [dbo].[Post]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Comentarios_dbo_Post_Id'
CREATE INDEX [IX_FK_dbo_Comentarios_dbo_Post_Id]
ON [dbo].[Comentario]
    ([Id_Post]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------