
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/01/2020 18:29:26
-- Generated from EDMX file: D:\AppRestaurant\BackEnd\WebApi\WebApi\Models\DBModels.edmx
-- Autor: Juan Gutierrez
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [RestauranntDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Order_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItems_Item]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT [FK_OrderItems_Item];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItems_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT [FK_OrderItems_Order];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[Item]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Item];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderItems];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customer'
CREATE TABLE [dbo].[Customer] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NULL
);
GO

-- Creating table 'Item'
CREATE TABLE [dbo].[Item] (
    [ItemID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NULL,
    [Price] decimal(18,2)  NULL
);
GO

-- Creating table 'Order'
CREATE TABLE [dbo].[Order] (
    [OrderID] bigint IDENTITY(1,1) NOT NULL,
    [OrderNo] varchar(50)  NULL,
    [CustomerID] int  NULL,
    [PMethod] varchar(50)  NULL,
    [GTotal] decimal(18,2)  NULL
);
GO

-- Creating table 'OrderItems'
CREATE TABLE [dbo].[OrderItems] (
    [OrderItemID] bigint IDENTITY(1,1) NOT NULL,
    [OrderID] bigint  NULL,
    [ItemID] int  NULL,
    [Quantity] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerID] in table 'Customer'
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT [PK_Customer]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [ItemID] in table 'Item'
ALTER TABLE [dbo].[Item]
ADD CONSTRAINT [PK_Item]
    PRIMARY KEY CLUSTERED ([ItemID] ASC);
GO

-- Creating primary key on [OrderID] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [PK_Order]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [OrderItemID] in table 'OrderItems'
ALTER TABLE [dbo].[OrderItems]
ADD CONSTRAINT [PK_OrderItems]
    PRIMARY KEY CLUSTERED ([OrderItemID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerID] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [FK_Order_Customer]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customer]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Customer'
CREATE INDEX [IX_FK_Order_Customer]
ON [dbo].[Order]
    ([CustomerID]);
GO

-- Creating foreign key on [ItemID] in table 'OrderItems'
ALTER TABLE [dbo].[OrderItems]
ADD CONSTRAINT [FK_OrderItems_Item]
    FOREIGN KEY ([ItemID])
    REFERENCES [dbo].[Item]
        ([ItemID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItems_Item'
CREATE INDEX [IX_FK_OrderItems_Item]
ON [dbo].[OrderItems]
    ([ItemID]);
GO

-- Creating foreign key on [OrderID] in table 'OrderItems'
ALTER TABLE [dbo].[OrderItems]
ADD CONSTRAINT [FK_OrderItems_Order]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Order]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItems_Order'
CREATE INDEX [IX_FK_OrderItems_Order]
ON [dbo].[OrderItems]
    ([OrderID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------