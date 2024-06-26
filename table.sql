CREATE DATABASE SOF3011
GO
USE [SOF3011]
GO
ALTER TABLE [dbo].[san_pham] DROP CONSTRAINT [fk_san_pham_danh_muc]
GO
ALTER TABLE [dbo].[hoa_don] DROP CONSTRAINT [fk_khach_hang]
GO
ALTER TABLE [dbo].[hdct] DROP CONSTRAINT [fk_hoa_don]
GO
ALTER TABLE [dbo].[hdct] DROP CONSTRAINT [fk_ctsp]
GO
ALTER TABLE [dbo].[ctsp] DROP CONSTRAINT [fk_sp]
GO
ALTER TABLE [dbo].[ctsp] DROP CONSTRAINT [fk_size]
GO
ALTER TABLE [dbo].[ctsp] DROP CONSTRAINT [fk_mau_sac]
GO
/****** Object:  Table [dbo].[size]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[size]') AND type in (N'U'))
DROP TABLE [dbo].[size]
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[san_pham]') AND type in (N'U'))
DROP TABLE [dbo].[san_pham]
GO
/****** Object:  Table [dbo].[mau_sac]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mau_sac]') AND type in (N'U'))
DROP TABLE [dbo].[mau_sac]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[khach_hang]') AND type in (N'U'))
DROP TABLE [dbo].[khach_hang]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hoa_don]') AND type in (N'U'))
DROP TABLE [dbo].[hoa_don]
GO
/****** Object:  Table [dbo].[hdct]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hdct]') AND type in (N'U'))
DROP TABLE [dbo].[hdct]
GO
/****** Object:  Table [dbo].[danh_muc]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[danh_muc]') AND type in (N'U'))
DROP TABLE [dbo].[danh_muc]
GO
/****** Object:  Table [dbo].[ctsp]    Script Date: 4/5/2024 8:26:25 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ctsp]') AND type in (N'U'))
DROP TABLE [dbo].[ctsp]
GO
/****** Object:  Table [dbo].[ctsp]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ctsp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_sp] [int] NULL,
	[id_mau_sac] [int] NULL,
	[id_size] [int] NULL,
	[gia_ban] [decimal](18, 2) NULL,
	[so_luong_ton] [int] NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_tao] [datetime] NULL,
	[ngay_sua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danh_muc]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_muc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_danh_muc] [varchar](255) NULL,
	[ten_danh_muc] [varchar](255) NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_tao] [datetime] NULL,
	[ngay_sua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hdct]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hdct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_hoa_don] [int] NULL,
	[id_ctsp] [int] NULL,
	[so_luong_mua] [int] NULL,
	[gia_ban] [decimal](18, 2) NULL,
	[tong_tien] [decimal](18, 2) NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_tao] [datetime] NULL,
	[ngay_sua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khach_hang] [int] NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_tao] [datetime] NULL,
	[ngay_sua] [datetime] NULL,
	[dia_chi] [nvarchar](255) NULL,
	[so_dien_thoai] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ho_ten] [nvarchar](255) NULL,
	[dia_chi] [nvarchar](255) NULL,
	[sdt] [varchar](20) NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_tao] [datetime] NULL,
	[ngay_sua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mau_sac]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mau_sac](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_mau] [varchar](255) NULL,
	[ten_mau] [varchar](255) NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_sua] [datetime] NULL,
	[ngay_tao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_san_pham] [varchar](255) NULL,
	[ten_san_pham] [varchar](255) NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_tao] [datetime] NULL,
	[ngay_sua] [datetime] NULL,
	[id_danh_muc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 4/5/2024 8:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_size] [varchar](255) NULL,
	[ten_size] [varchar](255) NULL,
	[trang_thai] [varchar](50) NULL,
	[ngay_sua] [datetime] NULL,
	[ngay_tao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ctsp]  WITH CHECK ADD  CONSTRAINT [fk_mau_sac] FOREIGN KEY([id_mau_sac])
REFERENCES [dbo].[mau_sac] ([id])
GO
ALTER TABLE [dbo].[ctsp] CHECK CONSTRAINT [fk_mau_sac]
GO
ALTER TABLE [dbo].[ctsp]  WITH CHECK ADD  CONSTRAINT [fk_size] FOREIGN KEY([id_size])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[ctsp] CHECK CONSTRAINT [fk_size]
GO
ALTER TABLE [dbo].[ctsp]  WITH CHECK ADD  CONSTRAINT [fk_sp] FOREIGN KEY([id_sp])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[ctsp] CHECK CONSTRAINT [fk_sp]
GO
ALTER TABLE [dbo].[hdct]  WITH CHECK ADD  CONSTRAINT [fk_ctsp] FOREIGN KEY([id_ctsp])
REFERENCES [dbo].[ctsp] ([id])
GO
ALTER TABLE [dbo].[hdct] CHECK CONSTRAINT [fk_ctsp]
GO
ALTER TABLE [dbo].[hdct]  WITH CHECK ADD  CONSTRAINT [fk_hoa_don] FOREIGN KEY([id_hoa_don])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[hdct] CHECK CONSTRAINT [fk_hoa_don]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [fk_khach_hang] FOREIGN KEY([id_khach_hang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [fk_khach_hang]
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD  CONSTRAINT [fk_san_pham_danh_muc] FOREIGN KEY([id_danh_muc])
REFERENCES [dbo].[danh_muc] ([id])
GO
ALTER TABLE [dbo].[san_pham] CHECK CONSTRAINT [fk_san_pham_danh_muc]
GO
INSERT INTO [dbo].[danh_muc] ([ma_danh_muc], [ten_danh_muc], [trang_thai], [ngay_tao], [ngay_sua])
VALUES 
('DM001', 'Category 1', 'Active', '2024-04-05', '2024-04-05'),
('DM002', 'Category 2', 'Active', '2024-04-05', '2024-04-05'),
('DM003', 'Category 3', 'Active', '2024-04-05', '2024-04-05'),
('DM004', 'Category 4', 'Active', '2024-04-05', '2024-04-05'),
('DM005', 'Category 5', 'Active', '2024-04-05', '2024-04-05'),
('DM006', 'Category 6', 'Active', '2024-04-05', '2024-04-05'),
('DM007', 'Category 7', 'Active', '2024-04-05', '2024-04-05'),
('DM008', 'Category 8', 'Active', '2024-04-05', '2024-04-05'),
('DM009', 'Category 9', 'Active', '2024-04-05', '2024-04-05'),
('DM010', 'Category 10', 'Active', '2024-04-05', '2024-04-05');
INSERT INTO [dbo].[mau_sac] ([ma_mau], [ten_mau], [trang_thai], [ngay_tao], [ngay_sua])
VALUES 
('MS001', 'Red', 'Active', '2024-04-05', '2024-04-05'),
('MS002', 'Blue', 'Active', '2024-04-05', '2024-04-05'),
('MS003', 'Green', 'Active', '2024-04-05', '2024-04-05'),
('MS004', 'Yellow', 'Active', '2024-04-05', '2024-04-05'),
('MS005', 'Black', 'Active', '2024-04-05', '2024-04-05'),
('MS006', 'White', 'Active', '2024-04-05', '2024-04-05'),
('MS007', 'Orange', 'Active', '2024-04-05', '2024-04-05'),
('MS008', 'Purple', 'Active', '2024-04-05', '2024-04-05'),
('MS009', 'Pink', 'Active', '2024-04-05', '2024-04-05'),
('MS010', 'Brown', 'Active', '2024-04-05', '2024-04-05');
INSERT INTO [dbo].[size] ([ma_size], [ten_size], [trang_thai], [ngay_tao], [ngay_sua])
VALUES 
('S001', 'Small', 'Active', '2024-04-05', '2024-04-05'),
('S002', 'Medium', 'Active', '2024-04-05', '2024-04-05'),
('S003', 'Large', 'Active', '2024-04-05', '2024-04-05'),
('S004', 'Extra Small', 'Active', '2024-04-05', '2024-04-05'),
('S005', 'Extra Large', 'Active', '2024-04-05', '2024-04-05'),
('S006', 'XXL', 'Active', '2024-04-05', '2024-04-05'),
('S007', 'XS', 'Active', '2024-04-05', '2024-04-05'),
('S008', 'XL', 'Active', '2024-04-05', '2024-04-05'),
('S009', 'XXS', 'Active', '2024-04-05', '2024-04-05'),
('S010', 'XXXL', 'Active', '2024-04-05', '2024-04-05');
INSERT INTO [dbo].[san_pham] ([ma_san_pham], [ten_san_pham], [trang_thai], [ngay_tao], [ngay_sua], [id_danh_muc])
VALUES 
('SP001', 'Product 1', 'Active', '2024-04-05', '2024-04-05', 1),
('SP002', 'Product 2', 'Active', '2024-04-05', '2024-04-05', 2),
('SP003', 'Product 3', 'Active', '2024-04-05', '2024-04-05', 3),
('SP004', 'Product 4', 'Active', '2024-04-05', '2024-04-05', 4),
('SP005', 'Product 5', 'Active', '2024-04-05', '2024-04-05', 5),
('SP006', 'Product 6', 'Active', '2024-04-05', '2024-04-05', 6),
('SP007', 'Product 7', 'Active', '2024-04-05', '2024-04-05', 7),
('SP008', 'Product 8', 'Active', '2024-04-05', '2024-04-05', 8),
('SP009', 'Product 9', 'Active', '2024-04-05', '2024-04-05', 9),
('SP010', 'Product 10', 'Active', '2024-04-05', '2024-04-05', 10);
INSERT INTO [dbo].[ctsp] ([id_sp], [id_mau_sac], [id_size], [gia_ban], [so_luong_ton], [trang_thai], [ngay_tao], [ngay_sua])
VALUES 
(1, 1, 1, 25.99, 50, 'Active', '2024-04-05', '2024-04-05'),
(2, 2, 2, 35.99, 30, 'Active', '2024-04-05', '2024-04-05'),
(3, 3, 3, 45.99, 20, 'Active', '2024-04-05', '2024-04-05'),
(4, 1, 2, 29.99, 40, 'Active', '2024-04-05', '2024-04-05'),
(5, 2, 3, 39.99, 25, 'Active', '2024-04-05', '2024-04-05'),
(6, 3, 1, 49.99, 15, 'Active', '2024-04-05', '2024-04-05'),
(7, 1, 3, 27.99, 35, 'Active', '2024-04-05', '2024-04-05'),
(8, 2, 1, 37.99, 28, 'Active', '2024-04-05', '2024-04-05'),
(9, 3, 2, 47.99, 22, 'Active', '2024-04-05', '2024-04-05'),
(10, 1, 1, 31.99, 45, 'Active', '2024-04-05', '2024-04-05'),
(1, 2, 3, 41.99, 20, 'Active', '2024-04-05', '2024-04-05'),
(1, 3, 1, 51.99, 15, 'Active', '2024-04-05', '2024-04-05'),
(1, 1, 3, 29.99, 35, 'Active', '2024-04-05', '2024-04-05'),
(2, 2, 1, 39.99, 25, 'Active', '2024-04-05', '2024-04-05'),
(2, 3, 2, 49.99, 20, 'Active', '2024-04-05', '2024-04-05'),
(3, 1, 1, 33.99, 30, 'Active', '2024-04-05', '2024-04-05'),
(4, 2, 2, 43.99, 18, 'Active', '2024-04-05', '2024-04-05'),
(5, 3, 3, 53.99, 10, 'Active', '2024-04-05', '2024-04-05'),
(6, 1, 2, 37.99, 28, 'Active', '2024-04-05', '2024-04-05'),
(3, 2, 3, 47.99, 22, 'Active', '2024-04-05', '2024-04-05'),
(2, 3, 1, 57.99, 12, 'Active', '2024-04-05', '2024-04-05'),
(7, 1, 3, 31.99, 32, 'Active', '2024-04-05', '2024-04-05'),
(8, 2, 1, 41.99, 24, 'Active', '2024-04-05', '2024-04-05'),
(8, 3, 2, 51.99, 18, 'Active', '2024-04-05', '2024-04-05'),
(9, 1, 1, 35.99, 27, 'Active', '2024-04-05', '2024-04-05'),
(9, 2, 2, 45.99, 15, 'Active', '2024-04-05', '2024-04-05'),
(8, 3, 3, 55.99, 8, 'Active', '2024-04-05', '2024-04-05'),
(7, 1, 2, 39.99, 22, 'Active', '2024-04-05', '2024-04-05'),
(6, 2, 3, 49.99, 17, 'Active', '2024-04-05', '2024-04-05'),
(5, 3, 1, 59.99, 9, 'Active', '2024-04-05', '2024-04-05');

INSERT INTO [dbo].[khach_hang] ([ho_ten], [dia_chi], [sdt], [trang_thai], [ngay_tao], [ngay_sua])
VALUES 
('John Doe', '123 Main St', '1234567890', 'Active', '2024-04-05', '2024-04-05'),
('Jane Smith', '456 Elm St', '0987654321', 'Active', '2024-04-05', '2024-04-05'),
('Michael Johnson', '789 Oak St', '1357924680', 'Active', '2024-04-05', '2024-04-05'),
('Emily Williams', '101 Pine St', '2468013579', 'Active', '2024-04-05', '2024-04-05'),
('Daniel Brown', '202 Maple St', '9876543210', 'Active', '2024-04-05', '2024-04-05'),
('Sarah Davis', '303 Birch St', '0123456789', 'Active', '2024-04-05', '2024-04-05'),
('Matthew Wilson', '404 Cedar St', '5678901234', 'Active', '2024-04-05', '2024-04-05'),
('Jessica Taylor', '505 Walnut St', '4321098765', 'Active', '2024-04-05', '2024-04-05'),
('Christopher Miller', '606 Pineapple St', '7890123456', 'Active', '2024-04-05', '2024-04-05'),
('Amanda Anderson', '707 Peach St', '2345678901', 'Active', '2024-04-05', '2024-04-05');
INSERT INTO [dbo].[hoa_don] ([id_khach_hang], [trang_thai], [ngay_tao], [ngay_sua], [dia_chi], [so_dien_thoai])
VALUES 
(1, 'Active', '2024-04-05', '2024-04-05', '123 Main St', '1234567890'),
(2, 'Active', '2024-04-05', '2024-04-05', '456 Elm St', '0987654321'),
(3, 'Active', '2024-04-05', '2024-04-05', '789 Oak St', '1357924680'),
(4, 'Active', '2024-04-05', '2024-04-05', '101 Pine St', '2468013579'),
(5, 'Active', '2024-04-05', '2024-04-05', '202 Maple St', '9876543210'),
(6, 'Active', '2024-04-05', '2024-04-05', '303 Birch St', '0123456789'),
(7, 'Active', '2024-04-05', '2024-04-05', '404 Cedar St', '5678901234'),
(8, 'Active', '2024-04-05', '2024-04-05', '505 Walnut St', '4321098765'),
(9, 'Active', '2024-04-05', '2024-04-05', '606 Pineapple St', '7890123456'),
(10, 'Active', '2024-04-05', '2024-04-05', '707 Peach St', '2345678901');
INSERT INTO [dbo].[hdct] ([id_hoa_don], [id_ctsp], [so_luong_mua], [gia_ban], [tong_tien], [trang_thai], [ngay_tao], [ngay_sua])
VALUES 
(1, 1, 2, 25.99, 51.98, 'Active', '2024-04-05', '2024-04-05'),
(1, 2, 1, 35.99, 35.99, 'Active', '2024-04-05', '2024-04-05'),
(2, 3, 3, 45.99, 137.97, 'Active', '2024-04-05', '2024-04-05'),
(2, 4, 1, 29.99, 29.99, 'Active', '2024-04-05', '2024-04-05'),
(3, 5, 2, 39.99, 79.98, 'Active', '2024-04-05', '2024-04-05'),
(3, 6, 3, 49.99, 149.97, 'Active', '2024-04-05', '2024-04-05'),
(4, 7, 1, 27.99, 27.99, 'Active', '2024-04-05', '2024-04-05'),
(4, 8, 2, 37.99, 75.98, 'Active', '2024-04-05', '2024-04-05'),
(5, 9, 3, 47.99, 143.97, 'Active', '2024-04-05', '2024-04-05'),
(5, 10, 1, 31.99, 31.99, 'Active', '2024-04-05', '2024-04-05');
