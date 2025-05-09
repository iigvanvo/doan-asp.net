USE [master]
GO
/****** Object:  Database [DoAn]    Script Date: 5/19/2024 10:17:31 PM ******/
CREATE DATABASE [DoAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DoAn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DoAn.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DoAn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DoAn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DoAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoAn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DoAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoAn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DoAn] SET  MULTI_USER 
GO
ALTER DATABASE [DoAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoAn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DoAn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DoAn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DoAn] SET QUERY_STORE = ON
GO
ALTER DATABASE [DoAn] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DoAn]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 5/19/2024 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[madonhang] [int] IDENTITY(1,1) NOT NULL,
	[makhachhang] [int] NOT NULL,
	[dienthoai] [nchar](15) NULL,
	[diachi] [nvarchar](500) NULL,
	[ngaydat] [date] NOT NULL,
	[ngaynhan] [date] NOT NULL,
	[thanhtoan] [nvarchar](150) NOT NULL,
	[soluongmua] [int] NULL,
	[tongtien] [decimal](18, 0) NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[madonhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 5/19/2024 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangChiTiet](
	[machitietdonhang] [int] NOT NULL,
	[madonhang] [int] NOT NULL,
	[masp] [int] NOT NULL,
	[soluong] [int] NULL,
	[gia] [decimal](18, 0) NULL,
	[tongtien] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 5/19/2024 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[magiohang] [int] IDENTITY(1,1) NOT NULL,
	[masp] [int] NOT NULL,
	[makhachhang] [int] NOT NULL,
	[soluong] [int] NOT NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[magiohang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSP]    Script Date: 5/19/2024 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSP](
	[mahang] [int] IDENTITY(1,1) NOT NULL,
	[tenhang] [nvarchar](50) NOT NULL,
	[trangthai] [bit] NOT NULL,
 CONSTRAINT [PK_HangSP] PRIMARY KEY CLUSTERED 
(
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/19/2024 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makhachhang] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](500) NULL,
	[dienthoai] [nchar](15) NULL,
	[email] [varchar](100) NULL,
	[matkhau] [nchar](10) NULL,
	[trangthai] [bit] NULL,
	[chucvu] [bit] NULL,
	[tinh] [nvarchar](500) NULL,
	[huyen] [nvarchar](500) NULL,
	[xa] [nvarchar](500) NULL,
	[thon] [nvarchar](500) NULL,
	[ngaydangky] [date] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/19/2024 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[masp] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [int] NOT NULL,
	[tensp] [nvarchar](500) NOT NULL,
	[hinhanh] [nvarchar](500) NULL,
	[soluong] [int] NULL,
	[giaban] [decimal](18, 0) NULL,
	[mota] [nvarchar](4000) NULL,
	[CPU] [nvarchar](500) NULL,
	[RAM] [nvarchar](500) NULL,
	[OS] [nvarchar](50) NULL,
	[manhinh] [nvarchar](500) NULL,
	[carddohoa] [nvarchar](200) NULL,
	[SSD] [nchar](50) NULL,
	[trangthai] [bit] NULL,
	[model] [nvarchar](200) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 5/19/2024 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[matintuc] [int] IDENTITY(1,1) NOT NULL,
	[tieude] [nvarchar](500) NULL,
	[hinhanh] [nvarchar](50) NULL,
	[ngaytao] [date] NULL,
	[gioithieu] [nvarchar](500) NULL,
	[trangthai] [bit] NULL,
	[makhachhang] [int] NULL,
	[noidung] [text] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[matintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([madonhang], [makhachhang], [dienthoai], [diachi], [ngaydat], [ngaynhan], [thanhtoan], [soluongmua], [tongtien], [trangthai]) VALUES (46, 36, N'0328729598     ', N'Thôn Chi Thịnh, Thanh Chi, Thanh Chương,Nghệ An', CAST(N'2024-05-14' AS Date), CAST(N'2024-05-17' AS Date), N'Thanh toán khi nhận hàng', NULL, CAST(29900000 AS Decimal(18, 0)), 1)
INSERT [dbo].[DonHang] ([madonhang], [makhachhang], [dienthoai], [diachi], [ngaydat], [ngaynhan], [thanhtoan], [soluongmua], [tongtien], [trangthai]) VALUES (47, 35, N'0986176237     ', N'thôn Văn Phạm, Thanh Khai, Thanh Chương,Nghệ An', CAST(N'2024-05-14' AS Date), CAST(N'2024-05-17' AS Date), N'Thanh toán khi nhận hàng', NULL, CAST(52800000 AS Decimal(18, 0)), 0)
INSERT [dbo].[DonHang] ([madonhang], [makhachhang], [dienthoai], [diachi], [ngaydat], [ngaynhan], [thanhtoan], [soluongmua], [tongtien], [trangthai]) VALUES (48, 35, N'0986176237     ', N'thôn Văn Phạm, Thanh Khai, Thanh Chương,Nghệ An', CAST(N'2024-05-15' AS Date), CAST(N'2024-05-18' AS Date), N'Thanh toán khi nhận hàng', NULL, CAST(47890000 AS Decimal(18, 0)), 0)
INSERT [dbo].[DonHang] ([madonhang], [makhachhang], [dienthoai], [diachi], [ngaydat], [ngaynhan], [thanhtoan], [soluongmua], [tongtien], [trangthai]) VALUES (49, 36, N'0328729598     ', N'Thôn Chi Thịnh, Thanh Chi, Thanh Chương,Nghệ An', CAST(N'2024-05-16' AS Date), CAST(N'2024-05-19' AS Date), N'Thanh toán khi nhận hàng', NULL, CAST(14790000 AS Decimal(18, 0)), 0)
INSERT [dbo].[DonHang] ([madonhang], [makhachhang], [dienthoai], [diachi], [ngaydat], [ngaynhan], [thanhtoan], [soluongmua], [tongtien], [trangthai]) VALUES (50, 36, N'0328729598     ', N'Thôn Chi Thịnh, Thanh Chi, Thanh Chương,Nghệ An', CAST(N'2024-05-16' AS Date), CAST(N'2024-05-19' AS Date), N'Thanh toán khi nhận hàng', NULL, CAST(22490000 AS Decimal(18, 0)), 0)
INSERT [dbo].[DonHang] ([madonhang], [makhachhang], [dienthoai], [diachi], [ngaydat], [ngaynhan], [thanhtoan], [soluongmua], [tongtien], [trangthai]) VALUES (51, 34, N'0334563248     ', N'Xóm Nam Trường, Văn Lợi, Quỳ Hợp,Nghệ An', CAST(N'2024-05-16' AS Date), CAST(N'2024-05-19' AS Date), N'Thanh toán khi nhận hàng', NULL, CAST(27290000 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 46, 58, 1, CAST(29900000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 47, 30, 1, CAST(28900000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 48, 61, 1, CAST(17990000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 48, 58, 1, CAST(29900000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 49, 20, 1, CAST(14790000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 50, 26, 1, CAST(22490000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 51, 25, 1, CAST(27290000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHangChiTiet] ([machitietdonhang], [madonhang], [masp], [soluong], [gia], [tongtien]) VALUES (0, 47, 31, 1, CAST(23900000 AS Decimal(18, 0)), NULL)
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([magiohang], [masp], [makhachhang], [soluong]) VALUES (174, 20, 35, 1)
INSERT [dbo].[GioHang] ([magiohang], [masp], [makhachhang], [soluong]) VALUES (175, 24, 35, 1)
INSERT [dbo].[GioHang] ([magiohang], [masp], [makhachhang], [soluong]) VALUES (176, 22, 35, 1)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HangSP] ON 

INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (2, N'Dell', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (3, N'Lenovo', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (4, N'Acer', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (5, N'Macbook', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (6, N'Thinkpad', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (7, N'Vivo', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (8, N'LG', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (9, N'Microsoft Surface', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (10, N'Asus', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (11, N'HP', 1)
INSERT [dbo].[HangSP] ([mahang], [tenhang], [trangthai]) VALUES (12, N'Huawei', 1)
SET IDENTITY_INSERT [dbo].[HangSP] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([makhachhang], [hoten], [diachi], [dienthoai], [email], [matkhau], [trangthai], [chucvu], [tinh], [huyen], [xa], [thon], [ngaydangky]) VALUES (6, N'Nguyễn Duy Đức', N'Nghệ An', N'0328739597     ', N'duyduc02@gmail.com                                                                                  ', N'ducduy2002', 0, 1, N'Nghệ An', N'Thanh Chương', N'Thanh Chi', N'Chi Thịnh', CAST(N'2024-04-10' AS Date))
INSERT [dbo].[KhachHang] ([makhachhang], [hoten], [diachi], [dienthoai], [email], [matkhau], [trangthai], [chucvu], [tinh], [huyen], [xa], [thon], [ngaydangky]) VALUES (34, N'Bui Anh Tuấn', N'0334563248', N'0334563248     ', N'tuanbuianh@gmail.com                                                                                ', N'123456    ', NULL, NULL, N'Nghệ An', N'Quỳ Hợp', N'Văn Lợi', N'Xóm Nam Trường', CAST(N'2024-05-14' AS Date))
INSERT [dbo].[KhachHang] ([makhachhang], [hoten], [diachi], [dienthoai], [email], [matkhau], [trangthai], [chucvu], [tinh], [huyen], [xa], [thon], [ngaydangky]) VALUES (35, N'Nguyễn Văn Tùng', N'0986176237     ', N'0986176237     ', N'nguyentung2002@gmail.com                                                                            ', N'tung2002  ', NULL, NULL, N'Nghệ An', N'Thanh Chương', N'Thanh Khai', N'thôn Văn Phạm', CAST(N'2024-05-14' AS Date))
INSERT [dbo].[KhachHang] ([makhachhang], [hoten], [diachi], [dienthoai], [email], [matkhau], [trangthai], [chucvu], [tinh], [huyen], [xa], [thon], [ngaydangky]) VALUES (36, N'Phan Văn Đức', N'0328729598     ', N'0328729598     ', N'phanvanduc100302@gmail.com                                                                          ', N'abcd1234  ', NULL, NULL, N'Nghệ An', N'Thanh Chương', N'Thanh Chi', N'Thôn Chi Thịnh', CAST(N'2024-05-14' AS Date))
INSERT [dbo].[KhachHang] ([makhachhang], [hoten], [diachi], [dienthoai], [email], [matkhau], [trangthai], [chucvu], [tinh], [huyen], [xa], [thon], [ngaydangky]) VALUES (37, N'Nguyễn Anh Hùng', NULL, NULL, N'hungnguyen2k@gmail.com                                                                              ', N'12345678  ', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-05-16' AS Date))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (20, 3, N'Laptop Lenovo Ideapad Gaming 3 15ACH6 82K2027QVN (AMD Ryzen 5 5500H | 8GB | 512GB | RTX 2050 | 15.6 inch FHD | Win 11 | Đen)', N'46501_laptop_lenovo_ideapad_gaming_3_15ach6_82k2027qvn__3_.jpg', 30, CAST(14790000 AS Decimal(18, 0)), N'Lenovo Ideapad Gaming 3 15ACH6 82K2027QVN là sự lựa chọn tuyệt vời cho những người yêu thích gaming và đòi hỏi hiệu suất mạnh mẽ mà không cần phải bỏ ra số tiền lớn. Với cấu hình ấn tượng và thiết kế tối giản, đây là một sự đầu tư đáng giá cho mọi người.', N'AMD Ryzen™ 5 5500Hz', N' 8 (1x8GB) SO-DIMM DDR4-3200 (nâng cấp tối đa 16GB)', N'Windows 11 Home SL', N'15.6" FHD (1920x1080) IPS 300nits Anti-glare, 45% NTSC, 144Hz', N'NVIDIA® GeForce RTX™ 2050 4GB GDDR6', N'512GB                                             ', 1, N'4C2XNQ21A9L')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (21, 3, N'Laptop Lenovo LOQ 15IRH8 82XV00QPVN (Intel Core i5-12450H | 16GB | 512GB | RTX 2050 | 15.6 inch FHD | Win 11 | Xám)', N'46405_laptop_lenovo_loq_15irh8_82xv00qpvn__2_.jpg', 11, CAST(18490000 AS Decimal(18, 0)), N'Cuộc đua trên thị trường laptop gaming ở năm 2023 này đang trở nên tàn khốc hơn bao giờ hết với sự tham gia của rất nhiều ông lớn. Và không thể chần chừ hơn được nữa, Lenovo đã và đang dấn sâu vào thị trường cạnh tranh khốc liệt này với những cải tiến mạnh mẽ về cả chất lượng, hiệu năng của máy cùng các công nghệ bên trong. Và ở phân khúc dưới 20 triệu, Lenovo LOQ 15IRH8 82XV00QPVN là một mẫu sản phẩm đang để bạn để mắt tới.', N'Intel Core i5-12450H (8 nhân 12 luồng, upto 4.4GHz, 12MB)', N'2x 8GB SO-DIMM DDR5-4800', N' Windows 11 Home', N'15.6 inch FHD (1920x1080) IPS 350nits Anti-glare, 45% NTSC, 144Hz, G-SYNC', N'NVIDIA® GeForce RTX 2050 4GB GDDR6', N' 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe              ', 1, N'9N7LJR3F2T8')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (22, 2, N'Laptop Dell Vostro 5630 THT7N (Core i7-1360P | 16GB | 512GB | RTX 2050 4GB | 16.0 inch FHD+ | Win 11 | Bạc)', N'dell1.jpg', 0, CAST(27690000 AS Decimal(18, 0)), N'Laptop Dell Vostro 5630 THT7N với cấu hình core i7 thế hệ 13 cùng màn hình 16inch sẽ là một sự lựa chọn đáng giá đem lại trải nghiệm tốt về cả làm việc lẫn giải trí đối với rất nhiều các anh chị em văn phòng cũng như các bạn học sinh sinh viên. Với thiết kế tối giản, kết cấu bền bỉ mang đặc trưng của thương hiệu Dell, người dùng hoàn toàn có thể yên tâm sử dụng chiếc laptop Dell Vostro lâu dài.', N'Intel® Core™ i7-1360P (18M Cache, Turbo Boost 5.0GHz)', N'16GB LPDDR5 4800MHz (RAM onboard)', N'Windows 11 Home + Office HS 2021', N'16.0 inch FHD+ WVA Anti-glare 16:10 250nits', N'NVIDIA RTX 2050 4GB GDDR6', N'512GB M.2 PCIe NVMe SSD                           ', 1, N'BP4WTH1X5M6')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (24, 2, N'Laptop Dell Vostro 3430 71011900 (Intel Core i5-1335U | 8GB | 512GB | Intel Iris Xe | 14 inch FHD | Win 11 | Office)', N'dell2.jpg', 25, CAST(15990000 AS Decimal(18, 0)), N'Laptop Dell Vostro 3430 71011900 là chiếc laptop mang kiểu dáng đặc trưng của phân khúc laptop văn phòng phù hợp cho nhiều đối tượng người dùng, đặc biệt là người dùng phổ thông. Sản phẩm ngoài sở hữu thiết kế trẻ trung, tối giản, thanh lịch thì còn được trang bị những linh kiện mới nhất cho hiệu năng mạnh mẽ cùng thiết kế bền bỉ, mẫu laptop Dell Vostro này chắc chắn sẽ là người bạn đồng hành đắc lực trong công việc cũng như cuộc sống bận rộn. ', N'Intel Core i5-1335U (tối đa 4.60 GHz, 12MB)', N'8GB (8GBx1) DDR4( 2 khe)', N'Windows 11 Home + Office Home Student 2021', N'14 inch FHD (1920x1080),WVA Anti-Glare', N' Intel Iris Xe Graphics có điều kiện khi sử dụng Dual RAM (với Ram 8GB : Intel UHD)', N'512GB SSD M.2 PCIe NVMe                           ', 1, N'C2D8FY7T3Q9')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (25, 2, N'Laptop Dell Inspiron 14 7430 i7U165W11SLU (Core i7 1355U | 16GB | 512GB | Intel Iris Xe | 14 inch FHD+ | Windows 11 Home | Bạc)', N'dell3.jpg', 2, CAST(27290000 AS Decimal(18, 0)), N' Laptop Dell Inspiron 14 7430 mang tới thiết kế đề cao tính mỏng nhẹ và di động, yếu tố luôn được giới văn phòng khá quan tâm, đặc biệt là đối tượng hay phải di chuyển nhiều. Với trọng lượng chỉ 1.57 kg,  Dell Inspiron 14 7430 sẵn sàng đồng hành cùng các bạn mọi lúc, mọi nơi và bất cứ khi nào các bạn cần. Được gia công cực kì tỉ mỉ mang tới chất lượng, độ hoàn thiện cũng như độ bền vượt trội. Toàn bộ phần vỏ ngoài của chiếc laptop được làm từ chất liệu nhôm dày dặn, cứng cáp và cực kì cao cấp. Đặc biệt về mặt thiết kế phải nhắc tới khả năng xoay gập cực kì linh hoạt và tiện lợi. Khả năng xoay gập 360 độ này giúp người dùng có thể thỏa sức sáng tạo để biến chiếc laptop trở nên thuận tiện nhất để các bạn có thể tăng cường hiệu quả công việc cũng như cải thiện trải nghiệm sử dụng của người dùng.', N'Intel Core i7 1355U (12M Cache, upto 5.00GHz)', N'16GB LPDDR5 4800MHz (RAM onboard)', N'Windows 11 Home SL', N'14 inch FHD+ (1920x1080) 250nits Anti-glare, Cảm ứng ( có kèm bút )', N' Intel Iris Xe Graphics', N'512GB M.2 PCIe NVMe SSD                           ', 1, N'4C2XNQ21A9LT5')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (26, 10, N'Laptop Asus Zenbook 14 OLED UX3402VA-KM203W (Intel Core I5-1340P | 16GB | 512GB | Intel Iris Xe | 14 inch OLED WQXGA+ | Win 11 | Bạc)', N'asus1.jpg', 28, CAST(22490000 AS Decimal(18, 0)), N'Định hình phong cách của bạn với ASUS Zenbook 14 OLED cùng thiết kế tinh tế và thanh lịch trong khung máy nhôm cao cấp với độ mỏng 16,9 mm và nhẹ 1,39 kg nhưng hoàn toàn hiện đại. Trải nghiệm hình ảnh hoàn hảo từ màn hình cảm ứng NanoEdge OLED 2.8K độ chính xác màu đạt chuẩn PANTONE® và gam màu 100% DCI-P3 đẳng cấp điện ảnh. Trang bị bộ xử lý Intel® Core™ thế hệ thứ 13, đồ họa Intel Iris® Xe mang lại hiệu suất vượt trội. Thiết kế mặt lưng sáng tạo lấy cảm hứng từ nghề thủ công Kintsugi độc đáo.     Hiển thị rực rỡ, sống động trên màn hình OLED 2.8K  Thiết kế NanoEdge viền siêu mỏng với tỷ lệ màn hình so với thân máy là 90% mang đến kiểu dáng vô cùng thanh lịch và nhỏ gọn trên ASUS Zenbook 14 OLED. Chất lượng hiển thị vượt trội với độ phân giải 2.8K cùng công nghệ OLED hàng đầu mang đến hình ảnh cực kỳ chi tiết với màu sắc sống động và độ chính xác màu vượt trội đạt chuẩn PANTONE®. Bảo vệ mắt tối đa với mức phát ánh sáng xanh thấp được chứng nhận từ SGS và TÜV Rheinland.', N'Intel Core i5-1340P (upto 4.60 GHz, 12MB)', N'16GB LPDDR5 on board', N'Windows 11 Home', N'14.0 inch OLED WQXGA+(2880x1800) BEND GLARE NON-TOUCH,400NITS, DCI-P3:100%, 90HZ', N'Intel Iris Xe Graphics', N'512GB M.2 NVMe™ PCIe® 4.0 SSD                     ', 1, N'BP4WTH1X5M6Q9')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (27, 10, N'Laptop Asus TUF Gaming F15 FX507ZC4-HN074W (Intel Core i5-12500H | 8GB | 512GB | RTX 3050 4GB | 15.6 inch FHD 144Hz | Win 11 | Xám)', N'asus2.jpg', 6, CAST(18790000 AS Decimal(18, 0)), N'Laptop Asus TUF Gaming F15 FX507ZC4-HN074W tuy chỉ là một chiếc laptop tầm trung có giá chưa tới 20 củ khoai nhưng lại có cấu hình khá ổn với bộ vi xử lý mạnh mẽ, card đồ họa chuyên dụng và màn hình tần số quét cao, một sự lựa chọn không thể tuyệt vời hơn dành cho người dùng cần một chiếc laptop gaming hiệu suất cao.  Cấu hình ngon trong tầm giá Laptop Asus TUF Gaming được trang bị bộ vi xử lý Intel Core i5 12500H, cho phép bạn dễ dàng xử lý các tác vụ nặng, đồng thời cung cấp đủ sức mạnh cho việc đa nhiệm và chạy các ứng dụng đòi hỏi nhiều tài nguyên như chơi game AAA ở mức cấu hình cao.', N'Intel Core i5-12500H (upto 4.50 GHz, 18MB)', N'8GB DDR4-3200 SO-DIMM (2 khe, tối đa 32GB)', N'Windows 11 Home', N'15.6-inch FHD (1920 x 1080) 16:9, 144Hz, Value IPS-level, NTSC 45%, SRGB 62.5%, anti-glare display', N' NVIDIA® GeForce RTX™ 3050 4GB GDDR6', N'512GB PCIe® 3.0 NVMe™ M.2 SSD                     ', 1, N'VR6SD4T8W5X')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (28, 11, N'Laptop HP 14S-dq5100TU 7C0Q0PA (Core i5-1235U | 8GB | 256GB | Intel Iris Xe | 14 inch FHD | Win 11 | Bạc)', N'hp1.jpg', 22, CAST(13290000 AS Decimal(18, 0)), N'Laptop HP 14S-dq5100TU 7C0Q0PA Là dòng sản phẩm laptop – máy tính xách tay hiệu năng mạnh mẽ tới từ thương hiệu laptop HP, HP 14S-dq5100TU 7C0Q0PA cho phép bạn thực hiện các tác vụ một cách mượt mà, trơn tru và hiệu quả. Cùng An Phát Computer tìm hiểu thêm các thông tin chi tiết về sản phẩm này! Laptop HP 14S-dq5100TU 7C0Q0PA sở hữu một vẻ ngoài tối giản với những đường bo mềm mại ở góc máy. Bao phủ khắp thiết bị là gam màu Bạc trang nhã, không bao giờ lỗi thời cho bạn thêm phần cảm hứng khi làm việc. Phần viền màn hình thu hẹp siêu mỏng giúp cho kích thước tổng thể vô cùng nhỏ gọn, mang đến tính di động tối ưu. Mặc dù là một chiếc laptop 14inch nhưng máy vẫn rất nhẹ nhàng để bạn mang đi bất cứ đâu với trọng lượng chỉ 1,46kg cùng độ mỏng 1,79cm.', N'Intel Core i5-1235U (12MB, up to 4.40GHz)', N'8GB (2 x 4GB) DDR4-3200 MHz (2 khe, tối đa 32GB)', N'Windows 11 Home SL', N'14 inch FHD (1920 x 1080), micro-edge, anti-glare, 250 nits, 45% NTSC', N'Intel Iris Xe Graphics', N'256GB PCIe® NVMe™ M.2 SSD                         ', 1, N'M7PQ9Z1V2S3')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (29, 11, N'Laptop HP ENVY X360 13-bf0112TU 7C0N9PA (Intel Core i5-1230U | 16GB | 512GB | Intel Iris Xe | 13.3 inch 2.8K | Cảm ứng | Win 11 | Bạc)', N'hp2.jpg', 29, CAST(23990000 AS Decimal(18, 0)), N'Laptop HP ENVY X360 13-bf0112TU 7C0N9PA là một trong những chiếc máy 2 trong 1 được yêu thích nhất hiện nay. Tiện lợi hơn với màn hình cảm ứng, di động hơn với thiết kế mỏng nhẹ, hiệu quả hơn với hiệu năng mạnh mẽ, giải trí đỉnh cao hơn với màn hình sắc nét,... Em máy này hứa hẹn sẽ đồng hành cùng bạn để tạo nên năng suất và chất lượng công việc.', N'Intel Core i5-1230U (upto 4.40 GHz, 12MB)', N'16GB DDR4 4266 MHz onboard', N'Windows 11 Home', N'13.3 inch 2.8K (2880 x 1800), OLED, UWVA, edge-to-edge glass, micro-edge, Corning® Gorilla® Glass NBT™, Low Blue Light, SDR 400 nits, HDR 500 nits, 100% DCI-P3 Cảm ứng (có bút)', N'Intel Iris Xe Graphics', N'512GB PCIe Gen4 NVMe TLC M.2 SSD                  ', 1, N'JR2WX3P6M7T')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (30, 8, N'Laptop LG Gram Style 2023 14Z90RS-G.AH54A5 (Intel Core i5-1340P | 16GB | 512GB | Intel Iris Xe | 14-inch WQXGA+ | Win 11 | Trắng)', N'lg1.jpg', 20, CAST(28900000 AS Decimal(18, 0)), N'LG Gram được biết đến như dòng Laptop cao cấp siêu mỏng nhẹ tới từ thương hiệu LG. Năm 2023, dòng sản phẩm đã quay trở lại với nhiều sự cải tiến mới. Cùng tìm hiểu về chiếc LG Gram 2023 14Z90RS-G.AH54A5 ngay dưới đây. Laptop mỏng nhẹ cùng với hiệu suất mạnh mẽ, LG gram mang đến cho bạn khả năng di động cao và năng suất làm việc tuyệt vời. Có trọng lượng 999 gram và kích thước 31.16 cm x 21.39 cm x 1.59 cm, LG Gram 2023 14Z90RS-G.AH54A5 lọt vào Top những chiếc Laptop nhỏ gọn nhất thời điểm hiện tại. Dù ngoại hình trông có vẻ mỏng manh nhưng LG gram đã vượt qua 7 bài kiểm tra độ bền quân sự Mỹ MIL-STD-810H cực kỳ khắt khe. Được làm từ vật liệu siêu nhẹ nhưng bền - magnesium, laptop LG gram đảm bảo độ mạnh mẽ cũng như tính di động cao.', N'Intel Core i5-1340P (12 Cores: 4P + 8E, P: 1.9 up to 4.6 GHz / E: 1.4 up to 3.4 GHz), 12MB', N'16GB LPDDR5 (Dual Channel, 6000MHz)', N'Windows 11 Home', N'14-inch WQXGA+ (2880*1800)16:10 Anti Glare Low Refrection, OLED, 90Hz, 0.2ms, DCI-P3 99% (Typical, min 95%), 400nit, 1,000,000 :1', N' Intel Iris Xe Graphics', N'512GB NVMe Gen 4 SSD                              ', 1, N'H8J3KL5Q8V2')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (31, 6, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001 (Core™ i5-12500H | 8GB | 512GB | RTX™ 3050 4GB | 15.6 inch FHD | Win 11 | Đen)', N'acer1.jpg', 21, CAST(23900000 AS Decimal(18, 0)), N'Trong thời gian trở lại đây, thương hiệu Laptop Acer vừa cho ra mắt mẫu laptop gaming Acer Nitro 5 Tiger phiên bản hoàn toàn mới gây "sốt" công động gaming. Chiếc laptop gaming siêu hot này đã được nâng cấp mạnh mẽ về cả thiết kế ngoại hình cho tới cấu hình với bộ vi xử lý Intel thế hệ thứ 12 mới nhất  cùng card đồ họa RTX 30 series. Tất cả kết hợp lại và chúng ta đã có một siêu phẩm laptop gaming đáng sở hữu nhất trong năm 2022.  An Phát PC xin giới thiệu trong bài viết này sản phẩm Laptop Gaming Acer Nitro 5 Tiger AN515-58-52SP NH.QFHSV.001, với mức giá chỉ chưa tới 25 triệu đồng, các bạn sẽ có ngay một "chiến binh" bên cạnh, luôn sẵn sàng để đồng hành cùng các bạn xử lý mọi tác vụ đồ hoạ hay chinh phục mọi chiến trường ảo!', N'Intel® Core™ i5-12500H (upto 4.50 GHz, 18MB)', N'8GB khe rời DDR4 3200MHz (2 khe, tối đa 32GB)', N'Windows 11 Home', N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel, Acer ComfyView LED-backlit TFT LCD', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', N'512GB PCIe NVMe SED SSD cắm sẵn                   ', 1, N'F6T7G2M9P1W')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (51, 3, N'Laptop Lenovo Yoga Slim 7 14IMH9 83CV001UVN (Intel Core Ultra 7 155H | 512GB | 32GB | Intel Arc | 14 inch WUXGA OLED | Win 11 | Office | Xám)', N'lenovo1.jpg', 14, CAST(27990000 AS Decimal(18, 0)), N'Là một trong những ông lớn đứng đầu ngành đồ công nghệ, Lenovo luôn luôn xuất hiện với những dòng sản phẩm mới vô cùng ấn tượng và phù hợp với nhu cầu khách hàng. Sản xuất máy tính cá nhân là một trong những ngành trọng điểm của Lenovo và trong lần trình làng mới này, nhà sản xuất đã cho ra mắt chiếc Laptop Lenovo Yoga Slim 7 14IMH9 83CV001UVN (Intel Core Ultra 7 155H | 512GB | 32GB | Intel Arc | 14 inch WUXGA OLED | Win 11 | Office | Xám), đặc biệt phù hợp với dân văn phòng cùng những thông số kỹ thuật hiện đại đáng bất ngờ. Xuất hiện với cân nặng là 1.39 kg và kích thước 312 x 221 x 14.9 mm, cùng màu sắc quen thuộc - màu xám sang trọng mang đến cho người dùng một sản phẩm với ngoại hình ưa nhìn, nhỏ gọn, đặc biệt dễ dàng mang theo bên mình với những khách hàng thường xuyên di chuyển.', N'Intel Core Ultra 7 155H (16 nhân 22 luồng, up to 4.8Ghz, 24MB)', N'32GB Soldered LPDDR5x-7467', N'Windows 11 Home Single Language', N'14 inch WUXGA (1920x1200) OLED 400nits Glossy, 100% DCI-P3, 60Hz, Eyesafe®, Dolby® Vision™, DisplayHDR™ True Black 500', N'Integrated Intel® Arc™ Graphics', N'512GB SSD M.2 2242 PCIe® 4.0x4 NVMe               ', 1, N'DSH9F6XL2P4')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (52, 8, N'Laptop LG Gram 2023 17ZD90R-G.AX73A5 (Core i7-1360P | 16GB | 256GB | Intel Iris Xe | 17 inch WQXGA | Grey)', N'lg2.jpg', 7, CAST(33990000 AS Decimal(18, 0)), N'Laptop LG Gram 2023 17ZD90R-G.AX73A5 Siêu phẩm Laptop mỏng nhẹ LG Gram được biết đến như dòng Laptop cao cấp siêu mỏng nhẹ tới từ thương hiệu LG. Năm 2023, dòng sản phẩm đã quay trở lại với nhiều sự cải tiến mới. Cùng tìm hiểu về chiếc Laptop LG Gram 2023 17ZD90R-G.AX73A5 ngay dưới đây.  Siêu nhẹ nhưng siêu mạnh Laptop mỏng nhẹ cùng với hiệu suất mạnh mẽ, LG gram mang đến cho bạn khả năng di động cao và năng suất làm việc tuyệt vời. Có trọng lượng 1.350Kg và kích thước 37.88 cm x 25.88 cm x 1.78 cm, Laptop LG Gram 2023 17ZD90R-G.AX73A5 lọt vào Top những chiếc Laptop nhỏ gọn nhất thời điểm hiện tại.', N'Intel Core i7-1360P (up to 5.0 GHz, 18MB)', N'16GB LPDDR5 (Dual Channel, 6000MHz)', N'Non-OS', N'17 inch WQXGA (2560 x 1600), 16:10, IPS Non Touch, 350nits, Anti-Glare, DCI-P3 99% (Thông thường), Tối thiểu 95%', N'Intel Iris Xe Graphics', N'256GB PCIe® NVMe™ M.2 SSD                         ', 1, N'VR6SD4T8W')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (53, 8, N'Laptop LG Gram 2023 2 in 1 - 14T90R-G.AH55A5 (Intel Core i5-1340P | 16GB | 512GB | Intel Iris Xe | 14-inch WUXGA | Cảm ứng | Win 11 | Đen)', N'lg3.jpg', 3, CAST(27999000 AS Decimal(18, 0)), N'Laptop LG Gram 2023 16ZD90R-G.AX55A5 Siêu phẩm Laptop mỏng nhẹ LG Gram được biết đến như dòng Laptop cao cấp siêu mỏng nhẹ tới từ thương hiệu LG. Năm 2023, dòng sản phẩm đã quay trở lại với nhiều sự cải tiến mới. Cùng tìm hiểu về chiếc Laptop LG Gram 2023 16ZD90R-G.AX55A5 ngay dưới đây.  Siêu nhẹ nhưng siêu mạnh Laptop mỏng nhẹ cùng với hiệu suất mạnh mẽ, LG gram mang đến cho bạn khả năng di động cao và năng suất làm việc tuyệt vời. Có trọng lượng 1.199Kg và kích thước 35.51 cm x 24.23 cm x 1.68 cm, Laptop LG Gram 2023 16ZD90R-G.AX55A5 lọt vào Top những chiếc Laptop nhỏ gọn nhất thời điểm hiện tại.', N'Intel Core i5-1340P (12 Cores: 4P + 8E, P: 1.9 up to 4.6 GHz / E: 1.4 up to 3.4 GHz), 12MB', N'16GB LPDDR5 (Dual Channel, 5200MHz)', N'Windows 11 Home', N'14-inch WUXGA (1920*1200) 16:10 Anti Glare, IPS cảm ứng, có hỗ trợ bút LG Pen Wacom, 60Hz, 0.2ms, DCI-P3 99% (Typical, min 95%), 350nit, 1200:1', N'Intel Iris Xe Graphics', N'512GB NVMe Gen 4 SSD                              ', 1, N'M7PQ9Z1V2')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (54, 12, N'Laptop HUAWEI MATEBOOK 14 - 6941487271238 (Core i5 –1240P | 16GB | 512GB | Iris® Xe Graphics | 14 inch 2K | Window 11 Home | Xám)', N'huawei1.jpg', 5, CAST(15990000 AS Decimal(18, 0)), N'Huawei MateBook D16 đã chính thức được giới thiệu đến thị trường Việt Nam, đây là  một sự nâng cấp khá nhiều của chiếc D15 với màn hình lớn hơn, cấu hình mạnh mẽ hơn, thời lượng pin khủng hơn....cho hiệu năng mạnh mẽ cùng giá thành phải chăng. Điểm nhấn của Laptop Huawei mới này là sở hữu màn hình có kích thước lên đến 16 inch cùng tỷ lệ 16:10, cấu hình trang bị chip intel thế hệ 12 mới nhất với nhiều trang bị và tính năng hấp dẫn hơn. Hãy cùng tìm hiểu sản phẩm laptop - máy tính xách tay HUAWEI MATEBOOK D16 trong bài viết dưới đây của An Phát PC nhé!  Thiết kế mỏng nhẹ sang trọng MateBook D16 ở phân khúc tầm trung nhưng sở hữu độ hoàn thiện vượt trội, được một thiết kế theo ngôn ngữ đơn giản, phần khung vỏ sẽ là kim loại mang lại cảm giác chắc chắn, gần như không có một chút ọp ẹp nào. Từng đường nét, đường cắt khá tinh tế, phần mặt A có vẻ nhôm được làm khá mỏng, nổi bật chữ Huawei đơn giản đặt ở giữa, khá to nhưng tổng thể vẫn khá hài hòa.  Máy có độ dày 18.4mm, kích thước 3 chiều lần lượt là 35.6 x24.8 x 1.8 cm và trọng lượng khoảng 1.7kg khá nhẹ nhàng so với nhiều sản phẩm laptop 16 inch khác, giúp chiếc máy có thể dễ dàng bỏ vào trong túi xách hay balo, tăng cường thêm tính di động.', N'Intel® Core i5-12450H (3.3 Ghz upto 4.40 GHz, 12MB)', N'16GB', N'Window 11 Home', N'16 inch FHD (1920 x 1080), Độ bao phủ màu 100% sRGB, Tỷ lệ màn hình 16:10, Tỷ lệ màn hình so với thân máy 90%, 300 Nits, Chứng nhận TUV Rheinland giảm ánh sáng, DC Dimming.', N'Intel® Iris® Xe Graphics', N'512GB PCle NVMe SSD                               ', 1, N'JR2WX3P6M')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (55, 11, N'Laptop HP 15s fq5231TU 8U241PA (Intel Core i3 1215U | 8GB | 256GB | 15.6FHD | Intel UHD Graphics | W11SL | BẠC)', N'hp3.jpg', 22, CAST(9990000 AS Decimal(18, 0)), N'Laptop HP 15s fq5231TU 8U241PA Với độ phủ sóng trên toàn thế giới, HP luôn luôn xuất hiện với những dòng sản phẩm mới vô cùng ấn tượng và phù hợp với nhu cầu khách hàng. Không chỉ đầu tư phát triển các dòng máy in, các vật tư liên quan đến in ấn như in 3D, HP còn đặc biệt đầu tư sản xuất máy tính cá nhân. Trong lần trình làng mới này, nhà sản xuất đã cho ra mắt chiếc Laptop HP 15s fq5231TU 8U241PA (Intel Core i3 1215U | 8GB | 256GB | 15.6FHD | Intel UHD Graphics | W11SL | BẠC), đặc biệt phù hợp với dân văn phòng cùng những thông số kỹ thuật hiện đại đáng bất ngờ.      Xuất hiện với màu sắc quen thuộc - màu bạc sang trọng, kết hợp cùng cân nặng, kích thước lần lượt là 1.47 kg và 35,85 x 24,2 x 1,79 cm mang đến cho người dùng một sản phẩm với ngoại hình ưa nhìn, nhỏ gọn, đặc biệt dễ dàng mang theo bên mình với những khách hàng thường xuyên di chuyển.', N'Intel Core i3-1215U (up to 4.4 GHz, 10MB L3 cache, 6 cores, 8 threads)', N'8GB DDR4-3200 MHz RAM (1 x 8GB)', N'Windows 11 Home SL', N'15.6 inch FHD (1920 x 1080), micro-edge, anti-glare, 250 nits, 45% NTSC', N'Intel UHD Graphics', N'256GB PCIe NVMe M.2 SSD                           ', 1, N'H8J3KL5Q8')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (56, 2, N'Laptop Dell Latitude 5440 L54401335U16512G (Intel Core i5-1335U | 16GB | 512GB | 14 inch FHD | Ubuntu)', N'dell4.jpg', 6, CAST(24990000 AS Decimal(18, 0)), N'Laptop Dell Latitude 5440 L54401335U16512G Laptop Dell Latitude 5440 L54401335U16512G là một trong những sản phẩm mới nhất trong dòng Latitude của Dell, hướng đến người dùng doanh nhân và người dùng cá nhân đang tìm kiếm một chiếc máy tính xách tay mạnh mẽ và bền bỉ. Với cấu hình và tính năng ấn tượng, chiếc laptop Dell này hứa hẹn mang lại trải nghiệm đáng giá.  Dell Latitude 5440 L54401335U16512G được thiết kế với sự tập trung vào tính tiện dụng và bền bỉ. Với trọng lượng chỉ 1.36kg, chiếc laptop này dễ dàng mang đi bất kỳ đâu mà bạn muốn. Khung máy bằng hợp kim nhôm cứng cáp và sự chắc chắn trong từng đường nét của thiết kế khiến nó trở thành một lựa chọn tốt cho những người thường xuyên di chuyển.  Laptop này trang bị một bàn phím chiclet tiêu chuẩn có độ hành trình phím tốt. Phím có kích thước lý tưởng và khoảng cách giữa các phím được thiết kế rộng rãi, giúp bạn gõ văn bản một cách thoải mái và nhanh chóng. Bàn phím cũng có đèn nền, cho phép bạn làm việc trong điều kiện ánh sáng yếu mà không gặp khó khăn.', N'Intel Core i5-1335U (upto 4.60 GHz, 12MB)', N'16GB DDR4', N'Ubuntu Linux', N'14.0 inch FHD (1920x1080) Non-Touch, AG, IPS, 250 nits', N'Intel Iris Xe Graphics có điều kiện khi sử dụng Dual RAM', N'512GB M.2, PCIe NVMe SSD                          ', 1, N'F6T7G2M9P')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (58, 8, N'Laptop LG Gram 2023 16ZD90R-G.AX55A5 (Hàng Giá Sốc)', N'lg3.jpg', 4, CAST(29900000 AS Decimal(18, 0)), N'Laptop LG Gram 2023 16ZD90R-G.AX55A5 Siêu phẩm Laptop mỏng nhẹ LG Gram được biết đến như dòng Laptop cao cấp siêu mỏng nhẹ tới từ thương hiệu LG. Năm 2023, dòng sản phẩm đã quay trở lại với nhiều sự cải tiến mới. Cùng tìm hiểu về chiếc Laptop LG Gram 2023 16ZD90R-G.AX55A5 ngay dưới đây.  Siêu nhẹ nhưng siêu mạnh Laptop mỏng nhẹ cùng với hiệu suất mạnh mẽ, LG gram mang đến cho bạn khả năng di động cao và năng suất làm việc tuyệt vời. Có trọng lượng 1.199Kg và kích thước 35.51 cm x 24.23 cm x 1.68 cm, Laptop LG Gram 2023 16ZD90R-G.AX55A5 lọt vào Top những chiếc Laptop nhỏ gọn nhất thời điểm hiện tại.', N'Intel Core i5-1340P (up to 4.6 GHz, 12MB)', N'16GB LPDDR5 (Dual Channel, 6000MHz)', N'Non-OS', N'Màn hình: 16 inch WQXGA (2560 x 1600), 16:10, IPS Non Touch, 350nits, Anti-Glare, DCI-P3 99% (Thông thường), Tối thiểu 95%', N'Intel Iris Xe Graphics', N'512GB PCIe® NVMe™ M.2 SSD                         ', 1, N'DSH9F6XL2')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (59, 8, N'Laptop LG Gram 2023 14Z90R-G.AH53A5 (Core i5-1340P | 16GB | 256GB | Intel Iris Xe | 14 inch WUXGA | Win 11 | Grey)', N'lg5.jpg', 4, CAST(23990000 AS Decimal(18, 0)), N'Laptop LG Gram 2023 14Z90R-G.AH53A5 Siêu phẩm Laptop mỏng nhẹ LG Gram được biết đến như dòng Laptop cao cấp siêu mỏng nhẹ tới từ thương hiệu LG. Năm 2023, dòng sản phẩm đã quay trở lại với nhiều sự cải tiến mới. Cùng tìm hiểu về chiếc Laptop LG Gram 2023 14Z90R-G.AH53A5  ngay dưới đây.  Siêu nhẹ nhưng siêu mạnh Laptop mỏng nhẹ cùng với hiệu suất mạnh mẽ, LG gram mang đến cho bạn khả năng di động cao và năng suất làm việc tuyệt vời. Có trọng lượng chưa tới 1kg và kích thước 31.2 cm x 21.39 cm x 1.68 cm, Laptop LG Gram 2023 14Z90R-G.AH53A5 lọt vào Top những chiếc Laptop nhỏ gọn nhất thời điểm hiện tại.', N'Intel Core i5-1340P (up to 4.60 GHz, 12MB)', N'16GB LPDDR5 (Dual Channel, 6000MHz)', N'Windows 11 Home', N'14 inch WUXGA (1920 x 1200), 16:10, IPS Non Touch, 350nits, Anti-Glare, DCI-P3 99% (Thông thường), Tối thiểu 95%', N'Intel Iris Xe Graphics', N'256GB PCIe® NVMe™ M.2 SSD                         ', 1, N'C2D8FY7T3')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (60, 12, N'Laptop HUAWEI MATEBOOK 14 - 6941487271238 (Core i5 –1240P | 16GB | 512GB | Iris® Xe Graphics | 14 inch 2K | Window 11 Home | Xám)', N'huawei2.jpg', 7, CAST(15590000 AS Decimal(18, 0)), NULL, N'Intel® Core i5 – 1240P (3.30 GHz upto 4.40 GHz, 12MB)', N'16GB', N'Window 11 Home', N'14 inch 2K (2160x1440), Độ bao phủ màu 100% sRGB, Tỷ lệ màn hình 3:2, Tỷ lệ màn hình so với thân máy 90%, 300 Nits, Chứng nhận TUV Rheinland giảm ánh sáng, DC Dimming.', N' Intel® Iris® Xe Graphics', N'512GB PCle NVMe SSD                               ', 1, N'BP4WTH1X5')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (61, 12, N'Laptop HUAWEI MATEBOOK D16 - 6941487268597 (Intel Core i5-12450H | 16GB | 512GB | Intel Iris Xe | 16 inch FHD | Win 11 + Office Home Student | Bạc)', N'huawei3.jpg', 2, CAST(17990000 AS Decimal(18, 0)), N'Huawei MateBook D16 đã chính thức được giới thiệu đến thị trường Việt Nam, đây là  một sự nâng cấp khá nhiều của chiếc D15 với màn hình lớn hơn, cấu hình mạnh mẽ hơn, thời lượng pin khủng hơn....cho hiệu năng mạnh mẽ cùng giá thành phải chăng. Điểm nhấn của Laptop Huawei mới này là sở hữu màn hình có kích thước lên đến 16 inch cùng tỷ lệ 16:10, cấu hình trang bị chip intel thế hệ 12 mới nhất với nhiều trang bị và tính năng hấp dẫn hơn. Hãy cùng tìm hiểu sản phẩm laptop - máy tính xách tay HUAWEI MATEBOOK D16 trong bài viết dưới đây của An Phát PC nhé! Thiết kế mỏng nhẹ sang trọng MateBook D16 ở phân khúc tầm trung nhưng sở hữu độ hoàn thiện vượt trội, được một thiết kế theo ngôn ngữ đơn giản, phần khung vỏ sẽ là kim loại mang lại cảm giác chắc chắn, gần như không có một chút ọp ẹp nào. Từng đường nét, đường cắt khá tinh tế, phần mặt A có vẻ nhôm được làm khá mỏng, nổi bật chữ Huawei đơn giản đặt ở giữa, khá to nhưng tổng thể vẫn khá hài hòa.  Máy có độ dày 18.4mm, kích thước 3 chiều lần lượt là 35.6 x24.8 x 1.8 cm và trọng lượng khoảng 1.7kg khá nhẹ nhàng so với nhiều sản phẩm laptop 16 inch khác, giúp chiếc máy có thể dễ dàng bỏ vào trong túi xách hay balo, tăng cường thêm tính di động.', N'Intel® Core i5-12450H (3.3 Ghz upto 4.40 GHz, 12MB)', N'16GB', N'Window 11 Home + Office Home & Student', N'16 inch FHD (1920 x 1080), Độ bao phủ màu 100% sRGB, Tỷ lệ màn hình 16:10, Tỷ lệ màn hình so với thân máy 90%, 300 Nits, Chứng nhận TUV Rheinland giảm ánh sáng, DC Dimming.', N'Intel® Iris® Xe Graphics', N'512GB PCle NVMe SSD                               ', 1, N'9N7LJR3F2')
INSERT [dbo].[SanPham] ([masp], [mahang], [tensp], [hinhanh], [soluong], [giaban], [mota], [CPU], [RAM], [OS], [manhinh], [carddohoa], [SSD], [trangthai], [model]) VALUES (62, 10, N'Laptop Asus Vivobook 15 OLED A1505VA-L1114W (Core i5-13500H | 16GB | 512GB | Iris Xe Graphics | 15.6inch FHD | Windows 11 SL | Đen)', N'asus3.jpg', 5, CAST(17490000 AS Decimal(18, 0)), N'Laptop Asus Vivobook 15 OLED A1505VA-L1114W ASUS Vivobook 14/15 OLED  Tuyên ngôn sức mạnh. Sống động thị giác     Tỏa sáng với cả thế giới cùng ASUS Vivobook 14/15 OLED mạnh mẽ, chiếc laptop tích hợp nhiều tính năng với màn hình OLED rực rỡ, gam màu DCI-P3 đẳng cấp điện ảnh. Mọi thứ trở nên dễ dàng hơn nhờ những tiện ích thân thiện với người dùng bao gồm bản lề mở phẳng 180°, nắp che webcam vật lý và các phím chức năng chuyên dụng. Bảo vệ sức khỏe an toàn với ASUS kháng khuẩn Guard Plus trên các bề mặt thường xuyên chạm vào. Bắt đầu ngày mới đầy hứng khởi với ASUS Vivobook 14/15 OLED! Hiệu năng mạnh mẽ hàng đầu phân khúc  ASUS Vivobook 14/15 OLED giúp bạn hoàn thành mọi tác vụ một cách nhanh chóng ở bất cứ đâu, dù ở cơ quan, ở nhà hay khi đi ra ngoài. Bộ vi xử lý Intel® Core™ thế hệ thứ 13 cùng bộ nhớ RAM DDR4 lên đến 16GB, bộ nhớ SSD lên đến 1TB và công nghệ kết nối WiFi 6E tiên tiến giúp mọi thứ trở nên dễ dàng.', N'Intel® Core™ i5-13500H (upto 4.70GHz, 18MB)', N'16GB DDR4 3200MHz', N'Windows 11 SL', N'15.6inch FHD (1920 x 1080) OLED 16:9 aspect ratio, 600nits, 100% DCI-P3 color gamut', N'Intel® Iris Xe Graphics', N'512GB M.2 NVMe™ PCIe® 3.0 SSD                     ', 1, N'4C2XNQ21A')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([matintuc], [tieude], [hinhanh], [ngaytao], [gioithieu], [trangthai], [makhachhang], [noidung]) VALUES (12, N'gdfgdfssss', N'lg3.jpg', CAST(N'0001-01-01' AS Date), N'dfgsssfgh', 1, 6, N'sdfgsd')
INSERT [dbo].[TinTuc] ([matintuc], [tieude], [hinhanh], [ngaytao], [gioithieu], [trangthai], [makhachhang], [noidung]) VALUES (13, N'Laptop gaming', N'hp3.jpg', CAST(N'0001-01-01' AS Date), N'dsfsd', 1, 6, N'sdfsdf')
INSERT [dbo].[TinTuc] ([matintuc], [tieude], [hinhanh], [ngaytao], [gioithieu], [trangthai], [makhachhang], [noidung]) VALUES (14, N'fgh', N'asus3.jpg', CAST(N'0001-01-01' AS Date), N'dgf', 1, 6, N'nguyên duy dsadfasdf')
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_ngaydat]  DEFAULT (getdate()) FOR [ngaydat]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_trangthai]  DEFAULT ((0)) FOR [trangthai]
GO
ALTER TABLE [dbo].[HangSP] ADD  CONSTRAINT [DF_HangSP_trangthai]  DEFAULT ((1)) FOR [trangthai]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_KhachHang_trangthai]  DEFAULT ((1)) FOR [trangthai]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_KhachHang_chucvu]  DEFAULT ((1)) FOR [chucvu]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_KhachHang_ngaydangky]  DEFAULT (getdate()) FOR [ngaydangky]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_trangthai]  DEFAULT ((1)) FOR [trangthai]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([makhachhang])
REFERENCES [dbo].[KhachHang] ([makhachhang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DonHangChiTiet_DonHang] FOREIGN KEY([madonhang])
REFERENCES [dbo].[DonHang] ([madonhang])
GO
ALTER TABLE [dbo].[DonHangChiTiet] CHECK CONSTRAINT [FK_DonHangChiTiet_DonHang]
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DonHangChiTiet_SanPham] FOREIGN KEY([masp])
REFERENCES [dbo].[SanPham] ([masp])
GO
ALTER TABLE [dbo].[DonHangChiTiet] CHECK CONSTRAINT [FK_DonHangChiTiet_SanPham]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_KhachHang] FOREIGN KEY([makhachhang])
REFERENCES [dbo].[KhachHang] ([makhachhang])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_KhachHang]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([masp])
REFERENCES [dbo].[SanPham] ([masp])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HangSP] FOREIGN KEY([mahang])
REFERENCES [dbo].[HangSP] ([mahang])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_HangSP]
GO
USE [master]
GO
ALTER DATABASE [DoAn] SET  READ_WRITE 
GO
