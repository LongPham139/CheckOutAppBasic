USE [SQLMau]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 28/11/2021 3:51:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[oderID] [varchar](15) NOT NULL,
	[userID] [varchar](15) NOT NULL,
	[time] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[stt] [int] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [varchar](12) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[oderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 28/11/2021 3:51:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [varchar](15) NOT NULL,
	[productID] [varchar](15) NOT NULL,
	[quantity] [int] NOT NULL,
	[oderID] [varchar](15) NOT NULL,
	[stt] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 28/11/2021 3:51:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](15) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 28/11/2021 3:51:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](15) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[roleID] [bit] NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [varchar](12) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-1', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 250.17001342773438, 1, N'BH-DN', N'0918805311')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-2', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 107.58000183105469, 2, N'BH-DN', N'0918805311')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-3', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 305.97998046875, 3, N'BH-DN', N'0918805311')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-4', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 336.6300048828125, 4, N'BH-DN', N'0918805311')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-5', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 85.4000015258789, 5, N'BH-DN', N'0918805311')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-6', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 297.25, 6, N'BH-DN', N'0231456987')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-7', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 263.67001342773438, 7, N'BT', N'0321456987')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-8', N'user', CAST(N'2021-09-06T00:00:00.000' AS DateTime), 229.04998779296875, 8, N'Nam Äá»nh ', N'0946486517')
INSERT [dbo].[tblOrder] ([oderID], [userID], [time], [total], [stt], [address], [phone]) VALUES (N'C-06092021-9', N'user', CAST(N'2021-11-28T00:00:00.000' AS DateTime), 243.89999389648438, 9, N'BH-DN', N'0231456987')
GO
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-1', N'P005', 1, N'C-06092021-1', 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-10', N'P005', 1, N'C-06092021-4', 10)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-11', N'P004', 1, N'C-06092021-4', 11)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-12', N'P006', 1, N'C-06092021-4', 12)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-13', N'P002', 2, N'C-06092021-4', 13)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-14', N'P001', 1, N'C-06092021-5', 14)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-15', N'P005', 1, N'C-06092021-6', 15)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-16', N'P006', 1, N'C-06092021-6', 16)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-17', N'P001', 1, N'C-06092021-6', 17)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-18', N'P003', 1, N'C-06092021-6', 18)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-19', N'P005', 1, N'C-06092021-7', 19)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-2', N'P007', 1, N'C-06092021-1', 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-20', N'P007', 1, N'C-06092021-7', 20)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-21', N'P001', 1, N'C-06092021-7', 21)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-22', N'P002', 1, N'C-06092021-7', 22)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-23', N'P006', 1, N'C-06092021-8', 23)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-24', N'P002', 2, N'C-06092021-8', 24)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-25', N'P004', 1, N'C-06092021-9', 25)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-26', N'P001', 1, N'C-06092021-9', 26)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-27', N'P010', 1, N'C-06092021-9', 27)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-28', N'P009', 1, N'C-06092021-9', 28)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-3', N'P003', 1, N'C-06092021-1', 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-4', N'P008', 1, N'C-06092021-1', 4)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-5', N'P005', 1, N'C-06092021-2', 5)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-6', N'P004', 1, N'C-06092021-2', 6)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-7', N'P005', 1, N'C-06092021-3', 7)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-8', N'P006', 2, N'C-06092021-3', 8)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [quantity], [oderID], [stt]) VALUES (N'D-9', N'P002', 1, N'C-06092021-3', 9)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P001', N'F250', 35, 85.4, N'Ford')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P002', N'Town Car', 16, 66.31, N'Lincoln')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P003', N'Swift', 16, 68.61, N'Suzuki')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P004', N'XJ', 23, 60.77, N'Jaguar')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P005', N'LS', 72, 46.81, N'Lexus')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P006', N'T100', 85, 96.43, N'Toyota')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P007', N'M Roadster', 44, 65.15, N'BMW')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P008', N'RX', 92, 69.6, N'Lexus')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P009', N'Grand Prix', 46, 21.63, N'Pontiac')
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description]) VALUES (N'P010', N'944', 2, 76.1, N'Porsche')
GO
INSERT [dbo].[tblUser] ([userID], [password], [roleID], [fullName], [address], [phone]) VALUES (N'admin', N'admin', 1, N'Long Pham', N'BH-DN', N'0918805311')
INSERT [dbo].[tblUser] ([userID], [password], [roleID], [fullName], [address], [phone]) VALUES (N'user ', N'user', 0, N'Tu Anh', N'BT', N'0321456987')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([oderID])
REFERENCES [dbo].[tblOrder] ([oderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
