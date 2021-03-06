USE [LZTBaseFrame.Normal]
GO
/****** Object:  StoredProcedure [dbo].[usp_TestUpdateStock]    Script Date: 03/24/2015 23:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TestUpdateStock]
AS
BEGIN
PRINT '更新库存。。。'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TestUpdateOther]    Script Date: 03/24/2015 23:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_TestUpdateOther]
AS
BEGIN
PRINT '更新数据。。。'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPO]    Script Date: 03/24/2015 23:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM dbo.tb_MyUser


CREATE PROCEDURE [dbo].[usp_GetPO]
  @PONO VARCHAR(20),
  @EndDate VARCHAR(8)
AS
BEGIN
/*
SELECT * FROM TB_PO

SELECT * FROM TB_customer
SELECT * FROM tb_currency


usp_GetPO 'PO11120001','20111010'

*/

	DECLARE @SQL VARCHAR(8000)  

SET @SQL='SELECT a.PONO,a.CustomerCode,a.ReceiveDay,
a.CustomerOrderNo,a.Currency,a.Amount FROM tb_PO a WHERE 1=1 '

/*
	SET @SQL='SELECT a.PONO,a.CustomerCode,b.NativeName AS CustomerName,a.ReceiveDay,
a.CustomerOrderNo,a.Currency,c.CurrencyName,a.Amount 
FROM tb_PO a
LEFT JOIN TB_customer b ON A.CustomerCode=b.CustomerCode
LEFT JOIN tb_currency C ON A.Currency=C.Currency WHERE 1=1 '
*/

    SET @SQL=@SQL+' AND A.PONO='''+@PONO+''' AND CONVERT(VARCHAR,A.ReceiveDay,112)>='''+@EndDate+''''



	PRINT @SQL
	EXEC (@SQL)

END
GO
/****** Object:  Table [dbo].[test01]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test01](
	[testcode] [int] NOT NULL,
	[testname] [varchar](50) NULL,
 CONSTRAINT [PK_test01] PRIMARY KEY CLUSTERED 
(
	[testcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[test01] ([testcode], [testname]) VALUES (32, N'lzh')
INSERT [dbo].[test01] ([testcode], [testname]) VALUES (324, N'asdf')
/****** Object:  Table [dbo].[tb_SOs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_SOs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[SONO] [varchar](20) NOT NULL,
	[Queue] [decimal](9, 2) NOT NULL,
	[StockCode] [varchar](20) NOT NULL,
	[CustomerOrderNo] [varchar](50) NULL,
	[ShipDay] [datetime] NULL,
	[Unit] [varchar](10) NULL,
	[Qty] [int] NULL,
	[Price] [numeric](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_SalesOrderDtl] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明細表主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'ISID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'SONO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單次序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'Queue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'貨品編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'StockCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客戶訂單號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'CustomerOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'要求貨期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'ShipDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重量單位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'Unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'棉花參考價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'LastUpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後修改者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs', @level2type=N'COLUMN',@level2name=N'LastUpdatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單明細表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SOs'
GO
SET IDENTITY_INSERT [dbo].[tb_SOs] ON
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (40, N'SO1103005', CAST(1.00 AS Decimal(9, 2)), N'CS-ADO-DIRECT', N'2352454', CAST(0x00009EA700000000 AS DateTime), NULL, 5, CAST(4497.00 AS Numeric(18, 2)), CAST(22485.00 AS Decimal(18, 2)), N'456456456456', CAST(0x00009EB3012B1CEA AS DateTime), N'admin', CAST(0x00009EBF0184809B AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (41, N'SO1103005', CAST(1.20 AS Decimal(9, 2)), N'CS-MINI', N'345345', CAST(0x00009EA000000000 AS DateTime), NULL, 3, CAST(1499.97 AS Numeric(18, 2)), CAST(4499.91 AS Decimal(18, 2)), N'345', CAST(0x00009EB30131397A AS DateTime), N'admin', CAST(0x00009EBF0184809B AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (42, N'SO1103005', CAST(1.40 AS Decimal(9, 2)), N'CS-WebService', N'3453', CAST(0x00009EAF00000000 AS DateTime), NULL, 2, CAST(5997.00 AS Numeric(18, 2)), CAST(11994.00 AS Decimal(18, 2)), N'345345345', CAST(0x00009EB30131397A AS DateTime), N'admin', CAST(0x00009F99016CE825 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (43, N'SO1103006', CAST(1.00 AS Decimal(9, 2)), N'CS-MINI', N'345', CAST(0x00009EC300000000 AS DateTime), NULL, 1, CAST(1199.97 AS Numeric(18, 2)), CAST(1199.97 AS Decimal(18, 2)), NULL, CAST(0x00009EBB01891290 AS DateTime), N'admin', CAST(0x00009EBB01891290 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (44, N'SO1103006', CAST(1.20 AS Decimal(9, 2)), N'DEMO', N'2222', CAST(0x00009EC400000000 AS DateTime), NULL, 1, CAST(3879.00 AS Numeric(18, 2)), CAST(3879.00 AS Decimal(18, 2)), NULL, CAST(0x00009EBC0128D475 AS DateTime), N'admin', CAST(0x00009EBC0128D475 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (45, N'SO1104001', CAST(1.00 AS Decimal(9, 2)), N'CS-WebService', N'345', CAST(0x00009ECB00000000 AS DateTime), NULL, 3, CAST(4497.00 AS Numeric(18, 2)), CAST(13491.00 AS Decimal(18, 2)), NULL, CAST(0x00009EBC013C97A5 AS DateTime), N'admin', CAST(0x00009EBC013C97A5 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (46, N'SO1104001', CAST(1.20 AS Decimal(9, 2)), N'DEMO', N'343', CAST(0x00009EC900000000 AS DateTime), NULL, 2, CAST(3879.00 AS Numeric(18, 2)), CAST(7758.00 AS Decimal(18, 2)), NULL, CAST(0x00009EBC013C97A5 AS DateTime), N'admin', CAST(0x00009EBC013C97A5 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (47, N'SO1104002', CAST(1.00 AS Decimal(9, 2)), N'CS-WebService', N'2345', CAST(0x00027B5200000000 AS DateTime), NULL, 1, CAST(20997.00 AS Numeric(18, 2)), CAST(20997.00 AS Decimal(18, 2)), NULL, CAST(0x00009ECB010FD35C AS DateTime), N'admin', CAST(0x00009ECB010FD35C AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (51, N'SO1105001', CAST(1.00 AS Decimal(9, 2)), N'CS-MINI', N'3456', CAST(0x00009EEA00000000 AS DateTime), NULL, 41, CAST(1199.97 AS Numeric(18, 2)), CAST(49198.77 AS Decimal(18, 2)), NULL, CAST(0x00009EEA01699590 AS DateTime), N'admin', CAST(0x00009EEA01699590 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (52, N'SO1105001', CAST(1.20 AS Decimal(9, 2)), N'PRODUCE_DB', N'444', CAST(0x0000965E00000000 AS DateTime), NULL, 31, CAST(2997.00 AS Numeric(18, 2)), CAST(92907.00 AS Decimal(18, 2)), NULL, CAST(0x00009EEA01699590 AS DateTime), N'admin', CAST(0x00009EEA01699590 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (53, N'SO1103005', CAST(1.60 AS Decimal(9, 2)), N'CS-WebService', N'f', CAST(0x00009F9400000000 AS DateTime), NULL, 331, CAST(6999.00 AS Numeric(18, 2)), CAST(2316669.00 AS Decimal(18, 2)), NULL, CAST(0x00009F99016CE825 AS DateTime), N'admin', CAST(0x00009FCE015755A5 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (54, N'SO1103005', CAST(1.80 AS Decimal(9, 2)), N'CS-WebService', N'44444', CAST(0x00009F9A00000000 AS DateTime), NULL, 441, CAST(6999.00 AS Numeric(18, 2)), CAST(3086559.00 AS Decimal(18, 2)), NULL, CAST(0x00009F9A00BEA11B AS DateTime), N'admin', CAST(0x00009FCE015755A5 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (55, N'SO1111001', CAST(1.00 AS Decimal(9, 2)), N'CS-WebService', N'2', CAST(0x0000943100000000 AS DateTime), NULL, 31, CAST(6999.00 AS Numeric(18, 2)), CAST(216969.00 AS Decimal(18, 2)), NULL, CAST(0x00009F9B0179CA8D AS DateTime), N'admin', CAST(0x00009F9B0179CA8D AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (56, N'SO1111002', CAST(1.00 AS Decimal(9, 2)), N'CS-WebService', N'4', CAST(0x0000943100000000 AS DateTime), NULL, 31, CAST(6999.00 AS Numeric(18, 2)), CAST(216969.00 AS Decimal(18, 2)), NULL, CAST(0x00009F9B017C027D AS DateTime), N'admin', CAST(0x0000A00701656771 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (57, N'SO1202001', CAST(1.00 AS Decimal(9, 2)), N'ABC', N'1', CAST(0x00009FFF00000000 AS DateTime), NULL, 1, CAST(1230.00 AS Numeric(18, 2)), CAST(1230.00 AS Decimal(18, 2)), NULL, CAST(0x00009FFF01489DFF AS DateTime), N'admin', CAST(0x00009FFF01489DFF AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (58, N'SO1202001', CAST(1.20 AS Decimal(9, 2)), N'ADO2.2', N'2', CAST(0x00009FFF00000000 AS DateTime), NULL, 1, CAST(8999.88 AS Numeric(18, 2)), CAST(8999.88 AS Decimal(18, 2)), NULL, CAST(0x00009FFF01489DFF AS DateTime), N'admin', CAST(0x00009FFF01489DFF AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (59, N'SO1202001', CAST(1.40 AS Decimal(9, 2)), N'CPU', N'6', CAST(0x000098E400000000 AS DateTime), NULL, 1, CAST(2000.00 AS Numeric(18, 2)), CAST(2000.00 AS Decimal(18, 2)), NULL, CAST(0x0000A00300AF9BCC AS DateTime), N'admin', CAST(0x0000A007015DF588 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (60, N'SO1202001', CAST(1.60 AS Decimal(9, 2)), N'CDE', N'7', CAST(0x000098E400000000 AS DateTime), NULL, 1, CAST(1500.00 AS Numeric(18, 2)), CAST(1500.00 AS Decimal(18, 2)), NULL, CAST(0x0000A00300B446BA AS DateTime), N'admin', CAST(0x0000A007015DF588 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (61, N'SO1202001', CAST(1.80 AS Decimal(9, 2)), N'CS-MINI', N'7', CAST(0x0000977700000000 AS DateTime), NULL, 1, CAST(399.99 AS Numeric(18, 2)), CAST(399.99 AS Decimal(18, 2)), NULL, CAST(0x0000A007015DF588 AS DateTime), N'admin', CAST(0x0000A007015DF588 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (62, N'SO1111002', CAST(1.20 AS Decimal(9, 2)), N'CS-MINI', N'44', CAST(0x0000933300000000 AS DateTime), NULL, 71, CAST(6399.99 AS Numeric(18, 2)), CAST(454399.29 AS Decimal(18, 2)), NULL, CAST(0x0000A00701650FDD AS DateTime), N'admin', CAST(0x0000A00701656771 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (63, N'SO1203001', CAST(1.00 AS Decimal(9, 2)), N'CS-MINI', N'4', CAST(0x0000960A00000000 AS DateTime), NULL, 21, CAST(399.99 AS Numeric(18, 2)), CAST(8399.79 AS Decimal(18, 2)), NULL, CAST(0x0000A007017957D1 AS DateTime), N'admin', CAST(0x0000A007017957D1 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (64, N'SO1203001', CAST(1.20 AS Decimal(9, 2)), N'DEMO', N'43', CAST(0x0000960A00000000 AS DateTime), NULL, 31, CAST(1293.00 AS Numeric(18, 2)), CAST(40083.00 AS Decimal(18, 2)), NULL, CAST(0x0000A007017957D1 AS DateTime), N'admin', CAST(0x0000A007017957D1 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (65, N'SO1203002', CAST(1.00 AS Decimal(9, 2)), N'CS-ADO-DIRECT', N'333', CAST(0x00003F0500000000 AS DateTime), NULL, 1, CAST(3999.99 AS Numeric(18, 2)), CAST(3999.99 AS Decimal(18, 2)), NULL, CAST(0x0000A00A00C884A6 AS DateTime), N'admin', CAST(0x0000A00A00C884A6 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (66, N'SO1203006', CAST(1.00 AS Decimal(9, 2)), N'CS-WebService', N'6', CAST(0x000098E700000000 AS DateTime), NULL, 1, CAST(6999.00 AS Numeric(18, 2)), CAST(6999.00 AS Decimal(18, 2)), NULL, CAST(0x0000A00A00D3E87E AS DateTime), N'admin', CAST(0x0000A00A00D3E87E AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (67, N'SO1203004', CAST(1.00 AS Decimal(9, 2)), N'AMDCPU', N'3', NULL, NULL, 1, CAST(1800.00 AS Numeric(18, 2)), CAST(1800.00 AS Decimal(18, 2)), NULL, CAST(0x0000A00A00D71174 AS DateTime), N'admin', CAST(0x0000A00A00D71174 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (68, N'SO1203008', CAST(1.00 AS Decimal(9, 2)), N'CS-MINI', N'4', CAST(0x0000961000000000 AS DateTime), NULL, 1, CAST(399.99 AS Numeric(18, 2)), CAST(399.99 AS Decimal(18, 2)), NULL, CAST(0x0000A00D00D55F17 AS DateTime), N'admin', CAST(0x0000A00D00D55F17 AS DateTime), N'admin')
INSERT [dbo].[tb_SOs] ([ISID], [SONO], [Queue], [StockCode], [CustomerOrderNo], [ShipDay], [Unit], [Qty], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (69, N'SO1104001', CAST(1.40 AS Decimal(9, 2)), N'DEMO', N'345', CAST(0x0000A2DB00000000 AS DateTime), NULL, 1, CAST(1293.00 AS Numeric(18, 2)), CAST(1293.00 AS Decimal(18, 2)), NULL, CAST(0x0000A2DB00841A9D AS DateTime), N'admin', CAST(0x0000A2DB00841A9D AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_SOs] OFF
/****** Object:  Table [dbo].[tb_SO]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_SO](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[SONO] [varchar](20) NOT NULL,
	[VerNo] [varchar](2) NULL,
	[CustomerCode] [varchar](20) NULL,
	[ReceiveDay] [datetime] NULL,
	[PayType] [varchar](10) NULL,
	[CustomerOrderNo] [varchar](20) NULL,
	[Salesman] [varchar](20) NULL,
	[Currency] [varchar](4) NULL,
	[Amount] [numeric](18, 2) NULL,
	[FinishingStatus] [varchar](10) NULL,
	[OrderFinishDay] [datetime] NULL,
	[Remark] [nvarchar](200) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[FlagApp] [char](1) NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
 CONSTRAINT [PK_tb_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[SONO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'SONO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'VerNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'CustomerCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接單日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'ReceiveDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客戶訂單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'CustomerOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'營銷員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'Salesman'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幣種' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'FinishingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單實際完成日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'OrderFinishDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_SO', @level2type=N'COLUMN',@level2name=N'Remark'
GO
SET IDENTITY_INSERT [dbo].[tb_SO] ON
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (20, N'SO1103005', N'03', N'CUSTOMER', CAST(0x00009EB300000000 AS DateTime), N'CASH', N'345345', N'001', N'RMB', CAST(5442206.91 AS Numeric(18, 2)), NULL, NULL, N'345345345345345345345xxxxxxxxxxxxxxxxxxxxxxxxxxx
abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', CAST(0x00009EB301293F1E AS DateTime), N'admin', CAST(0x00009FCE015755A5 AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D0174E223 AS DateTime))
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (21, N'SO1103006', N'05', N'CUSTOMER', CAST(0x00009EB300000000 AS DateTime), N'CASH', N'2345234', N'02', N'HKD', CAST(5078.97 AS Numeric(18, 2)), NULL, NULL, N'34523234523452345', CAST(0x00009EB30129554B AS DateTime), N'admin', CAST(0x0000A2DB00849F76 AS DateTime), N'admin', N'Y', NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (22, N'SO1104001', N'01', N'CUSTOMER', CAST(0x00009EBC00000000 AS DateTime), N'CHEQUE', N'234234', N'001', N'RMB', CAST(22542.00 AS Numeric(18, 2)), NULL, NULL, N'ok?  有个小bug,录完就改，呵呵！', CAST(0x00009EBC013C2B27 AS DateTime), N'admin', CAST(0x0000A2DB00841A9D AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (23, N'SO1104002', N'01', N'CUSTOMER', CAST(0x00009ECB00000000 AS DateTime), N'CHEQUE', N'2345', N'02', N'RMB', CAST(6999.00 AS Numeric(18, 2)), NULL, NULL, N'234523452345', CAST(0x00009ECB010FC2BF AS DateTime), N'admin', CAST(0x00009ECB010FD35C AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (24, N'SO1105001', N'03', N'CUSTOMER', CAST(0x00009EDD00000000 AS DateTime), N'CASH', N'333', N'001', N'RMB', CAST(47368.59 AS Numeric(18, 2)), NULL, NULL, N'33333333333333333333333333333333333333w456463456', CAST(0x00009EDD010DA27F AS DateTime), N'admin', CAST(0x00009EEA016D668B AS DateTime), N'admin', N'Y', NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (25, N'SO1105002', N'01', N'SUPPLIER', CAST(0x00009EDD00000000 AS DateTime), N'CASH', N'444', N'001', N'RMB', CAST(0.00 AS Numeric(18, 2)), NULL, NULL, N'44446666', CAST(0x00009EDD01125BDF AS DateTime), N'admin', CAST(0x00009EDD01129998 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (26, N'SO1111001', N'01', N'SUPPLIER', CAST(0x00009F9B00000000 AS DateTime), N'CHEQUE', N'234234', N'02', N'USD', CAST(216969.00 AS Numeric(18, 2)), NULL, NULL, N'234234234', CAST(0x00009F9B0179BA41 AS DateTime), N'admin', CAST(0x00009F9B0179CA8D AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (27, N'SO1111002', N'01', N'SUPPLIER', CAST(0x00009F9B00000000 AS DateTime), N'CHEQUE', N'345345345', N'fff', N'RMB', CAST(671368.29 AS Numeric(18, 2)), NULL, NULL, N'345345345345345345345345345345ssss', CAST(0x00009F9B017BEE13 AS DateTime), N'admin', CAST(0x0000A008013F7309 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (28, N'SO1202001', N'01', N'WCL', CAST(0x00009FFF00000000 AS DateTime), N'CASH', NULL, N'001', N'HKD', CAST(14129.87 AS Numeric(18, 2)), NULL, NULL, N'5464564564564564565675456456xxxxxxxxxxxxxxxxxxxxxxxxx66666
asdfasdfasdf7567567567567bbbbbwrwerwerwer', CAST(0x00009FFF01482E56 AS DateTime), N'admin', CAST(0x0000A00A00CEA301 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (29, N'SO1203001', N'01', N'CUSTOMER', CAST(0x0000A00700000000 AS DateTime), N'CHEQUE', N'345', N'555', N'HKD', CAST(48482.79 AS Numeric(18, 2)), NULL, NULL, N'34523452345234523452345saasdfasfasdf', CAST(0x0000A0070179392F AS DateTime), N'admin', CAST(0x0000A008011ECBE4 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (30, N'SO1203002', N'01', N'CUSTOMER', CAST(0x0000A00A00000000 AS DateTime), N'CHEQUE', N'324', N'02', N'USD', CAST(3999.99 AS Numeric(18, 2)), NULL, NULL, N'234234', CAST(0x0000A00A00C7DAED AS DateTime), N'admin', CAST(0x0000A00A00C884A6 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (31, N'SO1203003', N'01', N'customer4', CAST(0x0000A00A00000000 AS DateTime), NULL, NULL, NULL, NULL, CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, CAST(0x0000A00A00C8CC55 AS DateTime), N'admin', CAST(0x0000A00A00C8D82E AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (32, N'SO1203004', N'01', N'YG', CAST(0x0000A00A00000000 AS DateTime), N'CHEQUE', N'567', N'02', N'USD', CAST(1800.00 AS Numeric(18, 2)), NULL, NULL, N'234234234', CAST(0x0000A00A00C8EE43 AS DateTime), N'admin', CAST(0x0000A00A00D71174 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (33, N'SO1203005', N'01', N'customer4', CAST(0x0000A00A00000000 AS DateTime), N'CASH', NULL, NULL, NULL, CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, CAST(0x0000A00A00CD4957 AS DateTime), N'admin', CAST(0x0000A00A00CD4F95 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (34, N'SO1203006', N'01', N'YG', CAST(0x0000A00A00000000 AS DateTime), N'CHEQUE', N'6666', N'555', N'USD', CAST(6999.00 AS Numeric(18, 2)), NULL, NULL, N'5555555555555555555555555555555', CAST(0x0000A00A00D3D3EE AS DateTime), N'admin', CAST(0x0000A00A00D3E87E AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (35, N'SO1203007', N'01', N'YG', CAST(0x0000A00A00000000 AS DateTime), N'CHEQUE', N'sdf', N'02', N'RMB', CAST(0.00 AS Numeric(18, 2)), NULL, NULL, N'asdfasdf', CAST(0x0000A00A00D71827 AS DateTime), N'admin', CAST(0x0000A00A00D726F3 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (36, N'SO1203008', N'01', N'WCL', CAST(0x0000A00D00000000 AS DateTime), N'VIA', N'345345345', N'004', N'USD', CAST(399.99 AS Numeric(18, 2)), NULL, NULL, N'345345345345444', CAST(0x0000A00D00D54B50 AS DateTime), N'admin', CAST(0x0000A00D00D564AD AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_SO] ([ISID], [SONO], [VerNo], [CustomerCode], [ReceiveDay], [PayType], [CustomerOrderNo], [Salesman], [Currency], [Amount], [FinishingStatus], [OrderFinishDay], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (37, N'SO1203009', N'01', N'WCL', CAST(0x0000A01F00000000 AS DateTime), N'CHEQUE', N'234', N'004', N'HKD', CAST(0.00 AS Numeric(18, 2)), NULL, NULL, N'234234234', CAST(0x0000A01F00E65E01 AS DateTime), N'admin', CAST(0x0000A01F00E6691A AS DateTime), N'admin', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_SO] OFF
/****** Object:  Table [dbo].[tb_ProductCategory]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ProductCategory](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [varchar](20) NOT NULL,
	[ParentId] [varchar](20) NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Column1] [nvarchar](50) NULL,
	[Remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_tb_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_ProductCategory] ON
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (24, N'3456', N'CPU', N'3456', N'24-3456', N'备注24-3456')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (25, N'5555', N'SFW', N'55', N'555', N'5555')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (6, N'AMD', N'CPU', N'AMD处理器', N'6-AMD处理器', N'备注6-AMD处理器')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (5, N'CPU', N'', N'CPU', N'5-CPU', N'备注5-CPU')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (9, N'DELL', N'MONITOR', N'戴尔', N'9-戴尔', N'备注9-戴尔')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (2, N'HD', N'', N'硬盘', N'2-硬盘', N'备注2-硬盘')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (7, N'INTEL', N'CPU', N'INTELT处理器', N'7-INTELT处理器', N'备注7-INTELT处理器')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (4, N'M_BOARD', N'', N'主板', N'4-主板', N'备注4-主板')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (1, N'MEMORY', N'', N'内存', N'1-内存', N'备注1-内存')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (3, N'MONITOR', N'', N'显示器', N'3-显示器', N'备注3-显示器')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (8, N'SAMSANG', N'MONITOR', N'三星', N'8-三星', N'备注8-三星')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (12, N'SFW', N'', N'开发框架', N'12-开发框架', N'备注12-开发框架')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (13, N'SFW01', N'SFW', N'商业版本', N'13-商业版本', N'备注13-商业版本')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (10, N'SG', N'HD', N'西捷', N'10-西捷', N'备注10-西捷')
INSERT [dbo].[tb_ProductCategory] ([isid], [CategoryId], [ParentId], [CategoryName], [Column1], [Remark]) VALUES (22, N'v22', N'SFW', N'v22222', N'22-v222223434', N'备注22-v222223333')
SET IDENTITY_INSERT [dbo].[tb_ProductCategory] OFF
/****** Object:  Table [dbo].[tb_Product]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Product](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[CategoryId] [varchar](20) NULL,
	[SellPrice] [decimal](18, 2) NULL,
	[Supplier] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_tb_Product] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Product] ON
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (8, N'ABC', N'DELL显示器19''', N'MONITOR', CAST(1230.00 AS Decimal(18, 2)), N'34534', N'cc')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (6, N'ADO2.2', N'C/S快速开发框架V2.2', N'SFW', CAST(8999.88 AS Decimal(18, 2)), N'C/S框架网 ', N'C/S框架网 www.csframework.com')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (11, N'AMDCPU', N'4Core Intal CPU', N'AMD', CAST(1800.00 AS Decimal(18, 2)), N'555555555555', N'5456565656')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (9, N'CDE', N'Samsang显示器21''', N'MONITOR', CAST(1500.00 AS Decimal(18, 2)), N'444444444', N'2345234234')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (10, N'CPU', N'4Core Intal CPU', N'CPU', CAST(2000.00 AS Decimal(18, 2)), N'34', N'345')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (2, N'CS-ADO-DIRECT', N'C/S框架标准版', N'SFW', CAST(3999.99 AS Decimal(18, 2)), N'C/S框架网', N'www.csframework.com C/S框架网')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (1, N'CS-MINI', N'C/S框架精简版', N'SFW', CAST(399.99 AS Decimal(18, 2)), N'C/S框架网', N'www.csframework.com C/S框架网')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (3, N'CS-WebService', N'C/S框架高级版', N'SFW01', CAST(6999.00 AS Decimal(18, 2)), N'C/S框架网', N'www.csframework.com C/S框架网')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (4, N'DEMO', N'DEMODEMO444000000000', N'M_BOARD', CAST(1293.00 AS Decimal(18, 2)), N'DEMO330000000000', N'4234533300000000000')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (7, N'PRODUCE_DB', N'生产数据库25555554444', N'DELL', CAST(999.00 AS Decimal(18, 2)), N'CSFRAMEWORK55', N'5C/S框架网555555666666')
INSERT [dbo].[tb_Product] ([isid], [ProductCode], [ProductName], [CategoryId], [SellPrice], [Supplier], [Remark]) VALUES (16, N'XX', N'XX', N'XX', CAST(33.00 AS Decimal(18, 2)), N'XX', N'XX')
SET IDENTITY_INSERT [dbo].[tb_Product] OFF
/****** Object:  Table [dbo].[tb_POs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_POs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[PONO] [varchar](20) NOT NULL,
	[Queue] [decimal](9, 2) NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[Unit] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[Price] [numeric](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_POs] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_POs] ON
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, N'PO1203001', CAST(0.00 AS Decimal(9, 2)), N'CPU', N'3', 50, CAST(40.00 AS Numeric(18, 2)), CAST(2000.00 AS Decimal(18, 2)), N'2222', CAST(0x0000A00C012BB1F6 AS DateTime), N'admin', CAST(0x0000A00C012BB1F6 AS DateTime), N'admin')
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, N'PO1203002', CAST(0.00 AS Decimal(9, 2)), N'CS-MINI', N'4', 40, CAST(50.00 AS Numeric(18, 2)), CAST(2000.00 AS Decimal(18, 2)), NULL, CAST(0x0000A00C012D54B9 AS DateTime), N'admin', CAST(0x0000A00C012D54B9 AS DateTime), N'admin')
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, N'PO1203003', CAST(0.00 AS Decimal(9, 2)), N'CPU', N'3', 5, CAST(224.00 AS Numeric(18, 2)), CAST(1120.00 AS Decimal(18, 2)), NULL, CAST(0x0000A00D00D2EE68 AS DateTime), N'admin', CAST(0x0000A00D00D2EE68 AS DateTime), N'admin')
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, N'PO1203004', CAST(0.00 AS Decimal(9, 2)), N'CPU', N'4', 0, CAST(40.00 AS Numeric(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(0x0000A00D00D78B4A AS DateTime), N'admin', CAST(0x0000A00D00D78B4A AS DateTime), N'admin')
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, N'PO1203005', CAST(0.00 AS Decimal(9, 2)), N'DEMO', N'3', 20, CAST(40.00 AS Numeric(18, 2)), CAST(800.00 AS Decimal(18, 2)), NULL, CAST(0x0000A01F00F1B800 AS DateTime), N'admin', CAST(0x0000A01F00F1B800 AS DateTime), N'admin')
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (8, N'PO1203005', CAST(0.00 AS Decimal(9, 2)), N'CS-MINI', N'3', 30, CAST(40.00 AS Numeric(18, 2)), CAST(1200.00 AS Decimal(18, 2)), NULL, CAST(0x0000A01F00F1CF46 AS DateTime), N'admin', CAST(0x0000A01F00F1CF46 AS DateTime), N'admin')
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (9, N'PO1203005', CAST(0.00 AS Decimal(9, 2)), N'CDE', N'22', 40, CAST(30.00 AS Numeric(18, 2)), CAST(1200.00 AS Decimal(18, 2)), NULL, CAST(0x0000A01F00F1CF46 AS DateTime), N'admin', CAST(0x0000A01F00F1CF46 AS DateTime), N'admin')
INSERT [dbo].[tb_POs] ([ISID], [PONO], [Queue], [ProductCode], [Unit], [Quantity], [Price], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (10, N'PO1203004', CAST(0.00 AS Decimal(9, 2)), N'AMDCPU', N'4', 3, CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'asdfadf', CAST(0x0000A3170172BF1F AS DateTime), N'admin', CAST(0x0000A3170172BF1F AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_POs] OFF
/****** Object:  Table [dbo].[tb_PO]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_PO](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[PONO] [varchar](20) NOT NULL,
	[PODate] [datetime] NULL,
	[POUser] [varchar](20) NULL,
	[CustomerCode] [varchar](20) NULL,
	[CustomerContact] [varchar](20) NULL,
	[CustomerTel] [varchar](20) NULL,
	[PayType] [varchar](10) NULL,
	[CustomerOrderNo] [varchar](20) NULL,
	[Currency] [varchar](4) NULL,
	[Amount] [numeric](18, 2) NULL,
	[Remark] [nvarchar](200) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[FlagApp] [char](1) NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
 CONSTRAINT [PK_tb_PO] PRIMARY KEY CLUSTERED 
(
	[PONO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_PO] ON
INSERT [dbo].[tb_PO] ([ISID], [PONO], [PODate], [POUser], [CustomerCode], [CustomerContact], [CustomerTel], [PayType], [CustomerOrderNo], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (2, N'PO1203001', CAST(0x0000A00C012B2FF0 AS DateTime), N'555', N'FFT', N'234', N'234', N'CHEQUE', NULL, N'RMB', CAST(2000.00 AS Numeric(18, 2)), N'234234234', CAST(0x0000A00C012B2FF0 AS DateTime), N'admin', CAST(0x0000A00C012BB1F6 AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D0178A168 AS DateTime))
INSERT [dbo].[tb_PO] ([ISID], [PONO], [PODate], [POUser], [CustomerCode], [CustomerContact], [CustomerTel], [PayType], [CustomerOrderNo], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (3, N'PO1203002', CAST(0x0000A00C012C8938 AS DateTime), N'admin', N'SUPPLIER', N'Mr.Ling', N'0755-88888888', N'CHEQUE', NULL, N'HKD', CAST(2000.00 AS Numeric(18, 2)), N'asfasdfasdfsdaf', CAST(0x0000A00C012C8938 AS DateTime), N'admin', CAST(0x0000A00C012D54B9 AS DateTime), N'admin', N'N', NULL, NULL)
INSERT [dbo].[tb_PO] ([ISID], [PONO], [PODate], [POUser], [CustomerCode], [CustomerContact], [CustomerTel], [PayType], [CustomerOrderNo], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (4, N'PO1203003', CAST(0x0000A00D00D2DE18 AS DateTime), N'admin', N'SUPPLIER', N'Mr.Ling', N'0755-88888888', N'CASH', NULL, N'RMB', CAST(1120.00 AS Numeric(18, 2)), N'234234234', CAST(0x0000A00D00D2DE18 AS DateTime), N'admin', CAST(0x0000A00D00D2EE68 AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A00D00D4F711 AS DateTime))
INSERT [dbo].[tb_PO] ([ISID], [PONO], [PODate], [POUser], [CustomerCode], [CustomerContact], [CustomerTel], [PayType], [CustomerOrderNo], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (5, N'PO1203004', CAST(0x0000A00D00D50F33 AS DateTime), N'004', N'SUPPLIER', N'Mr.Ling', N'0755-88888888', N'CHEQUE', NULL, N'HKD', CAST(0.00 AS Numeric(18, 2)), N'2342342222', CAST(0x0000A00D00D50F33 AS DateTime), N'admin', CAST(0x0000A3170172BF1F AS DateTime), N'admin', N'N', NULL, NULL)
INSERT [dbo].[tb_PO] ([ISID], [PONO], [PODate], [POUser], [CustomerCode], [CustomerContact], [CustomerTel], [PayType], [CustomerOrderNo], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (6, N'PO1203005', CAST(0x0000A01F00F1A0D1 AS DateTime), N'admin', N'FFT', N'刘先生', N'234', N'CHEQUE', NULL, N'USD', CAST(3200.00 AS Numeric(18, 2)), N'234234', CAST(0x0000A01F00F1A0D1 AS DateTime), N'admin', CAST(0x0000A01F00F1CF46 AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A01F00F1DCEA AS DateTime))
INSERT [dbo].[tb_PO] ([ISID], [PONO], [PODate], [POUser], [CustomerCode], [CustomerContact], [CustomerTel], [PayType], [CustomerOrderNo], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (7, N'PO1203006', CAST(0x0000A01F00F23132 AS DateTime), N'admin', N'WQ', N'张先生', NULL, N'CASH', NULL, N'HKD', CAST(0.00 AS Numeric(18, 2)), N'345345345', CAST(0x0000A01F00F23132 AS DateTime), N'admin', CAST(0x0000A01F00F2435C AS DateTime), N'admin', N'N', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_PO] OFF
/****** Object:  Table [dbo].[tb_Person]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Person](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[SalesCode] [varchar](20) NOT NULL,
	[SalesName] [nvarchar](20) NOT NULL,
	[Department] [varchar](20) NULL,
	[InUse] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_Person] PRIMARY KEY CLUSTERED 
(
	[SalesCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Person] ON
INSERT [dbo].[tb_Person] ([ISID], [SalesCode], [SalesName], [Department], [InUse], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, N'001', N'jonny3', N'03 ', N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Person] ([ISID], [SalesCode], [SalesName], [Department], [InUse], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, N'003', N'Maggie', N'03 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Person] ([ISID], [SalesCode], [SalesName], [Department], [InUse], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (8, N'004', N'test', N'02 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Person] ([ISID], [SalesCode], [SalesName], [Department], [InUse], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, N'02', N'zzf', N'02 ', N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Person] ([ISID], [SalesCode], [SalesName], [Department], [InUse], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, N'555', N'6664444', N'01 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Person] ([ISID], [SalesCode], [SalesName], [Department], [InUse], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, N'fff', N'asdf', N'02 ', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Person] OFF
/****** Object:  Table [dbo].[tb_PayType]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_PayType](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[PayType] [varchar](10) NOT NULL,
	[TypeName] [nvarchar](20) NULL,
 CONSTRAINT [PK_tb_PayType] PRIMARY KEY CLUSTERED 
(
	[PayType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_PayType] ON
INSERT [dbo].[tb_PayType] ([isid], [PayType], [TypeName]) VALUES (1, N'CASH', N'现金')
INSERT [dbo].[tb_PayType] ([isid], [PayType], [TypeName]) VALUES (2, N'CHEQUE', N'支票')
INSERT [dbo].[tb_PayType] ([isid], [PayType], [TypeName]) VALUES (3, N'VIA', N'转帐')
SET IDENTITY_INSERT [dbo].[tb_PayType] OFF
/****** Object:  Table [dbo].[tb_MyUserRole]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_MyUserRole](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [varchar](30) NULL,
	[ModuleID] [int] NULL,
	[AuthorityID] [varchar](50) NULL,
	[Authorities] [int] NULL,
 CONSTRAINT [PK_tb_MyUserRole] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_MyUserRole] ON
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (1, N'3', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (2, N'3', 0, N'测试ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (3, N'3', 0, N'测试1ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (4, N'3', 0, N'测试1ToolStripMenuItem1', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (5, N'3', 0, N'货币定义ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (6, N'3', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (7, N'3', 0, N'测试ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (8, N'3', 0, N'测试1ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (9, N'3', 0, N'测试1ToolStripMenuItem1', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (10, N'3', 0, N'货币定义ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (11, N'3', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (12, N'3', 0, N'测试ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (13, N'3', 0, N'测试1ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (14, N'3', 0, N'测试1ToolStripMenuItem1', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (15, N'3', 0, N'货币定义ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (16, N'3', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (17, N'3', 0, N'测试ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (18, N'3', 0, N'测试1ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (19, N'3', 0, N'测试1ToolStripMenuItem1', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (20, N'3', 0, N'货币定义ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (21, N'admin_group', 2, N'menuPurchaseMain', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (22, N'admin_group', 2, N'menuItemPO', 106)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (23, N'admin_group', 3, N'menuMainInventory', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (24, N'admin_group', 3, N'menuItemCheck', 7167)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (25, N'admin_group', 3, N'menuItemQuery', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (26, N'admin_group', 4, N'menuSystemManager', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (27, N'admin_group', 4, N'menuItemUserMgr', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (28, N'admin_group', 4, N'menuItemAuth', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (29, N'admin_group', 4, N'menuItemSetup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (30, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (32, N'admin_group', 1, N'menuItemStock', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (33, N'admin_group', 0, N'测试ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (34, N'admin_group', 0, N'测试1ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (35, N'admin_group', 0, N'测试1ToolStripMenuItem1', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (36, N'admin_group', 0, N'货币定义ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (37, N'admin_group', 0, N'menuMainSalesSystem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (39, N'admin_group', 0, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (40, N'admin_group', 0, N'销售月报表ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (41, N'admin_group', 0, N'销售汇总表按客户ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (42, N'admin_group', 0, N'销售分析报表ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (43, N'admin_group', 4, N'menuMainInventory', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (44, N'admin_group', 0, N'入库单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (45, N'admin_group', 0, N'出库单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (46, N'admin_group', 0, N'调整单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (47, N'admin_group', 4, N'menuItemCheck', 32879)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (48, N'admin_group', 0, N'menuMainDataDict', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (49, N'admin_group', 0, N'生产单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (50, N'admin_group', 7, N'menuSystemManager', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (51, N'admin_group', 7, N'menuItemUserMgr', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (52, N'admin_group', 7, N'menuItemAuth', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (54, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (55, N'admin_group', 7, N'menuCompanyInfo', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (56, N'admin_group', 0, N'测试ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (57, N'admin_group', 0, N'测试1ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (58, N'admin_group', 0, N'测试1ToolStripMenuItem1', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (59, N'admin_group', 0, N'货币定义ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (60, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (61, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (65, N'admin_group', 0, N'menuItemCustomer', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (67, N'data_dict', 1, N'menuMainDataDict', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (68, N'data_dict', 1, N'menuItemStock', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (69, N'data_dict', 0, N'menuItemCustomer', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (70, N'data_dict', 1, N'menuSales', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (71, N'data_dict', 1, N'menuCommonDataDict', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (72, N'Sales', 0, N'menuItemCustomer', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (73, N'Sales', 0, N'menuMainSalesSystem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (74, N'Sales', 3, N'menuSalesOrder', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (75, N'Sales', 3, N'menuDO', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (76, N'Sales', 0, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (77, N'Sales', 0, N'销售月报表ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (78, N'Sales', 0, N'销售汇总表按客户ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (79, N'Sales', 0, N'销售分析报表ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (80, N'Sales', 3, N'menuItemInvoice', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (81, N'Sales', 3, N'menuItemAR', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (84, N'admin_group', 7, N'menuCustomMenuAuth', 5)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (85, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (86, N'data_dict', 1, N'menuItemCustomer', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (87, N'data_dict', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (88, N'Sales', 0, N'menuMainSalesSystem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (89, N'Sales', 3, N'menuSalesOrder', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (90, N'Sales', 3, N'menuDO', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (91, N'Sales', 0, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (92, N'Sales', 0, N'销售月报表ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (93, N'Sales', 0, N'销售汇总表按客户ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (94, N'Sales', 0, N'销售分析报表ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (95, N'Sales', 3, N'menuItemInvoice', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (96, N'Sales', 3, N'menuItemAR', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (97, N'Sales', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (98, N'data_dict', 1, N'menuProduct', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (101, N'data_dict', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (104, N'admin_group', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (105, N'admin_group', 2, N'menuStockIn', 32879)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (106, N'admin_group', 0, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (107, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (108, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (109, N'admin_group', 0, N'menuMainSalesSystem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (113, N'admin_group', 0, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (114, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (115, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (116, N'admin_group', 0, N'menuRpt03', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (117, N'admin_group', 0, N'menuItemStockIn', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (118, N'admin_group', 0, N'menuItemStockOut', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (119, N'admin_group', 0, N'menuItemAdj', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (120, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (121, N'system_manage', 7, N'menuSystemManager', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (122, N'system_manage', 7, N'menuCompanyInfo', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (123, N'system_manage', 7, N'menuItemUserMgr', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (124, N'system_manage', 7, N'menuItemAuth', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (125, N'system_manage', 7, N'menuCustomMenuAuth', 65541)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (126, N'system_manage', 7, N'menuItemSetup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (127, N'system_manage', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (134, N'admin_group', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (158, N'admin_group', 1, N'menuProductCategory', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (159, N'admin_group', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (160, N'admin_group', 0, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (161, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (162, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (163, N'admin_group', 3, N'menuMainSalesSystem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (164, N'admin_group', 0, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (165, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (166, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (167, N'admin_group', 0, N'menuRpt03', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (168, N'admin_group', 0, N'menuItemStockIn', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (169, N'admin_group', 0, N'menuItemStockOut', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (170, N'admin_group', 0, N'menuItemAdj', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (171, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (172, N'S1', 1, N'menuMainDataDict', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (173, N'S1', 1, N'menuItemEmployee', 65536)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (174, N'S1', 1, N'menuSales', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (175, N'S1', 3, N'menuMainSalesSystem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (176, N'S1', 3, N'menuSalesOrder', 32878)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (177, N'admin_group', 0, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (178, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (179, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (180, N'admin_group', 0, N'menuRpt03', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (181, N'admin_group', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (182, N'admin_group', 0, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (183, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (184, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (185, N'admin_group', 2, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (186, N'admin_group', 2, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (187, N'admin_group', 2, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (188, N'admin_group', 2, N'menuItemQuo', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (189, N'admin_group', 2, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (190, N'admin_group', 2, N'menuRpt03', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (191, N'admin_group', 0, N'menuItemStockIn', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (192, N'admin_group', 0, N'menuItemStockOut', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (193, N'admin_group', 0, N'menuItemAdj', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (194, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (195, N'admin_group', 0, N'menuItemBackup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (196, N'admin_group', 4, N'menuItemStockIn', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (197, N'admin_group', 4, N'menuItemStockOut', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (198, N'admin_group', 4, N'menuItemAdj', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (202, N'admin_group', 3, N'menuItemInvoice', 32879)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (203, N'test G', 3, N'menuMainSalesSystem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (205, N'test G', 3, N'menuSalesOrder', 5)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (218, N'admin_group', 0, N'二级菜单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (219, N'admin_group', 0, N'menuLevel3', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (220, N'admin_group', 3, N'menuSalesOrder', 32879)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (221, N'admin_group', 3, N'menuItemAR', 32879)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (222, N'data_dict', 0, N'二级菜单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (223, N'data_dict', 0, N'menuLevel3', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (224, N'admin_group', 7, N'menuItemSetup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (225, N'admin_group', 7, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (226, N'admin_group', 7, N'menuItemBackup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (227, N'data_dict', 0, N'二级菜单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (228, N'data_dict', 0, N'menuLevel3', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (229, N'admin_group', 0, N'二级菜单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (230, N'admin_group', 0, N'menuLevel3', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (231, N'admin_group', 1, N'menuMainDataDict', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (232, N'admin_group', 1, N'menuItemCustomer', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (233, N'admin_group', 1, N'menuProduct', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (234, N'admin_group', 1, N'menuSales', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (235, N'admin_group', 1, N'menuCommonDataDict', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (236, N'admin_group', 0, N'二级菜单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (237, N'admin_group', 0, N'menuLevel3', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (238, N'system_manage', 7, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (239, N'system_manage', 7, N'menuItemBackup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (240, N'test G', 1, N'menuMainDataDict', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (241, N'test G', 1, N'menuItemCustomer', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (242, N'test G', 2, N'menuPurchaseMain', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (243, N'test G', 2, N'menuItemPO', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (244, N'test G', 4, N'menuMainInventory', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (245, N'test G', 4, N'menuItemStockIn', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (248, N'admin_group', 1, N'menuItemEmployee', 65639)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (249, N'admin_group', 1, N'menuCategory', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (250, N'admin_group', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (251, N'admin_group', 0, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (252, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (253, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (254, N'admin_group', 0, N'menuItemReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (255, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (256, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (257, N'admin_group', 0, N'menuRpt03', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (258, N'admin_group', 0, N'menuItemStockIn', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (259, N'admin_group', 0, N'menuItemStockOut', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (260, N'admin_group', 0, N'menuItemAdj', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (261, N'admin_group', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (262, N'admin_group', 0, N'menuItemBackup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (263, N'data_dict', 1, N'menuProductCategory', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (264, N'data_dict', 1, N'menuItemEmployee', 65639)
GO
print 'Processed 200 total records'
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (265, N'data_dict', 1, N'menuCategory', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (266, N'system_manage', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (267, N'system_manage', 0, N'menuItemBackup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (268, N'system_manage', 0, N'menuLog', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (269, N'system_manage', 0, N'menuItemBackup', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (270, N'admin_group', 1, N'menuItemTestChild', 65639)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (271, N'admin_group', 0, N'二级菜单ToolStripMenuItem', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (272, N'admin_group', 0, N'menuLevel3', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (273, N'admin_group', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (274, N'admin_group', 0, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (275, N'admin_group', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (276, N'admin_group', 0, N'menuRpt02', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (277, N'admin_group', 0, N'toolStripMenuItem1', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (278, N'admin_group', 6, N'menuAccountMain', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (279, N'admin_group', 6, N'menuItemAR', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (280, N'admin_group', 6, N'menuItemAP', 49279)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (281, N'admin_group', 6, N'menuItemOutstanding', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (282, N'admin_group', 0, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (283, N'admin_group', 0, N'menuARRpt', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (284, N'admin_group', 0, N'menuAPRpt', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (285, N'test G', 1, N'menuProduct', 103)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (286, N'test G', 0, N'menuItemQuo', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (287, N'test G', 0, N'menuReports', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (288, N'test G', 0, N'menuRpt01', 0)
INSERT [dbo].[tb_MyUserRole] ([isid], [GroupCode], [ModuleID], [AuthorityID], [Authorities]) VALUES (289, N'test G', 0, N'menuRpt02', 0)
SET IDENTITY_INSERT [dbo].[tb_MyUserRole] OFF
/****** Object:  Table [dbo].[tb_MyUserGroupRe]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_MyUserGroupRe](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [varchar](30) NOT NULL,
	[Account] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tb_MyUserGroupRe] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_MyUserGroupRe] ON
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (3, N'data_dict', N'jonny')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (5, N'data_dict', N'admin')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (6, N'data_dict', N'cs')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (7, N'Sales', N'test')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (8, N'system_manage', N'jonny')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (14, N'admin_group', N'admin')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (16, N'admin_group', N'sale')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (22, N'S1', N'U')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (24, N'admin_group', N'jonny')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (25, N'admin_group', N'jonnysun')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (26, N'admin_group', N'U')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (27, N'admin_group', N'cs')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (28, N'admin_group', N'datadict')
INSERT [dbo].[tb_MyUserGroupRe] ([isid], [GroupCode], [Account]) VALUES (29, N'test G', N'luozh')
SET IDENTITY_INSERT [dbo].[tb_MyUserGroupRe] OFF
/****** Object:  Table [dbo].[tb_MyUserGroup]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_MyUserGroup](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [varchar](30) NULL,
	[GroupName] [varchar](100) NULL,
 CONSTRAINT [PK_tb_MyUserGroup] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_MyUserGroup] ON
INSERT [dbo].[tb_MyUserGroup] ([isid], [GroupCode], [GroupName]) VALUES (2, N'admin_group', N'管理员组')
INSERT [dbo].[tb_MyUserGroup] ([isid], [GroupCode], [GroupName]) VALUES (4, N'data_dict', N'数据字典管理用户组')
INSERT [dbo].[tb_MyUserGroup] ([isid], [GroupCode], [GroupName]) VALUES (5, N'Sales', N'销售部门组')
INSERT [dbo].[tb_MyUserGroup] ([isid], [GroupCode], [GroupName]) VALUES (6, N'system_manage', N'系统管理组')
INSERT [dbo].[tb_MyUserGroup] ([isid], [GroupCode], [GroupName]) VALUES (9, N'S1', N'会计部')
INSERT [dbo].[tb_MyUserGroup] ([isid], [GroupCode], [GroupName]) VALUES (10, N'test G', N'测试组')
SET IDENTITY_INSERT [dbo].[tb_MyUserGroup] OFF
/****** Object:  Table [dbo].[tb_MyUser]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_MyUser](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](30) NOT NULL,
	[NovellAccount] [nvarchar](100) NULL,
	[DomainName] [nvarchar](100) NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Email] [nvarchar](40) NULL,
	[Password] [nvarchar](100) NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLogoutTime] [datetime] NULL,
	[IsLocked] [smallint] NULL,
	[CreateTime] [datetime] NULL,
	[FlagAdmin] [nchar](1) NULL,
	[FlagOnline] [nchar](1) NULL,
	[LoginCounter] [int] NULL,
	[DataSets] [varchar](250) NULL,
 CONSTRAINT [PK_tb_MyUser] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_MyUser', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Novell网帐号(全名,如.Jonny.EDP.CKG.MO)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_MyUser', @level2type=N'COLUMN',@level2name=N'NovellAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Windows Domain Account(如:jonny@ckg.mo)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_MyUser', @level2type=N'COLUMN',@level2name=N'DomainName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中文名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_MyUser', @level2type=N'COLUMN',@level2name=N'UserName'
GO
SET IDENTITY_INSERT [dbo].[tb_MyUser] ON
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (1, N'admin', N'admin.csframework.com', N'admin@csframework.com', N'超级用户', NULL, N'13411589198', N'admin@csframework.com', N'25FEA7D14782D8C4', CAST(0x0000A465017E354B AS DateTime), CAST(0x0000A42701447695 AS DateTime), 0, NULL, N'Y', N'Y', 554, N',TEST,MES,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (2, N'test', N'test.csframework.com', N'test@csframework.com', N'test', NULL, N'010110', N'test@csframework.com', N'0226273B7D3A3B8AE60499CA8DB82408', CAST(0x00009EC800BB6B1B AS DateTime), CAST(0x00009EC800BB6F44 AS DateTime), 0, CAST(0x00009E140117262F AS DateTime), NULL, N'N', 2, N',CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (3, N'jonny', N'jonny.csframework.com', N'jonny@csframework.com', N'JONNY SUN', NULL, N'13411589198', N'jonnysun@csframework.com', N'53838B42FB42D449', CAST(0x00009EC800C0727C AS DateTime), CAST(0x00009EC800C07B59 AS DateTime), 0, CAST(0x00009E2B00A1C51C AS DateTime), NULL, N'N', 4, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (4, N'cs', N'55563453', N'555345345', N'cs', NULL, N'2134523452345', N'234325', N'13D60FEA16E389BC', CAST(0x00009EC800BDA386 AS DateTime), CAST(0x00009EC800BDB1A4 AS DateTime), 0, CAST(0x00009EB300D6D71D AS DateTime), NULL, N'N', 2, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (5, N'datadict', NULL, NULL, N'数据字典输入测试', NULL, N'12341324', N'AA@134.COM', N'53838B42FB42D449', CAST(0x00009EC800C65E53 AS DateTime), CAST(0x00009EC800C665F1 AS DateTime), 0, CAST(0x00009EB300EC3400 AS DateTime), NULL, N'N', 4, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (6, N'sale', N'234234', N'234', N'销售员', NULL, N'234', N'234234234', N'13D60FEA16E389BC', NULL, NULL, 0, CAST(0x00009EB300EC3400 AS DateTime), NULL, NULL, NULL, N',TEST,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (7, N'jonnysun', NULL, NULL, N'孙楚楚', NULL, N'32452354', N'234525@11.com', N'53DADBAE53DFD5D6', CAST(0x00009EEA016DA4B1 AS DateTime), CAST(0x00009EEA016DAB47 AS DateTime), 0, CAST(0x00009EE7015D3845 AS DateTime), NULL, N'N', 1, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (9, N'U', NULL, NULL, N'U_测试用户', NULL, NULL, NULL, N'5EE4A0B4A4483965', CAST(0x00009F2A011BA4AB AS DateTime), CAST(0x00009F2A011E308D AS DateTime), 0, CAST(0x00009F2701727378 AS DateTime), NULL, N'N', 3, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (11, N'a', N'333345', N'453345', N'a', NULL, N'345', N'345345345345345', N'AEF531BA2D92030A', CAST(0x00009F9A00D8C56D AS DateTime), CAST(0x00009F9A00D8DC96 AS DateTime), 0, CAST(0x00009F9A00CC5234 AS DateTime), NULL, N'N', 8, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (14, N'66', N'66234222', N'66555222234234', N'66234', NULL, N'6633', N'6611', N'5EE4A0B4A4483965', NULL, NULL, 0, CAST(0x00009F9B017C08A9 AS DateTime), NULL, NULL, NULL, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (16, N'xx', N'asdf', N'asdf', N'ff', NULL, N'asdf', N'a', N'5EE4A0B4A4483965', NULL, NULL, 0, CAST(0x0000A0360173431C AS DateTime), NULL, NULL, NULL, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (17, N'mmultisky', N'mmultisky', N'mmultisky', N'multisky', NULL, N'1363169111', NULL, N'5EE4A0B4A4483965', NULL, NULL, 0, CAST(0x0000A2DA016213ED AS DateTime), NULL, NULL, NULL, N',TEST,CSFramework,')
INSERT [dbo].[tb_MyUser] ([isid], [Account], [NovellAccount], [DomainName], [UserName], [Address], [Tel], [Email], [Password], [LastLoginTime], [LastLogoutTime], [IsLocked], [CreateTime], [FlagAdmin], [FlagOnline], [LoginCounter], [DataSets]) VALUES (18, N'luozh', NULL, NULL, N'luozh', NULL, NULL, NULL, N'53838B42FB42D449', CAST(0x0000A35F01732BBC AS DateTime), CAST(0x0000A35F017342EC AS DateTime), 0, CAST(0x0000A35F01722D6F AS DateTime), NULL, N'N', 1, N',CSFramework,')
SET IDENTITY_INSERT [dbo].[tb_MyUser] OFF
/****** Object:  Table [dbo].[tb_MyMenu]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_MyMenu](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[MenuCaption] [nvarchar](50) NULL,
	[Auths] [int] NULL,
	[ModuleID] [int] NULL,
	[MenuType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tb_MyMenu] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_MyMenu] ON
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (16, N'menuItemCustomer', N'客户资料', 103, 1, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (17, N'menuProduct', N'产品资料', 103, 1, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (18, N'menuSales', N'销售员管理', 103, 1, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (19, N'menuCommonDataDict', N'公共数据字典定义', 103, 1, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (20, N'menuItemPO', N'采购订单', 49279, 2, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (21, N'menuStockIn', N'入仓单', 49279, 2, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (22, N'menuSalesOrder', N'销售订单', 49279, 3, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (23, N'menuItemInvoice', N'销售发票', 49279, 3, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (24, N'menuItemAR', N'销售收款', 49279, 3, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (25, N'menuItemCheck', N'库存盘点', 49279, 4, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (26, N'menuCompanyInfo', N'公司设置', 103, 7, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (27, N'menuItemUserMgr', N'用户管理', 103, 7, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (28, N'menuItemAuth', N'权限管理', 103, 7, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (29, N'menuCustomMenuAuth', N'菜单权限', 131079, 7, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (30, N'menuItemSetup', N'系统设置', 0, 7, N'Dialog')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (31, N'menuProductCategory', N'产品资料(分类)', 103, 1, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (32, N'menuItemEmployee', N'员工资料管理', 65639, 1, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (33, N'menuItemQuo', N'报价单', 49279, 2, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (34, N'menuReports', N'采购模块报表', 0, 2, N'ItemOwner')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (35, N'menuRpt01', N'1. 销售月报表(Demo)', 96, 2, N'Report')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (36, N'menuRpt02', N'2. 销售汇总表(按客户,销售员)', 96, 2, N'Report')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (37, N'menuItemReports', N'报表', 0, 2, N'ItemOwner')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (38, N'menuRpt03', N'3. 销售分析报表', 96, 2, N'Report')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (39, N'menuItemStockIn', N'入库单', 49279, 4, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (40, N'menuItemStockOut', N'出库单', 49279, 4, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (41, N'menuItemAdj', N'调整单', 49279, 4, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (42, N'menuLog', N'日志配置', 0, 7, N'Dialog')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (43, N'menuItemBackup', N'备份/还原数据库', 0, 7, N'Dialog')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (44, N'menuItemTestChild', N'测试窗体', 69735, 1, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (45, N'menuItemAR', N'应收款(AR)', 49279, 6, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (46, N'menuItemAP', N'应付款(AP)', 49279, 6, N'DataForm')
INSERT [dbo].[tb_MyMenu] ([isid], [MenuName], [MenuCaption], [Auths], [ModuleID], [MenuType]) VALUES (47, N'menuItemOutstanding', N'帐款余额查询', 0, 6, N'Dialog')
SET IDENTITY_INSERT [dbo].[tb_MyMenu] OFF
/****** Object:  Table [dbo].[tb_MyFormTagName]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_MyFormTagName](
	[AUID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](20) NOT NULL,
	[TagValue] [int] NOT NULL,
	[TagName] [nvarchar](20) NULL,
 CONSTRAINT [PK_YarFormTagName] PRIMARY KEY CLUSTERED 
(
	[MenuName] ASC,
	[TagValue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_MyFormTagName] ON
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (5, N'menuItemCheck', 8, N'批准')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (11, N'menuItemCustomer', 1, N'添加')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (12, N'menuItemCustomer', 2, N'删除')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (13, N'menuItemCustomer', 4, N'修改')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (14, N'menuItemCustomer', 32, N'打印')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (15, N'menuItemCustomer', 64, N'打印預覽')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (6, N'menuItemEmployee', 65536, N'查看工资')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (3, N'menuItemPO', 1024, N'導出數據xfff')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (4, N'menuItemPO', 2048, N'鎖定')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (16, N'menuProduct', 1, N'添加')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (17, N'menuProduct', 2, N'删除')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (18, N'menuProduct', 4, N'修改')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (7, N'menuSales', 1, N'添加')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (8, N'menuSales', 2, N'删除')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (9, N'menuSales', 4, N'修改')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (19, N'menuSales', 32, N'打印')
INSERT [dbo].[tb_MyFormTagName] ([AUID], [MenuName], [TagValue], [TagName]) VALUES (20, N'menuSales', 64, N'Export to XLS')
SET IDENTITY_INSERT [dbo].[tb_MyFormTagName] OFF
/****** Object:  Table [dbo].[tb_MyAuthorityItem]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_MyAuthorityItem](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[AuthorityName] [nvarchar](20) NULL,
	[AuthorityValue] [int] NULL,
 CONSTRAINT [PK_tb_MyAuthorityItem] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_MyAuthorityItem] ON
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (26, N'None', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (27, N'查询', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (28, N'系统关闭', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (29, N'其他', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (30, N'保存', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (31, N'取消', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (32, N'顯示歷史修改', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (33, N'關閉窗體', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (34, N'顯示幫助信息', 0)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (35, N'添加', 1)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (36, N'删除', 2)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (37, N'修改', 4)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (38, N'批准', 8)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (39, N'变更', 16)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (40, N'打印', 32)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (41, N'打印預覽', 64)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (42, N'作廢', 128)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (43, N'生成單據', 256)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (44, N'復製單據', 512)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (45, N'導出數據', 1024)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (46, N'鎖定', 2048)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (47, N'预留01', 4096)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (48, N'附件管理', 8192)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (49, N'查看版本历史', 16384)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (50, N'查看修改历史', 32768)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (51, N'预留02', 65536)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (52, N'预留03', 131072)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (53, N'预留04', 262144)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (54, N'预留05', 524288)
INSERT [dbo].[tb_MyAuthorityItem] ([isid], [AuthorityName], [AuthorityValue]) VALUES (55, N'预留06', 1048576)
SET IDENTITY_INSERT [dbo].[tb_MyAuthorityItem] OFF
/****** Object:  Table [dbo].[tb_LoginLog]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_LoginLog](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](20) NULL,
	[LoginType] [char](1) NULL,
	[CurrentTime] [datetime] NULL,
 CONSTRAINT [PK_TLoginLog] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_LoginLog] ON
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (142, N'admin', N'I', CAST(0x00009EBB015EDB55 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (143, N'admin', N'I', CAST(0x00009EBB016272EC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (144, N'admin', N'I', CAST(0x00009EBB0162962C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (145, N'admin', N'I', CAST(0x00009EBB016706F2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (146, N'admin', N'I', CAST(0x00009EBB01687ADA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (147, N'admin', N'I', CAST(0x00009EBB0168D1E8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (148, N'admin', N'I', CAST(0x00009EBB016A1C50 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (149, N'admin', N'O', CAST(0x00009EBB016A48E3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (150, N'admin', N'I', CAST(0x00009EBB016AAB31 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (151, N'admin', N'O', CAST(0x00009EBB016AE3E3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (152, N'admin', N'I', CAST(0x00009EBB016B1A4E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (153, N'admin', N'O', CAST(0x00009EBB016B39FB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (154, N'admin', N'I', CAST(0x00009EBB016C330F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (155, N'admin', N'O', CAST(0x00009EBB016D6C0A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (156, N'admin', N'I', CAST(0x00009EBB016D7CFF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (157, N'admin', N'O', CAST(0x00009EBB016E63B0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (158, N'admin', N'I', CAST(0x00009EBB0172517D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (159, N'admin', N'I', CAST(0x00009EBB0174597D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (160, N'admin', N'O', CAST(0x00009EBB01777DB5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (161, N'admin', N'I', CAST(0x00009EBB0178E064 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (162, N'admin', N'I', CAST(0x00009EBB017B64F6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (163, N'admin', N'O', CAST(0x00009EBB017C0AE1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (164, N'admin', N'I', CAST(0x00009EBB017CE789 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (165, N'admin', N'I', CAST(0x00009EBB018104D6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (166, N'admin', N'I', CAST(0x00009EBB0181B636 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (167, N'admin', N'O', CAST(0x00009EBC00002F75 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (168, N'admin', N'I', CAST(0x00009EBC00CAAE81 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (169, N'admin', N'O', CAST(0x00009EBC00CB2539 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (170, N'admin', N'I', CAST(0x00009EBC00E5714E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (171, N'admin', N'O', CAST(0x00009EBC00ED65AD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (172, N'admin', N'I', CAST(0x00009EBC0120896F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (173, N'admin', N'O', CAST(0x00009EBC0120F630 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (174, N'admin', N'I', CAST(0x00009EBC0124259D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (175, N'admin', N'I', CAST(0x00009EBC01289B9B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (176, N'admin', N'I', CAST(0x00009EBC012C0E28 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (177, N'admin', N'I', CAST(0x00009EBC012FCA39 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (178, N'admin', N'O', CAST(0x00009EBC01312828 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (179, N'admin', N'I', CAST(0x00009EBC013309FF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (180, N'admin', N'O', CAST(0x00009EBC01333CFA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (181, N'admin', N'I', CAST(0x00009EBC01346EE5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (182, N'admin', N'I', CAST(0x00009EBC013A9544 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (183, N'admin', N'O', CAST(0x00009EBC013AC6B1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (184, N'admin', N'I', CAST(0x00009EBC013B4F57 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (185, N'admin', N'O', CAST(0x00009EBC013D4B8E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (186, N'admin', N'I', CAST(0x00009EBF01784325 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (187, N'admin', N'O', CAST(0x00009EBF01787065 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (188, N'admin', N'I', CAST(0x00009EBF01792177 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (189, N'admin', N'O', CAST(0x00009EBF01873CC5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (190, N'admin', N'I', CAST(0x00009EC4017C3024 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (191, N'admin', N'O', CAST(0x00009EC4017CEC24 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (192, N'admin', N'I', CAST(0x00009EC4017CEFE3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (193, N'admin', N'O', CAST(0x00009EC4017E8629 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (194, N'admin', N'I', CAST(0x00009EC501659D41 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (195, N'admin', N'O', CAST(0x00009EC50165C29B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (196, N'admin', N'I', CAST(0x00009EC5016AC2D1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (197, N'admin', N'I', CAST(0x00009EC5016B19F6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (198, N'admin', N'I', CAST(0x00009EC501759B37 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (199, N'admin', N'O', CAST(0x00009EC50175D51A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (200, N'admin', N'I', CAST(0x00009EC50176AF2D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (201, N'admin', N'O', CAST(0x00009EC50176E65E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (202, N'admin', N'I', CAST(0x00009EC50176E76D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (203, N'admin', N'O', CAST(0x00009EC50177116A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (204, N'admin', N'I', CAST(0x00009EC501771775 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (205, N'admin', N'O', CAST(0x00009EC5017789CE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (206, N'admin', N'I', CAST(0x00009EC501778ADB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (207, N'admin', N'O', CAST(0x00009EC5017971C1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (208, N'admin', N'I', CAST(0x00009EC5017A592C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (209, N'admin', N'O', CAST(0x00009EC5017AA449 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (210, N'admin', N'I', CAST(0x00009EC5017AA545 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (211, N'admin', N'O', CAST(0x00009EC5017B358F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (212, N'admin', N'I', CAST(0x00009EC7015A8AEE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (213, N'admin', N'O', CAST(0x00009EC7015AB135 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (214, N'admin', N'I', CAST(0x00009EC7015B03E7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (215, N'admin', N'O', CAST(0x00009EC7015B119D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (216, N'admin', N'I', CAST(0x00009EC7017DC643 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (217, N'admin', N'I', CAST(0x00009EC7017F2245 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (218, N'admin', N'O', CAST(0x00009EC7017F4CFB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (219, N'admin', N'I', CAST(0x00009EC701814BC5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (220, N'admin', N'O', CAST(0x00009EC70181A6CA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (221, N'admin', N'I', CAST(0x00009EC70181F816 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (222, N'admin', N'O', CAST(0x00009EC701823A60 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (223, N'admin', N'I', CAST(0x00009EC70184C2B6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (224, N'admin', N'I', CAST(0x00009EC701888644 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (225, N'admin', N'I', CAST(0x00009EC70189D071 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (226, N'admin', N'I', CAST(0x00009EC80004311F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (227, N'admin', N'I', CAST(0x00009EC800077F2E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (228, N'admin', N'O', CAST(0x00009EC80007F8E1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (229, N'admin', N'I', CAST(0x00009EC8000B848C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (230, N'admin', N'O', CAST(0x00009EC8000BBFD2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (231, N'admin', N'I', CAST(0x00009EC800AAFD48 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (232, N'admin', N'O', CAST(0x00009EC800AB1FF6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (233, N'admin', N'I', CAST(0x00009EC800AD3456 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (234, N'admin', N'O', CAST(0x00009EC800AD6CF7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (235, N'admin', N'I', CAST(0x00009EC800AD89DA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (236, N'admin', N'O', CAST(0x00009EC800AD9357 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (237, N'test', N'I', CAST(0x00009EC800B9C3F3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (238, N'test', N'O', CAST(0x00009EC800B9CB19 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (239, N'admin', N'I', CAST(0x00009EC800BB61A0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (240, N'admin', N'O', CAST(0x00009EC800BB68BB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (241, N'test', N'I', CAST(0x00009EC800BB6B1B AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (242, N'test', N'O', CAST(0x00009EC800BB6F44 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (243, N'admin', N'I', CAST(0x00009EC800BB746A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (244, N'admin', N'O', CAST(0x00009EC800BBEB8E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (245, N'admin', N'I', CAST(0x00009EC800BC01EA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (246, N'admin', N'O', CAST(0x00009EC800BC1257 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (247, N'admin', N'I', CAST(0x00009EC800BD83E1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (248, N'admin', N'O', CAST(0x00009EC800BD91F8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (249, N'cs', N'I', CAST(0x00009EC800BDA386 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (250, N'cs', N'O', CAST(0x00009EC800BDB1A4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (251, N'admin', N'I', CAST(0x00009EC800BDBF15 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (252, N'admin', N'O', CAST(0x00009EC800BDDEA5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (253, N'admin', N'I', CAST(0x00009EC800BF3550 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (254, N'admin', N'O', CAST(0x00009EC800BFB2C6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (255, N'jonny', N'I', CAST(0x00009EC800BFBE75 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (256, N'jonny', N'O', CAST(0x00009EC800BFCA8F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (257, N'jonny', N'I', CAST(0x00009EC800BFECA7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (258, N'jonny', N'O', CAST(0x00009EC800BFEF67 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (259, N'admin', N'I', CAST(0x00009EC800BFFADD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (260, N'admin', N'O', CAST(0x00009EC800C046DF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (261, N'jonny', N'I', CAST(0x00009EC800C04BF1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (262, N'jonny', N'O', CAST(0x00009EC800C06DA7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (263, N'jonny', N'I', CAST(0x00009EC800C0727C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (264, N'jonny', N'O', CAST(0x00009EC800C07B59 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (265, N'admin', N'I', CAST(0x00009EC800C082DD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (266, N'admin', N'O', CAST(0x00009EC800C09B85 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (267, N'admin', N'I', CAST(0x00009EC800C0DBDD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (268, N'admin', N'O', CAST(0x00009EC800C18DCE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (269, N'admin', N'I', CAST(0x00009EC800C1ADD9 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (270, N'admin', N'O', CAST(0x00009EC800C1C061 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (271, N'admin', N'I', CAST(0x00009EC800C58F5C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (272, N'admin', N'O', CAST(0x00009EC800C607E2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (273, N'datadict', N'I', CAST(0x00009EC800C60DCC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (274, N'datadict', N'O', CAST(0x00009EC800C6159D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (275, N'datadict', N'I', CAST(0x00009EC800C625BF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (276, N'datadict', N'O', CAST(0x00009EC800C627F0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (277, N'datadict', N'I', CAST(0x00009EC800C63287 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (278, N'datadict', N'O', CAST(0x00009EC800C63948 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (279, N'datadict', N'I', CAST(0x00009EC800C65E53 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (280, N'datadict', N'O', CAST(0x00009EC800C665F1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (281, N'admin', N'I', CAST(0x00009EC800D1A842 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (282, N'admin', N'O', CAST(0x00009EC800D5115B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (283, N'admin', N'I', CAST(0x00009ECB00FB8C80 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (284, N'admin', N'I', CAST(0x00009ECB00FF360D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (285, N'admin', N'I', CAST(0x00009ECB00FFB277 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (286, N'admin', N'I', CAST(0x00009ECB00FFDEFE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (287, N'admin', N'I', CAST(0x00009ECB00FFEFB4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (288, N'admin', N'I', CAST(0x00009ECB01000738 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (289, N'admin', N'I', CAST(0x00009ECB01001E83 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (290, N'admin', N'I', CAST(0x00009ECB0108053E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (291, N'admin', N'I', CAST(0x00009ECB010885FE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (292, N'admin', N'O', CAST(0x00009ECB0108A5CE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (293, N'admin', N'I', CAST(0x00009ECB010FAEBC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (294, N'admin', N'I', CAST(0x00009ECB0111F52A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (295, N'admin', N'I', CAST(0x00009EDB0168175D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (296, N'admin', N'O', CAST(0x00009EDB01684F54 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (297, N'admin', N'I', CAST(0x00009EDB0169B2EC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (298, N'admin', N'O', CAST(0x00009EDB0169C030 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (299, N'admin', N'I', CAST(0x00009EDB0171493F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (300, N'admin', N'O', CAST(0x00009EDB01715AE0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (301, N'admin', N'I', CAST(0x00009EDB0173A91E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (302, N'admin', N'O', CAST(0x00009EDB0173B20E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (303, N'admin', N'I', CAST(0x00009EDB0179EDBF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (304, N'admin', N'O', CAST(0x00009EDB0179F97F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (305, N'admin', N'I', CAST(0x00009EDD01007AFB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (306, N'admin', N'O', CAST(0x00009EDD0100C4D5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (307, N'admin', N'I', CAST(0x00009EDD010234E4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (308, N'admin', N'O', CAST(0x00009EDD01030D54 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (309, N'admin', N'I', CAST(0x00009EDD0109B4D1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (310, N'admin', N'O', CAST(0x00009EDD010A0E50 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (311, N'admin', N'I', CAST(0x00009EDD010B9DF8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (312, N'admin', N'O', CAST(0x00009EDD010BB1DB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (313, N'admin', N'I', CAST(0x00009EDD010BEB56 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (314, N'admin', N'O', CAST(0x00009EDD010C0393 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (315, N'admin', N'I', CAST(0x00009EDD010C5BD8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (316, N'admin', N'O', CAST(0x00009EDD010C6E8C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (317, N'admin', N'I', CAST(0x00009EDD010C97B8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (318, N'admin', N'O', CAST(0x00009EDD010F1F12 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (319, N'admin', N'I', CAST(0x00009EDD011097F6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (320, N'admin', N'O', CAST(0x00009EDD0110A8CE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (321, N'admin', N'I', CAST(0x00009EDD0110F6C2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (322, N'admin', N'O', CAST(0x00009EDD011106FE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (323, N'admin', N'I', CAST(0x00009EDD011193C2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (324, N'admin', N'O', CAST(0x00009EDD0113A4E7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (325, N'admin', N'I', CAST(0x00009EDD01164B3E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (326, N'admin', N'I', CAST(0x00009EDD011AB5C1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (327, N'admin', N'O', CAST(0x00009EDD011ACF78 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (328, N'admin', N'I', CAST(0x00009EDD011B4F68 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (329, N'admin', N'O', CAST(0x00009EDD011E5D1A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (330, N'admin', N'I', CAST(0x00009EDD011FF54C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (331, N'admin', N'O', CAST(0x00009EDD01200CD0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (332, N'admin', N'I', CAST(0x00009EDD0121237D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (333, N'admin', N'O', CAST(0x00009EDD01213A8E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (334, N'admin', N'I', CAST(0x00009EDD0121D2C3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (335, N'admin', N'O', CAST(0x00009EDD0121EB9C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (336, N'admin', N'I', CAST(0x00009EDF00BE653F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (337, N'admin', N'O', CAST(0x00009EDF00BE9756 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (338, N'admin', N'I', CAST(0x00009EDF00BE99BA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (339, N'admin', N'O', CAST(0x00009EDF00BE9E81 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (340, N'admin', N'I', CAST(0x00009EDF00E074E3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (341, N'admin', N'I', CAST(0x00009EDF01325E4E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (342, N'admin', N'O', CAST(0x00009EDF0132C381 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (343, N'admin', N'I', CAST(0x00009EDF013879D0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (344, N'admin', N'O', CAST(0x00009EDF0145F1CE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (345, N'admin', N'I', CAST(0x00009EE301566CB6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (346, N'admin', N'O', CAST(0x00009EE3015A96CB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (347, N'admin', N'I', CAST(0x00009EE5014BD88E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (348, N'admin', N'O', CAST(0x00009EE501544425 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (349, N'admin', N'I', CAST(0x00009EE501631DF1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (350, N'admin', N'O', CAST(0x00009EE501634A8F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (351, N'admin', N'I', CAST(0x00009EE501635285 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (352, N'admin', N'O', CAST(0x00009EE5016613F2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (353, N'admin', N'I', CAST(0x00009EE501686F12 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (354, N'admin', N'O', CAST(0x00009EE501699CA2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (355, N'admin', N'I', CAST(0x00009EE5016D229F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (356, N'admin', N'I', CAST(0x00009EE7015D1546 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (357, N'admin', N'I', CAST(0x00009EE7015EC2E6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (358, N'admin', N'O', CAST(0x00009EE7015F163A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (359, N'admin', N'I', CAST(0x00009EE7015FA673 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (360, N'admin', N'O', CAST(0x00009EE701604FB8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (361, N'admin', N'I', CAST(0x00009EE70161B6AE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (362, N'admin', N'O', CAST(0x00009EE701620F85 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (363, N'admin', N'I', CAST(0x00009EE70163EBE7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (364, N'admin', N'I', CAST(0x00009EE701647712 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (365, N'admin', N'I', CAST(0x00009EE70164E138 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (366, N'admin', N'O', CAST(0x00009EE701654743 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (367, N'admin', N'I', CAST(0x00009EE801755604 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (368, N'admin', N'O', CAST(0x00009EE801757ED8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (369, N'admin', N'I', CAST(0x00009EE801789440 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (370, N'admin', N'I', CAST(0x00009EE8017B9409 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (371, N'admin', N'O', CAST(0x00009EE8017CBA46 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (372, N'admin', N'I', CAST(0x00009EE8017CED30 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (373, N'admin', N'I', CAST(0x00009EE8017F6192 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (374, N'admin', N'O', CAST(0x00009EE8017F93C9 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (375, N'a', N'I', CAST(0x00009EE8017F9C2B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (376, N'a', N'I', CAST(0x00009EE8017FA650 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (377, N'a', N'I', CAST(0x00009EE8018048C3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (378, N'a', N'I', CAST(0x00009EE801807319 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (379, N'a', N'I', CAST(0x00009EE801808F3D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (380, N'a', N'I', CAST(0x00009EE80180B51C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (381, N'a', N'I', CAST(0x00009EE80180D3A1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (382, N'a', N'I', CAST(0x00009EE80180F04A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (383, N'a', N'I', CAST(0x00009EE801811A90 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (384, N'a', N'I', CAST(0x00009EE801813D52 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (385, N'a', N'I', CAST(0x00009EE801815671 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (386, N'a', N'I', CAST(0x00009EE80181923E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (387, N'admin', N'I', CAST(0x00009EE801827789 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (388, N'admin', N'O', CAST(0x00009EE801829269 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (389, N'a', N'I', CAST(0x00009EE801829658 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (390, N'a', N'I', CAST(0x00009EE8018921E6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (391, N'a', N'O', CAST(0x00009EE8018986B1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (392, N'a', N'I', CAST(0x00009EE801899250 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (393, N'a', N'O', CAST(0x00009EE8018B2E7D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (394, N'a', N'I', CAST(0x00009EEA015E6D21 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (395, N'a', N'O', CAST(0x00009EEA015E7E0F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (396, N'admin', N'I', CAST(0x00009EEA015E84E2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (397, N'admin', N'I', CAST(0x00009EEA0167DED6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (398, N'admin', N'I', CAST(0x00009EEA01696F26 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (399, N'admin', N'O', CAST(0x00009EEA016D9EDF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (400, N'jonnysun', N'I', CAST(0x00009EEA016DA4B2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (401, N'jonnysun', N'O', CAST(0x00009EEA016DAB47 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (402, N'admin', N'I', CAST(0x00009EEA016DB165 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (403, N'admin', N'O', CAST(0x00009EEA016E2F9A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (404, N'admin', N'I', CAST(0x00009F0601260CA9 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (405, N'admin', N'I', CAST(0x00009F0601280C80 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (406, N'admin', N'I', CAST(0x00009F060129CCF0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (407, N'admin', N'O', CAST(0x00009F06012A77C0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (408, N'admin', N'I', CAST(0x00009F0A015EABB8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (409, N'admin', N'I', CAST(0x00009F0A015FDFA2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (410, N'admin', N'O', CAST(0x00009F0A016032EF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (411, N'admin', N'I', CAST(0x00009F0A01615B0F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (412, N'admin', N'O', CAST(0x00009F0A016212BD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (413, N'admin', N'I', CAST(0x00009F0A0162D102 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (414, N'admin', N'O', CAST(0x00009F0A0162F76A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (415, N'admin', N'I', CAST(0x00009F0A01638309 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (416, N'admin', N'I', CAST(0x00009F0A0168A7ED AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (417, N'admin', N'O', CAST(0x00009F0A01690856 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (418, N'admin', N'I', CAST(0x00009F0A016A4C7B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (419, N'admin', N'O', CAST(0x00009F0A016B9870 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (420, N'admin', N'I', CAST(0x00009F0E00B98818 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (421, N'admin', N'O', CAST(0x00009F0E00B9EC62 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (422, N'admin', N'I', CAST(0x00009F0E00CAA9F0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (423, N'admin', N'O', CAST(0x00009F0E00CC0C3F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (424, N'admin', N'I', CAST(0x00009F0E00CCAAC9 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (425, N'admin', N'O', CAST(0x00009F0E00CF71E0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (426, N'admin', N'I', CAST(0x00009F0E00DD5359 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (427, N'admin', N'O', CAST(0x00009F0E00E2494B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (428, N'admin', N'I', CAST(0x00009F0E00F2F9E1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (429, N'admin', N'O', CAST(0x00009F0E00F368E8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (430, N'admin', N'I', CAST(0x00009F1801612958 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (431, N'admin', N'O', CAST(0x00009F1801613A3E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (432, N'admin', N'I', CAST(0x00009F180161EF47 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (433, N'admin', N'O', CAST(0x00009F180169A389 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (434, N'admin', N'I', CAST(0x00009F18017E26CE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (435, N'admin', N'I', CAST(0x00009F1901543655 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (436, N'admin', N'O', CAST(0x00009F1901562C21 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (437, N'admin', N'I', CAST(0x00009F1901566738 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (438, N'admin', N'I', CAST(0x00009F1901571840 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (439, N'admin', N'I', CAST(0x00009F1A016B66FE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (440, N'admin', N'O', CAST(0x00009F1A016BF839 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (441, N'admin', N'I', CAST(0x00009F1A016C153E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (442, N'admin', N'O', CAST(0x00009F1A016C2104 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (443, N'admin', N'I', CAST(0x00009F1A016CF6B8 AS DateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (444, N'admin', N'O', CAST(0x00009F1A016DA606 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (445, N'admin', N'I', CAST(0x00009F1A016DD3B0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (446, N'admin', N'O', CAST(0x00009F1A016E0931 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (447, N'admin', N'I', CAST(0x00009F1A017313FD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (448, N'admin', N'O', CAST(0x00009F1A0174771A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (449, N'admin', N'I', CAST(0x00009F1A0175737B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (450, N'admin', N'O', CAST(0x00009F1A0175D349 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (451, N'admin', N'I', CAST(0x00009F1A0176544D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (452, N'admin', N'I', CAST(0x00009F27015E08A2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (453, N'admin', N'I', CAST(0x00009F270168A9F3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (454, N'admin', N'O', CAST(0x00009F270168BEEF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (455, N'admin', N'I', CAST(0x00009F27016A38AC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (456, N'admin', N'I', CAST(0x00009F27016BC0D0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (457, N'admin', N'I', CAST(0x00009F270171D212 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (458, N'admin', N'O', CAST(0x00009F270187AD54 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (459, N'admin', N'I', CAST(0x00009F2A0106EA4F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (460, N'admin', N'O', CAST(0x00009F2A010788EA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (461, N'admin', N'I', CAST(0x00009F2A01078C1F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (462, N'admin', N'O', CAST(0x00009F2A0107B778 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (463, N'admin', N'I', CAST(0x00009F2A0107CB7E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (464, N'admin', N'O', CAST(0x00009F2A011AE77C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (465, N'u', N'I', CAST(0x00009F2A011AEF08 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (466, N'U', N'O', CAST(0x00009F2A011B2B3F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (467, N'admin', N'I', CAST(0x00009F2A011B3375 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (468, N'admin', N'O', CAST(0x00009F2A011B47BA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (469, N'u', N'I', CAST(0x00009F2A011B5076 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (470, N'U', N'O', CAST(0x00009F2A011B5F9F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (471, N'admin', N'I', CAST(0x00009F2A011B6E49 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (472, N'admin', N'O', CAST(0x00009F2A011B9ED4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (473, N'u', N'I', CAST(0x00009F2A011BA4AB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (474, N'U', N'O', CAST(0x00009F2A011E308A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (475, N'admin', N'I', CAST(0x00009F2C015EE6BE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (476, N'admin', N'O', CAST(0x00009F2C016048CC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (477, N'admin', N'I', CAST(0x00009F2C01604E23 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (478, N'admin', N'O', CAST(0x00009F2C0160E7D1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (479, N'admin', N'I', CAST(0x00009F2D01670C63 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (480, N'admin', N'O', CAST(0x00009F2D01682063 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (481, N'admin', N'I', CAST(0x00009F2D016ADF30 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (482, N'admin', N'O', CAST(0x00009F2D016B3525 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (483, N'admin', N'I', CAST(0x00009F2D016BCCE6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (484, N'admin', N'O', CAST(0x00009F2D016BE215 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (485, N'admin', N'I', CAST(0x00009F4E015BA78B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (486, N'admin', N'O', CAST(0x00009F4E015C611C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (487, N'admin', N'I', CAST(0x00009F4E016B4AB5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (488, N'admin', N'I', CAST(0x00009F4E0177C48B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (489, N'admin', N'I', CAST(0x00009F5201807A08 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (490, N'admin', N'O', CAST(0x00009F520180F571 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (491, N'admin', N'I', CAST(0x00009F58015FB323 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (492, N'admin', N'O', CAST(0x00009F58016058D1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (493, N'admin', N'I', CAST(0x00009F580168CC38 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (494, N'admin', N'O', CAST(0x00009F580169E71B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (495, N'admin', N'I', CAST(0x00009F58016C8B90 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (496, N'admin', N'O', CAST(0x00009F58016C9736 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (497, N'admin', N'I', CAST(0x00009F6200E6D7F8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (498, N'admin', N'I', CAST(0x00009F6200E7BEE3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (499, N'admin', N'O', CAST(0x00009F6200E830D7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (500, N'admin', N'I', CAST(0x00009F6200E89823 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (501, N'admin', N'O', CAST(0x00009F6200EBDB4A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (502, N'admin', N'I', CAST(0x00009F6200EC4301 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (503, N'admin', N'O', CAST(0x00009F6200EC6906 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (504, N'admin', N'I', CAST(0x00009F6900AE2A1D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (505, N'admin', N'O', CAST(0x00009F6900AF9417 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (506, N'admin', N'I', CAST(0x00009F6900B28D96 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (507, N'admin', N'O', CAST(0x00009F6900B2AB14 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (508, N'admin', N'I', CAST(0x00009F6900B2AC44 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (509, N'admin', N'I', CAST(0x00009F6900BC5C72 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (510, N'admin', N'I', CAST(0x00009F6900BD4213 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (511, N'admin', N'O', CAST(0x00009F6900BD535C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (512, N'admin', N'I', CAST(0x00009F7700D4573B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (513, N'admin', N'O', CAST(0x00009F7700D5CF96 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (514, N'admin', N'I', CAST(0x00009F7700D61E3E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (515, N'admin', N'O', CAST(0x00009F7700D70A1D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (516, N'admin', N'I', CAST(0x00009F7700E7DD28 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (517, N'admin', N'O', CAST(0x00009F7700E7EA6A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (518, N'admin', N'I', CAST(0x00009F7700E87F28 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (519, N'admin', N'I', CAST(0x00009F7700EF2182 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (520, N'admin', N'I', CAST(0x00009F7700F4051C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (521, N'admin', N'I', CAST(0x00009F7700F6E9EF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (522, N'admin', N'O', CAST(0x00009F7700F746CE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (523, N'admin', N'I', CAST(0x00009F7700F7AD5C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (524, N'admin', N'O', CAST(0x00009F7700F7E535 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (525, N'admin', N'I', CAST(0x00009F7700F85CD5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (526, N'admin', N'O', CAST(0x00009F7700F89E09 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (527, N'admin', N'I', CAST(0x00009F7B016514BD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (528, N'admin', N'I', CAST(0x00009F7B01673EBB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (529, N'admin', N'I', CAST(0x00009F7B0167FB24 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (530, N'admin', N'O', CAST(0x00009F7B0169AC44 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (531, N'admin', N'I', CAST(0x00009F99016CC5DF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (532, N'admin', N'O', CAST(0x00009F99016D5103 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (533, N'admin', N'I', CAST(0x00009F9A009AA4E1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (534, N'admin', N'O', CAST(0x00009F9A009AC44C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (535, N'admin', N'I', CAST(0x00009F9A009DF8BA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (536, N'admin', N'O', CAST(0x00009F9A009E23B5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (537, N'admin', N'I', CAST(0x00009F9A009E2584 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (538, N'admin', N'O', CAST(0x00009F9A00A27B15 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (539, N'admin', N'I', CAST(0x00009F9A00A2DB1E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (540, N'admin', N'O', CAST(0x00009F9A00A511A6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (541, N'admin', N'I', CAST(0x00009F9A00A5A883 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (542, N'admin', N'O', CAST(0x00009F9A00BD19C8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (543, N'admin', N'I', CAST(0x00009F9A00BD9F21 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (544, N'admin', N'I', CAST(0x00009F9A00CA681A AS DateTime))
GO
print 'Processed 400 total records'
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (545, N'admin', N'O', CAST(0x00009F9A00CC8738 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (546, N'a', N'I', CAST(0x00009F9A00CC8CE3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (547, N'admin', N'I', CAST(0x00009F9A00CC9FDF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (548, N'admin', N'O', CAST(0x00009F9A00CCB1D6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (549, N'a', N'I', CAST(0x00009F9A00CCB69D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (550, N'a', N'I', CAST(0x00009F9A00CCC6F7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (551, N'admin', N'I', CAST(0x00009F9A00CCD2E3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (552, N'admin', N'O', CAST(0x00009F9A00CCE930 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (553, N'a', N'I', CAST(0x00009F9A00CCEE50 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (554, N'a', N'I', CAST(0x00009F9A00CD0EC8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (555, N'admin', N'I', CAST(0x00009F9A00CD3370 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (556, N'admin', N'I', CAST(0x00009F9A00CEEF14 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (557, N'admin', N'I', CAST(0x00009F9A00D3A778 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (558, N'admin', N'O', CAST(0x00009F9A00D3E618 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (559, N'b', N'I', CAST(0x00009F9A00D3EEB3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (560, N'b', N'I', CAST(0x00009F9A00D3F9CB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (561, N'b', N'I', CAST(0x00009F9A00D43D08 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (562, N'b', N'I', CAST(0x00009F9A00D48206 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (563, N'b', N'I', CAST(0x00009F9A00D4D528 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (564, N'admin', N'I', CAST(0x00009F9A00D78AA4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (565, N'admin', N'O', CAST(0x00009F9A00D797A2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (566, N'a', N'I', CAST(0x00009F9A00D7A1DF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (567, N'a', N'O', CAST(0x00009F9A00D7B00E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (568, N'b', N'I', CAST(0x00009F9A00D7B4F7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (569, N'b', N'O', CAST(0x00009F9A00D7BA04 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (570, N'admin', N'I', CAST(0x00009F9A00D7C234 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (571, N'admin', N'O', CAST(0x00009F9A00D7F39A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (572, N'a', N'I', CAST(0x00009F9A00D7F9A6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (573, N'a', N'O', CAST(0x00009F9A00D89092 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (574, N'admin', N'I', CAST(0x00009F9A00D89711 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (575, N'admin', N'O', CAST(0x00009F9A00D8C161 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (576, N'a', N'I', CAST(0x00009F9A00D8C56D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (577, N'a', N'O', CAST(0x00009F9A00D8DC92 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (578, N'b', N'I', CAST(0x00009F9A00D8E118 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (579, N'b', N'O', CAST(0x00009F9A00D8E696 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (580, N'admin', N'I', CAST(0x00009F9A0117E28E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (581, N'admin', N'I', CAST(0x00009F9A0120FEED AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (582, N'admin', N'I', CAST(0x00009F9A012191F4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (583, N'admin', N'I', CAST(0x00009F9A012324C2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (584, N'admin', N'O', CAST(0x00009F9A01249DEA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (585, N'admin', N'I', CAST(0x00009F9A01252EA7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (586, N'admin', N'I', CAST(0x00009F9A0125F786 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (587, N'admin', N'O', CAST(0x00009F9A0126B362 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (588, N'admin', N'I', CAST(0x00009F9A012970C5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (589, N'admin', N'I', CAST(0x00009F9A0129F7C3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (590, N'admin', N'I', CAST(0x00009F9B01571006 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (591, N'admin', N'O', CAST(0x00009F9B015731F9 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (592, N'admin', N'I', CAST(0x00009F9B016230A7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (593, N'admin', N'O', CAST(0x00009F9B016259FD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (594, N'admin', N'I', CAST(0x00009F9B01666042 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (595, N'admin', N'I', CAST(0x00009F9B0167961A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (596, N'admin', N'I', CAST(0x00009F9B0170AC68 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (597, N'admin', N'O', CAST(0x00009F9B0171893A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (598, N'admin', N'I', CAST(0x00009F9B01795D0D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (599, N'admin', N'O', CAST(0x00009F9B017A2EA4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (600, N'admin', N'I', CAST(0x00009F9B017B6F12 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (601, N'admin', N'O', CAST(0x00009F9B017C6442 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (602, N'admin', N'I', CAST(0x00009FCE015725D3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (603, N'admin', N'O', CAST(0x00009FCE01575B0D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (604, N'admin', N'O', CAST(0x00009FFF01470DBC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (605, N'admin', N'I', CAST(0x00009FFF01471840 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (606, N'admin', N'O', CAST(0x00009FFF016083F5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (607, N'admin', N'I', CAST(0x0000A00101477D8F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (608, N'admin', N'O', CAST(0x0000A0010147CB17 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (609, N'admin', N'I', CAST(0x0000A001015831E7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (610, N'admin', N'I', CAST(0x0000A001016709B2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (611, N'admin', N'O', CAST(0x0000A00101676DAC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (612, N'admin', N'I', CAST(0x0000A00101687331 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (613, N'admin', N'I', CAST(0x0000A001016C474F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (614, N'admin', N'O', CAST(0x0000A001016DE735 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (615, N'admin', N'I', CAST(0x0000A0010170F493 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (616, N'admin', N'O', CAST(0x0000A00101713768 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (617, N'admin', N'I', CAST(0x0000A00300AF5B9B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (618, N'admin', N'O', CAST(0x0000A00300AFA4D5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (619, N'admin', N'I', CAST(0x0000A00300B41725 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (620, N'admin', N'O', CAST(0x0000A00300B44DC2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (621, N'admin', N'I', CAST(0x0000A007011605AE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (622, N'admin', N'I', CAST(0x0000A00701568E22 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (623, N'admin', N'I', CAST(0x0000A007015CEAB4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (624, N'admin', N'I', CAST(0x0000A007015DD1FE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (625, N'admin', N'I', CAST(0x0000A00701603859 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (626, N'admin', N'I', CAST(0x0000A007016E5912 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (627, N'admin', N'O', CAST(0x0000A007017030AB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (628, N'admin', N'I', CAST(0x0000A0070178A48A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (629, N'admin', N'O', CAST(0x0000A0070180EBE3 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (630, N'admin', N'I', CAST(0x0000A008011E43C0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (631, N'admin', N'O', CAST(0x0000A0080140171C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (632, N'admin', N'I', CAST(0x0000A0080167235E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (633, N'admin', N'O', CAST(0x0000A00801675A5A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (634, N'admin', N'I', CAST(0x0000A00900E9818E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (635, N'admin', N'I', CAST(0x0000A00900EA7081 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (636, N'admin', N'I', CAST(0x0000A00A00C6ECDA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (637, N'admin', N'I', CAST(0x0000A00A00CBC581 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (638, N'admin', N'O', CAST(0x0000A00A00CC2032 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (639, N'admin', N'I', CAST(0x0000A00A00CC7374 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (640, N'admin', N'I', CAST(0x0000A00A00CC9D20 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (641, N'admin', N'I', CAST(0x0000A00A00CD27CA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (642, N'admin', N'O', CAST(0x0000A00A00CF4096 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (643, N'admin', N'I', CAST(0x0000A00A00D1A957 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (644, N'admin', N'I', CAST(0x0000A00A00D31177 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (645, N'admin', N'O', CAST(0x0000A00A00D3284D AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (646, N'admin', N'I', CAST(0x0000A00A00D3BDA2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (647, N'admin', N'I', CAST(0x0000A00A00D65FB5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (648, N'admin', N'I', CAST(0x0000A00A00D6B9CF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (649, N'admin', N'O', CAST(0x0000A00A00D7CA4B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (650, N'admin', N'I', CAST(0x0000A00A00D8F394 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (651, N'admin', N'O', CAST(0x0000A00A00D94EB8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (652, N'admin', N'I', CAST(0x0000A00A0144F742 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (653, N'admin', N'I', CAST(0x0000A00A01533948 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (654, N'admin', N'O', CAST(0x0000A00A0153A6D8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (655, N'admin', N'I', CAST(0x0000A00A015A8FF6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (656, N'admin', N'I', CAST(0x0000A00A015B25DE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (657, N'admin', N'O', CAST(0x0000A00A015B638B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (658, N'admin', N'I', CAST(0x0000A00A015BA952 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (659, N'admin', N'I', CAST(0x0000A00A015DC00B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (660, N'admin', N'I', CAST(0x0000A00A015E11B2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (661, N'admin', N'I', CAST(0x0000A00A0160598D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (662, N'admin', N'O', CAST(0x0000A00A0162A1DC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (663, N'admin', N'I', CAST(0x0000A00A0162B190 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (664, N'admin', N'I', CAST(0x0000A00A0162DEEB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (665, N'admin', N'O', CAST(0x0000A00A01632591 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (666, N'admin', N'I', CAST(0x0000A00A016386C5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (667, N'admin', N'I', CAST(0x0000A00A01641C0A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (668, N'admin', N'I', CAST(0x0000A00A016582F5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (669, N'admin', N'I', CAST(0x0000A00A016B953B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (670, N'admin', N'I', CAST(0x0000A00A016C286A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (671, N'admin', N'I', CAST(0x0000A00A016CC7DC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (672, N'admin', N'O', CAST(0x0000A00A016D2B1E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (673, N'admin', N'I', CAST(0x0000A00A016D4A6E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (674, N'admin', N'I', CAST(0x0000A00A016F335B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (675, N'admin', N'I', CAST(0x0000A00A016FFEDE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (676, N'admin', N'I', CAST(0x0000A00A017769FD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (677, N'admin', N'O', CAST(0x0000A00A017CDE28 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (678, N'admin', N'I', CAST(0x0000A00C01209FC8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (679, N'admin', N'I', CAST(0x0000A00C012323F7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (680, N'admin', N'O', CAST(0x0000A00C01249BC5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (681, N'admin', N'I', CAST(0x0000A00C01271F4D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (682, N'admin', N'O', CAST(0x0000A00C0127A00B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (683, N'admin', N'I', CAST(0x0000A00C01291E45 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (684, N'admin', N'I', CAST(0x0000A00C012B1C4F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (685, N'admin', N'O', CAST(0x0000A00C012D7459 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (686, N'admin', N'I', CAST(0x0000A00C012E3DA1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (687, N'admin', N'O', CAST(0x0000A00C012F2E78 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (688, N'admin', N'I', CAST(0x0000A00D009955BB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (689, N'admin', N'O', CAST(0x0000A00D009A0641 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (690, N'admin', N'I', CAST(0x0000A00D00D1058C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (691, N'admin', N'I', CAST(0x0000A00D00D4B0FB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (692, N'admin', N'O', CAST(0x0000A00D00D5AD3E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (693, N'admin', N'I', CAST(0x0000A00D00D75A40 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (694, N'admin', N'O', CAST(0x0000A00D00D894B5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (695, N'admin', N'I', CAST(0x0000A00D00D982CF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (696, N'admin', N'O', CAST(0x0000A00D00D9BBDA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (697, N'admin', N'I', CAST(0x0000A00D00DAA286 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (698, N'admin', N'O', CAST(0x0000A00D00DAE316 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (699, N'admin', N'I', CAST(0x0000A00D00DB52F2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (700, N'admin', N'O', CAST(0x0000A00D00DB99D8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (701, N'admin', N'I', CAST(0x0000A00D00DCFE92 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (702, N'admin', N'O', CAST(0x0000A00D00DD0F45 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (703, N'admin', N'I', CAST(0x0000A00E00D33F36 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (704, N'admin', N'O', CAST(0x0000A00E00D38565 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (705, N'admin', N'I', CAST(0x0000A00E011CE29A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (706, N'admin', N'O', CAST(0x0000A00E011CEC70 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (707, N'admin', N'I', CAST(0x0000A00E011D1B90 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (708, N'admin', N'I', CAST(0x0000A01F00D465EB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (709, N'admin', N'O', CAST(0x0000A01F00D4850D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (710, N'admin', N'I', CAST(0x0000A01F00D575CB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (711, N'admin', N'O', CAST(0x0000A01F00D599A0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (712, N'admin', N'I', CAST(0x0000A01F00D6691C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (713, N'admin', N'O', CAST(0x0000A01F00D6D4FD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (714, N'admin', N'I', CAST(0x0000A01F00DA3049 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (715, N'admin', N'O', CAST(0x0000A01F00DB9B71 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (716, N'admin', N'I', CAST(0x0000A01F00E29F27 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (717, N'admin', N'I', CAST(0x0000A01F00E62504 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (718, N'admin', N'O', CAST(0x0000A01F00EAE8C4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (719, N'admin', N'I', CAST(0x0000A01F00F1786C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (720, N'admin', N'O', CAST(0x0000A01F00F4305B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (721, N'admin', N'I', CAST(0x0000A03400B88D37 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (722, N'admin', N'I', CAST(0x0000A03400B91D2D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (723, N'admin', N'I', CAST(0x0000A03400BBA889 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (724, N'admin', N'O', CAST(0x0000A03400BC531E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (725, N'admin', N'I', CAST(0x0000A03400BC92AD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (726, N'admin', N'O', CAST(0x0000A03400BCBEA1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (727, N'admin', N'I', CAST(0x0000A03400BD6B07 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (728, N'admin', N'I', CAST(0x0000A03400BDEEDE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (729, N'admin', N'O', CAST(0x0000A03400BEC313 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (730, N'admin', N'I', CAST(0x0000A03400BFBB81 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (731, N'admin', N'I', CAST(0x0000A03400C10404 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (732, N'admin', N'I', CAST(0x0000A03400C30A08 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (733, N'admin', N'I', CAST(0x0000A03400C4182D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (734, N'admin', N'I', CAST(0x0000A03400C54791 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (735, N'admin', N'I', CAST(0x0000A03400C79000 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (736, N'admin', N'O', CAST(0x0000A03400C94962 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (737, N'admin', N'I', CAST(0x0000A03400CCA7D2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (738, N'admin', N'I', CAST(0x0000A03400CF4F11 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (739, N'admin', N'I', CAST(0x0000A03400D0525D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (740, N'admin', N'O', CAST(0x0000A03400D087DA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (741, N'admin', N'I', CAST(0x0000A03400D1F6B7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (742, N'admin', N'O', CAST(0x0000A03400D27D24 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (743, N'admin', N'I', CAST(0x0000A03500D6376E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (744, N'admin', N'O', CAST(0x0000A03500DD18FC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (745, N'admin', N'I', CAST(0x0000A03501615079 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (746, N'admin', N'I', CAST(0x0000A035016ACAF9 AS DateTime))
GO
print 'Processed 600 total records'
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (747, N'admin', N'I', CAST(0x0000A035016E696A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (748, N'admin', N'I', CAST(0x0000A03600CB1355 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (749, N'admin', N'O', CAST(0x0000A03600CC3C11 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (750, N'admin', N'I', CAST(0x0000A03600CE235F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (751, N'admin', N'I', CAST(0x0000A03600D2D27F AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (752, N'admin', N'O', CAST(0x0000A03600D31702 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (753, N'admin', N'I', CAST(0x0000A03600D3D4A5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (754, N'admin', N'I', CAST(0x0000A03600D6D8A7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (755, N'admin', N'O', CAST(0x0000A03600D78B42 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (756, N'admin', N'I', CAST(0x0000A03600D9DAEF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (757, N'admin', N'O', CAST(0x0000A03600DCE2F2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (758, N'admin', N'I', CAST(0x0000A03600DD0D91 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (759, N'admin', N'O', CAST(0x0000A03600DED878 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (760, N'admin', N'I', CAST(0x0000A03600FE8B69 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (761, N'admin', N'O', CAST(0x0000A03600FF34A2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (762, N'admin', N'I', CAST(0x0000A0360101386C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (763, N'admin', N'I', CAST(0x0000A0360101AEBA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (764, N'admin', N'O', CAST(0x0000A03601022241 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (765, N'admin', N'I', CAST(0x0000A03601023811 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (766, N'admin', N'O', CAST(0x0000A036010346A2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (767, N'admin', N'I', CAST(0x0000A036010347D7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (768, N'admin', N'O', CAST(0x0000A03601037582 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (769, N'admin', N'I', CAST(0x0000A036014DA849 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (770, N'admin', N'I', CAST(0x0000A036014E5849 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (771, N'admin', N'I', CAST(0x0000A036014FD3A5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (772, N'admin', N'I', CAST(0x0000A0360150AFA1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (773, N'admin', N'O', CAST(0x0000A036015148F8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (774, N'admin', N'I', CAST(0x0000A0360152C365 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (775, N'admin', N'O', CAST(0x0000A03601537F0D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (776, N'admin', N'I', CAST(0x0000A03601593A38 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (777, N'admin', N'I', CAST(0x0000A0360159CE5B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (778, N'admin', N'I', CAST(0x0000A036015A69C5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (779, N'admin', N'I', CAST(0x0000A036015B6AA1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (780, N'admin', N'I', CAST(0x0000A036015C0CA6 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (781, N'admin', N'I', CAST(0x0000A03601650B74 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (782, N'admin', N'O', CAST(0x0000A0360166AA42 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (783, N'admin', N'I', CAST(0x0000A03601672056 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (784, N'admin', N'I', CAST(0x0000A0360169337E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (785, N'admin', N'I', CAST(0x0000A0360170D5AB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (786, N'admin', N'O', CAST(0x0000A03601723773 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (787, N'admin', N'I', CAST(0x0000A036017339C5 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (788, N'admin', N'O', CAST(0x0000A03601737475 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (789, N'admin', N'I', CAST(0x0000A036017385DE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (790, N'admin', N'I', CAST(0x0000A041009B907D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (791, N'admin', N'O', CAST(0x0000A041009BDD6E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (792, N'admin', N'I', CAST(0x0000A05A009B667A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (793, N'admin', N'I', CAST(0x0000A05A016384A4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (794, N'admin', N'O', CAST(0x0000A05A0163F996 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (795, N'admin', N'I', CAST(0x0000A05A0166B978 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (796, N'admin', N'I', CAST(0x0000A05A0166F34E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (797, N'admin', N'I', CAST(0x0000A05A0167B37E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (798, N'admin', N'O', CAST(0x0000A05A016E4930 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (799, N'admin', N'I', CAST(0x0000A05A018108AD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (800, N'admin', N'I', CAST(0x0000A05A0182CFC7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (801, N'admin', N'I', CAST(0x0000A05A01838724 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (802, N'admin', N'O', CAST(0x0000A05A018409FE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (803, N'admin', N'I', CAST(0x0000A05D00C0B323 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (804, N'admin', N'O', CAST(0x0000A05D00C0EA2B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (805, N'admin', N'I', CAST(0x0000A05D00C109ED AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (806, N'admin', N'O', CAST(0x0000A05D00C3E77E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (807, N'admin', N'I', CAST(0x0000A05D00C46E79 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (808, N'admin', N'I', CAST(0x0000A05D00C71B55 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (809, N'admin', N'I', CAST(0x0000A05D00CB84B0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (810, N'admin', N'I', CAST(0x0000A05D00CF294C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (811, N'admin', N'I', CAST(0x0000A05D00D02FFF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (812, N'admin', N'I', CAST(0x0000A05D00D4013B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (813, N'admin', N'I', CAST(0x0000A05D00DC295A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (814, N'admin', N'O', CAST(0x0000A05D00DC4AE4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (815, N'admin', N'I', CAST(0x0000A05D00DCB9E4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (816, N'admin', N'O', CAST(0x0000A05D00DCD3E8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (817, N'admin', N'I', CAST(0x0000A05D00DE46AB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (818, N'admin', N'I', CAST(0x0000A05D00E1BBC4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (819, N'admin', N'I', CAST(0x0000A05D00E26D6C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (820, N'admin', N'I', CAST(0x0000A05D00E56BE4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (821, N'admin', N'I', CAST(0x0000A05D00E5B2E9 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (822, N'admin', N'O', CAST(0x0000A05D00E623FF AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (823, N'admin', N'I', CAST(0x0000A05D00E6C4DB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (824, N'admin', N'I', CAST(0x0000A05D00EB9F29 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (825, N'admin', N'O', CAST(0x0000A05D00F572AA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (826, N'admin', N'I', CAST(0x0000A05D012CEACC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (827, N'admin', N'O', CAST(0x0000A05D012D00F1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (828, N'admin', N'I', CAST(0x0000A05D012D5355 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (829, N'admin', N'O', CAST(0x0000A05D012E24A2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (830, N'admin', N'I', CAST(0x0000A05D0132B4B0 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (831, N'admin', N'O', CAST(0x0000A05D0132C4C8 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (832, N'admin', N'I', CAST(0x0000A05D01335B1D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (833, N'admin', N'I', CAST(0x0000A05D0170BA34 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (834, N'admin', N'I', CAST(0x0000A05D01723C31 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (835, N'admin', N'I', CAST(0x0000A05D017467AD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (836, N'admin', N'I', CAST(0x0000A05D01765936 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (837, N'admin', N'I', CAST(0x0000A05D0177EE3E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (838, N'admin', N'O', CAST(0x0000A05D0179D167 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (839, N'admin', N'I', CAST(0x0000A05D01832F0A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (840, N'admin', N'I', CAST(0x0000A05E00B9CBD9 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (841, N'admin', N'I', CAST(0x0000A05E00E4722D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (842, N'admin', N'I', CAST(0x0000A1A500F242FD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (843, N'admin', N'O', CAST(0x0000A1A500F2FB33 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (844, N'admin', N'I', CAST(0x0000A1A500F45310 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (845, N'admin', N'O', CAST(0x0000A1A500F50E67 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (846, N'admin', N'I', CAST(0x0000A2DA015E68A7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (847, N'admin', N'I', CAST(0x0000A2DA015F06EC AS DateTime))
GO
print 'Processed 700 total records'
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (848, N'admin', N'I', CAST(0x0000A2DA015FAB8C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (849, N'admin', N'I', CAST(0x0000A2DA0161F492 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (850, N'admin', N'I', CAST(0x0000A2DA0164EE7C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (851, N'admin', N'I', CAST(0x0000A2DA01660F30 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (852, N'admin', N'I', CAST(0x0000A2DA0168D212 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (853, N'admin', N'I', CAST(0x0000A2DA016B09CE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (854, N'admin', N'I', CAST(0x0000A2DA01794A2E AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (855, N'admin', N'O', CAST(0x0000A2DA0179A85C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (856, N'admin', N'I', CAST(0x0000A2DA0179B793 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (857, N'admin', N'I', CAST(0x0000A2DB00839EEC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (858, N'admin', N'I', CAST(0x0000A2DB0159A8EE AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1857, N'admin', N'I', CAST(0x0000A2DD00728352 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1858, N'admin', N'I', CAST(0x0000A2DD0078146D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1859, N'admin', N'I', CAST(0x0000A2DD0078F688 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1860, N'admin', N'O', CAST(0x0000A2DD007977B1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1861, N'admin', N'I', CAST(0x0000A2DD0079C974 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1862, N'admin', N'O', CAST(0x0000A2DD0079D21D AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1863, N'admin', N'I', CAST(0x0000A2DD007A5795 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1864, N'admin', N'O', CAST(0x0000A2DD007A6377 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1865, N'admin', N'I', CAST(0x0000A2DD0082E437 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1866, N'admin', N'I', CAST(0x0000A2E2000E4371 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1867, N'admin', N'I', CAST(0x0000A314016E7EC7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1868, N'admin', N'I', CAST(0x0000A31500E93650 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1869, N'admin', N'O', CAST(0x0000A31500FE31F2 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1870, N'admin', N'I', CAST(0x0000A31701722F6B AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1871, N'admin', N'I', CAST(0x0000A3170182FEE4 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1872, N'admin', N'O', CAST(0x0000A3170183063A AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1873, N'admin', N'I', CAST(0x0000A31C0109AB44 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1874, N'admin', N'I', CAST(0x0000A3520138502C AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1875, N'admin', N'I', CAST(0x0000A35A01770043 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1876, N'admin', N'O', CAST(0x0000A35A0189D8D1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1877, N'admin', N'I', CAST(0x0000A35F016E01FD AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1878, N'admin', N'O', CAST(0x0000A35F0172A4F1 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1879, N'admin', N'I', CAST(0x0000A35F0172BCFC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1880, N'admin', N'O', CAST(0x0000A35F01732392 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1881, N'luozh', N'I', CAST(0x0000A35F01732BBC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1882, N'luozh', N'O', CAST(0x0000A35F017342EC AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1883, N'admin', N'I', CAST(0x0000A35F017351DB AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1884, N'admin', N'I', CAST(0x0000A42701442EF7 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1885, N'admin', N'O', CAST(0x0000A42701447695 AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1886, N'admin', N'I', CAST(0x0000A427014482AA AS DateTime))
INSERT [dbo].[tb_LoginLog] ([isid], [Account], [LoginType], [CurrentTime]) VALUES (1887, N'admin', N'I', CAST(0x0000A465017E354F AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_LoginLog] OFF
/****** Object:  Table [dbo].[tb_LogFields]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_LogFields](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[FieldName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_T_LogFields] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_LogFields', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_LogFields', @level2type=N'COLUMN',@level2name=N'FieldName'
GO
SET IDENTITY_INSERT [dbo].[tb_LogFields] ON
INSERT [dbo].[tb_LogFields] ([isid], [TableName], [FieldName]) VALUES (174, N'tb_Product', N'ProductName')
INSERT [dbo].[tb_LogFields] ([isid], [TableName], [FieldName]) VALUES (176, N'tb_Product', N'SellPrice')
INSERT [dbo].[tb_LogFields] ([isid], [TableName], [FieldName]) VALUES (177, N'tb_Product', N'Supplier')
INSERT [dbo].[tb_LogFields] ([isid], [TableName], [FieldName]) VALUES (178, N'tb_Product', N'ProductCode')
SET IDENTITY_INSERT [dbo].[tb_LogFields] OFF
/****** Object:  Table [dbo].[tb_LogDtl]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_LogDtl](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[GUID32] [varchar](32) NULL,
	[TableName] [varchar](20) NULL,
	[FieldName] [varchar](20) NULL,
	[OldValue] [varchar](250) NULL,
	[NewValue] [varchar](250) NULL,
 CONSTRAINT [PK_tb_LogDtl] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'32位編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_LogDtl', @level2type=N'COLUMN',@level2name=N'GUID32'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_LogDtl', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_LogDtl', @level2type=N'COLUMN',@level2name=N'FieldName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'舊值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_LogDtl', @level2type=N'COLUMN',@level2name=N'OldValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_LogDtl', @level2type=N'COLUMN',@level2name=N'NewValue'
GO
SET IDENTITY_INSERT [dbo].[tb_LogDtl] ON
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (172, N'eb1179de2fa946f2811d03cdf7594800', N'tb_Product', N'ProductName', N'DEMODEMO', N'DEMODEMO444')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (173, N'eb1179de2fa946f2811d03cdf7594800', N'tb_Product', N'Remark', N'42345', N'42345333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (174, N'eb1179de2fa946f2811d03cdf7594800', N'tb_Product', N'SellPrice', N'129.00', N'1293.00')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (175, N'eb1179de2fa946f2811d03cdf7594800', N'tb_Product', N'Supplier', N'DEMO', N'DEMO33')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (176, N'6f844bab97044e14b1296d57ae94d67d', N'tb_Product', N'SellPrice', N'999.99', N'3999.99')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (177, N'9cf87b960cd64ee2b3960523224602a6', N'tb_Product', N'SellPrice', N'999.99', N'3999.99')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (178, N'26401e1be78c4a98b9139f6ed4e82963', N'tb_Product', N'SellPrice', N'1499.00', N'6999.00')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (179, N'470d74dd25884592ba21bd56beb8c2d8', N'tb_Product', N'SellPrice', N'1499.00', N'6999.00')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (180, N'31e9680fc8cf490e86c79e2eac9dee29', N'tb_Product', N'ProductName', N'测试产品', N'测试产品_MODIFY')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (181, N'31e9680fc8cf490e86c79e2eac9dee29', N'tb_Product', N'Remark', N'OK?', N'OK?333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (182, N'31e9680fc8cf490e86c79e2eac9dee29', N'tb_Product', N'SellPrice', N'99.00', N'990')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (183, N'31e9680fc8cf490e86c79e2eac9dee29', N'tb_Product', N'Supplier', N'csfRAMEWORK', N'csfRAMEWORK333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (184, N'22d62d28dda64d33af4f562b81297850', N'tb_Product', N'ProductName', N'测试产品', N'测试产品_MODIFY')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (185, N'22d62d28dda64d33af4f562b81297850', N'tb_Product', N'Remark', N'OK?', N'OK?333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (186, N'22d62d28dda64d33af4f562b81297850', N'tb_Product', N'SellPrice', N'99.00', N'990')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (187, N'22d62d28dda64d33af4f562b81297850', N'tb_Product', N'Supplier', N'csfRAMEWORK', N'csfRAMEWORK333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (188, N'873cb8b75dbc43f99fdae3f57de0eb4b', N'tb_Product', N'ProductName', N'test product', N'test product888')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (189, N'873cb8b75dbc43f99fdae3f57de0eb4b', N'tb_Product', N'Remark', N'ok?', N'ok?88')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (190, N'873cb8b75dbc43f99fdae3f57de0eb4b', N'tb_Product', N'SellPrice', N'999.00', N'99988')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (191, N'873cb8b75dbc43f99fdae3f57de0eb4b', N'tb_Product', N'Supplier', N'csframework', N'csframework888')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (192, N'39c0abbb0f2b443e931947636c50d620', N'tb_Product', N'ProductName', N'test product', N'test product888')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (193, N'39c0abbb0f2b443e931947636c50d620', N'tb_Product', N'Remark', N'ok?', N'ok?88')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (194, N'39c0abbb0f2b443e931947636c50d620', N'tb_Product', N'SellPrice', N'999.00', N'99988')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (195, N'39c0abbb0f2b443e931947636c50d620', N'tb_Product', N'Supplier', N'csframework', N'csframework888')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (196, N'a2f6d84838c349bfadefac9533bddb45', N'tb_Product', N'ProductName', N'44', N'443333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (197, N'a2f6d84838c349bfadefac9533bddb45', N'tb_Product', N'Remark', N'33', N'33333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (198, N'a2f6d84838c349bfadefac9533bddb45', N'tb_Product', N'SellPrice', N'55.00', N'55.003333333333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (199, N'a2f6d84838c349bfadefac9533bddb45', N'tb_Product', N'Supplier', N'22', N'22333333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (200, N'c830cbfccd094de6a86c1f2d62881e95', N'tb_Product', N'ProductName', N'44', N'443333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (201, N'c830cbfccd094de6a86c1f2d62881e95', N'tb_Product', N'Remark', N'33', N'33333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (202, N'c830cbfccd094de6a86c1f2d62881e95', N'tb_Product', N'SellPrice', N'55.00', N'55.003333333333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (203, N'c830cbfccd094de6a86c1f2d62881e95', N'tb_Product', N'Supplier', N'22', N'22333333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (204, N'9dcfba73ea3d418198fd8455b40f2ffa', N'tb_Product', N'Remark', N'', N'ddddddddddddddddddddddddddd')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (205, N'9dcfba73ea3d418198fd8455b40f2ffa', N'tb_Product', N'Supplier', N'', N'34534')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (206, N'6bdd4e26a30b4d5a848f5d4eae40cdf6', N'tb_Product', N'Remark', N'ddddddddddddddddddddddddddd', N'cc')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (207, N'37f0e3197e394a51a802aa5b624d4249', N'tb_Product', N'ProductName', N'生产数据库', N'生产数据库2')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (208, N'51fb9c8078e54d7fb10555c640d259e1', N'tb_Product', N'ProductName', N'66', N'66444')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (209, N'51fb9c8078e54d7fb10555c640d259e1', N'tb_Product', N'Remark', N'345', N'345345345')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (210, N'51fb9c8078e54d7fb10555c640d259e1', N'tb_Product', N'SellPrice', N'345.00', N'34555')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (211, N'51fb9c8078e54d7fb10555c640d259e1', N'tb_Product', N'Supplier', N'345', N'345345345')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (212, N'9daf10f4531e4ce4867cfdfad64acb23', N'tb_Product', N'ProductName', N'生产数据库2', N'生产数据库2555555')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (213, N'1a13f3957bfa4b97a5e99fea5fbf1ddd', N'tb_Product', N'ProductName', N'DEMODEMO444', N'DEMODEMO444000000000')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (214, N'1a13f3957bfa4b97a5e99fea5fbf1ddd', N'tb_Product', N'Supplier', N'DEMO33', N'DEMO330000000000')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (215, N'b157ad55916243f59be4da5645994b69', N'tb_Product', N'Supplier', N'', N'444444444')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (216, N'521a8f0775a246b7ae6e5e6329c8050d', N'tb_Product', N'Supplier', N'', N'555555555555')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (217, N'787da4c49c2643379ccd9b3f418d9827', N'tb_Product', N'Supplier', N'', N'34')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (218, N'e7c1ba3562c04f2e92f5deea1d17a610', N'tb_Product', N'ProductName', N'生产数据库2555555', N'生产数据库25555554444')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (219, N'dff5a9906b5348ef8805f0e5f082aae5', N'tb_Product', N'Supplier', N'CSFRAMEWORK', N'CSFRAMEWORK55')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (220, N'4de954918f1f46659fa79b4cf52c931d', N'tb_Product', N'ProductName', N'44', N'44333')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (221, N'4de954918f1f46659fa79b4cf52c931d', N'tb_Product', N'SellPrice', N'55.00', N'5544')
INSERT [dbo].[tb_LogDtl] ([isid], [GUID32], [TableName], [FieldName], [OldValue], [NewValue]) VALUES (222, N'4de954918f1f46659fa79b4cf52c931d', N'tb_Product', N'Supplier', N'22', N'2222')
SET IDENTITY_INSERT [dbo].[tb_LogDtl] OFF
/****** Object:  Table [dbo].[tb_Log]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Log](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[GUID32] [varchar](32) NULL,
	[LogUser] [varchar](30) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[OPType] [int] NOT NULL,
	[TableName] [varchar](30) NULL,
	[KeyFieldName] [varchar](20) NULL,
	[DocNo] [varchar](20) NULL,
	[IsMaster] [char](1) NULL,
 CONSTRAINT [PK_T_Log] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'32位主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'GUID32'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'LogUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'LogDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型:1修改,2新增,3删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'OPType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键字段名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'KeyFieldName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'DocNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表标志:Y/N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Log', @level2type=N'COLUMN',@level2name=N'IsMaster'
GO
SET IDENTITY_INSERT [dbo].[tb_Log] ON
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (7, N'eb1179de2fa946f2811d03cdf7594800', N'admin', CAST(0x00009EBB01757AB3 AS DateTime), 1, N'tb_Product', N'ProductCode', N'DEMO', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (8, N'6f844bab97044e14b1296d57ae94d67d', N'admin', CAST(0x00009EC701850477 AS DateTime), 1, N'tb_Product', N'ProductCode', N'CS-ADO-DIRECT', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (9, N'9cf87b960cd64ee2b3960523224602a6', N'admin', CAST(0x00009EC7018504C2 AS DateTime), 1, N'tb_Product', N'ProductCode', N'CS-ADO-DIRECT', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (10, N'26401e1be78c4a98b9139f6ed4e82963', N'admin', CAST(0x00009EC701851C4E AS DateTime), 1, N'tb_Product', N'ProductCode', N'CS-WebService', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (11, N'470d74dd25884592ba21bd56beb8c2d8', N'admin', CAST(0x00009EC701851C57 AS DateTime), 1, N'tb_Product', N'ProductCode', N'CS-WebService', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (12, N'31e9680fc8cf490e86c79e2eac9dee29', N'admin', CAST(0x00009EDD010D1B54 AS DateTime), 1, N'tb_Product', N'ProductCode', N'TEST01', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (13, N'22d62d28dda64d33af4f562b81297850', N'admin', CAST(0x00009EDD010D1B83 AS DateTime), 1, N'tb_Product', N'ProductCode', N'TEST01', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (14, N'873cb8b75dbc43f99fdae3f57de0eb4b', N'admin', CAST(0x00009EDD0112096B AS DateTime), 1, N'tb_Product', N'ProductCode', N'test', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (15, N'39c0abbb0f2b443e931947636c50d620', N'admin', CAST(0x00009EDD01120982 AS DateTime), 1, N'tb_Product', N'ProductCode', N'test', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (16, N'a2f6d84838c349bfadefac9533bddb45', N'admin', CAST(0x00009EEA015EA0AA AS DateTime), 1, N'tb_Product', N'ProductCode', N'333', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (17, N'c830cbfccd094de6a86c1f2d62881e95', N'admin', CAST(0x00009EEA015EA0DD AS DateTime), 1, N'tb_Product', N'ProductCode', N'333', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (18, N'9dcfba73ea3d418198fd8455b40f2ffa', N'admin', CAST(0x00009F9B0162469C AS DateTime), 1, N'tb_Product', N'ProductCode', N'ABC', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (19, N'6bdd4e26a30b4d5a848f5d4eae40cdf6', N'admin', CAST(0x00009F9B0167AAE5 AS DateTime), 1, N'tb_Product', N'ProductCode', N'ABC', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (20, N'37f0e3197e394a51a802aa5b624d4249', N'admin', CAST(0x00009F9B01718507 AS DateTime), 1, N'tb_Product', N'ProductCode', N'PRODUCE_DB', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (21, N'51fb9c8078e54d7fb10555c640d259e1', N'admin', CAST(0x00009F9B017BA621 AS DateTime), 1, N'tb_Product', N'ProductCode', N'55', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (22, N'9daf10f4531e4ce4867cfdfad64acb23', N'admin', CAST(0x0000A00300AF7A4F AS DateTime), 1, N'tb_Product', N'ProductCode', N'PRODUCE_DB', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (23, N'1a13f3957bfa4b97a5e99fea5fbf1ddd', N'admin', CAST(0x0000A00300B42D7F AS DateTime), 1, N'tb_Product', N'ProductCode', N'DEMO', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (24, N'b157ad55916243f59be4da5645994b69', N'admin', CAST(0x0000A007011653E3 AS DateTime), 1, N'tb_Product', N'ProductCode', N'CDE', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (25, N'521a8f0775a246b7ae6e5e6329c8050d', N'admin', CAST(0x0000A0070156BB66 AS DateTime), 1, N'tb_Product', N'ProductCode', N'AMDCPU', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (26, N'787da4c49c2643379ccd9b3f418d9827', N'admin', CAST(0x0000A00701573A7E AS DateTime), 1, N'tb_Product', N'ProductCode', N'CPU', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (27, N'e7c1ba3562c04f2e92f5deea1d17a610', N'admin', CAST(0x0000A00701790ABF AS DateTime), 1, N'tb_Product', N'ProductCode', N'PRODUCE_DB', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (28, N'dff5a9906b5348ef8805f0e5f082aae5', N'admin', CAST(0x0000A007017BC267 AS DateTime), 1, N'tb_Product', N'ProductCode', N'PRODUCE_DB', N'Y')
INSERT [dbo].[tb_Log] ([isid], [GUID32], [LogUser], [LogDate], [OPType], [TableName], [KeyFieldName], [DocNo], [IsMaster]) VALUES (29, N'4de954918f1f46659fa79b4cf52c931d', N'admin', CAST(0x0000A00D00D1E2D6 AS DateTime), 1, N'tb_Product', N'ProductCode', N'33', N'Y')
SET IDENTITY_INSERT [dbo].[tb_Log] OFF
/****** Object:  Table [dbo].[tb_Location]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Location](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [varchar](20) NOT NULL,
	[LocationName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Location] ON
INSERT [dbo].[tb_Location] ([ISID], [LocationID], [LocationName]) VALUES (1, N'L01', N'临时仓1')
INSERT [dbo].[tb_Location] ([ISID], [LocationID], [LocationName]) VALUES (2, N'L02', N'临时仓2')
INSERT [dbo].[tb_Location] ([ISID], [LocationID], [LocationName]) VALUES (4, N'SHMAX', N'上海MAX')
INSERT [dbo].[tb_Location] ([ISID], [LocationID], [LocationName]) VALUES (3, N'ZHMAIN', N'珠海总仓')
SET IDENTITY_INSERT [dbo].[tb_Location] OFF
/****** Object:  Table [dbo].[tb_IOs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_IOs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[Queue] [decimal](18, 2) NULL,
	[IONO] [varchar](20) NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[Quantity] [int] NULL,
	[Remark] [varchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_IOs] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_IOs] ON
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, CAST(1.00 AS Decimal(18, 2)), N'IO1204002', N'CS-ADO-DIRECT', 221, NULL, CAST(0x0000A036015C91F1 AS DateTime), N'admin', CAST(0x0000A036015C91F1 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, CAST(1.00 AS Decimal(18, 2)), N'IO1204003', N'CDE', 1, NULL, CAST(0x0000A036015CF403 AS DateTime), N'admin', CAST(0x0000A036015CF403 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, CAST(1.20 AS Decimal(18, 2)), N'IO1204003', N'CS-ADO-DIRECT', 31, NULL, CAST(0x0000A036015CF403 AS DateTime), N'admin', CAST(0x0000A036015CF403 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, CAST(1.40 AS Decimal(18, 2)), N'IO1204003', N'DEMO', 41, NULL, CAST(0x0000A036015CF403 AS DateTime), N'admin', CAST(0x0000A036015CF403 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, CAST(1.00 AS Decimal(18, 2)), N'IO1204005', N'PRODUCE_DB', 31, N'33', CAST(0x0000A0360171AFB6 AS DateTime), N'admin', CAST(0x0000A0360171AFB6 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (8, CAST(1.00 AS Decimal(18, 2)), N'IO1205001', N'CS-ADO-DIRECT', 41, NULL, CAST(0x0000A05A0163B28B AS DateTime), N'admin', CAST(0x0000A05A0163B28B AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (9, CAST(1.20 AS Decimal(18, 2)), N'IO1205001', N'CS-MINI', 51, NULL, CAST(0x0000A05A0163B28B AS DateTime), N'admin', CAST(0x0000A05A0163B28B AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (10, CAST(1.00 AS Decimal(18, 2)), N'IO1205002', N'AMDCPU', 1, N'333', CAST(0x0000A05A01683C26 AS DateTime), N'admin', CAST(0x0000A05A01683C26 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (11, CAST(1.20 AS Decimal(18, 2)), N'IO1205002', N'CS-WebService', 21, N'44', CAST(0x0000A05A01683C26 AS DateTime), N'admin', CAST(0x0000A05A01683C26 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (12, CAST(1.40 AS Decimal(18, 2)), N'IO1205002', N'PRODUCE_DB', 31, N'55', CAST(0x0000A05A01683C26 AS DateTime), N'admin', CAST(0x0000A05A01683C26 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (13, CAST(1.00 AS Decimal(18, 2)), N'IO1205003', N'AMDCPU', 1, N'333', CAST(0x0000A05A01684C92 AS DateTime), N'admin', CAST(0x0000A05A01684C92 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (14, CAST(1.20 AS Decimal(18, 2)), N'IO1205003', N'CS-WebService', 21, N'44', CAST(0x0000A05A01684C92 AS DateTime), N'admin', CAST(0x0000A05A01684C92 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (15, CAST(1.40 AS Decimal(18, 2)), N'IO1205003', N'PRODUCE_DB', 31, N'55', CAST(0x0000A05A01684C92 AS DateTime), N'admin', CAST(0x0000A05A01684C92 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (16, CAST(1.20 AS Decimal(18, 2)), N'IO1205004', N'CPU', 31, NULL, CAST(0x0000A05A01840405 AS DateTime), N'admin', CAST(0x0000A05A01840405 AS DateTime), N'admin')
INSERT [dbo].[tb_IOs] ([ISID], [Queue], [IONO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (17, CAST(1.00 AS Decimal(18, 2)), N'IO1205004', N'CS-ADO-DIRECT', 1, NULL, CAST(0x0000A05A01840405 AS DateTime), N'admin', CAST(0x0000A05A01840405 AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_IOs] OFF
/****** Object:  Table [dbo].[tb_IO]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_IO](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[IONO] [varchar](20) NOT NULL,
	[DocDate] [datetime] NULL,
	[DocUser] [varchar](20) NULL,
	[RefNo] [varchar](20) NULL,
	[CustomerCode] [varchar](20) NULL,
	[Department] [varchar](20) NULL,
	[Deliver] [varchar](20) NULL,
	[LocationID] [varchar](20) NULL,
	[Remark] [varchar](250) NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[FlagApp] [char](1) NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_IO] PRIMARY KEY CLUSTERED 
(
	[IONO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_IO] ON
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (2, N'IO1204002', CAST(0x0000A03600000000 AS DateTime), N'admin', N'234234', N'WCL', N'D02', N'sale', N'L02', N'234234', N'admin', CAST(0x0000A036015C3757 AS DateTime), NULL, NULL, NULL, N'admin', CAST(0x0000A036015C91F1 AS DateTime))
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (3, N'IO1204003', CAST(0x0000A03600000000 AS DateTime), N'admin', N'234', N'customer4', N'D03', N'jonnysun', N'SHMAX', N'234234', N'admin', CAST(0x0000A036015CDBA9 AS DateTime), N'Y', N'admin', CAST(0x0000A036015CF779 AS DateTime), N'admin', CAST(0x0000A036015CF403 AS DateTime))
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (4, N'IO1204004', CAST(0x0000A03600000000 AS DateTime), N'admin', N'234234234', N'YG', N'D02', N'jonny', N'L02', N'345345345', N'admin', CAST(0x0000A036015CFF62 AS DateTime), N'N', NULL, NULL, N'admin', CAST(0x0000A0360171DA72 AS DateTime))
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (5, N'IO1204005', CAST(0x0000A03600000000 AS DateTime), N'admin', NULL, N'WCL', N'D02', N'jonny', N'SHMAX', N'asdfasdfasdf', N'admin', CAST(0x0000A03601717713 AS DateTime), N'Y', N'admin', CAST(0x0000A0360171B6B4 AS DateTime), N'admin', CAST(0x0000A0360171AFB6 AS DateTime))
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (8, N'IO1205001', CAST(0x0000A03600000000 AS DateTime), N'admin', NULL, N'WQ', N'D02', N'cs', N'L02', N'asdf234234234', N'admin', CAST(0x0000A05A00000000 AS DateTime), NULL, NULL, NULL, N'admin', CAST(0x0000A05A0163B28B AS DateTime))
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (9, N'IO1205002', CAST(0x0000A03600000000 AS DateTime), N'admin', NULL, N'WQ', N'D01', N'cs', N'ZHMAIN', N'asfasfasdf', N'admin', CAST(0x0000A05A00000000 AS DateTime), NULL, NULL, NULL, N'admin', CAST(0x0000A05A01683C26 AS DateTime))
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (10, N'IO1205003', CAST(0x0000A03600000000 AS DateTime), N'admin', NULL, N'WQ', N'D01', N'cs', N'ZHMAIN', N'asfasfasdf345345345', N'admin', CAST(0x0000A05A00000000 AS DateTime), NULL, NULL, NULL, N'admin', CAST(0x0000A05A01684C92 AS DateTime))
INSERT [dbo].[tb_IO] ([ISID], [IONO], [DocDate], [DocUser], [RefNo], [CustomerCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (11, N'IO1205004', CAST(0x0000A03600000000 AS DateTime), N'admin', NULL, N'SUPPLIER', N'D02', N'jonny', N'SHMAX', N'asfdasdfasdfasdfasdf', N'admin', CAST(0x0000A05A00000000 AS DateTime), NULL, NULL, NULL, N'admin', CAST(0x0000A05A01840405 AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_IO] OFF
/****** Object:  Table [dbo].[tb_INs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_INs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[Queue] [decimal](18, 2) NULL,
	[INNO] [varchar](20) NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[Quantity] [int] NULL,
	[Remark] [varchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_INs] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_INs] ON
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, CAST(1.00 AS Decimal(18, 2)), N'IN1204002', N'CS-ADO-DIRECT', 1, NULL, CAST(0x0000A0360150D952 AS DateTime), N'admin', CAST(0x0000A0360150D952 AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, CAST(1.20 AS Decimal(18, 2)), N'IN1204002', N'CPU', 1, NULL, CAST(0x0000A0360150D952 AS DateTime), N'admin', CAST(0x0000A0360150D952 AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, CAST(1.00 AS Decimal(18, 2)), N'IN1204004', N'AMDCPU', 1, N'333', CAST(0x0000A03601534E78 AS DateTime), N'admin', CAST(0x0000A0360153632E AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (5, CAST(1.20 AS Decimal(18, 2)), N'IN1204004', N'CS-WebService', 21, N'44', CAST(0x0000A03601534E78 AS DateTime), N'admin', CAST(0x0000A0360153632E AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, CAST(1.40 AS Decimal(18, 2)), N'IN1204004', N'PRODUCE_DB', 31, N'55', CAST(0x0000A03601534E78 AS DateTime), N'admin', CAST(0x0000A0360153632E AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, CAST(1.00 AS Decimal(18, 2)), N'IN1204005', N'CS-ADO-DIRECT', 1, NULL, CAST(0x0000A0360171431C AS DateTime), N'admin', CAST(0x0000A0360171431C AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (8, CAST(1.20 AS Decimal(18, 2)), N'IN1204005', N'CPU', 31, NULL, CAST(0x0000A03601714E72 AS DateTime), N'admin', CAST(0x0000A03601714E72 AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (10, CAST(1.00 AS Decimal(18, 2)), N'IN1204006', N'CS-ADO-DIRECT', 41, NULL, CAST(0x0000A05A009BD07E AS DateTime), N'admin', CAST(0x0000A05A009BD07E AS DateTime), N'admin')
INSERT [dbo].[tb_INs] ([ISID], [Queue], [INNO], [ProductCode], [Quantity], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (11, CAST(1.20 AS Decimal(18, 2)), N'IN1204006', N'CS-MINI', 51, NULL, CAST(0x0000A05A009BD07E AS DateTime), N'admin', CAST(0x0000A05A009BD07E AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_INs] OFF
/****** Object:  Table [dbo].[tb_IN]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_IN](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[INNO] [varchar](20) NOT NULL,
	[DocDate] [datetime] NULL,
	[DocUser] [varchar](20) NULL,
	[RefNo] [varchar](20) NULL,
	[SupplierCode] [varchar](20) NULL,
	[Department] [varchar](20) NULL,
	[Deliver] [varchar](20) NULL,
	[LocationID] [varchar](20) NULL,
	[Remark] [varchar](250) NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[FlagApp] [char](1) NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_IN] PRIMARY KEY CLUSTERED 
(
	[INNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_IN] ON
INSERT [dbo].[tb_IN] ([ISID], [INNO], [DocDate], [DocUser], [RefNo], [SupplierCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (5, N'IN1204001', CAST(0x0000A03600000000 AS DateTime), N'admin', N'234234', N'SUPPLIER', N'D02', N'jonny', N'SHMAX', N'234234234234234', N'admin', CAST(0x0000A03600D3E03C AS DateTime), N'Y', N'admin', CAST(0x0000A03600D6F546 AS DateTime), N'admin', CAST(0x0000A03600D56FEB AS DateTime))
INSERT [dbo].[tb_IN] ([ISID], [INNO], [DocDate], [DocUser], [RefNo], [SupplierCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (8, N'IN1204002', CAST(0x0000A03600000000 AS DateTime), N'admin', N',.nklnklj', N'SUPPLIER', N'D03', N'test', N'L01', N'uyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuy', N'admin', CAST(0x0000A0360150C388 AS DateTime), N'Y', N'admin', CAST(0x0000A0360150F77A AS DateTime), N'admin', CAST(0x0000A0360150D952 AS DateTime))
INSERT [dbo].[tb_IN] ([ISID], [INNO], [DocDate], [DocUser], [RefNo], [SupplierCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (9, N'IN1204003', CAST(0x0000A03600000000 AS DateTime), N'admin', N'123123', N'customer4', N'D03', N'jonny', N'L02', N'123123', N'admin', CAST(0x0000A0360150FB49 AS DateTime), N'N', NULL, NULL, N'admin', CAST(0x0000A03601510983 AS DateTime))
INSERT [dbo].[tb_IN] ([ISID], [INNO], [DocDate], [DocUser], [RefNo], [SupplierCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (10, N'IN1204004', CAST(0x0000A03600000000 AS DateTime), N'admin', N'asdfasfd', N'WQ', N'D01', N'cs', N'ZHMAIN', N'asfasfasdf', N'admin', CAST(0x0000A03601532ADB AS DateTime), NULL, NULL, NULL, N'admin', CAST(0x0000A0360153632E AS DateTime))
INSERT [dbo].[tb_IN] ([ISID], [INNO], [DocDate], [DocUser], [RefNo], [SupplierCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (11, N'IN1204005', CAST(0x0000A03600000000 AS DateTime), N'admin', N'asdf', N'SUPPLIER', N'D02', N'jonny', N'SHMAX', N'asfdasdfasdfasdfasdf', N'admin', CAST(0x0000A0360170F02A AS DateTime), N'Y', N'admin', CAST(0x0000A036017152BB AS DateTime), N'admin', CAST(0x0000A03601714E72 AS DateTime))
INSERT [dbo].[tb_IN] ([ISID], [INNO], [DocDate], [DocUser], [RefNo], [SupplierCode], [Department], [Deliver], [LocationID], [Remark], [CreatedBy], [CreationDate], [FlagApp], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (12, N'IN1204006', CAST(0x0000A03600000000 AS DateTime), N'admin', N'asdf', N'WQ', N'D02', N'cs', N'L02', N'asdf234234234', N'admin', CAST(0x0000A036017158EB AS DateTime), N'N', NULL, NULL, N'admin', CAST(0x0000A05A009BD07E AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_IN] OFF
/****** Object:  Table [dbo].[tb_ICs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ICs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[Queue] [decimal](18, 2) NULL,
	[ICNO] [varchar](20) NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[Quantity] [int] NULL,
	[Remark] [varchar](250) NULL,
	[LocationID] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_ICs] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_ICs] ON
INSERT [dbo].[tb_ICs] ([ISID], [Queue], [ICNO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, CAST(1.00 AS Decimal(18, 2)), N'IC1204003', N'AMDCPU', 41, N'333', N'SHMAX', CAST(0x0000A03601674818 AS DateTime), N'admin', CAST(0x0000A03601674818 AS DateTime), N'admin')
INSERT [dbo].[tb_ICs] ([ISID], [Queue], [ICNO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, CAST(1.20 AS Decimal(18, 2)), N'IC1204003', N'CS-ADO-DIRECT', 51, N'44', N'ZHMAIN', CAST(0x0000A03601674818 AS DateTime), N'admin', CAST(0x0000A03601674818 AS DateTime), N'admin')
INSERT [dbo].[tb_ICs] ([ISID], [Queue], [ICNO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, CAST(1.40 AS Decimal(18, 2)), N'IC1204003', N'CS-MINI', 61, N'55', N'L02', CAST(0x0000A03601674818 AS DateTime), N'admin', CAST(0x0000A03601674818 AS DateTime), N'admin')
INSERT [dbo].[tb_ICs] ([ISID], [Queue], [ICNO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (5, CAST(1.20 AS Decimal(18, 2)), N'IC1204002', N'CS-ADO-DIRECT', 1, NULL, N'ZHMAIN', CAST(0x0000A0360169763C AS DateTime), N'admin', CAST(0x0000A0360169763C AS DateTime), N'admin')
INSERT [dbo].[tb_ICs] ([ISID], [Queue], [ICNO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, CAST(1.40 AS Decimal(18, 2)), N'IC1204002', N'DEMO', 221, NULL, N'L01', CAST(0x0000A0360169763C AS DateTime), N'admin', CAST(0x0000A0360169763C AS DateTime), N'admin')
INSERT [dbo].[tb_ICs] ([ISID], [Queue], [ICNO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, CAST(1.60 AS Decimal(18, 2)), N'IC1204002', N'CS-MINI', 221, NULL, N'L02', CAST(0x0000A03601698879 AS DateTime), N'admin', CAST(0x0000A03601698879 AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_ICs] OFF
/****** Object:  Table [dbo].[tb_IC]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_IC](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[ICNO] [varchar](20) NOT NULL,
	[DocDate] [datetime] NULL,
	[DocUser] [varchar](20) NULL,
	[FlagApp] [char](1) NULL,
	[Remark] [varchar](250) NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_IC] PRIMARY KEY CLUSTERED 
(
	[ICNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_IC] ON
INSERT [dbo].[tb_IC] ([ISID], [ICNO], [DocDate], [DocUser], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (1, N'IC1204002', CAST(0x0000A03600000000 AS DateTime), N'admin', N'Y', N'23413412341234', N'admin', CAST(0x0000A03601661742 AS DateTime), N'admin', CAST(0x0000A036016A8BA8 AS DateTime), N'admin', CAST(0x0000A03601698874 AS DateTime))
INSERT [dbo].[tb_IC] ([ISID], [ICNO], [DocDate], [DocUser], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (2, N'IC1204003', CAST(0x0000A03600000000 AS DateTime), N'admin', N'Y', N'345345345', N'admin', CAST(0x0000A03601672FF6 AS DateTime), N'admin', CAST(0x0000A03601675152 AS DateTime), N'admin', CAST(0x0000A03601674818 AS DateTime))
INSERT [dbo].[tb_IC] ([ISID], [ICNO], [DocDate], [DocUser], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (3, N'IC1204004', CAST(0x0000A03600000000 AS DateTime), N'admin', N'N', N'22222222222222222222', N'admin', CAST(0x0000A036016A999C AS DateTime), NULL, NULL, N'admin', CAST(0x0000A036016ADC64 AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_IC] OFF
/****** Object:  Table [dbo].[tb_IAs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_IAs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[Queue] [decimal](18, 2) NULL,
	[IANO] [varchar](20) NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[Quantity] [int] NULL,
	[Remark] [varchar](250) NULL,
	[LocationID] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_IAs] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_IAs] ON
INSERT [dbo].[tb_IAs] ([ISID], [Queue], [IANO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, CAST(1.00 AS Decimal(18, 2)), N'IA1204002', N'CDE', 1, N'45345', N'L01', CAST(0x0000A03400C7CBF8 AS DateTime), N'admin', CAST(0x0000A03400C7CBF8 AS DateTime), N'admin')
INSERT [dbo].[tb_IAs] ([ISID], [Queue], [IANO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, CAST(1.20 AS Decimal(18, 2)), N'IA1204002', N'CDE', 221, N'22222222222', N'L02', CAST(0x0000A03400C7E25D AS DateTime), N'admin', CAST(0x0000A03400C7E25D AS DateTime), N'admin')
INSERT [dbo].[tb_IAs] ([ISID], [Queue], [IANO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, CAST(1.40 AS Decimal(18, 2)), N'IA1204002', N'DEMO', -111, N'3444', N'ZHMAIN', CAST(0x0000A03400C7F1A2 AS DateTime), N'admin', CAST(0x0000A03400C7F1A2 AS DateTime), N'admin')
INSERT [dbo].[tb_IAs] ([ISID], [Queue], [IANO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, CAST(1.00 AS Decimal(18, 2)), N'IA1204006', N'CS-WebService', 1, NULL, N'SHMAX', CAST(0x0000A03400D2706E AS DateTime), N'admin', CAST(0x0000A03400D2706E AS DateTime), N'admin')
INSERT [dbo].[tb_IAs] ([ISID], [Queue], [IANO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, CAST(1.00 AS Decimal(18, 2)), N'IA1204007', N'CPU', 3, NULL, N'L02', CAST(0x0000A03601720BFF AS DateTime), N'admin', CAST(0x0000A03601720BFF AS DateTime), N'admin')
INSERT [dbo].[tb_IAs] ([ISID], [Queue], [IANO], [ProductCode], [Quantity], [Remark], [LocationID], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (12, CAST(1.00 AS Decimal(18, 2)), N'IA1204007', N'XX', 1, N'1', N'1', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_IAs] OFF
/****** Object:  Table [dbo].[tb_IA]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_IA](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[IANO] [varchar](20) NOT NULL,
	[DocDate] [datetime] NULL,
	[DocUser] [varchar](20) NULL,
	[Reason] [varchar](200) NULL,
	[FlagApp] [char](1) NULL,
	[Remark] [varchar](250) NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_IA] PRIMARY KEY CLUSTERED 
(
	[IANO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_IA] ON
INSERT [dbo].[tb_IA] ([ISID], [IANO], [DocDate], [DocUser], [Reason], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (1, N'IA1204001', CAST(0x0000A03400000000 AS DateTime), N'admin', N'234', N'Y', N'234234', N'admin', CAST(0x0000A03400C422B5 AS DateTime), N'admin', CAST(0x0000A03400C44377 AS DateTime), N'admin', CAST(0x0000A03400C4249C AS DateTime))
INSERT [dbo].[tb_IA] ([ISID], [IANO], [DocDate], [DocUser], [Reason], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (2, N'IA1204002', CAST(0x0000A03400000000 AS DateTime), N'admin', N'243523', NULL, N'523452345', N'admin', CAST(0x0000A03400C7C12F AS DateTime), NULL, NULL, N'admin', CAST(0x0000A03400C7F1A2 AS DateTime))
INSERT [dbo].[tb_IA] ([ISID], [IANO], [DocDate], [DocUser], [Reason], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (4, N'IA1204004', CAST(0x0000A03400000000 AS DateTime), N'admin', N'2134', NULL, N'4234', N'admin', CAST(0x0000A03400C88130 AS DateTime), NULL, NULL, N'admin', CAST(0x0000A03400C88317 AS DateTime))
INSERT [dbo].[tb_IA] ([ISID], [IANO], [DocDate], [DocUser], [Reason], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (5, N'IA1204005', CAST(0x0000A03400000000 AS DateTime), N'admin', NULL, N'Y', N'asdfasdf', N'admin', CAST(0x0000A03400D06AB8 AS DateTime), N'admin', CAST(0x0000A03400D22797 AS DateTime), N'admin', CAST(0x0000A03400D079F4 AS DateTime))
INSERT [dbo].[tb_IA] ([ISID], [IANO], [DocDate], [DocUser], [Reason], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (6, N'IA1204006', CAST(0x0000A03400000000 AS DateTime), N'admin', N'234234', NULL, N'234234', N'admin', CAST(0x0000A03400D23333 AS DateTime), NULL, NULL, N'admin', CAST(0x0000A03400D2706E AS DateTime))
INSERT [dbo].[tb_IA] ([ISID], [IANO], [DocDate], [DocUser], [Reason], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (7, N'IA1204007', CAST(0x0000A03600000000 AS DateTime), N'admin', N'aaaa', N'Y', N'asdfasdfasdf', N'admin', CAST(0x0000A0360171F4E3 AS DateTime), N'admin', CAST(0x0000A03601720F87 AS DateTime), N'admin', CAST(0x0000A03601720BFF AS DateTime))
INSERT [dbo].[tb_IA] ([ISID], [IANO], [DocDate], [DocUser], [Reason], [FlagApp], [Remark], [CreatedBy], [CreationDate], [AppUser], [AppDate], [LastUpdatedBy], [LastUpdateDate]) VALUES (8, N'IA1204008', CAST(0x0000A03600000000 AS DateTime), N'admin', NULL, N'N', N'asdfasdf', N'admin', CAST(0x0000A03601722491 AS DateTime), NULL, NULL, N'admin', CAST(0x0000A03601722CB7 AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_IA] OFF
/****** Object:  Table [dbo].[tb_CustomerAttribute]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_CustomerAttribute](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeCode] [varchar](10) NOT NULL,
	[NativeName] [nvarchar](40) NULL,
	[EnglishName] [varchar](50) NULL,
	[IsSelected] [char](10) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_CustomerInfo] PRIMARY KEY CLUSTERED 
(
	[AttributeCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司屬性代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CustomerAttribute', @level2type=N'COLUMN',@level2name=N'AttributeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中文名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CustomerAttribute', @level2type=N'COLUMN',@level2name=N'NativeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英文名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CustomerAttribute', @level2type=N'COLUMN',@level2name=N'EnglishName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客戶屬性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CustomerAttribute'
GO
SET IDENTITY_INSERT [dbo].[tb_CustomerAttribute] ON
INSERT [dbo].[tb_CustomerAttribute] ([ISID], [AttributeCode], [NativeName], [EnglishName], [IsSelected], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, N'AGT', N'代理公司', N'Agent', N'0         ', CAST(0x000093BE00A73D48 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[tb_CustomerAttribute] ([ISID], [AttributeCode], [NativeName], [EnglishName], [IsSelected], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, N'BNK', N'銀行', N'Bank', N'0         ', CAST(0x000093B600A94214 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[tb_CustomerAttribute] ([ISID], [AttributeCode], [NativeName], [EnglishName], [IsSelected], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, N'CHL', N'子公司', N'Child Company', N'0         ', CAST(0x000093BB00B39700 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[tb_CustomerAttribute] ([ISID], [AttributeCode], [NativeName], [EnglishName], [IsSelected], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, N'CUS', N'客戶', N'Customer', N'0         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CustomerAttribute] ([ISID], [AttributeCode], [NativeName], [EnglishName], [IsSelected], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, N'SEL', N'本公司', N'Self', N'0         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CustomerAttribute] ([ISID], [AttributeCode], [NativeName], [EnglishName], [IsSelected], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, N'SPL', N'供應商', N'Supplier', N'0         ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_CustomerAttribute] OFF
/****** Object:  Table [dbo].[tb_Customer]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Customer](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [varchar](20) NOT NULL,
	[NativeName] [nvarchar](100) NULL,
	[EnglishName] [varchar](100) NULL,
	[AttributeCodes] [varchar](50) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Address3] [nvarchar](50) NULL,
	[Country] [nvarchar](20) NULL,
	[Region] [nvarchar](20) NULL,
	[City] [nvarchar](20) NULL,
	[CountryCode] [nvarchar](6) NULL,
	[CityCode] [varchar](6) NULL,
	[Tel] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[PostalCode] [varchar](20) NULL,
	[ZipCode] [varchar](20) NULL,
	[WebAddress] [varchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Bank] [nvarchar](20) NULL,
	[BankAccount] [varchar](50) NULL,
	[BankAddress] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](20) NULL,
	[Remark] [nvarchar](200) NULL,
	[InUse] [char](10) NULL,
	[PaymentTerm] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_tb_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CustomerCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'CustomerCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'NativeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英文名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'EnglishName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户属性. 多个属性以逗号分开.如:A,B,C,D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'AttributeCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Address1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Address2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Address3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'國家' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省/地區' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'國家區號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'CountryCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市區號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'CityCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電話號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'傳真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'郵政區號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'郵政編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'WebAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電郵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開戶銀行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Bank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'BankAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分行地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'BankAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'聯系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'ContactPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在用(Y/N）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'InUse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'數期（天）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'PaymentTerm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'LastUpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Customer', @level2type=N'COLUMN',@level2name=N'LastUpdatedBy'
GO
SET IDENTITY_INSERT [dbo].[tb_Customer] ON
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (13, N'333', N'555', N'345', N',CUS,SPL,', N'345', N'345', N'345', N'345', N'34', N'345', N'345', N'345', N'345', N'34', N'345', N'345', N'345', N'45', N'BOC', N'34', N'345', N'444', N'345', NULL, 345, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, N'44', N'33', N'345', N',AGT,BNK,CHL,', N'345', N'2345', N'2345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'2345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, N'CSFRAMEWORK', N'C/S框架网|', N'www.9ymw.com', N',SEL,', N'广东省珠海市', N'广东省珠海市广东省珠海市', N'广东省珠海市广东省珠海市', N'中国', N'广东省', N'珠海市', N'852', N'0755', N'13546906869', NULL, N'245233', N'519060', N'www.9ymw.com', N'', N'ICBC', NULL, N'中国工商银行广东省珠海市拱北支行', N'孙中吕', N'C/S框架网欢迎您！', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, N'CUSTOMER', N'湖南广播电台', N'湖南广播电台', N',CUS,', N'湖南广播电台', N'湖南广播电台', N'湖南广播电台', N'345345345', N'湖南', N'长沙', N'345', N'345', N'345', N'345', N'345', N'345', N'345', N'a@a.com', N'ICBC', N'245634576345634', N'湖南广播电台', N'Ms.Zhou', N'湖南广播电台345345345', NULL, 60, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, N'customer4', N'测试用户4', N'测试用户4', N',CUS,SPL,', N'21341234', N'124', N'1234', N'1234', N'1234', N'3412341234', N'1234', N'12', N'234', N'1234', N'23412', N'12', N'2341234', N'23412444', N'BOC', N'1234', N'234144', N'测试用户4', N'3412341234444', N'True      ', 12341, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (11, N'FFT', N'飞恩达软件', N'飞恩达软件', N',SPL,', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'刘先生', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, N'SUPPLIER', N'新科现代软件有限公司', N'XINGKE SOFTWARE COMPANY', N',SPL,', N'广东省珠海市', NULL, NULL, N'CHN', N'广东省', N'珠海市', N'852', N'0755', N'0755-88888888', N'0755-88888888', NULL, N'519060', N'http://www.csframework.com', N'ABC@SS@.COM', N'BOC', N'4434532453223423', N'广东省珠海市', N'Mr.Ling', N'新科现代软件有限公司', NULL, 30, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (8, N'WCL', N'珠海伟创力', N'珠海伟创力', N',CUS,', N'广东珠海', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ICBC', N'1345234563567', NULL, N'刘总', NULL, N'True      ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (10, N'WQ', N'伟强电脑设备有限公司', N'伟强电脑设备有限公司', N',SPL,', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'张先生', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Customer] ([ISID], [CustomerCode], [NativeName], [EnglishName], [AttributeCodes], [Address1], [Address2], [Address3], [Country], [Region], [City], [CountryCode], [CityCode], [Tel], [Fax], [PostalCode], [ZipCode], [WebAddress], [Email], [Bank], [BankAccount], [BankAddress], [ContactPerson], [Remark], [InUse], [PaymentTerm], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (9, N'YG', N'珠海远光软件股份有限公司', N'珠海远光软件股份有限公司', N',CUS,', N'广东，珠海，南方软件园', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'胡经理', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Customer] OFF
/****** Object:  Table [dbo].[tb_Currency]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Currency](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[Currency] [varchar](10) NOT NULL,
	[CurrencyName] [varchar](20) NULL,
 CONSTRAINT [PK_tb_Currency] PRIMARY KEY CLUSTERED 
(
	[Currency] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Currency] ON
INSERT [dbo].[tb_Currency] ([isid], [Currency], [CurrencyName]) VALUES (3, N'HKD', N'港币')
INSERT [dbo].[tb_Currency] ([isid], [Currency], [CurrencyName]) VALUES (1, N'RMB', N'人民币')
INSERT [dbo].[tb_Currency] ([isid], [Currency], [CurrencyName]) VALUES (2, N'USD', N'美刀')
SET IDENTITY_INSERT [dbo].[tb_Currency] OFF
/****** Object:  Table [dbo].[tb_CompanyInfo]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_CompanyInfo](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [char](3) NOT NULL,
	[NativeName] [nvarchar](40) NULL,
	[EnglishName] [nvarchar](40) NULL,
	[ProgramName] [nvarchar](40) NULL,
	[ReportHead] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Tel] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'CompanyCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'NativeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英文名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'EnglishName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'報表抬頭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'ReportHead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'傳真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_CompanyInfo', @level2type=N'COLUMN',@level2name=N'Fax'
GO
SET IDENTITY_INSERT [dbo].[tb_CompanyInfo] ON
INSERT [dbo].[tb_CompanyInfo] ([ISID], [CompanyCode], [NativeName], [EnglishName], [ProgramName], [ReportHead], [Address], [Tel], [Fax], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, N'LZT', N'立智通软件', N'LZTSOFT', N'立智通软件开发框架', N'', N'', N'', N'', CAST(0x00009E1D00CD3147 AS DateTime), N'admin', CAST(0x0000A31500F59AD4 AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_CompanyInfo] OFF
/****** Object:  Table [dbo].[tb_CommonDataDict]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_CommonDataDict](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[DataType] [int] NULL,
	[DataCode] [varchar](20) NULL,
	[NativeName] [nvarchar](100) NULL,
	[EnglishName] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_CommonDataDict] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_CommonDataDict] ON
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, 2, N'PRC', N'中华人民共和国', N'People''s Republic of China', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, 1, N'ICBC', N'中国工商银行', N'ICBC', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, 1, N'BOC', N'中国银行', N'BOCCCCCC', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (6, 2, N'AMERICA', N'美利坚合众国', N'AMERICA', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (9, 2, N'eee', N'234234', N'234234234', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (11, 1, N'222', N'23454444444444444444444444', N'2352345', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (12, 5, N'HKD', N'HKD', N'港币', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (13, 5, N'CNY', N'人民币', N'RMB', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (15, 6, N'D01', N'MIS部门', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (16, 6, N'D02', N'生产部', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (17, 6, N'D03', N'仓储部门', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (18, 2, N'2', N'45', N'345', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (19, 33, N'33', N'23', N'234', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (20, 33, N'33', N'23', N'234', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (21, 5, N'5', N'2345', N'23452345', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (22, 2, N'2', N'345', N'345345', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (23, 6, N'6', N'22', N'44', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (24, 4, N'40001', N'222', N'333', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (25, 2, N'20003', N'111', N'111', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_CommonDataDict] ([ISID], [DataType], [DataCode], [NativeName], [EnglishName], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (26, 5, N'50002', N'222', N'222', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_CommonDataDict] OFF
/****** Object:  Table [dbo].[tb_CommDataDictType]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_CommDataDictType](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[DataType] [int] NOT NULL,
	[TypeName] [nvarchar](20) NULL,
 CONSTRAINT [PK_tb_CommDataDictType] PRIMARY KEY CLUSTERED 
(
	[DataType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_CommDataDictType] ON
INSERT [dbo].[tb_CommDataDictType] ([isid], [DataType], [TypeName]) VALUES (1, 1, N'银行资料')
INSERT [dbo].[tb_CommDataDictType] ([isid], [DataType], [TypeName]) VALUES (2, 2, N'国家')
INSERT [dbo].[tb_CommDataDictType] ([isid], [DataType], [TypeName]) VALUES (3, 3, N'地区')
INSERT [dbo].[tb_CommDataDictType] ([isid], [DataType], [TypeName]) VALUES (4, 4, N'地区')
INSERT [dbo].[tb_CommDataDictType] ([isid], [DataType], [TypeName]) VALUES (6, 5, N'货币')
INSERT [dbo].[tb_CommDataDictType] ([isid], [DataType], [TypeName]) VALUES (7, 6, N'部门资料')
INSERT [dbo].[tb_CommDataDictType] ([isid], [DataType], [TypeName]) VALUES (5, 33, N'44')
SET IDENTITY_INSERT [dbo].[tb_CommDataDictType] OFF
/****** Object:  Table [dbo].[tb_AttachFile]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_AttachFile](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [varchar](20) NULL,
	[FileTitle] [nvarchar](100) NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FileType] [varchar](10) NOT NULL,
	[FileSize] [decimal](18, 2) NULL,
	[FileBody] [image] NULL,
	[IsDroped] [varchar](1) NULL,
 CONSTRAINT [PK_tb_AttachFile] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'FileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單據號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'DocID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'FileTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'FileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'FileSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'FileBody'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刪除標記' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AttachFile', @level2type=N'COLUMN',@level2name=N'IsDroped'
GO
SET IDENTITY_INSERT [dbo].[tb_AttachFile] ON
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (33, N'SO1103005', N'24_Approval.ico', N'24_Approval.ico', N'.ico', CAST(1.72 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (34, N'SO1103005', N'test.txt', N'test.txt', N'.txt', CAST(0.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (35, N'SO1104001', N'test.txt', N'test.txt', N'.txt', CAST(0.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (36, N'SO1105001', N'_.txt', N'_.txt', N'.txt', CAST(0.03 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (37, N'SO1103005', N'logo-for-app1.png', N'logo-for-app1.png', N'.png', CAST(17.99 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (38, N'SO1104001', N'钱.txt', N'钱.txt', N'.txt', CAST(0.13 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (41, N'SO1202001', N'20120222-02.PNG', N'20120222-02.PNG', N'.PNG', CAST(46.06 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (42, N'SO1202001', N'emptyrow.jpg', N'emptyrow.jpg', N'.jpg', CAST(38.40 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (43, N'SO1202001', N'如何明细表字段选择。。。.jpg', N'如何明细表字段选择。。。.jpg', N'.jpg', CAST(71.39 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (44, N'SO1202001', N'list.png', N'list.png', N'.png', CAST(3.40 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (45, N'SO1111002', N'item.png', N'item.png', N'.png', CAST(2.99 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[tb_AttachFile] ([FileID], [DocID], [FileTitle], [FileName], [FileType], [FileSize], [FileBody], [IsDroped]) VALUES (46, N'SO1203001', N'ButtonCascade.png', N'ButtonCascade.png', N'.png', CAST(0.91 AS Decimal(18, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_AttachFile] OFF
/****** Object:  Table [dbo].[tb_ARs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ARs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[ARNO] [varchar](20) NULL,
	[Queue] [decimal](18, 2) NULL,
	[InvoiceNo] [varchar](20) NULL,
	[SONO] [varchar](20) NULL,
	[Currency] [varchar](20) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_ARDtl] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發票編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ARs', @level2type=N'COLUMN',@level2name=N'InvoiceNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ARs', @level2type=N'COLUMN',@level2name=N'SONO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'貨幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ARs', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ARs', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ARs', @level2type=N'COLUMN',@level2name=N'Remark'
GO
SET IDENTITY_INSERT [dbo].[tb_ARs] ON
INSERT [dbo].[tb_ARs] ([ISID], [ARNO], [Queue], [InvoiceNo], [SONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, N'AR1205001', CAST(1.00 AS Decimal(18, 2)), N'SO1103005', N'SO1103005', N'RMB', CAST(100.00 AS Decimal(18, 2)), NULL, CAST(0x0000A05D0174FFE4 AS DateTime), N'admin', CAST(0x0000A05D0174FFE4 AS DateTime), N'admin')
INSERT [dbo].[tb_ARs] ([ISID], [ARNO], [Queue], [InvoiceNo], [SONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, N'AR1205002', CAST(1.00 AS Decimal(18, 2)), N'SO1103005', N'SO1103005', N'RMB', CAST(442206.91 AS Decimal(18, 2)), NULL, CAST(0x0000A05D01751D19 AS DateTime), N'admin', CAST(0x0000A05D01751D19 AS DateTime), N'admin')
INSERT [dbo].[tb_ARs] ([ISID], [ARNO], [Queue], [InvoiceNo], [SONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (3, N'AR1205003', CAST(1.00 AS Decimal(18, 2)), N'SO1103005', N'SO1103005', N'RMB', CAST(4999900.00 AS Decimal(18, 2)), NULL, CAST(0x0000A05D01755DBB AS DateTime), N'admin', CAST(0x0000A05D01755DBB AS DateTime), N'admin')
INSERT [dbo].[tb_ARs] ([ISID], [ARNO], [Queue], [InvoiceNo], [SONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (4, N'AR1205004', CAST(1.20 AS Decimal(18, 2)), N'SO1105001', N'SO1105001', N'RMB', CAST(47368.59 AS Decimal(18, 2)), NULL, CAST(0x0000A05D017590E4 AS DateTime), N'admin', CAST(0x0000A05D017590E4 AS DateTime), N'admin')
INSERT [dbo].[tb_ARs] ([ISID], [ARNO], [Queue], [InvoiceNo], [SONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (5, N'AR1205004', CAST(1.00 AS Decimal(18, 2)), N'SO1103006', N'SO1103006', N'HKD', CAST(1692.99 AS Decimal(18, 2)), NULL, CAST(0x0000A05D017590E4 AS DateTime), N'admin', CAST(0x0000A05D017590E4 AS DateTime), N'admin')
INSERT [dbo].[tb_ARs] ([ISID], [ARNO], [Queue], [InvoiceNo], [SONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (7, N'AR1402001', CAST(1.00 AS Decimal(18, 2)), N'SO1103006', N'SO1103006', N'HKD', CAST(3385.98 AS Decimal(18, 2)), NULL, CAST(0x0000A2DB015AD550 AS DateTime), N'admin', CAST(0x0000A2DB015AD550 AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_ARs] OFF
/****** Object:  Table [dbo].[tb_AR]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_AR](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[ARNO] [varchar](20) NOT NULL,
	[ReceivedDate] [datetime] NULL,
	[CustomerCode] [varchar](20) NULL,
	[ChequeNo] [varchar](20) NULL,
	[ChequeBank] [varchar](20) NULL,
	[Currency] [varchar](20) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
	[FlagApp] [char](1) NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
 CONSTRAINT [PK_tb_AR] PRIMARY KEY CLUSTERED 
(
	[ARNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收票日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AR', @level2type=N'COLUMN',@level2name=N'ReceivedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支票號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AR', @level2type=N'COLUMN',@level2name=N'ChequeNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支票銀行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AR', @level2type=N'COLUMN',@level2name=N'ChequeBank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支票貨幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AR', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支票金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AR', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_AR', @level2type=N'COLUMN',@level2name=N'Remark'
GO
SET IDENTITY_INSERT [dbo].[tb_AR] ON
INSERT [dbo].[tb_AR] ([ISID], [ARNO], [ReceivedDate], [CustomerCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (2, N'AR1205001', CAST(0x0000A05D00000000 AS DateTime), N'CUSTOMER', N'123123123', N'BOC', N'RMB', CAST(100.00 AS Decimal(18, 2)), N'123123', CAST(0x0000A05D012DAEE2 AS DateTime), N'admin', CAST(0x0000A05D0174FFE4 AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D01753B5D AS DateTime))
INSERT [dbo].[tb_AR] ([ISID], [ARNO], [ReceivedDate], [CustomerCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (3, N'AR1205002', CAST(0x0000A05D00000000 AS DateTime), N'CUSTOMER', N'234', N'ICBC', N'RMB', CAST(442206.91 AS Decimal(18, 2)), N'23234234', CAST(0x0000A05D01750720 AS DateTime), N'admin', CAST(0x0000A05D01751D19 AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D01754168 AS DateTime))
INSERT [dbo].[tb_AR] ([ISID], [ARNO], [ReceivedDate], [CustomerCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (4, N'AR1205003', CAST(0x0000A05D00000000 AS DateTime), N'CUSTOMER', N'234', N'BOC', N'RMB', CAST(4999900.00 AS Decimal(18, 2)), N'234234', CAST(0x0000A05D017546D8 AS DateTime), N'admin', CAST(0x0000A05D01755DBB AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D01756123 AS DateTime))
INSERT [dbo].[tb_AR] ([ISID], [ARNO], [ReceivedDate], [CustomerCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (5, N'AR1205004', CAST(0x0000A05D00000000 AS DateTime), N'CUSTOMER', N'234', N'ICBC', N'RMB', CAST(49061.58 AS Decimal(18, 2)), N'234', CAST(0x0000A05D01756322 AS DateTime), N'admin', CAST(0x0000A05D017590E4 AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D017594B3 AS DateTime))
INSERT [dbo].[tb_AR] ([ISID], [ARNO], [ReceivedDate], [CustomerCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (6, N'AR1205005', CAST(0x0000A05D00000000 AS DateTime), N'CUSTOMER', N'234234', N'ICBC', N'RMB', CAST(0.00 AS Decimal(18, 2)), N'324234', CAST(0x0000A05D017596AE AS DateTime), N'admin', CAST(0x0000A05D01787699 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_AR] ([ISID], [ARNO], [ReceivedDate], [CustomerCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (7, N'AR1402001', CAST(0x0000A2DB00000000 AS DateTime), N'CUSTOMER', NULL, N'222', N'RMB', CAST(3385.98 AS Decimal(18, 2)), NULL, CAST(0x0000A2DC015A5ECF AS DateTime), N'admin', CAST(0x0000A2DB015AD550 AS DateTime), N'admin', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_AR] OFF
/****** Object:  Table [dbo].[tb_APs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_APs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[APNO] [varchar](20) NULL,
	[Queue] [decimal](18, 2) NULL,
	[InvoiceNo] [varchar](20) NULL,
	[PONO] [varchar](20) NULL,
	[Currency] [varchar](20) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_tb_APDtl] PRIMARY KEY CLUSTERED 
(
	[ISID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_APs] ON
INSERT [dbo].[tb_APs] ([ISID], [APNO], [Queue], [InvoiceNo], [PONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (1, N'AP1205002', CAST(1.00 AS Decimal(18, 2)), N'PO1203001', NULL, N'RMB', CAST(2000.00 AS Decimal(18, 2)), NULL, CAST(0x0000A05D0178C1FB AS DateTime), N'admin', CAST(0x0000A05D0178C1FB AS DateTime), N'admin')
INSERT [dbo].[tb_APs] ([ISID], [APNO], [Queue], [InvoiceNo], [PONO], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy]) VALUES (2, N'AP1205003', CAST(1.00 AS Decimal(18, 2)), N'PO1203005', NULL, N'USD', CAST(3200.00 AS Decimal(18, 2)), NULL, CAST(0x0000A05D0178D7AE AS DateTime), N'admin', CAST(0x0000A05D0178D7AE AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tb_APs] OFF
/****** Object:  Table [dbo].[tb_AP]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_AP](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[APNO] [varchar](20) NOT NULL,
	[ReceivedDate] [datetime] NULL,
	[SupplierCode] [varchar](20) NULL,
	[ChequeNo] [varchar](20) NULL,
	[ChequeBank] [varchar](20) NULL,
	[Currency] [varchar](20) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdatedBy] [varchar](20) NULL,
	[FlagApp] [char](1) NULL,
	[AppUser] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
 CONSTRAINT [PK_tb_AP] PRIMARY KEY CLUSTERED 
(
	[APNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_AP] ON
INSERT [dbo].[tb_AP] ([ISID], [APNO], [ReceivedDate], [SupplierCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (1, N'AP1205001', CAST(0x0000A05D00000000 AS DateTime), N'SUPPLIER', N'dfgdfgsdfg', N'BOC', N'RMB', CAST(0.00 AS Decimal(18, 2)), N'dfghxdfg', CAST(0x0000A05D013C1402 AS DateTime), N'admin', CAST(0x0000A05D013C1C94 AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[tb_AP] ([ISID], [APNO], [ReceivedDate], [SupplierCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (2, N'AP1205002', CAST(0x0000A05D00000000 AS DateTime), N'FFT', N'12341234', N'BOC', N'RMB', CAST(2000.00 AS Decimal(18, 2)), N'Q1234', CAST(0x0000A05D0178AB7A AS DateTime), N'admin', CAST(0x0000A05D0178C1FB AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D0178C6ED AS DateTime))
INSERT [dbo].[tb_AP] ([ISID], [APNO], [ReceivedDate], [SupplierCode], [ChequeNo], [ChequeBank], [Currency], [Amount], [Remark], [CreationDate], [CreatedBy], [LastUpdateDate], [LastUpdatedBy], [FlagApp], [AppUser], [AppDate]) VALUES (3, N'AP1205003', CAST(0x0000A05D00000000 AS DateTime), N'FFT', N'234234', N'BOC', N'RMB', CAST(3200.00 AS Decimal(18, 2)), N'234', CAST(0x0000A05D0178C8F1 AS DateTime), N'admin', CAST(0x0000A05D0178D7AE AS DateTime), N'admin', N'Y', N'admin', CAST(0x0000A05D0178DC0A AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_AP] OFF
/****** Object:  Table [dbo].[tb_AccountIDs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_AccountIDs](
	[ISID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [varchar](20) NOT NULL,
	[AccName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_AccountIDs] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_AccountIDs] ON
INSERT [dbo].[tb_AccountIDs] ([ISID], [AccID], [AccName]) VALUES (1, N'M01', N'管理费')
INSERT [dbo].[tb_AccountIDs] ([ISID], [AccID], [AccName]) VALUES (2, N'M02', N'其它杂项')
INSERT [dbo].[tb_AccountIDs] ([ISID], [AccID], [AccName]) VALUES (3, N'M03', N'餐费')
INSERT [dbo].[tb_AccountIDs] ([ISID], [AccID], [AccName]) VALUES (4, N'M04', N'住宿')
INSERT [dbo].[tb_AccountIDs] ([ISID], [AccID], [AccName]) VALUES (5, N'M05', N'交通费用')
SET IDENTITY_INSERT [dbo].[tb_AccountIDs] OFF
/****** Object:  Table [dbo].[sys_Modules]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_Modules](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[ModuleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_sys_Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模塊編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Modules', @level2type=N'COLUMN',@level2name=N'ModuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模塊名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Modules', @level2type=N'COLUMN',@level2name=N'ModuleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统模块列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Modules'
GO
SET IDENTITY_INSERT [dbo].[sys_Modules] ON
INSERT [dbo].[sys_Modules] ([isid], [ModuleID], [ModuleName]) VALUES (1, 1, N'数据字典')
INSERT [dbo].[sys_Modules] ([isid], [ModuleID], [ModuleName]) VALUES (2, 2, N'采购模块')
INSERT [dbo].[sys_Modules] ([isid], [ModuleID], [ModuleName]) VALUES (3, 3, N'销售模块')
INSERT [dbo].[sys_Modules] ([isid], [ModuleID], [ModuleName]) VALUES (4, 4, N'库存模块')
INSERT [dbo].[sys_Modules] ([isid], [ModuleID], [ModuleName]) VALUES (5, 5, N'生产管理')
INSERT [dbo].[sys_Modules] ([isid], [ModuleID], [ModuleName]) VALUES (6, 6, N'财务管理')
INSERT [dbo].[sys_Modules] ([isid], [ModuleID], [ModuleName]) VALUES (7, 7, N'系统管理')
SET IDENTITY_INSERT [dbo].[sys_Modules] OFF
/****** Object:  Table [dbo].[sys_FieldNameDefs]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_FieldNameDefs](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
	[FieldName] [varchar](50) NULL,
	[DisplayName] [nvarchar](50) NULL,
	[Remark] [nvarchar](100) NULL,
	[FlagDisplay] [char](1) NULL,
 CONSTRAINT [PK_sys_Fields] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_FieldNameDefs', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_FieldNameDefs', @level2type=N'COLUMN',@level2name=N'FieldName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中文名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_FieldNameDefs', @level2type=N'COLUMN',@level2name=N'DisplayName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_FieldNameDefs', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表格顯示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_FieldNameDefs', @level2type=N'COLUMN',@level2name=N'FlagDisplay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段说明表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_FieldNameDefs'
GO
SET IDENTITY_INSERT [dbo].[sys_FieldNameDefs] ON
INSERT [dbo].[sys_FieldNameDefs] ([isid], [TableName], [FieldName], [DisplayName], [Remark], [FlagDisplay]) VALUES (147, N'tb_Product', N'ProductCode', N'ProductCode', NULL, N'Y')
INSERT [dbo].[sys_FieldNameDefs] ([isid], [TableName], [FieldName], [DisplayName], [Remark], [FlagDisplay]) VALUES (148, N'tb_Product', N'ProductName', N'ProductName', NULL, N'Y')
INSERT [dbo].[sys_FieldNameDefs] ([isid], [TableName], [FieldName], [DisplayName], [Remark], [FlagDisplay]) VALUES (149, N'tb_Product', N'SellPrice', N'SellPrice', NULL, N'Y')
INSERT [dbo].[sys_FieldNameDefs] ([isid], [TableName], [FieldName], [DisplayName], [Remark], [FlagDisplay]) VALUES (150, N'tb_Product', N'Supplier', N'Supplier', NULL, N'Y')
INSERT [dbo].[sys_FieldNameDefs] ([isid], [TableName], [FieldName], [DisplayName], [Remark], [FlagDisplay]) VALUES (151, N'tb_Product', N'Remark', N'Remark', NULL, N'Y')
SET IDENTITY_INSERT [dbo].[sys_FieldNameDefs] OFF
/****** Object:  Table [dbo].[sys_DocSN]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_DocSN](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[DocName] [varchar](10) NULL,
	[Header] [varchar](2) NULL,
	[YYMM] [char](4) NULL,
	[MaxID] [int] NULL,
	[Remark] [nvarchar](100) NULL,
 CONSTRAINT [PK_TDocSN] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單據名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_DocSN', @level2type=N'COLUMN',@level2name=N'DocName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字頭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_DocSN', @level2type=N'COLUMN',@level2name=N'Header'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年年月月' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_DocSN', @level2type=N'COLUMN',@level2name=N'YYMM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_DocSN', @level2type=N'COLUMN',@level2name=N'MaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_DocSN', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务单据流水号码表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_DocSN'
GO
SET IDENTITY_INSERT [dbo].[sys_DocSN] ON
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (1, N'SO', N'SO', N'1011', 34, N'銷售訂單')
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (2, N'SO', N'SO', N'1011', 34, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (3, N'SO', N'SO', N'1101', 1, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (7, N'SO', N'SO', N'1103', 6, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (8, N'PO', N'PO', N'1103', 1, N'采购订单')
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (9, N'SO', N'SO', N'1104', 2, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (10, N'SO', N'SO', N'1105', 2, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (11, N'SO', N'SO', N'1111', 2, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (12, N'SO', N'SO', N'1202', 1, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (13, N'SO', N'SO', N'1203', 9, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (15, N'PO', N'PO', N'1203', 6, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (16, N'IA', N'IA', N'1204', 8, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (18, N'IN', N'IN', N'1204', 6, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (19, N'IN', N'IN', N'1204', 6, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (20, N'IO', N'IO', N'1204', 5, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (21, N'IC', N'IC', N'1204', 4, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (24, N'IO', N'IO', N'1205', 4, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (25, N'AR', N'AR', N'1205', 5, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (26, N'AP', N'AP', N'1205', 3, NULL)
INSERT [dbo].[sys_DocSN] ([isid], [DocName], [Header], [YYMM], [MaxID], [Remark]) VALUES (27, N'AR', N'AR', N'1402', 1, NULL)
SET IDENTITY_INSERT [dbo].[sys_DocSN] OFF
/****** Object:  Table [dbo].[sys_DataSN]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_DataSN](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[DataCode] [varchar](10) NULL,
	[Header] [varchar](10) NULL,
	[Length] [int] NULL,
	[MaxID] [int] NULL,
 CONSTRAINT [PK_sys_DataSN] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[sys_DataSN] ON
INSERT [dbo].[sys_DataSN] ([isid], [DataCode], [Header], [Length], [MaxID]) VALUES (1, N'2', N'2', 4, 2)
INSERT [dbo].[sys_DataSN] ([isid], [DataCode], [Header], [Length], [MaxID]) VALUES (2, N'33', N'33', 4, 1)
INSERT [dbo].[sys_DataSN] ([isid], [DataCode], [Header], [Length], [MaxID]) VALUES (3, N'5', N'5', 4, 1)
INSERT [dbo].[sys_DataSN] ([isid], [DataCode], [Header], [Length], [MaxID]) VALUES (5, N'6', N'6', 4, 1)
SET IDENTITY_INSERT [dbo].[sys_DataSN] OFF
/****** Object:  Table [dbo].[sys_BusinessTables]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_BusinessTables](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NULL,
	[SortID] [int] NULL,
	[FormName] [varchar](50) NULL,
	[FormNameSpace] [varchar](100) NULL,
	[FormCaption] [nvarchar](50) NULL,
	[KeyFieldName] [varchar](50) NULL,
	[Table1] [varchar](50) NULL,
	[Table1Name] [nvarchar](50) NULL,
	[Table2] [varchar](50) NULL,
	[Table2Name] [nvarchar](50) NULL,
	[Table3] [varchar](50) NULL,
	[Table3Name] [nvarchar](50) NULL,
	[Table4] [varchar](50) NULL,
	[Table4Name] [nvarchar](50) NULL,
	[Table5] [varchar](50) NULL,
	[Table5Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_BussessTables] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'ModuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗體名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'FormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名字空間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'FormNameSpace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗體標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'FormCaption'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主鍵名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'KeyFieldName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table1Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第1個明細表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第1個明細表名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table2Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第2個明細表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第2個明細表名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table3Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第3個明細表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第3個明細表名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table4Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第4個明細表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第4個明細表名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables', @level2type=N'COLUMN',@level2name=N'Table5Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务单据列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_BusinessTables'
GO
SET IDENTITY_INSERT [dbo].[sys_BusinessTables] ON
INSERT [dbo].[sys_BusinessTables] ([isid], [ModuleID], [SortID], [FormName], [FormNameSpace], [FormCaption], [KeyFieldName], [Table1], [Table1Name], [Table2], [Table2Name], [Table3], [Table3Name], [Table4], [Table4Name], [Table5], [Table5Name]) VALUES (1, 3, 1, N'frmSO', N'CSFramework3.SalesModule.frmSO', N'销售订单管理', N'SONO', N'tb_SO', N'销售订单主表', N'tb_SOs', N'销售订单明细表', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_BusinessTables] ([isid], [ModuleID], [SortID], [FormName], [FormNameSpace], [FormCaption], [KeyFieldName], [Table1], [Table1Name], [Table2], [Table2Name], [Table3], [Table3Name], [Table4], [Table4Name], [Table5], [Table5Name]) VALUES (2, 1, 1, N'frmProduct', N'CSFramework3.DataDictionary.frmProduct', N'物料管理', N'ProductCode', N'tb_Product', N'物料主表', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_BusinessTables] ([isid], [ModuleID], [SortID], [FormName], [FormNameSpace], [FormCaption], [KeyFieldName], [Table1], [Table1Name], [Table2], [Table2Name], [Table3], [Table3Name], [Table4], [Table4Name], [Table5], [Table5Name]) VALUES (8, 2, 1, N'frmCustomer', N'CSFramework3.DataDictionary.frmCustomer', N'客户管理', N'CustomerCode', N'tb_Customer', N'客户资料', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[sys_BusinessTables] OFF
/****** Object:  StoredProcedure [dbo].[sp_sys_GetTableFieldType]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_sys_GetTableFieldType]
  @TableName varchar(50)
as
begin

/*

select * from tb_Fields
select * from tb_Configs

*/

SELECT a.name as FieldName,b.name as TypeName,
     case when b.name='nvarchar' then a.Length/2 else a.Length end as Length
  FROM syscolumns a join systypes b 
  on a.xusertype = b.xusertype AND a.id = object_id(@TableName)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchLog]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SearchLog]
  @LogUser VARCHAR(20),
  @TableName VARCHAR(20), --不能为空!
  @LogDateFrom VARCHAR(8),--YYYYMMDD
  @LogDateTo VARCHAR(8)--YYYYMMDD
AS
BEGIN
/*
------------------------------
查询修改日志记录 CREATED:JONNY
------------------------------
SELECT * FROM dbo.tb_Log order by tablename
SELECT * FROM dbo.tb_LogDtl
SELECT * FROM dbo.sys_BusinessTables

sp_SearchLog '','tb_SalesOrder','',''
sp_SearchLog 'x','tb_SalesOrder','20100101','20100101'

*/

  DECLARE @SQL VARCHAR(2000),@WHERE VARCHAR(500) 
  SET @WHERE=' a.TableName ='''+@TableName+''''
  IF (@LogUser<>'') SET @WHERE=@WHERE+' AND LogUser='''+@LogUser+''''
  IF (@LogDateFrom<>'') SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,LogDate,112)>='''+@LogDateFrom+''''
  IF (@LogDateTo<>'') SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,LogDate,112)<='''+@LogDateTo+''''
  PRINT @WHERE

  PRINT '返回主表数据'
  SET @SQL='SELECT a.GUID32,u.UserName AS LogUser,a.LogDate,o.TypeName AS OPType,b.DisplayName AS TableName,
            dbo.fn_GetFieldDisplayName(a.TableName,a.KeyFieldName) AS KeyFieldName,a.DocNo,
            dbo.fn_GetEditContent(a.GUID32) as EditContent FROM tb_Log a
            LEFT JOIN tb_MyUser u ON a.LogUser=u.Account
            LEFT JOIN vw_LogOPType o ON a.OPType=o.TypeID
            LEFT JOIN vw_AllTables b ON a.TableName=b.TableName
            WHERE a.IsMaster=''Y'' AND '+@WHERE +' ORDER BY a.TableName '

  PRINT @SQL
  EXEC(@SQL)

  PRINT '返回日志数据'
  SET @SQL='SELECT a.GUID32,a.OldValue,a.NewValue,dbo.fn_GetFieldDisplayName(a.TableName,a.FieldName) AS FieldTitle,
            b.DisplayName as TableName
            FROM tb_LogDtl a
            LEFT JOIN vw_AllTables b ON a.TableName=b.TableName
            WHERE a.GUID32 IN (SELECT GUID32 FROM tb_Log a WHERE '+@WHERE+') '
  PRINT @SQL
  EXEC(@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RptSO]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RptSO]
  @DocNoFrom VARCHAR(20), 
  @DocNoTo VARCHAR(20),
  @DateFrom VARCHAR(8), --YYYYMMDD
  @DateTo VARCHAR(8)--YYYYMMDD
AS
BEGIN
/*
销售订单报表 BY JONNY SUN :2010-11-09
---------------------------------------
SELECT * FROM dbo.tb_SalesOrder
SELECT * FROM dbo.tb_SalesOrderDtl 
SELECT * FROM tb_Stock
SELECT * FROM tb_Customer

sp_RptSO '','','',''
sp_RptSO '','','20100101','20101230'
*/
	DECLARE @SQL VARCHAR(2000),@WHERE VARCHAR(1000)
	SET @WHERE=''
    IF (@DocNoFrom<>'') SET @WHERE=@WHERE+' AND SONO>='''+@DocNoFrom+''''
    IF (@DocNoTo<>'')   SET @WHERE=@WHERE+' AND SONO<='''+@DocNoTo+''''
    IF (@DateFrom<>'')  SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,ReceiveDay,112)>='''+@DateFrom+''''
    IF (@DateTo<>'')    SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,ReceiveDay,112)<='''+@DateTo+''''
    
    PRINT '查询主表数据'
	SET @SQL='SELECT a.*,b.NativeName FROM tb_SO a 
              LEFT JOIN tb_Customer b ON a.CustomerCode=b.CustomerCode
              WHERE 1=1 '+@WHERE +' ORDER BY ReceiveDay '
	PRINT @SQL
	EXEC (@SQL)

    PRINT '查询明细表数据'
	SET @SQL='SELECT a.SONO,a.StockCode,a.Price,a.Qty,a.Amount,a.Remark,b.ProductName,b.Supplier
              FROM tb_SOs a LEFT JOIN tb_Product b ON a.StockCode=b.ProductCode              
              WHERE SONO IN (SELECT SONO FROM tb_SO WHERE 1=1 '+@WHERE + ')'
	PRINT @SQL
	EXEC (@SQL)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RptAR_Checklist]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RptAR_Checklist]
  @DocNoFrom VARCHAR(20), 
  @DocNoTo VARCHAR(20),
  @DateFrom VARCHAR(8), --YYYYMMDD
  @DateTo VARCHAR(8)--YYYYMMDD
AS
BEGIN

/************************************************************************
收款报表清单 BY JONNY SUN :2012-5-7
---------------------------------------
SELECT * FROM dbo.tb_AR
SELECT * FROM dbo.tb_ARs

sp_RptAR_Checklist '','','',''
sp_RptAR_Checklist 'AR1204005','AR1204005','20100101','20121230'

*************************************************************************/


	DECLARE @SQL VARCHAR(2000),@WHERE VARCHAR(1000)
	SET @WHERE=''
    IF (@DocNoFrom<>'') SET @WHERE=@WHERE+' AND a.ARNO>='''+@DocNoFrom+''''
    IF (@DocNoTo<>'')   SET @WHERE=@WHERE+' AND a.ARNO<='''+@DocNoTo+''''
    IF (@DateFrom<>'')  SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,a.ReceivedDate,112)>='''+@DateFrom+''''
    IF (@DateTo<>'')    SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,a.ReceivedDate,112)<='''+@DateTo+''''
    
    PRINT '查询数据'
	SET @SQL='SELECT a.ARNO,a.ReceivedDate,a.CustomerCode,c.NativeName AS CustomerName,a.ChequeNo,a.ChequeBank,
				b.InvoiceNo,b.Amount,b.Remark,
				CASE WHEN d.AccName IS NULL THEN ''业务单据'' ELSE d.AccName END AS ItemName 
				FROM tb_AR a 
				LEFT JOIN tb_ARs b ON a.ARNO=b.ARNO
				LEFT JOIN tb_Customer c ON a.CustomerCode=c.CustomerCode
				LEFT JOIN tb_AccountIDs d on b.InvoiceNo=d.AccID   
				WHERE b.Amount>0 '+@WHERE +' ORDER BY a.CustomerCode,a.ReceivedDate DESC'
	PRINT @SQL
	EXEC (@SQL)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RptAR]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RptAR]
  @DocNoFrom VARCHAR(20), 
  @DocNoTo VARCHAR(20),
  @DateFrom VARCHAR(8), --YYYYMMDD
  @DateTo VARCHAR(8)--YYYYMMDD
AS
BEGIN
/*
收款单报表 BY JONNY SUN :2012-5-7
---------------------------------------
SELECT * FROM dbo.tb_AR
SELECT * FROM dbo.tb_ARs

sp_RptAR '','','',''
sp_RptAR '','','20100101','20101230'

*/
	DECLARE @SQL VARCHAR(2000),@WHERE VARCHAR(1000)
	SET @WHERE=''
    IF (@DocNoFrom<>'') SET @WHERE=@WHERE+' AND ARNO>='''+@DocNoFrom+''''
    IF (@DocNoTo<>'')   SET @WHERE=@WHERE+' AND ARNO<='''+@DocNoTo+''''
    IF (@DateFrom<>'')  SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,ReceivedDate,112)>='''+@DateFrom+''''
    IF (@DateTo<>'')    SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,ReceivedDate,112)<='''+@DateTo+''''
    
    PRINT '查询主表数据'
	SET @SQL='SELECT a.*,b.NativeName FROM tb_AR a 
              LEFT JOIN tb_Customer b ON a.CustomerCode=b.CustomerCode
              WHERE 1=1 '+@WHERE +' ORDER BY ReceivedDate '
	PRINT @SQL
	EXEC (@SQL)

    PRINT '查询明细表数据'
	SET @SQL='SELECT a.*,CASE WHEN b.AccName IS NULL THEN ''业务单据'' ELSE b.AccName END AS ItemName FROM tb_ARs a LEFT JOIN tb_AccountIDs b on a.InvoiceNo=b.AccID              
              WHERE ARNO IN (SELECT ARNO FROM tb_AR WHERE 1=1 '+@WHERE + ')'
	PRINT @SQL
	EXEC (@SQL)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RptAP]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RptAP]
  @DocNoFrom VARCHAR(20), 
  @DocNoTo VARCHAR(20),
  @DateFrom VARCHAR(8), --YYYYMMDD
  @DateTo VARCHAR(8)--YYYYMMDD
AS
BEGIN
/*
收款单报表 BY JONNY SUN :2012-5-7
---------------------------------------
SELECT * FROM dbo.tb_AP
SELECT * FROM dbo.tb_APs

sp_RptAP '','','',''
sp_RptAP '','','20100101','20121230'

*/
	DECLARE @SQL VARCHAR(2000),@WHERE VARCHAR(1000)
	SET @WHERE=''
    IF (@DocNoFrom<>'') SET @WHERE=@WHERE+' AND APNO>='''+@DocNoFrom+''''
    IF (@DocNoTo<>'')   SET @WHERE=@WHERE+' AND APNO<='''+@DocNoTo+''''
    IF (@DateFrom<>'')  SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,ReceivedDate,112)>='''+@DateFrom+''''
    IF (@DateTo<>'')    SET @WHERE=@WHERE+' AND CONVERT(VARCHAR,ReceivedDate,112)<='''+@DateTo+''''
    
    PRINT '查询主表数据'
	SET @SQL='SELECT a.*,b.NativeName FROM tb_AP a 
              LEFT JOIN tb_Customer b ON a.SupplierCode=b.CustomerCode
              WHERE 1=1 '+@WHERE +' ORDER BY ReceivedDate '
	PRINT @SQL
	EXEC (@SQL)

    PRINT '查询明细表数据'
	SET @SQL='SELECT a.*,CASE WHEN b.AccName IS NULL THEN ''业务单据'' ELSE b.AccName END AS ItemName FROM tb_APs a LEFT JOIN tb_AccountIDs b on a.InvoiceNo=b.AccID              
              WHERE APNO IN (SELECT APNO FROM tb_AP WHERE 1=1 '+@WHERE + ')'
	PRINT @SQL
	EXEC (@SQL)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_sys_GetTableFieldNames]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sys_GetTableFieldNames]
  @TableName VARCHAR(100)
AS
BEGIN
/*
获取表的字段备注信息 by jonny

sp_sys_GetTableFieldNames 'tb_SO'
sp_sys_GetTableFieldNames 'tb_SOs'
*/
	SELECT  
	TableName=d.name,
	FieldOrder=a.colorder,
	FieldName=a.name,
	FieldCaption=case when isnull(g.[value], '')='' then a.name else CAST(g.[value] AS NVARCHAR(250)) end 
	FROM   syscolumns   a
	inner  join   sysobjects   d   on   a.id=d.id     and   d.xtype= 'U '   and     d.name <> 'dtproperties '	
	left   join   sysproperties   g   on   a.id=g.id   and   a.colid=g.smallid    
	where   d.name= @TableName         --如果只查询指定表,加上此条件
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sys_GetTableFieldDef]    Script Date: 03/24/2015 23:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sys_GetTableFieldDef]
  @TableName VARCHAR(100)
AS
BEGIN
/*
获取表的结构 by jonny

sp_GetTableFieldDef 'tb_SalesOrder'
sp_GetTableFieldDef 'tb_SalesOrderDtl'
*/
	SELECT  
	TableName=d.name,--case   when   a.colorder=1   then   d.name   else   ' '   end,
	TableDesc=case   when   a.colorder=1   then   isnull(f.value, ' ')   else   ' '   end,
	FieldOrder=a.colorder,
	FieldName=a.name,
	IsIdentity=case   when   COLUMNPROPERTY(   a.id,a.name, 'IsIdentity')=1   then   'Y'else  'N'   end,
	PK=case   when   exists(SELECT   1   FROM   sysobjects   where   xtype= 'PK '   and   parent_obj=a.id   and   name   in   (
	SELECT   name   FROM   sysindexes   WHERE   indid   in(
	SELECT   indid   FROM   sysindexkeys   WHERE   id   =   a.id   AND   colid=a.colid
	)))   then   'Y'   else   'N'   end,
	FieldType=b.name,
	FieldLength=a.length,
	Prec=COLUMNPROPERTY(a.id,a.name, 'PRECISION '),
	Scale=isnull(COLUMNPROPERTY(a.id,a.name, 'Scale '),0),
	AllowNull=case   when   a.isnullable=1   then   'Y' else   'N'   end,
	DefaultValue=isnull(e.text, ' '),
	FieldCaption=case when isnull(g.[value], '')='' then a.name else g.[value] end
	FROM   syscolumns   a
	left   join   systypes   b   on   a.xusertype=b.xusertype
	inner   join   sysobjects   d   on   a.id=d.id     and   d.xtype= 'U '   and     d.name <> 'dtproperties '
	left   join   syscomments   e   on   a.cdefault=e.id
	left   join   sysproperties   g   on   a.id=g.id   and   a.colid=g.smallid    
	left   join   sysproperties   f   on   d.id=f.id   and   f.smallid=0
	where   d.name= @TableName         --如果只查询指定表,加上此条件

END
GO
/****** Object:  View [dbo].[vw_CommonDataDicts]    Script Date: 03/24/2015 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CommonDataDicts]
AS
SELECT 1 AS DataType,'国家名称定义' AS DataName UNION ALL
SELECT 2 AS DataType,'地区资料定义' UNION ALL
SELECT 3 AS DataType,'银行名称定义'
GO
/****** Object:  View [dbo].[vw_LogOPType]    Script Date: 03/24/2015 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LogOPType]
AS
/*
日志类型,对应LogOPType枚举类型
*/
	SELECT 0 AS TypeID,'' AS TypeName UNION
	SELECT 1 AS TypeID,'修改' AS TypeName UNION
	SELECT 2 AS TypeID,'删除' AS TypeName UNION
	SELECT 3 AS TypeID,'新增' AS TypeName
GO
/****** Object:  View [dbo].[vw_SOs]    Script Date: 03/24/2015 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_SOs]
AS
/*
SELECT * FROM tb_Product
SELECT * FROM [vw_SOs]
*/
SELECT A.*,B.ProductName AS StockName FROM tb_SOs A LEFT JOIN tb_Product B ON A.StockCode=B.ProductCode
GO
/****** Object:  View [dbo].[vw_POs]    Script Date: 03/24/2015 23:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_POs]
AS
/*
SELECT * FROM tb_Product
SELECT * FROM [vw_POs]
*/
SELECT A.*,B.ProductName AS ProductName FROM tb_POs A LEFT JOIN tb_Product B ON A.ProductCode=B.ProductCode
GO
/****** Object:  View [dbo].[vw_IOs]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_IOs]
AS
/*
SELECT * FROM tb_Product
SELECT * FROM [vw_IOs]
*/
SELECT A.*,B.ProductName FROM tb_IOs A LEFT JOIN tb_Product B ON A.ProductCode=B.ProductCode
GO
/****** Object:  View [dbo].[vw_INs]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_INs]
AS
/*
SELECT * FROM tb_Product
SELECT * FROM [vw_INs]
*/
SELECT A.*,B.ProductName FROM tb_INs A LEFT JOIN tb_Product B ON A.ProductCode=B.ProductCode
GO
/****** Object:  View [dbo].[vw_ICs]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[vw_ICs]
AS
/*
SELECT * FROM tb_Product
SELECT * FROM [vw_ICs]
*/
SELECT A.*,B.ProductName AS StockName FROM tb_ICs A LEFT JOIN tb_Product B ON A.ProductCode=B.ProductCode
GO
/****** Object:  View [dbo].[vw_IAs]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_IAs]
AS
/*
SELECT * FROM tb_Product
SELECT * FROM [vw_IAs]
*/
SELECT A.*,B.ProductName AS StockName FROM tb_IAs A LEFT JOIN tb_Product B ON A.ProductCode=B.ProductCode
GO
/****** Object:  View [dbo].[vw_ARs]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ARs]
AS
-- select * from vw_ARS
-- select * from dbo.tb_AccountIDs
   SELECT a.*,CASE WHEN b.AccName IS NULL THEN '业务单据' ELSE b.AccName END AS ItemName FROM tb_ARS a LEFT JOIN tb_AccountIDs b on a.InvoiceNo=b.AccID
GO
/****** Object:  View [dbo].[vw_APs]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_APs]
AS
-- select * from vw_APS
-- select * from dbo.tb_AccountIDs
   SELECT a.*,CASE WHEN b.AccName IS NULL THEN '业务单据' ELSE b.AccName END AS ItemName FROM tb_APS a LEFT JOIN tb_AccountIDs b on a.InvoiceNo=b.AccID
GO
/****** Object:  View [dbo].[vw_AllTables]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AllTables]
as
/*
SELECT * FROM sys_BusinessTables
SELECT * FROM vw_AllTables
*/
	SELECT DISTINCT * FROM 
	(
		SELECT Table1 AS TableName,Table1Name AS DisplayName FROM sys_BusinessTables
		UNION
		SELECT Table2,Table2Name FROM sys_BusinessTables
		UNION
		SELECT Table3,Table3Name FROM sys_BusinessTables
		UNION
		SELECT Table4,Table4Name FROM sys_BusinessTables
		UNION
		SELECT Table5,Table5Name FROM sys_BusinessTables
	) T WHERE ISNULL(TableName,'')<>''
GO
/****** Object:  StoredProcedure [dbo].[sp_sys_CreateFieldDefs]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sys_CreateFieldDefs]
  @TableName VARCHAR(20)  
AS
BEGIN
/*
自动创建字段说明,导入字段列表
--------------------------------------
dbo.sp_sys_GetTableFieldType  'tb_SalesOrder'
dbo.sp_sys_GetTableFieldDef  'tb_SalesOrder'
dbo.sp_sys_GetTableFieldNames 'tb_SO'

SELECT * FROM dbo.sys_FieldNameDefs
-------------test code---------------

sp_sys_CreateFieldDefs 'tb_SO'
sp_sys_CreateFieldDefs 'tb_SOs'

*/
	DECLARE @EffectCount INT
	CREATE TABLE #TMPDEF (TableName VARCHAR(50),FieldOrder INT,FieldName VARCHAR(50),FieldCaption NVARCHAR(250))

	PRINT '取当前表的字段说明'
	INSERT INTO #TMPDEF EXEC sp_sys_GetTableFieldNames @TableName

    PRINT '保存字段说明, 公共字段除外'
	INSERT INTO sys_FieldNameDefs(TableName,FieldName,DisplayName) 
	  SELECT TableName,FieldName,CAST(FieldCaption AS NVARCHAR) FROM #TMPDEF 
      WHERE FieldName NOT IN (SELECT FieldName FROM sys_FieldNameDefs WHERE ISNULL(TableName,'')='')
        AND FieldName NOT IN (SELECT FieldName FROM sys_FieldNameDefs WHERE ISNULL(TableName,'')=@TableName)

    --本次更新的记录数
    SELECT @EffectCount=@@ROWCOUNT

	DROP TABLE #TMPDEF
	SELECT @EffectCount AS EffectCount

END
GO
/****** Object:  StoredProcedure [dbo].[sp_QueryOutstandingAR]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QueryOutstandingAR]
  @InvoiceNo VARCHAR(20),    --发票编号,用于查询单张发票的Outstanding
  @CustomerCode  VARCHAR(20),--客户编号
  @FromDate VARCHAR(8),      --起始日期:YYYYMMDD
  @ToDate VARCHAR(8),        --结束日期1:YYYYMMDD
  @EndDate VARCHAR(8)       --结束日期2:YYYYMMDD  
AS
BEGIN

/*************************************************************************

-- 注意：多币种要通过Currency分组，如果是单一货币，下面可以不处理Currency字段。

--------------------------------------------------------------------------
SELECT * FROM tb_SO
SELECT * FROM dbo.tb_Customer
SELECT * FROM tb_AR
SELECT * FROM tb_ARs

** TEST SQL**

sp_QueryOutstandingAR '','','','',''
sp_QueryOutstandingAR '','CUSTOMER','','',''
sp_QueryOutstandingAR '','CUSTOMER','20110101','20111230',''
sp_QueryOutstandingAR '','CS01','20110101','','20111230'

**************************************************************************/
	DECLARE @SQL VARCHAR(2000)
	DECLARE @WHERE VARCHAR(500)
	SET @WHERE=''

	PRINT '组合查询条件'
	IF (ISNULL(@InvoiceNo,'')<>'')               SET @WHERE=@WHERE+' AND (SONO='''+@InvoiceNo+''') '
	IF (ISNULL(@CustomerCode,'')<>'')            SET @WHERE=@WHERE+' AND (CustomerCode='''+@CustomerCode+''') '
	IF (ISNULL(@FromDate,'00000000')>'19000101') SET @WHERE=@WHERE+' AND (CONVERT(VARCHAR,ReceiveDay,112)>='''+@FromDate+''') '--ReceiveDate是指销售日期
	IF (ISNULL(@ToDate,  '00000000')>'19000101') SET @WHERE=@WHERE+' AND (CONVERT(VARCHAR,ReceiveDay,112)<='''+@ToDate  +''') '
	IF (ISNULL(@EndDate, '00000000')>'19000101') SET @WHERE=@WHERE+' AND (CONVERT(VARCHAR,ReceiveDay,112)<='''+@EndDate +''') '

	--PRINT @WHERE

	-------------------------------------------------------------------------------------------------------
	PRINT '创建OUTSTANDING 结果表'
	CREATE TABLE #Result
	(	  
      DocNo VARCHAR(20),        --InvoiceNo或SONO
	  DocDate DATETIME,         --InvoiceDate      
	  RefNo VARCHAR(20),        --SONO     
      CustomerCode VARCHAR(20), --客户
      Currency VARCHAR(20),     --发票的货币
      Amount DECIMAL(18,2)      DEFAULT 0,  --发票金额      
	  PaidAmount DECIMAL(18,2)  DEFAULT 0,  --已付金额汇总=SUM(ARDtl.Amount)
      Balance DECIMAL(18,2)     DEFAULT 0   --结余 = 发票的金额汇总-已收款的金额汇总	  
	)
	-------------------------------------------------------------------------------------------------------

	PRINT '销售订单汇总'
	SET @SQL='INSERT INTO #Result(DocNo,DocDate,RefNo,CustomerCode,Currency,Amount)
			  SELECT SONO,ReceiveDay,SONO,CustomerCode,Currency,Amount
              FROM tb_SO WHERE FlagApp=''Y'' ' --查询审核的单据
    SET @SQL=@SQL+@WHERE
	PRINT @SQL

	EXEC(@SQL)

	--SELECT * FROM #Result
	--RETURN 
	-------------------------------------------------------------------------------------------------------
	PRINT '已收款汇总'
	CREATE TABLE #ARGroup
	(	  
      InvoiceNo VARCHAR(20),      
      Currency VARCHAR(20),
      Amount DECIMAL(18,2)      
	)

    SET @SQL='INSERT INTO #ARGroup(InvoiceNo,Currency,Amount)
		SELECT b.InvoiceNo,b.Currency,SUM(b.Amount)Amount FROM tb_AR a
		LEFT JOIN tb_ARs b ON a.ARNO=b.ARNO
		WHERE FlagApp=''Y'' AND b.InvoiceNo IN (SELECT InvoiceNo FROM #Result) 
		GROUP BY b.InvoiceNo,b.Currency ' -- 多币种
	
    PRINT @SQL
    EXEC(@SQL)

--SELECT * FROM #Result
	PRINT '更新已收金额'
	UPDATE #Result SET PaidAmount=ISNULL(b.Amount,0) FROM #Result a JOIN #ARGroup b
	ON a.DocNo=b.InvoiceNo AND a.Currency=b.Currency

	PRINT '计算余款'
	UPDATE #Result SET Balance=Amount-PaidAmount

	SELECT A.*,B.NativeName AS CustomerName FROM #Result A LEFT JOIN tb_Customer B 
    ON A.CustomerCode=B.CustomerCode WHERE Balance>0

	DROP TABLE #Result
	DROP TABLE #ARGroup

------------------------------------------------------------------------------------------------------
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QueryOutstandingAP]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QueryOutstandingAP]
  @InvoiceNo VARCHAR(20),    --发票编号,用于查询单张发票的Outstanding
  @SupplierCode  VARCHAR(20),--客户编号
  @FromDate VARCHAR(8),      --起始日期:YYYYMMDD
  @ToDate VARCHAR(8),        --结束日期1:YYYYMMDD
  @EndDate VARCHAR(8)       --结束日期2:YYYYMMDD  
AS
BEGIN

/*************************************************************************

-- 注意：多币种要通过Currency分组，如果是单一货币，下面可以不处理Currency字段。

--------------------------------------------------------------------------
SELECT * FROM tb_PO
SELECT * FROM dbo.tb_Customer WHERE AttributeCodes LIKE '%SPL%'
SELECT * FROM tb_AP
SELECT * FROM tb_APs

** TEST SQL**

sp_QueryOutstandingAP '','','','',''
sp_QueryOutstandingAP '','SUPPLIER','','',''
sp_QueryOutstandingAP '','SUPPLIER','20110101','20111230',''
sp_QueryOutstandingAP 'x','CS01','20110101','','20111230'

**************************************************************************/
	DECLARE @SQL VARCHAR(2000)
	DECLARE @WHERE VARCHAR(500)
	SET @WHERE=''

	PRINT '组合查询条件'
	IF (ISNULL(@InvoiceNo,'')<>'')               SET @WHERE=@WHERE+' AND (PONO='''+@InvoiceNo+''') '
	IF (ISNULL(@SupplierCode,'')<>'')            SET @WHERE=@WHERE+' AND (CustomerCode='''+@SupplierCode+''') '
	IF (ISNULL(@FromDate,'00000000')>'19000101') SET @WHERE=@WHERE+' AND (CONVERT(VARCHAR,PODate,112)>='''+@FromDate+''') '
	IF (ISNULL(@ToDate,  '00000000')>'19000101') SET @WHERE=@WHERE+' AND (CONVERT(VARCHAR,PODate,112)<='''+@ToDate  +''') '
	IF (ISNULL(@EndDate, '00000000')>'19000101') SET @WHERE=@WHERE+' AND (CONVERT(VARCHAR,PODate,112)<='''+@EndDate +''') '

	--PRINT @WHERE

	-------------------------------------------------------------------------------------------------------
	PRINT '创建OUTSTANDING 结果表'
	CREATE TABLE #Result
	(	  
      DocNo VARCHAR(20),        --InvoiceNo或PONO
	  DocDate DATETIME,         --InvoiceDate      
	  RefNo VARCHAR(20),        --PONO     
      SupplierCode VARCHAR(20), --客户
      Currency VARCHAR(20),     --发票的货币
      Amount DECIMAL(18,2)      DEFAULT 0,  --发票金额      
	  PaidAmount DECIMAL(18,2)  DEFAULT 0,  --已付金额汇总=SUM(APDtl.Amount)
      Balance DECIMAL(18,2)     DEFAULT 0   --结余 = 发票的金额汇总-已收款的金额汇总	  
	)
	-------------------------------------------------------------------------------------------------------

	PRINT '采购订单汇总'
	SET @SQL='INSERT INTO #Result(DocNo,DocDate,RefNo,SupplierCode,Currency,Amount)
			  SELECT PONO,PODate,PONO,CustomerCode,Currency,Amount
              FROM tb_PO WHERE FlagApp=''Y'' ' --查询审核的单据
    SET @SQL=@SQL+@WHERE
	PRINT @SQL

	EXEC(@SQL)

	--SELECT * FROM #Result
	--RETURN 
	-------------------------------------------------------------------------------------------------------
	PRINT '已付款汇总'
	CREATE TABLE #APGroup
	(	  
      InvoiceNo VARCHAR(20),      
      Currency VARCHAR(20),
      Amount DECIMAL(18,2)      
	)

    SET @SQL='INSERT INTO #APGroup(InvoiceNo,Currency,Amount)
		SELECT b.InvoiceNo,b.Currency,SUM(b.Amount)Amount FROM tb_AP a
		LEFT JOIN tb_APs b ON a.APNO=b.APNO
		WHERE FlagApp=''Y'' AND b.InvoiceNo IN (SELECT InvoiceNo FROM #Result) 
		GROUP BY b.InvoiceNo,b.Currency ' -- 多币种
	
    PRINT @SQL
    EXEC(@SQL)

--SELECT * FROM #Result
	PRINT '更新已收金额'
	UPDATE #Result SET PaidAmount=ISNULL(b.Amount,0) FROM #Result a JOIN #APGroup b
	ON a.DocNo=b.InvoiceNo AND a.Currency=b.Currency

	PRINT '计算余款'
	UPDATE #Result SET Balance=Amount-PaidAmount

	SELECT A.*,B.NativeName AS CustomerName FROM #Result A LEFT JOIN tb_Customer B 
    ON A.SupplierCode=B.CustomerCode WHERE Balance>0

	DROP TABLE #Result
	DROP TABLE #APGroup

------------------------------------------------------------------------------------------------------
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MyGetGroupData]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_MyGetGroupData]
  @GroupCode varchar(30)
as
begin
  /*******************************************************************************
    佽隴:郪眈壽訧蹋.  

    select * from dbo.tb_MyUserGroup
    select * from dbo.tb_UserAuthority where AccountOrGroupID=''Super Administrators'' and AuthorityType=''Group'' 
    [sp_MyGetGroupData] ''TestGroup''
  ********************************************************************************/  

  --tb_UserGroup 郪訧蹋
  select * from dbo.tb_MyUserGroup where GroupCode=@GroupCode

  --tb_UserGroupRe 郪腔蚚誧杅擂
  select a.*,b.UserName from dbo.tb_MyUserGroupRe a left join dbo.tb_MyUser b on a.Account=b.Account where GroupCode=@GroupCode

  --tb_UserAuthority 郪癹
  select * from dbo.tb_MyUserRole where GroupCode=@GroupCode

  --tb_User  郪褫恁蚚誧
  select Account,UserName from dbo.tb_MyUser where Account 
     not in (select Account from tb_MyUserGroupRe where GroupCode=@GroupCode)
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MyGetAuthorities]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_MyGetAuthorities]
  @UserOrGroup varchar(20),
  @Type int -- 1:User 2:Group
as
begin

/*

select * from dbo.tb_MyAuthorityItem
select * from dbo.tb_MyUser
select * from dbo.tb_MyUserGroup
select * from dbo.tb_MyUserRole
select * from dbo.tb_MyUserGroupRe

sp_MyGetAuthorities 'jonny',1
sp_MyGetAuthorities ''TestGroup'',2

*/
    create table #groups (GroupCode varchar(30) COLLATE Chinese_PRC_CI_AS)

    --1:User 2:Group
	if (@Type=1)
	  insert into #groups select distinct GroupCode from dbo.tb_MyUserGroupRe where Account=@UserOrGroup
	if (@Type=2)
	  insert into #groups select @UserOrGroup

    --脤梑癹
	select ModuleID,AuthorityID,Sum(AuthorityValue) as Authorities from
	(
		select distinct a.ModuleID,a.AuthorityID,b.AuthorityValue 
		  from dbo.tb_MyUserRole a join tb_MyAuthorityItem b 
		  on b.AuthorityValue & a.Authorities= b.AuthorityValue
		where a.GroupCode in (select distinct GroupCode from #groups)
	) temp 
	group by ModuleID,AuthorityID
	order by ModuleID,AuthorityID

    drop table #groups 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MyDeleteGroupData]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MyDeleteGroupData]
  @GroupCode varchar(30)
as
begin
	delete tb_MyUserGroup where GroupCode=@GroupCode
	delete tb_MyUserGroupRe where GroupCode=@GroupCode
	delete tb_MyUserRole where GroupCode=@GroupCode
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Logout]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Logout]
  @Account VARCHAR(20)
AS
BEGIN
/*
SELECT * FROM TLoginLog
SELECT * FROM tb_MyUser

sp_Logout 'admin'

*/

  INSERT INTO tb_LoginLog(Account,LoginType,CurrentTime) VALUES (@Account,'O',GetDate())

  UPDATE tb_MyUser SET FlagOnline='N',LastLogoutTime=GetDate() WHERE Account=@Account

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Login]
  @Account VARCHAR(20), /*三种帐户类型,对应@LoginUserType参数*/
  @Password VARCHAR(50),
  @DataSetID VARCHAR(20),
  @LoginUserType CHAR(1) /*(S/W/N) S:System Default; W:Windows Domain; N:Novell Account */
AS
BEGIN
  /*************************************************************************
    SELECT * FROM [tb_MyUser]
    SELECT * FROM dbo.tb_LoginLog
 
    sp_Login 'admin','0226273B7D3A3B8AE60499CA8DB82408','A','S'

	UPDATE [tb_MyUser] SET ISLOCKED=1 WHERE ISID=6
    PRINT CHARINDEX('B','BAB')
  *************************************************************************/
  DECLARE @TEMP_USER VARCHAR(50),@TEMP_PWD VARCHAR(50)
  SET @TEMP_USER=''

  IF (LTRIM(RTRIM(@Account))='') 
  BEGIN
	  SELECT TOP 0 * FROM [tb_MyUser] --用户不存在
      SELECT '帐户不能为空！' AS ReturnMessage --出错信息
      RETURN --退出
  END

  IF CHARINDEX(','+@LoginUserType+',',',S,W,N,')=0
  BEGIN
	  SELECT TOP 0 * FROM [tb_MyUser] --用户不存在
      SELECT '无法识别的登录类型！' AS ReturnMessage --出错信息
      RETURN --退出
  END

  IF (@LoginUserType='S') --System User 
  BEGIN
    SET @TEMP_USER=@Account
    SET @TEMP_PWD=@Password
  END

  IF (@LoginUserType='W') --Windows Domain User 
  BEGIN
	SELECT TOP 1 @TEMP_USER=ISNULL(Account,''),@TEMP_PWD=Password FROM [tb_MyUser] 
	  WHERE CHARINDEX(','+@Account+',',','+DomainName+',')>0
  END

  IF (@LoginUserType='N') --Novell User 
  BEGIN
	SELECT TOP 1 @TEMP_USER=ISNULL(Account,''),@TEMP_PWD=Password FROM [tb_MyUser] 
	  WHERE CHARINDEX(','+@Account+',',','+NovellAccount+',')>0
  END

  IF EXISTS(SELECT * FROM [tb_MyUser] WHERE [Account]=@TEMP_USER AND [Password]=@TEMP_PWD)
  BEGIN
    PRINT 'USER,PWD OK!'

    DECLARE @IsLocked SMALLINT,@FlagOnline CHAR(1),@LastLoginTime DATETIME,@DataSets VARCHAR(250)

    SELECT @IsLocked=IsLocked,@FlagOnline=FlagOnline,@LastLoginTime=LastLoginTime,@DataSets=DataSets
      FROM [tb_MyUser] WHERE [Account]=@TEMP_USER

    IF CHARINDEX(','+@DataSetID+',',@DataSets)<=0
    BEGIN      
      SELECT TOP 0 * FROM [tb_MyUser] --用户不存在
      SELECT '用户没有该帐套的权限！' AS ReturnMessage --出错信息
      RETURN --退出
    END    

    IF ISNULL(@IsLocked,0)<>0  
    BEGIN      
      SELECT TOP 0 * FROM [tb_MyUser] --用户不存在
      SELECT '用户已经锁定，禁止该用户登录！' AS ReturnMessage --出错信息
      RETURN --退出
    END

    --更新最后登录时间及登录状态
    UPDATE [tb_MyUser] SET FlagOnline='Y',LastLoginTime=GETDATE(),LoginCounter=ISNULL(LoginCounter,0)+1  
       WHERE [Account]=@TEMP_USER AND [Password]=@TEMP_PWD

    --登录日志
    INSERT INTO tb_LoginLog(Account,LoginType,CurrentTime) VALUES (@TEMP_USER,'I',GETDATE())

    --返回用户信息
    SELECT * FROM [tb_MyUser] WHERE [Account]=@TEMP_USER AND [Password]=@TEMP_PWD
    SELECT '' AS ReturnMessage

  END ELSE
  BEGIN
    SELECT TOP 0 * FROM [tb_MyUser] --用户不存在
    SELECT '用户名或密码错误！' AS ReturnMessage
  END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetNo]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetNo]
  @DocName VARCHAR(4)
AS
BEGIN
/*-------------------------------------------------------------------------------------
  程序说明:返回单据流水号 BY:JONNY 2010-06-14
  返回结果:MAX_NO字段,正常表示为最新单号,为空表示单据无效
  -------------------------------------------------------------------------------------
SELECT * FROM sys_DocSN

---测试--------

sp_GetNo 'SO' /*取采购单号*/
sp_GetNo 'SCNO' /*取销售合约号*/
sp_GetNo 'X@#$' /*测试不存在的单号*/
-------------------------------------------------------------------------------------*/
  DECLARE @Value INT,@Header VARCHAR(10),@RetValue VARCHAR(20),@YYMM CHAR(4)

  SELECT @YYMM=SUBSTRING(CONVERT(VARCHAR,GETDATE(),112),3,4)/*20100616,取YYMM=1006*/
  SELECT @Header=Header FROM sys_DocSN WHERE DocName=@DocName

  IF (ISNULL(@Header,'')='') /*不存在的单据号码*/
  BEGIN
    SELECT '' AS MAX_NO
    RETURN
  END

  SELECT @Value=MaxID FROM sys_DocSN WHERE DocName=@DocName AND YYMM=@YYMM

  IF @Value IS NULL
  BEGIN    
    INSERT INTO sys_DocSN(DocName,Header,YYMM,MaxID) VALUES (@DocName,@Header,@YYMM,1)
    SELECT @Header+@YYMM+'001' AS MAX_NO /*本月第一张单号*/
  END 
  ELSE
  BEGIN
	SET @Value=ISNULL(@Value,0)+1 /*取最大值+1,为返回的流水号*/
	UPDATE sys_DocSN SET MaxID=@Value WHERE DocName=@DocName AND YYMM=@YYMM/*更新流水号*/

	/*返回结果:YYMMDD+流水号*/
	SET @RetValue=@Header+@YYMM+RIGHT('000'+CAST(@Value AS VARCHAR),3)
	SELECT @RetValue AS MAX_NO
  END
  -----------------------------------------END--------------------------------------------
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFormAuthority]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetFormAuthority]
  @account varchar(30),
  @moduleID int,
  @menuName varchar(200)
as
begin
/*
sp_GetFormAuthority 'take',4,'menuItemCheck'
*/
  
  select Authorities from dbo.tb_MyUserRole where AuthorityID=@menuName and ModuleID=@moduleID and
   GroupCode in (select GroupCode from dbo.tb_MyUserGroupRe where Account=@account)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDataSN]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetDataSN]
  @DataCode VARCHAR(10),
  @AsHeader CHAR(1)--Y/N,DataCode作为字头
AS
BEGIN
/*-------------------------------------------------------------------------------------
  程序说明:返回自定义流水号 BY:JONNY 2012-05-23
  返回结果:MAX_NO
  -------------------------------------------------------------------------------------
SELECT * FROM sys_DataSN

---测试--------

sp_GetDataSN 'BANK','Y'
sp_GetDataSN 'DEPT','Y' 
sp_GetDataSN 'GGX','Y' 
sp_GetDataSN 'A','N' 

-------------------------------------------------------------------------------------*/
	DECLARE @Value INT,@Length INT,@Header VARCHAR(10),@RetValue VARCHAR(50),@CHAR VARCHAR(20)

	SELECT @Header=Header,@Value=MaxID,@Length=Length FROM sys_DataSN WHERE DataCode=@DataCode

	IF (@Header IS NULL AND @Value IS NULL)
	BEGIN
	    SELECT @Value=0,@Length=4,@Header=CASE WHEN @AsHeader='Y' THEN @DataCode ELSE NULL END
		INSERT INTO sys_DataSN(DataCode,Header,Length,MaxID) VALUES (@DataCode,@Header,@Length,0)
	END

	SET @Value=ISNULL(@Value,0)+1 /*取最大值+1,为返回的流水号*/
	UPDATE sys_DataSN SET MaxID=@Value WHERE DataCode=@DataCode/*更新流水号*/

	SET @CHAR=RIGHT(REPLACE(SPACE(@Length),' ','0')+CAST(@Value AS VARCHAR),@Length)	
	SET @RetValue=ISNULL(@Header,'')+@CHAR/*返回结果:字头+流水号*/

	SELECT @RetValue AS MAX_NO
  -----------------------------------------END--------------------------------------------
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDataDicts]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDataDicts]
AS
BEGIN
/*-------------------------------------------------------------------------------------
  程序说明:下载数据字典 BY:JONNY 2010-06-14
  返回结果: 多个数据表.
  -------------------------------------------------------------------------------------

SELECT * FROM dbo.tb_Customer
SELECT * FROM dbo.tb_CommonDataDict

dbo.sp_GetCustomerByAttributeCodes ',CUS,','Y'

sp_GetDataDicts

*/

    SELECT * FROM dbo.vw_LogOPType
	SELECT * FROM dbo.sys_BusinessTables    
	SELECT * FROM dbo.tb_MyUser
	SELECT * FROM dbo.tb_Person
    SELECT * FROM tb_CustomerAttribute
    SELECT * FROM dbo.tb_CommonDataDict WHERE DataType=1 --银行资料
    SELECT * FROM dbo.tb_CommDataDictType
    SELECT * FROM dbo.tb_PayType
    SELECT * FROM dbo.tb_Currency
    SELECT * FROM dbo.tb_Location
    SELECT * FROM dbo.tb_CommonDataDict WHERE DataType=6 --部门资料

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomerByAttributeCodes]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetCustomerByAttributeCodes]
  @AttributeCodes VARCHAR(50), --客户类型,如: ,CUS,SPL,
  @NameWithCode CHAR(1)--客户名称前面显示编号,如: C00001 测试用客户
AS
BEGIN
	/***********************************************************
     程序:根据客户类型获取客户表数据 BY JONNY SUN 2011-01-06
    ------------------------------------------------------------
	SELECT * FROM dbo.tb_Customer
	SELECT * FROM dbo.tb_CustomerAttribute 

	-- TESTING --              
    sp_GetCustomerByAttributeCodes '','N'
	sp_GetCustomerByAttributeCodes ',CUS,','Y'
	sp_GetCustomerByAttributeCodes ',SPL,CUS,','Y'
	************************************************************/

	PRINT '预设返回所有资料'
	IF (ISNULL(@AttributeCodes,'')='')
    BEGIN
	  IF (@NameWithCode='Y')
        SELECT CustomerCode,
          CustomerCode+' - '+NativeName AS NativeName,
          CustomerCode+' - '+EnglishName AS EnglishName
        FROM tb_Customer A ORDER BY CustomerCode
      ELSE
        SELECT CustomerCode,NativeName,EnglishName FROM tb_Customer A
        ORDER BY CustomerCode

      RETURN
    END

	CREATE TABLE #TMPCODES (AttributeCode VARCHAR(20))
	INSERT INTO #TMPCODES SELECT AttributeCode FROM dbo.tb_CustomerAttribute 
	  WHERE CHARINDEX(','+AttributeCode+',',@AttributeCodes)>0

	PRINT '返回数据'
    IF (@NameWithCode='Y')
	BEGIN
		SELECT CustomerCode,
        CustomerCode+' - '+NativeName AS NativeName,
        CustomerCode+' - '+EnglishName AS EnglishName
        FROM tb_Customer A JOIN #TMPCODES B
		ON CHARINDEX(','+B.AttributeCode+',',','+A.AttributeCodes+',')>0
        ORDER BY CustomerCode
	END
	ELSE
	BEGIN
		SELECT CustomerCode,NativeName,EnglishName FROM tb_Customer A JOIN #TMPCODES B
		ON CHARINDEX(','+B.AttributeCode+',',','+A.AttributeCodes+',')>0
         ORDER BY CustomerCode
	END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_FuzzySearchProduct]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_FuzzySearchProduct]
  @Content VARCHAR(50)
AS
BEGIN
/*
SELECT * FROM dbo.tb_Product

sp_FuzzySearchProduct 'MINI'
sp_FuzzySearchProduct ''

*/
IF (ISNULL(@Content,'')='')  
  SELECT * FROM tb_Product ORDER BY ProductCode
ELSE
  SELECT A.* FROM tb_Product A WHERE 
    A.ProductCode LIKE N'%'+@Content+'%' OR
    A.ProductName LIKE N'%'+@Content+'%' OR
    A.Remark LIKE N'%'+@Content+'%' 
  ORDER BY A.ProductCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_FuzzySearchCustomer]    Script Date: 03/24/2015 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_FuzzySearchCustomer]
  @Content VARCHAR(50),
  @AttributeCodes VARCHAR(50)
AS
BEGIN
	/*
	SELECT * FROM dbo.tb_Customer
	SELECT * FROM dbo.tb_CustomerAttribute

    sp_FuzzySearchCustomer '',''
    sp_FuzzySearchCustomer 'c/s',',SEL,CHL'
    sp_FuzzySearchCustomer '电台',''
    sp_FuzzySearchCustomer '现代','CUS,SPL,CHL'

	*/

    DECLARE @SQL VARCHAR(2000)

	CREATE TABLE #TBCODES(AttributeCode VARCHAR(20))

	INSERT INTO #TBCODES
	  SELECT AttributeCode FROM tb_CustomerAttribute WHERE ','+@AttributeCodes+',' LIKE '%,'+AttributeCode+',%'

    --SELECT * FROM #TBCODES

	PRINT '如未指定类型，返回100条记录'
	IF ISNULL(@AttributeCodes,'')=''	  
      SET @SQL='SELECT TOP 100 * FROM tb_Customer A WHERE ((A.AttributeCodes LIKE ''%CUS%'') OR (A.AttributeCodes LIKE ''%SPL%'')) '
    ELSE
      SET @SQL='SELECT DISTINCT A.* FROM tb_Customer A,#TBCODES B WHERE (CHARINDEX(B.AttributeCode,A.AttributeCodes)>0) '        

	IF (ISNULL(@Content,'')='')  
    BEGIN
      PRINT @SQL
      EXEC (@SQL)
    END ELSE
    BEGIN
	  SET @SQL=@SQL+' AND (A.CustomerCode LIKE N''%'+@Content+'%'' OR '
	  SET @SQL=@SQL+' A.EnglishName LIKE N''%'+@Content+'%'' OR '
	  SET @SQL=@SQL+' A.NativeName LIKE N''%'+@Content+'%'' )'
	  SET @SQL=@SQL+' ORDER BY A.CustomerCode'	  

      PRINT @SQL
      EXEC (@SQL)
    END
 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFieldDisplayName]    Script Date: 03/24/2015 23:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetFieldDisplayName]
(
	@TableName VARCHAR(50),
	@FieldName VARCHAR(50)
)
RETURNS NVARCHAR(250)
AS
BEGIN
/*
获取字段中文名称, JONNY SUN, 2010-11-16
--------------------------
SELECT * FROM dbo.sys_FieldNameDefs WHERE FIELDNAME='Remark'

print dbo.fn_GetFieldDisplayName('','')
print dbo.fn_GetFieldDisplayName('','ISID')
print dbo.fn_GetFieldDisplayName('','Remark')
print dbo.fn_GetFieldDisplayName('tb_SalesOrder','Remark')

*/
    SET @TableName=ISNULL(@TableName,'')
    SET @FieldName=ISNULL(@FieldName,'')

    /*字段名无效,返回空值*/
	IF @FieldName='' RETURN '无定义名称'

	DECLARE @RETVALUE NVARCHAR(250)
	SELECT TOP 1 @RETVALUE=DisplayName FROM 
	(
		SELECT    TableName,DisplayName FROM sys_FieldNameDefs WHERE TableName=@TableName AND FieldName=@FieldName 
        UNION ALL
		SELECT '' TableName,DisplayName FROM sys_FieldNameDefs WHERE FieldName=@FieldName AND ISNULL(TableName,'')=''	
	) T 

	RETURN ISNULL(@RETVALUE,@FieldName)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetEditContent]    Script Date: 03/24/2015 23:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetEditContent](@GUID32 VARCHAR(32))
RETURNS VARCHAR(8000)
AS
BEGIN

/*

SELECT * FROM dbo.tb_LogDtl WHERE GUID32='47baa40018a04e9680d4efb51b473324'
PRINT 'ABC'+ASC(13)+ASC(10)+'CDE'
PRINT DBO.fn_GetEditContent('47baa40018a04e9680d4efb51b473324')

*/


	DECLARE @Content VARCHAR(8000),@FieldName VARCHAR(50),@OldValue VARCHAR(250),@NewValue VARCHAR(250)
	SET @Content=''

	DECLARE crDetail CURSOR FOR 
    SELECT FieldName,OldValue,NewValue FROM tb_LogDtl WHERE GUID32=@GUID32
	OPEN crDetail                       --打开游标
	FETCH NEXT FROM crDetail INTO @FieldName,@OldValue,@NewValue 
	WHILE @@FETCH_STATUS=0           --判断是否成功获取数据
	BEGIN	
      IF (@Content<>'') SET @Content=@Content+CHAR(13)+CHAR(10)
      SET @Content=@Content+'['+@FieldName+'] 由"'+@OldValue+'"改为"'+@NewValue+'"'
	  FETCH NEXT FROM crDetail INTO @FieldName,@OldValue,@NewValue 
	END

	CLOSE crDetail                   --关闭游标
	DEALLOCATE crDetail 

  RETURN @Content
END
GO
/****** Object:  StoredProcedure [dbo].[sp_sys_GetTableFieldsForPicker]    Script Date: 03/24/2015 23:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_sys_GetTableFieldsForPicker]
  @TableName VARCHAR(50),
  @ReturnAll CHAR(1) --Y/N 是否返回所有字段
as
begin

/*
获取表的字段名定义信息
----------------------------------

SELECT * FROM dbo.sys_FieldNameDefs

sp_sys_GetTableFieldsForPicker 'tb_SalesOrder','N'
sp_sys_GetTableFieldsForPicker 'tb_SalesOrder','Y'

*/

  PRINT '获取表的字段名定义信息'
  SET @ReturnAll=ISNULL(@ReturnAll,'Y')

  IF (@ReturnAll='Y')
  BEGIN
      PRINT '返回所有字段定义'
	  SELECT DISTINCT * FROM 
	  (   /*取指定表名的字段定义*/
		  SELECT FieldName,DisplayName FROM sys_FieldNameDefs WHERE TableName=@TableName 
		  UNION ALL
          /*取公共字段定义*/
		  SELECT FieldName,DisplayName FROM sys_FieldNameDefs WHERE ISNULL(TableName,'')='' AND 
		  FieldName IN (SELECT a.name FROM syscolumns a WHERE a.id = object_id(@TableName)) AND
          FieldName NOT IN (SELECT FieldName FROM sys_FieldNameDefs WHERE TableName=@TableName)
	  ) T ORDER BY FieldName
  END ELSE
  BEGIN
      PRINT '返回只可显示的字段定义'
	  SELECT DISTINCT * FROM 
	  (   /*取指定表名的字段定义*/
		  SELECT FieldName,DisplayName FROM sys_FieldNameDefs WHERE FlagDisplay='Y' AND TableName=@TableName 
		  UNION ALL
          /*取公共字段定义*/
		  SELECT FieldName,DisplayName FROM sys_FieldNameDefs WHERE FlagDisplay='Y' AND ISNULL(TableName,'')='' AND 
		  FieldName IN (SELECT a.name FROM syscolumns a WHERE a.id = object_id(@TableName)) AND
          FieldName NOT IN (SELECT FieldName FROM sys_FieldNameDefs WHERE FlagDisplay='Y' AND TableName=@TableName)
	  ) T ORDER BY FieldName
  END
end
GO
/****** Object:  Default [tb_SalesOrderDtl_Queue]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_SOs] ADD  CONSTRAINT [tb_SalesOrderDtl_Queue]  DEFAULT ((0)) FOR [Queue]
GO
/****** Object:  Default [tb_SalesOrderDtl_Amount]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_SOs] ADD  CONSTRAINT [tb_SalesOrderDtl_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF__tb_POs__Queue__7775B2CE]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_POs] ADD  CONSTRAINT [DF__tb_POs__Queue__7775B2CE]  DEFAULT ((0)) FOR [Queue]
GO
/****** Object:  Default [DF__tb_POs__Amount__7869D707]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_POs] ADD  CONSTRAINT [DF__tb_POs__Amount__7869D707]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [tb_Customer_PaymentTerm]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_Customer] ADD  CONSTRAINT [tb_Customer_PaymentTerm]  DEFAULT ((0)) FOR [PaymentTerm]
GO
/****** Object:  Default [DF__tb_Attach__FileT__77BFCB91]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_AttachFile] ADD  CONSTRAINT [DF__tb_Attach__FileT__77BFCB91]  DEFAULT ('') FOR [FileTitle]
GO
/****** Object:  Default [DF__tb_Attach__FileN__78B3EFCA]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_AttachFile] ADD  CONSTRAINT [DF__tb_Attach__FileN__78B3EFCA]  DEFAULT ('') FOR [FileName]
GO
/****** Object:  Default [DF__tb_Attach__FileT__79A81403]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_AttachFile] ADD  CONSTRAINT [DF__tb_Attach__FileT__79A81403]  DEFAULT ('') FOR [FileType]
GO
/****** Object:  Default [DF__tb_Attach__FileS__7A9C383C]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_AttachFile] ADD  CONSTRAINT [DF__tb_Attach__FileS__7A9C383C]  DEFAULT ('') FOR [FileSize]
GO
/****** Object:  Default [DF__tb_Attach__IsDro__7B905C75]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[tb_AttachFile] ADD  CONSTRAINT [DF__tb_Attach__IsDro__7B905C75]  DEFAULT ('0') FOR [IsDroped]
GO
/****** Object:  Default [DF_sys_FieldNameDefs_FlagDisplay]    Script Date: 03/24/2015 23:17:01 ******/
ALTER TABLE [dbo].[sys_FieldNameDefs] ADD  CONSTRAINT [DF_sys_FieldNameDefs_FlagDisplay]  DEFAULT ('Y') FOR [FlagDisplay]
GO
