CREATE DATABASE QL_ThuCung
GO
USE QL_ThuCung
GO
ALTER DATABASE QL_ThuCung SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE QL_ThuCung SET ANSI_NULLS OFF 
GO
ALTER DATABASE QL_ThuCung SET ANSI_PADDING OFF 
GO
ALTER DATABASE QL_ThuCung SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE QL_ThuCung SET ARITHABORT OFF 
GO
ALTER DATABASE QL_ThuCung SET AUTO_CLOSE OFF 
GO
ALTER DATABASE QL_ThuCung SET AUTO_SHRINK OFF 
GO
ALTER DATABASE QL_ThuCung SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE QL_ThuCung SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE QL_ThuCung SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE QL_ThuCung SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE QL_ThuCung SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE QL_ThuCung SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE QL_ThuCung SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE QL_ThuCung SET  ENABLE_BROKER 
GO
ALTER DATABASE QL_ThuCung SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE QL_ThuCung SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE QL_ThuCung SET TRUSTWORTHY OFF 
GO
ALTER DATABASE QL_ThuCung SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE QL_ThuCung SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE QL_ThuCung SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE QL_ThuCung SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE QL_ThuCung SET RECOVERY FULL 
GO
ALTER DATABASE QL_ThuCung SET  MULTI_USER 
GO
ALTER DATABASE QL_ThuCung SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE QL_ThuCung SET DB_CHAINING OFF 
GO
ALTER DATABASE QL_ThuCung SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE QL_ThuCung SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE QL_ThuCung SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_ThuCung', N'ON'
GO
ALTER DATABASE QL_ThuCung SET QUERY_STORE = OFF
GO
USE QL_ThuCung
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdmin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifedBy] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*====================================================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*====================================================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giong](
	[MaLoai] [int] NOT NULL,
	[MaGiong] [int] IDENTITY(1,1) NOT NULL,
	[TenGiong] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Giong] PRIMARY KEY CLUSTERED 
(
	[MaGiong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*====================================================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuCung](
	[MaTC] [int] IDENTITY(1,1) NOT NULL,
	[TenTC] [nvarchar](50) NULL,
	[GiaBan] [decimal](18, 0)NOT NULL,
	[GioiThieu] [nvarchar](max) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
	[AnhBia] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaGiong] [int] NULL,
	[MaLoai] [int] NULL,
	[Moi] [bit] NOT NULL,
 CONSTRAINT [PK_ThuCung] PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/*====================================================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[MaKH] [int] NULL,
	[NguoiNhan] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[SoDT] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*====================================================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDH] [int] NOT NULL,
	[MaTC] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ThanhTien] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*====================================================================================*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[XacNhanMK] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [nvarchar](20) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*====================================================================================*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Content] [ntext] NOT NULL,
	[CreateDate] [datetime]  NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*====================================================================================*/
CREATE TRIGGER CapNhapThanhTien
on ChiTietDonHang
for insert
as
	update ChiTietDonHang
	set THANHTIEN =(select ThuCung.GiaBan * ChiTietDonHang.SoLuong from ThuCung where ChiTietDonHang.MaTC = ThuCung.MaTC )
	where MaDH = (select MaDH from inserted)
go

CREATE TRIGGER CapNhapSoLuongThuCung
ON ChiTietDonHang 
FOR INSERT
AS
	UPDATE ThuCung
	set SoLuongTon = ThuCung.SoLuongTon - (SELECT SoLuong FROM inserted)
	where MaTC = (select MaTC from inserted)
GO
/*===========================Mã Hash = 123=========================================================*/
SET IDENTITY_INSERT [dbo].[UserAdmin] ON 
INSERT [dbo].[UserAdmin] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifedBy], [Status]) 
VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', N'Dinh Phat Tai', N'Ấp 3 Long Cang, Cần Đước, Long An', N'phattai30092001@gmail.com', N'0359975249', NULL, NULL, NULL, 1)
INSERT [dbo].[UserAdmin] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifedBy], [Status]) 
VALUES (2, N'admin2', N'202cb962ac59075b964b07152d234b70', N'Nguyen Thi A', N'Ấp 1 Long Cang, Cần Đước, Long An', N'nguyenthia@gmail.com', N'0123456789', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserAdmin] OFF

/*====================================================================================*/
SET IDENTITY_INSERT [dbo].[Loai] ON 
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (1, N'Chó')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (2, N'Mèo')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (3, N'Chim')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (4, N'Hamster')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (5, N'Cá')

SET IDENTITY_INSERT [dbo].[Loai] OFF

/*====================================================================================*/
SET IDENTITY_INSERT [dbo].[Giong] ON 
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (1,
1, 
N'Chó Husky',
N'Chó Husky là một giống chó tuyết có nguồn gốc từ Sibir, Nga.
Husky có vẻ đẹp quyến rũ, thân hình dũng mãnh, sức khỏe dẻo dai phi thường.
Là giống chó hiền lành, rất tình cảm, hay tò mò, ưa vận động, rất thích người và đặc biệt thân thiện với trẻ em. 
Ở Việt Nam, chó Husky rất được yêu thích và được săn đón bởi đông đảo những người yêu chó.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (1,
2,
N'Chó Corgi',
N'Chó Corgi là một giống chó nhỏ, chân ngắn nhưng thân dài, đuôi cụt và một đôi tai lớn.
Corgi có vẻ ngoài đáng yêu, cặp mông hình trái tim tạo nên nét quyến rũ và đã tạo nên cơn sốt ngắm mông Corgi.  
Là giống chó rất thông minh, biết vâng lời, có bản năng bảo vệ, rất tận tâm với chủ và thân thiện với trẻ em. 
Chúng rất điềm tĩnh, trung thành và đáng yêu, song rất cảnh giác trước người lạ.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (1,
3,
N'Chó Golden Retriever',
N'Chó Golden Retriever là một giống chó săn thượng hạng đến từ Scotland.
Golden có bộ lông vàng mượt khá sang trọng, khuôn mặt thường xuyên cười vui vẻ, tuy nhiên, lúc buồn lại tỏ vẻ đáng thương rõ ràng.
Là giống chó rất thông minh, dễ huấn luyện, luôn biết cách làm hài lòng chủ nhân và thích vui chơi cùng mọi người.
Golden rất điềm tĩnh, hiền lành và tình cảm, lại rất nhanh nhẹn và năng động.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (1,
4,
N'Chó Pit Bull',
N'Chó Bull hay còn gọi với tên tiếng Anh là American Pit Bull Terrier hay Pit Bull hoặc Dog
Pit Bull Terrier American là một giống chó có nguồn gốc từ Mỹ. Đây là một giống chó có
kích cỡ trung bình đến lớn có nguồn gốc từ dòng chó chọi')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (1,
5,
N'Chó Pug',
N'Pug,
hay thường được gọi là chó mặt xệ, là giống chó thuộc nhóm chó cảnh có nguồn gốc từ Trung Quốc,
chúng có một khuôn mặt nhăn, mõm ngắn, và đuôi xoăn. Giống chó này có bộ lông mịn, bóng, có nhiều màu sắc nhưng phổ biến nhất là màu đen và nâu vàng.
Cơ thể của Pug nhỏ gọn hình vuông với các cơ bắp rất phát triển.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (2,
6,
N'Mèo Anh lông ngắn',
N'Mèo Anh lông ngắn là một giống mèo cảnh có nguồn gốc từ Anh.
Chúng sở hữu một thân hình vô cùng mập mạp đáng yêu, nổi bật với khuôn mặt tròn và bộ lông màu xám xanh cổ điển và một cái đuôi to.
Tính cách của chúng tuy khá lười biếng tuy nhiên lại phù hợp với những người bận rộn không có quá nhiều thời gian và không đòi hỏi chủ nhân của chúng phải chải chuốt vệ sinh thường xuyên.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (2,
7,
N'Mèo Nga lông dài',
N'Mèo Nga lông dài thực chất có nguồn gốc là giống mèo Angora Turkish, có xuất xứ từ Thổ Nhĩ Kỳ.
Mèo Nga sở hữu bộ lông dài trắng muốt như tuyết tuyệt đẹp, tuy nhiên không xù, thân hình nhỏ gọn, thanh thoát và quý phái.
Tính tình thông minh, linh hoạt, quấn chủ và hiền lành, mèo Nga được xem như loại mèo toàn diện nhất.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (2,
8,
N'Mèo Exotic',
N'Mèo lông ngắn Ba Tư hay còn gọi là mèo Exotic hay còn gọi là mèo Ba Tư mặt tịt là giống mèo có nguồn gốc tại Mỹ,
được phát triển trên cơ sở phiên bản của giống mèo Ba Tư. Chúng là giống khá nổi tiếng, đáng yêu và được nhiều người hâm hộ, đặc biệt là nữ giới')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (2,
9,
N'Mèo Ai Cập',
N'Mèo Sphinx hay còn gọi là mèo không lông Sphinx hay còn được biết đến là mèo Canada hoặc mèo Mexico không lông là
một giống mèo được phát triển vào thập niên 1960 với đặc điểm là thân thể trần trụi, không có sợi lông nào. Giống mèo này được coi là một trong những
giống mèo xấu nhất thế giới nhưng lại có giá rất đắt.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (3,
10,
N'Chim họa mi',
N'Có tên khoa học là Garrulux Canorus, chim Họa Mi thường sinh sống ở các khu rừng, vườn cây,
 công viên,… Loài chim cảnh Việt Nam này khá nhỏ bé, chỉ ngang hoặc bé hơn chim Sơn Ca nhưng 
 bù lại chúng là một trong các loại chim hót hay nhất. Bởi vậy mà người ta thường ví các ca sĩ có giọng hát cao là những chú chim họa mi.') 
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (3,
11,
N'Chim vàng anh',
N'Chim Vàng Anh luôn nổi bật với màu lông vàng rực. Chim mái và chim trống sẽ có ánh màu khác nhau đôi chút.
Chim Vàng Anh cũng thuộc các loại chim sâu ở Việt Nam nên thường được nuôi để diệt sâu và trang trí.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (3,
12,
N'Chim sơn ca',
N'Sơn ca hay Sơn ca phương Đông là một loài chim thuộc Họ Sơn ca. Loài này sinh sống ở Nam Á và Đông Nam Á.
 Giống như các loài sơn ca khác, nó được tìm thấy trong khu vực đồng cỏ thưa - thường gần các thuỷ vực - nơi nó ăn hạt và côn trùng.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (3,
13,
N'Chim chào mào',
N'Chào mào là một loài chim thuộc bộ Sẻ phân bố ở châu Á. Nó là một thành viên của họ Chào mào.
Nó là một loài động vật ăn quả thường trú được tìm thấy chủ yếu ở châu Á nhiệt đới. Nó đã được đưa bởi con người 
vào nhiều khu vực nhiệt đới trên thế giới, nơi các quần thể đã tự hình thành. Nó ăn trái cây và côn trùng nhỏ.') 
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (4,
14,
N'Chuột Hamster',
N'Chuột Hamster không phải thuộc loài họ chuột thông thường (họ Chuột) như chuột cống, 
chuột nhắt, chuột đồng... mang nhiều mầm bệnh. Mà chúng thuộc họ Cricetidae, sinh sống ngoài tự nhiên, thường đào hang và có hai túi má để dự trữ thức ăn. ')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (5,
15,
N'Cá ba đuôi',
N'Là loài cá cảnh đẹp thuộc họ cá Chép. Loại cá này dễ thích nghi với điều kiện sống trong bể nuôi
từ kích cỡ nhỏ đến to, hòn non bộ, bể cạn, bể kính…Điểm đặc biệt của cá 3 đuôi là loại cá cảnh nước ngọt dễ nuôi.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (5,
16,
N'Cá chép Nhật(Koi)',
N'Cá Koi là loài cá chép lai tạo, có quan hệ họ hàng gần với cá vàng và được nuôi để làm cảnh.
Cá Koi được cho là loại cá kiểng đẹp dễ nuôi mang lại may mắn, thể hiện triển vọng tương lai và
cơ hội về tài chính. Hồ cá Koi sinh trưởng càng nhiều thì may mắn tiền tài càng sinh sôi.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (5,
17,
N'Cá bảy màu',
N'Cá bảy màu là một trong những loại cá cảnh nước ngọt phổ biến nhất thế giới. Nó là một thành viên nhỏ của họ
Cá khổng tước và giống như các thành viên khác của họ cá này, chúng là dạng cá đẻ trứng thai.')
INSERT [dbo].[Giong] ([MaLoai], [MaGiong], [TenGiong], [MoTa]) VALUES (5,
18,
N'Cá Đuôi kiếm',
N'Cá đuôi kiếm là loại cá cảnh với thân hình nhỏ và bầu bĩnh con trống là những con có kỳ trên lưng (vây lưng) dài rất đẹp, 
Cá đuôi kiếm mái thì hầu như quanh năm suốt tháng bụng to tròn vì chúng mang thai và đẻ một cách liên tục')
SET IDENTITY_INSERT [dbo].[Giong] OFF
/*====================================================================================*/
SET IDENTITY_INSERT [dbo].[ThuCung] ON 
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (1,
N'Cá ba đuôi ngũ sắc', CAST(100000 AS Decimal(18, 0)), N'Nếu bạn đang muốn tìm mua một chú cá Ba Đuôi Ngũ Sắc đẹp,
lộng lẫy mà vẫn chưa tìm được cửa hàng bán cá cảnh đẹp tại TPHCM, thì cửa hàng cá cảnh Trung Tín là địa chỉ
đáng tin cậy để bạn chọn mua. Ngoài cá loại cá cảnh thì cửa hàng hiện đang bán rất nhiều mặc hàng khác nhau
phục vụ cho việc thiết kế một hồ cá cảnh sinh động nhất.', N'CÁ BA ĐUÔI NGŨ SẮC
Ba Đuôi Ngũ Sắc là một trong những loài cá được thuần hóa lâu đời nhất trên thế giới. Cá Ba Đuôi Ngũ Sắc bắt đầu được nuôi từ thời nhà Tống Trung Quốc vào những năm 960 trước Công Nguyên sau đó được đem bán rộng rãi vào thời nhà Minh (1368-1644 sau Công Nguyên). Vào năm 1500 sau Công Nguyên, nó được đem sang Nhật Bản và có mặt tại châu Âu hơn 2 thế kỷ sau.
Nếu bạn đang muốn tìm mua một chú cá Ba Đuôi Ngũ Sắc đẹp, lộng lẫy mà vẫn chưa tìm được cửa hàng bán cá cảnh đẹp tại TPHCM, thì cửa hàng cá cảnh Trung Tín là địa chỉ đáng tin cậy để bạn chọn mua. Ngoài cá loại cá cảnh thì cửa hàng hiện đang bán rất nhiều mặc hàng khác nhau phục vụ cho việc thiết kế một hồ cá cảnh sinh động nhất.
CÁ CẢNH THUỶ SINH TRUNG TÍN
Đặc điểm của cá Ba Đuôi Ngũ Sắc:
Cá Ba Đuôi Ngũ Sắc có thể phát triển tới chiều dài khoảng 16 – 20 cm (6,3 – 7,87 inch). Tuy nhiên, hiếm có con cá vàng nào đạt được đến kích thước này.
Trong điều kiện tối ưu, cá Ba Đuôi Ngũ Sắc có thể sống hơn 20 năm, nhưng đa số cá nuôi tại nhà thường chỉ sống dưới 6 tới 8 năm do phải sống trong điều kiện sống không tối ưu (chẳng hạn phải sống trong bể thủy tinh tròn). Con cá già nhất đã ghi chép lại sống tới 49 năm.
Cá Ba Đuôi Ngũ Sắc có dáng bơi ngộ nghĩnh, màu sắc đa dạng, dễ nuôi và dễ chăm sóc. Điều này giúp cá trở thành loài cá cảnh phổ biến nhất trên thế giới.
Cá thường rất nhạy cảm với âm thanh và tiếng động. Do đó, hãy đặt hồ cá ở nơi yên tĩnh ít người qua lại hay nói chuyện lớn tiếng.
Thức ăn viên được các nhà sản xuất chế biến dành riêng cho loài cá này thường thiếu hụt protein và thừa quá nhiều carbonhydras so với thức ăn viên dành cho các loài cá khác.
Do đó nếu chỉ cho cá ăn thức ăn viên, cá sẽ không có đủ dinh dưỡng cần thiết để phát triển. Thêm vào đó, cho cá Ba Đuôi Ngũ Sắc ăn thức ăn của người như bánh mì,
bánh quy hay khoai tây cũng là điều không nên.', N'~/UploadFile/files/CaBaDuoi_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 15, 5,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (2,
N'Cá ba đuôi ngũ sắc', CAST(100000 AS Decimal(18, 0)), N'Nếu bạn đang muốn tìm mua một chú cá Ba Đuôi Ngũ Sắc đẹp,
lộng lẫy mà vẫn chưa tìm được cửa hàng bán cá cảnh đẹp tại TPHCM, thì cửa hàng cá cảnh Trung Tín là địa chỉ
đáng tin cậy để bạn chọn mua. Ngoài cá loại cá cảnh thì cửa hàng hiện đang bán rất nhiều mặc hàng khác nhau
phục vụ cho việc thiết kế một hồ cá cảnh sinh động nhất.', N'CÁ BA ĐUÔI NGŨ SẮC
Ba Đuôi Ngũ Sắc là một trong những loài cá được thuần hóa lâu đời nhất trên thế giới. Cá Ba Đuôi Ngũ Sắc bắt đầu được nuôi từ thời nhà Tống Trung Quốc vào những năm 960 trước Công Nguyên sau đó được đem bán rộng rãi vào thời nhà Minh (1368-1644 sau Công Nguyên). Vào năm 1500 sau Công Nguyên, nó được đem sang Nhật Bản và có mặt tại châu Âu hơn 2 thế kỷ sau.
Nếu bạn đang muốn tìm mua một chú cá Ba Đuôi Ngũ Sắc đẹp, lộng lẫy mà vẫn chưa tìm được cửa hàng bán cá cảnh đẹp tại TPHCM, thì cửa hàng cá cảnh Trung Tín là địa chỉ đáng tin cậy để bạn chọn mua. Ngoài cá loại cá cảnh thì cửa hàng hiện đang bán rất nhiều mặc hàng khác nhau phục vụ cho việc thiết kế một hồ cá cảnh sinh động nhất.
CÁ CẢNH THUỶ SINH TRUNG TÍN
Đặc điểm của cá Ba Đuôi Ngũ Sắc:
Cá Ba Đuôi Ngũ Sắc có thể phát triển tới chiều dài khoảng 16 – 20 cm (6,3 – 7,87 inch). Tuy nhiên, hiếm có con cá vàng nào đạt được đến kích thước này.
Trong điều kiện tối ưu, cá Ba Đuôi Ngũ Sắc có thể sống hơn 20 năm, nhưng đa số cá nuôi tại nhà thường chỉ sống dưới 6 tới 8 năm do phải sống trong điều kiện sống không tối ưu (chẳng hạn phải sống trong bể thủy tinh tròn). Con cá già nhất đã ghi chép lại sống tới 49 năm.
Cá Ba Đuôi Ngũ Sắc có dáng bơi ngộ nghĩnh, màu sắc đa dạng, dễ nuôi và dễ chăm sóc. Điều này giúp cá trở thành loài cá cảnh phổ biến nhất trên thế giới.
Cá thường rất nhạy cảm với âm thanh và tiếng động. Do đó, hãy đặt hồ cá ở nơi yên tĩnh ít người qua lại hay nói chuyện lớn tiếng.
Về thức ăn, trong tự nhiên, cá này ăn đủ thứ như rong rêu, cây thủy sinh, trứng của loài cá khác, ấu trùng, thậm chí là cả các loài cá nhỏ. Khi được nuôi làm cảnh, chúng vẫn ăn tạp, nhưng khẩu phần ăn có phần thay đổi một chút.
Thức ăn viên được các nhà sản xuất chế biến dành riêng cho loài cá này thường thiếu hụt protein và thừa quá nhiều carbonhydras so với thức ăn viên dành cho các loài cá khác.
Do đó nếu chỉ cho cá ăn thức ăn viên, cá sẽ không có đủ dinh dưỡng cần thiết để phát triển. Thêm vào đó, cho cá Ba Đuôi Ngũ Sắc ăn thức ăn của người như bánh mì,
bánh quy hay khoai tây cũng là điều không nên.', N'~/UploadFile/files/CaBaDuoi_2.png', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 15, 5,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (3,
N'Cá bảy màu', CAST(100000 AS Decimal(18, 0)), N' Là một trong những loài cá cảnh đẹp và phổ biến nhất thế giới, cá bảy màu thu hút người nhìn bởi màu sắc
sặc sỡ cùng nhiều thông tin thú vị xoay quanh nó. Vậy bạn có biết loại cá bảy màu nào hiện nay được người chơi ưa chuộng nhất chưa, hôm nay Trung Tín sẽ giới thiệu
đến bạn một loại cá bảy màu đẹp nhất đang được bày bán tại cửa hàng của chúng tôi đó chính là cá Bảy Màu Tai To.'
,N'CÁ BẢY MÀU TAI TO
Là một trong những loài cá cảnh đẹp và phổ biến nhất thế giới, cá bảy màu thu hút người nhìn bởi màu sắc sặc sỡ cùng nhiều thông tin thú vị xoay quanh nó.
Vậy bạn có biết loại cá bảy màu nào hiện nay được người chơi ưa chuộng nhất chưa, hôm nay Trung Tín sẽ giới thiệu đến bạn một loại cá bảy màu đẹp nhất đang được bày bán tại cửa hàng của chúng tôi đó chính là cá Bảy Màu Tai To.
Đặc điểm của cá Bảy Màu Tai To:
Là một trong những dòng cá bảy màu khá được ưa chuộng tại Việt Nam, cá Bảy Màu Tai To hiện được giới yêu cá tìm kiếm và đặt mua với số lượng lớn.
Đây là giống cá dễ nuôi, sinh sản nhanh, đa dạng và phong phú nhất trong số các loài cá cảnh (về màu sắc). Cá Bảy Màu Tai To nhập vào Việt Nam đã lâu, chúng có một sự đa dạng lớn về màu sắc giữa các quần thể.
Cá Bảy Màu Tai To rất nhiều, thời kỳ mang thai của chúng là 22-30 ngày, trung bình khoảng 28 ngày. Sau khi cá cái được thụ tinh thì một vùng sẫm màu gần hậu môn, gọi là đốm thai, sẽ lớn dần lên và sẫm màu đi.
Chúng ưa thích nước có nhiệt độ khoảng 28 °C (82 °F) để sinh sản, cá cái sẽ sinh ra từ 2 đến 200 cá con, thông thường trong khoảng 5 - 30 con. Cá con vừa sinh đã có đầy đủ khả năng bơi, ăn, và tránh nguy hiểm.
Quả thực kỹ thuật nuôi cá bảy màu không cần quá cầu kỳ chỉ cần đảm bảo ăn đúng bữa, chăm sóc hay phòng bệnh cho chúng đúng cách là chúng cực kỳ khỏe mạnh.'
,N'~/UploadFile/files/CaBayMau_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 17, 5,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (4,
N'Cá đuôi kiếm', CAST(500000 AS Decimal(18, 0)), N'Cá đuôi kiếm – Loại cá cảnh phổ biến dễ nuôi dễ chăm sóc
Là loại cá cảnh rất phổ biến nó là loại cá cảnh phổ biến đến mức gần như ai chơi cá cảnh đều đã từng nuôi qua loại này
Cá đuôi kiếm rất dễ nuôi và dễ chăm sóc chúng đẻ rất nhiều nếu ở trong môi trường nước ổn đinh'
,N'Thông tin tên gọi cá đuôi kiếm
Tên thường gọi Cá hồng kim đuôi kiếm (cá kiếm)
Tên tiếng anh Swordtail (ý nghĩa: tail: cái đuôi, sword: thanh kiếm)
Tên khoa học Xiphophorus hellerii Heckel 1848, bộ Cyprinodontiformes (bộ cá sóc), họ: Poeciliidae (họ cá khổng tước)
Nguồn gốc cá nhập nội từ những năm 50, hiện được sinh sản và nhân giống rộng rãi tại Việt Nam.
Đặc điểm của Cá đuôi kiếm
Cá đuôi kiếm là loại cá cảnh với thân hình nhỏ và bầu bĩnh con trống là những con có kỳ trên lưng (vây lưng) dài rất đẹp, Cá đuôi kiếm mái thì hầu như quanh năm suốt tháng bụng to tròn vì chúng mang thai và đẻ một cách liên tục
Cá đuôi kiếm rất thích hợp sống trong môi trường thủy sinh giá từ 3500đ- 4000đ / 1 con tùy theo size'
,N'~/UploadFile/files/CaDuoiKiem_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 18, 5,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (5,
N'Cá Koi', CAST(1000000 AS Decimal(18, 0)), N'Cá Koi có nguồn gốc từ Trung Á sau  đó phát triển mạnh, phổ biến tại Trung Quốc và Nhật Bản. 
Vào năm 1950, các chuyên gia sinh học người Nhật được cử đến Trung tâm khoa học Kỹ thuật của trường Đại học Chicago để học hỏi kinh nghiệm và
lai tạo thành công dòng cá Koi. Cá Koi được người Nhật tạo ra có màu sắc vô cùng cuốn hút và có giá thành khá cao. Ban đầu dòng cá Koi khi được
tạo ra được đặt tên là Nishikigoi, mãi đến thế kỷ 19 mới chính thức được đổi tên thành cá Koi.'
,N'Tập tính, khả năng sinh sản và sinh trưởng của Cá Koi
Cá Koi khi được sống trong hồ nước nhân tạo, điều kiện tốt sẽ sống tới 25 – 35 năm. Cá Koi sau khi đã quen, thuần thục trong môi trường sống nhân
tạo sau khoảng 1 năm thì sẽ bắt đầu để trứng, cá Koi cái 2-3 năm tuổi có thể đẻ khoảng 150 – 200 ngàn trứng mỗi lần đẻ. Cá thường đẻ lúc khoảng 4-5 sáng,
sau khoảng 26 – 48h ở nhiệt độ 28 đến 30 độ C thì cá sẽ nở.
Khi tuổi tác và nhiệt độ môi trường thay đổi thì màu sắc và hình dạng của cá Koi sẽ thay đổi liên tục, giống như bức tranh màu mà bạn tự vẽ.
Nếu cá Koi có màu sắc quá hỗn tạp, bị lem hoặc dị tật sẽ bị loại, không được lựa chọn.'
,N'~/UploadFile/files/CaKoi_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 16, 5,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (6,
N'Cá Koi', CAST(1200000 AS Decimal(18, 0)), N'Cá Koi có nguồn gốc từ Trung Á sau  đó phát triển mạnh, phổ biến tại Trung Quốc và Nhật Bản. 
Vào năm 1950, các chuyên gia sinh học người Nhật được cử đến Trung tâm khoa học Kỹ thuật của trường Đại học Chicago để học hỏi kinh nghiệm và
lai tạo thành công dòng cá Koi. Cá Koi được người Nhật tạo ra có màu sắc vô cùng cuốn hút và có giá thành khá cao. Ban đầu dòng cá Koi khi được
tạo ra được đặt tên là Nishikigoi, mãi đến thế kỷ 19 mới chính thức được đổi tên thành cá Koi.'
,N'Tập tính, khả năng sinh sản và sinh trưởng của Cá Koi
Cá Koi khi được sống trong hồ nước nhân tạo, điều kiện tốt sẽ sống tới 25 – 35 năm. Cá Koi sau khi đã quen, thuần thục trong môi trường sống nhân
tạo sau khoảng 1 năm thì sẽ bắt đầu để trứng, cá Koi cái 2-3 năm tuổi có thể đẻ khoảng 150 – 200 ngàn trứng mỗi lần đẻ. Cá thường đẻ lúc khoảng 4-5 sáng,
sau khoảng 26 – 48h ở nhiệt độ 28 đến 30 độ C thì cá sẽ nở.
Khi tuổi tác và nhiệt độ môi trường thay đổi thì màu sắc và hình dạng của cá Koi sẽ thay đổi liên tục, giống như bức tranh màu mà bạn tự vẽ.
Nếu cá Koi có màu sắc quá hỗn tạp, bị lem hoặc dị tật sẽ bị loại, không được lựa chọn.'
,N'~/UploadFile/files/CaKoi_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 16, 5,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (7,
N'Chim Chào Mào', CAST(500000 AS Decimal(18, 0)), N'CChim Chào Mào là loài chim đang ngày càng được lựa chọn nhiều để làm chim cảnh bởi tập tính sinh sống
của chúng phù hợp với điều kiện sống ở nước ta. Cùng với đó là ngoại hình khá bắt mắt và giọng hót rất hay của loài chim cảnh này cũng khiến người chơi thích
thú. Chim Chào Mào cũng rất thân thiện với người nuôi nếu như người nuôi hiểu rõ về tập tính, kỹ thuật và cách chăm sóc chúng.'
,N'Đặc điểm của Chim Chào Mào
Chim Chào mào là loài chim thuộc bộ chim Sẻ và biết hót được phân bố ở khắp các khu vực Châu Á. Chúng có hai má trắng mào to, phía trên mảng trắng
là màu đỏ nên chúng được gọi với cái tên là Red-whiskered Bulbul. Ở Việt Nam tùy theo địa phương mà chúng có tên gọi khác nhau như: chóp mũ đỏ, đít
đỏ...nhưng chào mào vẫn là cái tên thông dụng nhất.
Trong tự nhiên loài chim cảnh này thường sống ở những nơi có nhiều cây cối như rừng núi nhưng không phải rừng quá rậm. Giọng hót của loài chim này
rất dễ nhận biết nên chúng ta dễ dàng nhận biết được. Nếu bạn nghe thấy tiếng chim hót thanh rất dễ nghe vào mỗi buổi sáng thì đó chính là chim chào mào.'
,N'~/UploadFile/files/ChimChaoMao_1.png', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 13, 3,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (8,
N'Chim Chào Mào', CAST(500000 AS Decimal(18, 0)), N'CChim Chào Mào là loài chim đang ngày càng được lựa chọn nhiều để làm chim cảnh bởi tập tính sinh sống
của chúng phù hợp với điều kiện sống ở nước ta. Cùng với đó là ngoại hình khá bắt mắt và giọng hót rất hay của loài chim cảnh này cũng khiến người chơi thích
thú. Chim Chào Mào cũng rất thân thiện với người nuôi nếu như người nuôi hiểu rõ về tập tính, kỹ thuật và cách chăm sóc chúng.'
,N'Đặc điểm của Chim Chào Mào
Chim Chào mào là loài chim thuộc bộ chim Sẻ và biết hót được phân bố ở khắp các khu vực Châu Á. Chúng có hai má trắng mào to, phía trên mảng trắng
là màu đỏ nên chúng được gọi với cái tên là Red-whiskered Bulbul. Ở Việt Nam tùy theo địa phương mà chúng có tên gọi khác nhau như: chóp mũ đỏ, đít
đỏ...nhưng chào mào vẫn là cái tên thông dụng nhất.
Trong tự nhiên loài chim cảnh này thường sống ở những nơi có nhiều cây cối như rừng núi nhưng không phải rừng quá rậm. Giọng hót của loài chim này
rất dễ nhận biết nên chúng ta dễ dàng nhận biết được. Nếu bạn nghe thấy tiếng chim hót thanh rất dễ nghe vào mỗi buổi sáng thì đó chính là chim chào mào.'
,N'~/UploadFile/files/ChimChaoMao_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 13, 3,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (9,
N'Chim Hoạ Mi', CAST(500000 AS Decimal(18, 0)), N'Chim Họa Mi được nhiều người mệnh danh là loài chim có giọng hót tuyệt vời nhất trong tất cả các loài chim rừng.
Cũng chính vì thế mà người nghệ sĩ nào có tông giọng tốt, hát hay đều được so sánh với chim họa mi.'
,N'Nhìn tổng thể dòng chim họa mi có cơ thể cũng tương đối lớn. Chúng chỉ to gần ngang chim Cu ngói.
Lông hầu như toàn bộ cơ chim đều có màu nâu sẫm, ở phần dưới ngực thì lông có màu vàng hung
Mắt to, long lanh trong vắt, có viền mắt bao xung quanh và nó kéo dài khoảng một phân rưỡi ra phía sau.
Chiều dài toàn thân của chim từ mỏ đến hết phần đuôi là khoảng 20cm.
Mỏ chim dày, chân nhỏ. Hai bộ phận này đều có màu nâu nhạt.'
,N'~/UploadFile/files/ChimHoaMi_1.png', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 10, 3,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (10,
N'Chim Hoạ Mi', CAST(500000 AS Decimal(18, 0)), N'Chim Họa Mi được nhiều người mệnh danh là loài chim có giọng hót tuyệt vời nhất trong tất cả các loài chim rừng.
Cũng chính vì thế mà người nghệ sĩ nào có tông giọng tốt, hát hay đều được so sánh với chim họa mi.'
,N'Nhìn tổng thể dòng chim họa mi có cơ thể cũng tương đối lớn. Chúng chỉ to gần ngang chim Cu ngói.
Lông hầu như toàn bộ cơ chim đều có màu nâu sẫm, ở phần dưới ngực thì lông có màu vàng hung
Mắt to, long lanh trong vắt, có viền mắt bao xung quanh và nó kéo dài khoảng một phân rưỡi ra phía sau.
Chiều dài toàn thân của chim từ mỏ đến hết phần đuôi là khoảng 20cm.
Mỏ chim dày, chân nhỏ. Hai bộ phận này đều có màu nâu nhạt.'
,N'~/UploadFile/files/ChimHoaMi_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 10, 3,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (11,
N'Chim Sơn Ca', CAST(500000 AS Decimal(18, 0)), N'Chim sơn ca là một trong những loài chim cảnh, được yêu thích nhất tại Việt Nam hiện nay.
Trước khi có ý định nuôi 1 chú chim sơn ca, các bạn nên tìm hiểu rõ về đặc điểm và đặc tính của chúng.'
,N'Chim sơn ca có hình dáng khá bé nhỏ, cơ thể của chúng gần giống với loài chim sẻ.
Khi trưởng thành, cơ thể của chúng chỉ dài khoảng 12 – 24cm, cân nặng dao động trong khoảng từ 15 – 75 gam.
Chim sơn ca có tỷ lệ cơ thể khá cân đối.
Đầu của chim khá tròn, mỏ nhọn giống hình chóp và khá trơn.
Mắt của chúng khá to, tròn và đen nhánh.
Phần đầu của chúng có 1 chiếc mào cấu tạo từ những sợi lông mềm khá lớn.
Đây là đặc điểm nổi bật để phân biệt chim sẻ và chim sơn ca.'
,N'~/UploadFile/files/ChimSonCa_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 12, 3,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (12,
N'Chim Vàng Anh', CAST(1500000 AS Decimal(18, 0)), N'Trước khi tìm hiểu chim vàng anh ăn gì thì bạn cần biết được nguồn gốc xuất xứ và đặc điểm của loài
chim này. Vàng anh tên hay còn được gọi là chim hoàng anh, đây là loài duy nhất thuộc họ Vàng anh, bộ sẻ, sinh sống chủ yếu ở khu vực ôn đới của Bắc bán cầu.
Loài chim này có tập tính di cư, mùa hè nó sẽ di cư đến những khu vực Châu Âu và Châu Á, mùa đông nó sẽ di cư đến khu vực nhiệt đới.'
,N'Chim hoàng anh có đặc điểm ngoại hình khá thu hút, cụ thể như sau:
Đầu chim đen, mỏ đỏ, mắt đỏ, chân nâu, toàn thân có màu vàng chanh, đuôi và cánh có đặc điểm màu trắng đen. 
Chim vàng anh có 16 giọng hót được phân khúc đặc sắc và hai giọng hít ru khi chúng nuôi con, đem đến tính độc đáo, sự khác biệt của loài chim này.
Chim trống mang màu sắc lòe loẹt với các màu tương phản, phần lớn là màu vàng tươi và các vết đen sắt nét trên đầu, cánh hay đuôi.
Chim mái có màu sắc giống với chim trống nhưng có màu hơi xanh lục, phần bụng tươi hơn. Vì thế mà loài chim mái về tổng thể có màu sắc ít tương phản hơn.
Những con chim non bộ lông có màu săc tương tự như chim mái như có thêm các sọc vằn bổ sung.
Vàng anh là loài chim có giọng hót rất hay, hót giỏi và có kích cỡ trung bình. Chim có 16 giọng hót, tiếng hót của chúng giống với chim giẻ củi nhưng thánh thót hơn.
Chúng sở hữu mỏ khỏe và nhọn, các chân và ngón tương đối ngắn nhưng khỏe.'
,N'~/UploadFile/files/ChimVangAnh_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 11, 3,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (13,
N'Chim Vàng Anh', CAST(1500000 AS Decimal(18, 0)), N'Trước khi tìm hiểu chim vàng anh ăn gì thì bạn cần biết được nguồn gốc xuất xứ và đặc điểm của loài
chim này. Vàng anh tên hay còn được gọi là chim hoàng anh, đây là loài duy nhất thuộc họ Vàng anh, bộ sẻ, sinh sống chủ yếu ở khu vực ôn đới của Bắc bán cầu.
Loài chim này có tập tính di cư, mùa hè nó sẽ di cư đến những khu vực Châu Âu và Châu Á, mùa đông nó sẽ di cư đến khu vực nhiệt đới.'
,N'Chim hoàng anh có đặc điểm ngoại hình khá thu hút, cụ thể như sau:
Đầu chim đen, mỏ đỏ, mắt đỏ, chân nâu, toàn thân có màu vàng chanh, đuôi và cánh có đặc điểm màu trắng đen. 
Chim vàng anh có 16 giọng hót được phân khúc đặc sắc và hai giọng hít ru khi chúng nuôi con, đem đến tính độc đáo, sự khác biệt của loài chim này.
Chim trống mang màu sắc lòe loẹt với các màu tương phản, phần lớn là màu vàng tươi và các vết đen sắt nét trên đầu, cánh hay đuôi.
Chim mái có màu sắc giống với chim trống nhưng có màu hơi xanh lục, phần bụng tươi hơn. Vì thế mà loài chim mái về tổng thể có màu sắc ít tương phản hơn.
Những con chim non bộ lông có màu săc tương tự như chim mái như có thêm các sọc vằn bổ sung.
Vàng anh là loài chim có giọng hót rất hay, hót giỏi và có kích cỡ trung bình. Chim có 16 giọng hót, tiếng hót của chúng giống với chim giẻ củi nhưng thánh thót hơn.
Chúng sở hữu mỏ khỏe và nhọn, các chân và ngón tương đối ngắn nhưng khỏe.'
,N'~/UploadFile/files/ChimVangAnh_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 11, 3,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (14,
N'Chó Corgi', CAST(7000000 AS Decimal(18, 0)), N'Xuất hiện từ hơn 3000 năm trước, chó Corgi luôn nằm trong bảng xếp hạng những giống chó được nuôi phổ biến nhất
trên thế giới. Chú chó có nguồn gốc từ xứ Wales này rất được Hoàng gia Anh ưa chuộng. Ban đầu chúng được nuôi để chăn gia súc, từ sau thế kỉ 16 thì được nuôi rộng
rãi và Việt Nam cũng không ngoại lệ.'
,N'Không thể phủ nhận sự đáng yêu của loài chó này đến từ cặp mông to tròn và đôi chân ngắn cũn. Chính vì vậy mà chân càng ngắn thì giá sẽ càng cao. Giống chó này 
có kích thước về chiều cao khá hạn chế chỉ dưới 30cm và nặng khoảng 12kg khi trưởng thành.
Chó Corgi có khuôn mặt khá giống loài cáo thường có đôi tai dựng đứng hình tam giác đều, chắc và thuôn về một đỉnh tròn. Chó Corgi có 2 loại là Corgi
Pembroke Wales và Corgi Cardigan Wales. Corgi Pembroke Wales khác ở chỗ chiều dài ngắn hơn, tai nhỏ hơn và chân hơi thẳng. Màu lông đậm nhạt thay đổi theo bộ 
dày ở các bộ phận. Loài chó này cũng rất hay rụng lông nhất là vào mùa xuân và mùa thu và rụng khi thời tiết nóng đối với con cái.
Trong khi một số chú chó Corgi ngoại lai sinh ra với đuôi ngắn hoặc cụt tự nhiên, phần lớn thì sẽ có đuôi dài từ 2 – 5 ngày tuổi.
Trạng thái tiêu chuẩn của AKC đuôi không được dài quá 2 inch (khoảng 5 cm).'
,N'~/UploadFile/files/ChoCogri.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 2, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (15,
N'Chó Corgi', CAST(7000000 AS Decimal(18, 0)), N'Xuất hiện từ hơn 3000 năm trước, chó Corgi luôn nằm trong bảng xếp hạng những giống chó được nuôi phổ biến nhất
trên thế giới. Chú chó có nguồn gốc từ xứ Wales này rất được Hoàng gia Anh ưa chuộng. Ban đầu chúng được nuôi để chăn gia súc, từ sau thế kỉ 16 thì được nuôi rộng
rãi và Việt Nam cũng không ngoại lệ.'
,N'Không thể phủ nhận sự đáng yêu của loài chó này đến từ cặp mông to tròn và đôi chân ngắn cũn. Chính vì vậy mà chân càng ngắn thì giá sẽ càng cao. Giống chó này 
có kích thước về chiều cao khá hạn chế chỉ dưới 30cm và nặng khoảng 12kg khi trưởng thành.
Chó Corgi có khuôn mặt khá giống loài cáo thường có đôi tai dựng đứng hình tam giác đều, chắc và thuôn về một đỉnh tròn. Chó Corgi có 2 loại là Corgi
Pembroke Wales và Corgi Cardigan Wales. Corgi Pembroke Wales khác ở chỗ chiều dài ngắn hơn, tai nhỏ hơn và chân hơi thẳng. Màu lông đậm nhạt thay đổi theo bộ 
dày ở các bộ phận. Loài chó này cũng rất hay rụng lông nhất là vào mùa xuân và mùa thu và rụng khi thời tiết nóng đối với con cái.
Trong khi một số chú chó Corgi ngoại lai sinh ra với đuôi ngắn hoặc cụt tự nhiên, phần lớn thì sẽ có đuôi dài từ 2 – 5 ngày tuổi.
Trạng thái tiêu chuẩn của AKC đuôi không được dài quá 2 inch (khoảng 5 cm).'
,N'~/UploadFile/files/ChoCorgi_4.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 2, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (16,
N'Chó Corgi', CAST(7000000 AS Decimal(18, 0)), N'Xuất hiện từ hơn 3000 năm trước, chó Corgi luôn nằm trong bảng xếp hạng những giống chó được nuôi phổ biến nhất
trên thế giới. Chú chó có nguồn gốc từ xứ Wales này rất được Hoàng gia Anh ưa chuộng. Ban đầu chúng được nuôi để chăn gia súc, từ sau thế kỉ 16 thì được nuôi rộng
rãi và Việt Nam cũng không ngoại lệ.'
,N'Không thể phủ nhận sự đáng yêu của loài chó này đến từ cặp mông to tròn và đôi chân ngắn cũn. Chính vì vậy mà chân càng ngắn thì giá sẽ càng cao. Giống chó này 
có kích thước về chiều cao khá hạn chế chỉ dưới 30cm và nặng khoảng 12kg khi trưởng thành.
Chó Corgi có khuôn mặt khá giống loài cáo thường có đôi tai dựng đứng hình tam giác đều, chắc và thuôn về một đỉnh tròn. Chó Corgi có 2 loại là Corgi
Pembroke Wales và Corgi Cardigan Wales. Corgi Pembroke Wales khác ở chỗ chiều dài ngắn hơn, tai nhỏ hơn và chân hơi thẳng. Màu lông đậm nhạt thay đổi theo bộ 
dày ở các bộ phận. Loài chó này cũng rất hay rụng lông nhất là vào mùa xuân và mùa thu và rụng khi thời tiết nóng đối với con cái.
Trong khi một số chú chó Corgi ngoại lai sinh ra với đuôi ngắn hoặc cụt tự nhiên, phần lớn thì sẽ có đuôi dài từ 2 – 5 ngày tuổi.
Trạng thái tiêu chuẩn của AKC đuôi không được dài quá 2 inch (khoảng 5 cm).'
,N'~/UploadFile/files/ChoCorgi_5.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 2, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (17,
N'Chó Corgi', CAST(7000000 AS Decimal(18, 0)), N'Xuất hiện từ hơn 3000 năm trước, chó Corgi luôn nằm trong bảng xếp hạng những giống chó được nuôi phổ biến nhất
trên thế giới. Chú chó có nguồn gốc từ xứ Wales này rất được Hoàng gia Anh ưa chuộng. Ban đầu chúng được nuôi để chăn gia súc, từ sau thế kỉ 16 thì được nuôi rộng
rãi và Việt Nam cũng không ngoại lệ.'
,N'Không thể phủ nhận sự đáng yêu của loài chó này đến từ cặp mông to tròn và đôi chân ngắn cũn. Chính vì vậy mà chân càng ngắn thì giá sẽ càng cao. Giống chó này 
có kích thước về chiều cao khá hạn chế chỉ dưới 30cm và nặng khoảng 12kg khi trưởng thành.
Chó Corgi có khuôn mặt khá giống loài cáo thường có đôi tai dựng đứng hình tam giác đều, chắc và thuôn về một đỉnh tròn. Chó Corgi có 2 loại là Corgi
Pembroke Wales và Corgi Cardigan Wales. Corgi Pembroke Wales khác ở chỗ chiều dài ngắn hơn, tai nhỏ hơn và chân hơi thẳng. Màu lông đậm nhạt thay đổi theo bộ 
dày ở các bộ phận. Loài chó này cũng rất hay rụng lông nhất là vào mùa xuân và mùa thu và rụng khi thời tiết nóng đối với con cái.
Trong khi một số chú chó Corgi ngoại lai sinh ra với đuôi ngắn hoặc cụt tự nhiên, phần lớn thì sẽ có đuôi dài từ 2 – 5 ngày tuổi.
Trạng thái tiêu chuẩn của AKC đuôi không được dài quá 2 inch (khoảng 5 cm).'
,N'~/UploadFile/files/ChoCorgi_6.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 2, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (18,
N'Chó Golden', CAST(10000000 AS Decimal(18, 0)), N'Hiện nay trên thị trường, có rất nhiều trại chó chuyên về giống Golden Retriever thuần chủng.
Những chú chó Golden sinh tại Việt Nam có mức giá rất hợp lý, dao động từ 6-8 triệu/ con. Rất nhiều người nuôi tỏ ra hài lòng với mức giá này. 
Bởi chỉ với vài triệu họ có thể sở hữu được một chú chó cực kỳ thông minh, trung thành, thân thiện.'
,N'Những chú chó Golden có mức độ phổ biến nhất ở các nước Phương Tây như Mỹ, Canada, Đức, Anh… Những bé cún được sinh ra và
nuôi tại đây sở hữu những đặc điểm vô cùng nổi trội như:
Lông màu vàng kem hoặc vàng nhạt.
Thân hình nhỏ nhắn nhưng thanh thoát, gọn gàng, đạt tiêu chuẩn thuần chủng.
Những chú chó Golden sinh tại Châu Âu đẹp hơn rất nhiều so với chó sinh tại Việt Nam và chó của Thái Lan.'
,N'~/UploadFile/files/ChoGoldenRetriever_4.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 3, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (19,
N'Chó Golden', CAST(10000000 AS Decimal(18, 0)), N'Hiện nay trên thị trường, có rất nhiều trại chó chuyên về giống Golden Retriever thuần chủng.
Những chú chó Golden sinh tại Việt Nam có mức giá rất hợp lý, dao động từ 6-8 triệu/ con. Rất nhiều người nuôi tỏ ra hài lòng với mức giá này. 
Bởi chỉ với vài triệu họ có thể sở hữu được một chú chó cực kỳ thông minh, trung thành, thân thiện.'
,N'Những chú chó Golden có mức độ phổ biến nhất ở các nước Phương Tây như Mỹ, Canada, Đức, Anh… Những bé cún được sinh ra và
nuôi tại đây sở hữu những đặc điểm vô cùng nổi trội như:
Lông màu vàng kem hoặc vàng nhạt.
Thân hình nhỏ nhắn nhưng thanh thoát, gọn gàng, đạt tiêu chuẩn thuần chủng.
Những chú chó Golden sinh tại Châu Âu đẹp hơn rất nhiều so với chó sinh tại Việt Nam và chó của Thái Lan.'
,N'~/UploadFile/files/ChoGoldenRetriever_5.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 3, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (20,
N'Chó Husky', CAST(7000000 AS Decimal(18, 0)), N'Chó Husky tên quốc tế là Siberian Husky hay chó Husky Sibir là giống chó nhà được phát triển bởi bộ tộc 
Chukchi hơn 3000 năm trước và hoàn toàn không phải lai giữa chó và Sói.
Người Chukchi đã sử dụng chó Husky để kéo xe trượt tuyết và họ xem chúng như một thành viên trong gia đình. Do đó chúng còn được 
gọi là chó tuyết trắng, chó bạch tuyết hay chó kéo xe tuyết.'
,N'Siberian Husky là giống chó làm việc có kích thước trung bình với hai đôi chân thon dài nhanh nhẹn và dáng đi uyển chuyển, nhẹ nhàng không dùng lực.
Một chú chó Husky thuần chủng đực cao khoảng 53-58 cm và nặng 20-27 kg. Chó Husky cái cao khoảng 51-56 cm và nặng khoảng 16-23 kg.
Chó Husky Sibir đến từ vùng cực với khí hậu lạnh khắc nghiệt nên chúng sở hữu một bộ lông rất dày có hai lớp, lớp lông dày, ngắn mềm mượt bên
trong và lông mỏng hơn, dài, thẳng phủ bên ngoài.
Nhờ có bộ lông đặc biệt này mà chúng có thể chịu được cái lạnh từ -50 đến -60 °C.
Màu lông của chó Husky là sự kết hợp của màu trắng và các màu sắc khác như đen, xám, nâu, đỏ… chó Husky Sibir các màu đặc trưng như Husky trắng,
Husky nâu đỏ, Husky trắng đen.'
,N'~/UploadFile/files/ChoHusky_6.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 1, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (21,
N'Chó Husky', CAST(7000000 AS Decimal(18, 0)), N'Chó Husky tên quốc tế là Siberian Husky hay chó Husky Sibir là giống chó nhà được phát triển bởi bộ tộc 
Chukchi hơn 3000 năm trước và hoàn toàn không phải lai giữa chó và Sói.
Người Chukchi đã sử dụng chó Husky để kéo xe trượt tuyết và họ xem chúng như một thành viên trong gia đình. Do đó chúng còn được 
gọi là chó tuyết trắng, chó bạch tuyết hay chó kéo xe tuyết.'
,N'Siberian Husky là giống chó làm việc có kích thước trung bình với hai đôi chân thon dài nhanh nhẹn và dáng đi uyển chuyển, nhẹ nhàng không dùng lực.
Một chú chó Husky thuần chủng đực cao khoảng 53-58 cm và nặng 20-27 kg. Chó Husky cái cao khoảng 51-56 cm và nặng khoảng 16-23 kg.
Chó Husky Sibir đến từ vùng cực với khí hậu lạnh khắc nghiệt nên chúng sở hữu một bộ lông rất dày có hai lớp, lớp lông dày, ngắn mềm mượt bên
trong và lông mỏng hơn, dài, thẳng phủ bên ngoài.
Nhờ có bộ lông đặc biệt này mà chúng có thể chịu được cái lạnh từ -50 đến -60 °C.
Màu lông của chó Husky là sự kết hợp của màu trắng và các màu sắc khác như đen, xám, nâu, đỏ… chó Husky Sibir các màu đặc trưng như Husky trắng,
Husky nâu đỏ, Husky trắng đen.'
,N'~/UploadFile/files/ChoHusky1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 1, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (22,
N'Chó Husky', CAST(7000000 AS Decimal(18, 0)), N'Chó Husky tên quốc tế là Siberian Husky hay chó Husky Sibir là giống chó nhà được phát triển bởi bộ tộc 
Chukchi hơn 3000 năm trước và hoàn toàn không phải lai giữa chó và Sói.
Người Chukchi đã sử dụng chó Husky để kéo xe trượt tuyết và họ xem chúng như một thành viên trong gia đình. Do đó chúng còn được 
gọi là chó tuyết trắng, chó bạch tuyết hay chó kéo xe tuyết.'
,N'Siberian Husky là giống chó làm việc có kích thước trung bình với hai đôi chân thon dài nhanh nhẹn và dáng đi uyển chuyển, nhẹ nhàng không dùng lực.
Một chú chó Husky thuần chủng đực cao khoảng 53-58 cm và nặng 20-27 kg. Chó Husky cái cao khoảng 51-56 cm và nặng khoảng 16-23 kg.
Chó Husky Sibir đến từ vùng cực với khí hậu lạnh khắc nghiệt nên chúng sở hữu một bộ lông rất dày có hai lớp, lớp lông dày, ngắn mềm mượt bên
trong và lông mỏng hơn, dài, thẳng phủ bên ngoài.
Nhờ có bộ lông đặc biệt này mà chúng có thể chịu được cái lạnh từ -50 đến -60 °C.
Màu lông của chó Husky là sự kết hợp của màu trắng và các màu sắc khác như đen, xám, nâu, đỏ… chó Husky Sibir các màu đặc trưng như Husky trắng,
Husky nâu đỏ, Husky trắng đen.'
,N'~/UploadFile/files/ChoHusky2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 1, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (23,
N'Chó Pit Bull', CAST(50000000 AS Decimal(18, 0)), N'Thực tế đã xảy ra rất nhiều vụ tai nạn do chó Pitbull gây ra khiến đa phần người Việt “tẩy chay” chúng.
Tuy nhiên vẫn có rất nhiều người chọn nuôi Pitbull bởi đam mê và bởi họ biết một sự thật rằng, mọi người đang đánh đồng, hiểu sai về người bạn này.'
,N'Thuộc dòng chó kích thước trung bình với chiều cao tối đa khoảng 55cm và cân nặng tối đa khoảng hơn 20kg nhưng Pitbull trông luôn nổi bật bởi ngoại
hình dữ dằn. Chúng có khung xương to, cơ bắp săn chắc, vạm vỡ, cái trán to và gồ ghề cùng đôi mắt đỏ ngầu trông như luôn trực chiến. Chính vì vậy người ta 
thường có cái nhìn không thiện cảm về người bạn này.
Chúng ta sẽ tìm hiểu chi tiết hơn về một bộ phận rất đặc biệt của Pitbull, đó chính là cơ hàm. Cơ hàm của chúng có cấu tạo như khớp hóa, khi đã cắn vật gì
thì không chịu nhà ra. Vết thương do Pitbull cắn thường rất rộng và sâu do hàm răng vừa dài lại vừa nhọn cùng lực cắn mạnh đến 250 pounds/1 inch vuông.'
,N'~/UploadFile/files/ChoPitBull_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 4, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (24,
N'Chó Pit Bull', CAST(40000000 AS Decimal(18, 0)), N'Thực tế đã xảy ra rất nhiều vụ tai nạn do chó Pitbull gây ra khiến đa phần người Việt “tẩy chay” chúng.
Tuy nhiên vẫn có rất nhiều người chọn nuôi Pitbull bởi đam mê và bởi họ biết một sự thật rằng, mọi người đang đánh đồng, hiểu sai về người bạn này.'
,N'Thuộc dòng chó kích thước trung bình với chiều cao tối đa khoảng 55cm và cân nặng tối đa khoảng hơn 20kg nhưng Pitbull trông luôn nổi bật bởi ngoại
hình dữ dằn. Chúng có khung xương to, cơ bắp săn chắc, vạm vỡ, cái trán to và gồ ghề cùng đôi mắt đỏ ngầu trông như luôn trực chiến. Chính vì vậy người ta 
thường có cái nhìn không thiện cảm về người bạn này.
Chúng ta sẽ tìm hiểu chi tiết hơn về một bộ phận rất đặc biệt của Pitbull, đó chính là cơ hàm. Cơ hàm của chúng có cấu tạo như khớp hóa, khi đã cắn vật gì
thì không chịu nhà ra. Vết thương do Pitbull cắn thường rất rộng và sâu do hàm răng vừa dài lại vừa nhọn cùng lực cắn mạnh đến 250 pounds/1 inch vuông.'
,N'~/UploadFile/files/ChoPitBull_4.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 4, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (25,
N'Chó Pug', CAST(4000000 AS Decimal(18, 0)), N'Chó Pug mặt xệ là giống cảnh khuyển có lịch sử lâu đời. Xuất xứ của chúng đến nay vẫn chưa có câu trả lời
chính xác. Khả năng cao nhất, Pug đã có mặt từ thời nhà Hán – Trung Quốc vào khoảng năm 200 TCN. Khi ấy, Pug được coi là giống thú cảnh quý tộc, có cuộc sống xa hoa bởi chủ yếu được hoàng thân, quốc thích Trung Quốc nuôi dưỡng.'
,N'Thuộc dòng chó kích thước trung bình với chiều cao tối đa khoảng 55cm và cân nặng tối đa khoảng hơn 20kg nhưng Pitbull trông luôn nổi bật bởi ngoại
hình dữ dằn. Chúng có khung xương to, cơ bắp săn chắc, vạm vỡ, cái trán to và gồ ghề cùng đôi mắt đỏ ngầu trông như luôn trực chiến. Chính vì vậy người ta 
thường có cái nhìn không thiện cảm về người bạn này.
Chúng ta sẽ tìm hiểu chi tiết hơn về một bộ phận rất đặc biệt của Pitbull, đó chính là cơ hàm. Cơ hàm của chúng có cấu tạo như khớp hóa, khi đã cắn vật gì
thì không chịu nhà ra. Vết thương do Pitbull cắn thường rất rộng và sâu do hàm răng vừa dài lại vừa nhọn cùng lực cắn mạnh đến 250 pounds/1 inch vuông.'
,N'~/UploadFile/files/ChoPug_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 5, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (26,
N'Chó Pug', CAST(4000000 AS Decimal(18, 0)), N'Chó Pug mặt xệ là giống cảnh khuyển có lịch sử lâu đời. Xuất xứ của chúng đến nay vẫn chưa có câu trả lời
chính xác. Khả năng cao nhất, Pug đã có mặt từ thời nhà Hán – Trung Quốc vào khoảng năm 200 TCN. Khi ấy, Pug được coi là giống thú cảnh quý tộc, có cuộc sống xa hoa bởi chủ yếu được hoàng thân, quốc thích Trung Quốc nuôi dưỡng.'
,N'Thuộc dòng chó kích thước trung bình với chiều cao tối đa khoảng 55cm và cân nặng tối đa khoảng hơn 20kg nhưng Pitbull trông luôn nổi bật bởi ngoại
hình dữ dằn. Chúng có khung xương to, cơ bắp săn chắc, vạm vỡ, cái trán to và gồ ghề cùng đôi mắt đỏ ngầu trông như luôn trực chiến. Chính vì vậy người ta 
thường có cái nhìn không thiện cảm về người bạn này.
Chúng ta sẽ tìm hiểu chi tiết hơn về một bộ phận rất đặc biệt của Pitbull, đó chính là cơ hàm. Cơ hàm của chúng có cấu tạo như khớp hóa, khi đã cắn vật gì
thì không chịu nhà ra. Vết thương do Pitbull cắn thường rất rộng và sâu do hàm răng vừa dài lại vừa nhọn cùng lực cắn mạnh đến 250 pounds/1 inch vuông.'
,N'~/UploadFile/files/ChoPug_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 5, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (27,
N'Chó Pug', CAST(3500000 AS Decimal(18, 0)), N'Chó Pug mặt xệ là giống cảnh khuyển có lịch sử lâu đời. Xuất xứ của chúng đến nay vẫn chưa có câu trả lời
chính xác. Khả năng cao nhất, Pug đã có mặt từ thời nhà Hán – Trung Quốc vào khoảng năm 200 TCN. Khi ấy, Pug được coi là giống thú cảnh quý tộc, có cuộc sống xa hoa bởi chủ yếu được hoàng thân, quốc thích Trung Quốc nuôi dưỡng.'
,N'Thuộc dòng chó kích thước trung bình với chiều cao tối đa khoảng 55cm và cân nặng tối đa khoảng hơn 20kg nhưng Pitbull trông luôn nổi bật bởi ngoại
hình dữ dằn. Chúng có khung xương to, cơ bắp săn chắc, vạm vỡ, cái trán to và gồ ghề cùng đôi mắt đỏ ngầu trông như luôn trực chiến. Chính vì vậy người ta 
thường có cái nhìn không thiện cảm về người bạn này.
Chúng ta sẽ tìm hiểu chi tiết hơn về một bộ phận rất đặc biệt của Pitbull, đó chính là cơ hàm. Cơ hàm của chúng có cấu tạo như khớp hóa, khi đã cắn vật gì
thì không chịu nhà ra. Vết thương do Pitbull cắn thường rất rộng và sâu do hàm răng vừa dài lại vừa nhọn cùng lực cắn mạnh đến 250 pounds/1 inch vuông.'
,N'~/UploadFile/files/ChoPug_5.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 5, 1,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (28,
N'Chuột Hamster', CAST(350000 AS Decimal(18, 0)), N'Chuột Hamster hiện nay có khoảng 26 loài, tuy nhiên giống chuột được biết đến nhiều nhất là chuột Hamster
Syria. Chúng được phát hiện lần đầu vào năm 1839 bởi một nhà động vật học người Anh tên là George Robert Waterhouse, ông đã đặt tên loài chuột kỳ lạ này là
Mesocricetus auratus, có nghĩa là lông vàng.'
,N'Chuột Hamster là loài sống về đêm, tức là chúng rất thích ngủ vào ban ngày và rất ghét bị đánh thức. Trong tự nhiên, chúng đào hang để ẩn náu và sinh sống,
đồng thời cũng để tích trữ lương thực dự trữ. Việc sống dưới hang giúp chúng luôn mát mẻ mặc kệ môi trường bên ngoài có khắc nghiệt như thế nào. Hamster hoang dã thường sẽ tích trữ đồ ăn và ngủ đông.'
,N'~/UploadFile/files/ChuotHamster_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 14, 4,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (29,
N'Mèo Ai Cập', CAST(15000000 AS Decimal(18, 0)), N'Vào năm 1966, có 1 sự giao phối rất ngẫu nhiên đến từ 2 chú mèo ở Toronto và Canada. 
Kết quả thực sự rất bất ngờ khi Prune ra đời và trên người hoàn toàn trụi lông và trông rất hoang dã.
Sau khi trưởng thành, Prune lại tiếp tục giao phối với mẹ của nó và kết quả là đã có nhiều chú mèo không lông khác ra đời.
Chúng chính là cụ nội loài mèo không lông Ai Cập ngày nay'
,N'So với những giống mèo khác, mèo Ai Cập có khá nhiều đặc điểm thú vị khiến cho những người yêu mèo phải mê đắm.
mèo ai cập giá
Thoạt đầu khi mới nhìn qua bạn sẽ thấy 1 chú mèo hoàn toàn nhẵn nhụi với làn da đầy nếp nhăn giống như một sinh vật vừa mới ra đời. Tuy nhiên, nếu 
có điều kiện quan sát kĩ thì bạn sẽ nhận ra thực tế không phải như vậy
Da của chúng được bao trùm bởi 1 lớp lông tơ cực kỳ mỏng và mảnh, tất nhiên là lớp lông này hoàn toàn không có tác dụng che chắn hay giữ ấm cơ thể.
Tuy nhiên, bề mặt da sẽ giúp xúc giác của mèo Ai Cập trở nên nhạy bén hơn trong mọi tình huống.
Mèo Ai Cập có đôi tai khá to, hơn hẳn so với khuôn mặt cùng 1 đôi mắt nai luôn toát lên vẻ nghiêm nghị.
Càng lớn dần theo thời gian thì vẻ nhăn nheo trên phần da của mèo Ai Cập càng giãn ra khiến chúng trở nên già nua và ngày càng dữ tợn.
Chính vì không có lớp lông bên ngoài che chắn và bảo vệ nên mèo Ai Cập rất dễ bị tổn thương. Trong quá trình chăm sóc bạn nên mua
các bộ quần áo cho dành riêng cho thú cưng để mèo Ai Cập mặc trong những ngày trời lạnh.
Mèo Ai Cập rất dễ thương, sở hữu trong mình tính cách thân thiện, thông minh, hoạt bát và cực kỳ trung thành với chủ nhân.
Không giống với tính nhút nhát của những loài mèo khác, mèo Ai Cập rất ngoan khi khách đến nhà.
mèo ai cập giá bao nhiêu
Giống mèo này rất hiếu khách và “hiểu chuyện”, chúng có thể tự đi lấy đồ chơi và tự chơi đùa một mình khi thấy chủ nhân bận.
Nét duyên dáng và “biết điều” này đã khiến rất nhiều người phải xiu lòng và bắt buộc bù đắp lại bằng việc hết mực thương yêu chúng.
Mèo Ai Cập rất thích làm nũng nên bạn sẽ thường xuyên bắt gặp cảnh chúng cọ đầu vào chân hay rúc vào lòng bạn mỗi tối.
Mèo Ai Cập thích sự ấm áp, chúng thường lần mò và nằm cạnh tivi, tấm thảm hoặc đón nắng ngoài sân vào mỗi buổi sáng bên cạnh cửa sổ…
Vốn là loài vật sống tình cảm nên bạn hoàn toàn có thể yên tâm khi thả mèo Ai Cập chơi đùa cùng những vật nuôi khác. Các em ấy sẽ 
chẳng ăn hiếp ai bao giờ mà ngược lại còn nhường nhịn và rất thân thiện.
Ngoài ra, bản tính trung thành là 1 ưu điểm nổi bật, sẽ không có chuyện mèo Ai Cập bỏ nhà đi hoang trừ khi bị chủ nhân đánh đuổi.'
,N'~/UploadFile/files/MeoAiCap_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 9, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (30,
N'Mèo Ai Cập', CAST(17000000 AS Decimal(18, 0)), N'Vào năm 1966, có 1 sự giao phối rất ngẫu nhiên đến từ 2 chú mèo ở Toronto và Canada. 
Kết quả thực sự rất bất ngờ khi Prune ra đời và trên người hoàn toàn trụi lông và trông rất hoang dã.
Sau khi trưởng thành, Prune lại tiếp tục giao phối với mẹ của nó và kết quả là đã có nhiều chú mèo không lông khác ra đời.
Chúng chính là cụ nội loài mèo không lông Ai Cập ngày nay'
,N'So với những giống mèo khác, mèo Ai Cập có khá nhiều đặc điểm thú vị khiến cho những người yêu mèo phải mê đắm.
mèo ai cập giá
Thoạt đầu khi mới nhìn qua bạn sẽ thấy 1 chú mèo hoàn toàn nhẵn nhụi với làn da đầy nếp nhăn giống như một sinh vật vừa mới ra đời. Tuy nhiên, nếu 
có điều kiện quan sát kĩ thì bạn sẽ nhận ra thực tế không phải như vậy
Da của chúng được bao trùm bởi 1 lớp lông tơ cực kỳ mỏng và mảnh, tất nhiên là lớp lông này hoàn toàn không có tác dụng che chắn hay giữ ấm cơ thể.
Tuy nhiên, bề mặt da sẽ giúp xúc giác của mèo Ai Cập trở nên nhạy bén hơn trong mọi tình huống.
Mèo Ai Cập có đôi tai khá to, hơn hẳn so với khuôn mặt cùng 1 đôi mắt nai luôn toát lên vẻ nghiêm nghị.
Càng lớn dần theo thời gian thì vẻ nhăn nheo trên phần da của mèo Ai Cập càng giãn ra khiến chúng trở nên già nua và ngày càng dữ tợn.
Chính vì không có lớp lông bên ngoài che chắn và bảo vệ nên mèo Ai Cập rất dễ bị tổn thương. Trong quá trình chăm sóc bạn nên mua
các bộ quần áo cho dành riêng cho thú cưng để mèo Ai Cập mặc trong những ngày trời lạnh.
Mèo Ai Cập rất dễ thương, sở hữu trong mình tính cách thân thiện, thông minh, hoạt bát và cực kỳ trung thành với chủ nhân.
Không giống với tính nhút nhát của những loài mèo khác, mèo Ai Cập rất ngoan khi khách đến nhà.
mèo ai cập giá bao nhiêu
Giống mèo này rất hiếu khách và “hiểu chuyện”, chúng có thể tự đi lấy đồ chơi và tự chơi đùa một mình khi thấy chủ nhân bận.
Nét duyên dáng và “biết điều” này đã khiến rất nhiều người phải xiu lòng và bắt buộc bù đắp lại bằng việc hết mực thương yêu chúng.
Mèo Ai Cập rất thích làm nũng nên bạn sẽ thường xuyên bắt gặp cảnh chúng cọ đầu vào chân hay rúc vào lòng bạn mỗi tối.
Mèo Ai Cập thích sự ấm áp, chúng thường lần mò và nằm cạnh tivi, tấm thảm hoặc đón nắng ngoài sân vào mỗi buổi sáng bên cạnh cửa sổ…
Vốn là loài vật sống tình cảm nên bạn hoàn toàn có thể yên tâm khi thả mèo Ai Cập chơi đùa cùng những vật nuôi khác. Các em ấy sẽ 
chẳng ăn hiếp ai bao giờ mà ngược lại còn nhường nhịn và rất thân thiện.
Ngoài ra, bản tính trung thành là 1 ưu điểm nổi bật, sẽ không có chuyện mèo Ai Cập bỏ nhà đi hoang trừ khi bị chủ nhân đánh đuổi.'
,N'~/UploadFile/files/MeoAiCap_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 9, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (31,
N'Mèo Ai Cập', CAST(16000000 AS Decimal(18, 0)), N'Vào năm 1966, có 1 sự giao phối rất ngẫu nhiên đến từ 2 chú mèo ở Toronto và Canada. 
Kết quả thực sự rất bất ngờ khi Prune ra đời và trên người hoàn toàn trụi lông và trông rất hoang dã.
Sau khi trưởng thành, Prune lại tiếp tục giao phối với mẹ của nó và kết quả là đã có nhiều chú mèo không lông khác ra đời.
Chúng chính là cụ nội loài mèo không lông Ai Cập ngày nay'
,N'So với những giống mèo khác, mèo Ai Cập có khá nhiều đặc điểm thú vị khiến cho những người yêu mèo phải mê đắm.
mèo ai cập giá
Thoạt đầu khi mới nhìn qua bạn sẽ thấy 1 chú mèo hoàn toàn nhẵn nhụi với làn da đầy nếp nhăn giống như một sinh vật vừa mới ra đời. Tuy nhiên, nếu 
có điều kiện quan sát kĩ thì bạn sẽ nhận ra thực tế không phải như vậy
Da của chúng được bao trùm bởi 1 lớp lông tơ cực kỳ mỏng và mảnh, tất nhiên là lớp lông này hoàn toàn không có tác dụng che chắn hay giữ ấm cơ thể.
Tuy nhiên, bề mặt da sẽ giúp xúc giác của mèo Ai Cập trở nên nhạy bén hơn trong mọi tình huống.
Mèo Ai Cập có đôi tai khá to, hơn hẳn so với khuôn mặt cùng 1 đôi mắt nai luôn toát lên vẻ nghiêm nghị.
Càng lớn dần theo thời gian thì vẻ nhăn nheo trên phần da của mèo Ai Cập càng giãn ra khiến chúng trở nên già nua và ngày càng dữ tợn.
Chính vì không có lớp lông bên ngoài che chắn và bảo vệ nên mèo Ai Cập rất dễ bị tổn thương. Trong quá trình chăm sóc bạn nên mua
các bộ quần áo cho dành riêng cho thú cưng để mèo Ai Cập mặc trong những ngày trời lạnh.
Mèo Ai Cập rất dễ thương, sở hữu trong mình tính cách thân thiện, thông minh, hoạt bát và cực kỳ trung thành với chủ nhân.
Không giống với tính nhút nhát của những loài mèo khác, mèo Ai Cập rất ngoan khi khách đến nhà.
mèo ai cập giá bao nhiêu
Giống mèo này rất hiếu khách và “hiểu chuyện”, chúng có thể tự đi lấy đồ chơi và tự chơi đùa một mình khi thấy chủ nhân bận.
Nét duyên dáng và “biết điều” này đã khiến rất nhiều người phải xiu lòng và bắt buộc bù đắp lại bằng việc hết mực thương yêu chúng.
Mèo Ai Cập rất thích làm nũng nên bạn sẽ thường xuyên bắt gặp cảnh chúng cọ đầu vào chân hay rúc vào lòng bạn mỗi tối.
Mèo Ai Cập thích sự ấm áp, chúng thường lần mò và nằm cạnh tivi, tấm thảm hoặc đón nắng ngoài sân vào mỗi buổi sáng bên cạnh cửa sổ…
Vốn là loài vật sống tình cảm nên bạn hoàn toàn có thể yên tâm khi thả mèo Ai Cập chơi đùa cùng những vật nuôi khác. Các em ấy sẽ 
chẳng ăn hiếp ai bao giờ mà ngược lại còn nhường nhịn và rất thân thiện.
Ngoài ra, bản tính trung thành là 1 ưu điểm nổi bật, sẽ không có chuyện mèo Ai Cập bỏ nhà đi hoang trừ khi bị chủ nhân đánh đuổi.'
,N'~/UploadFile/files/MeoAiCap_3.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 9, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (32,
N'Mèo Ai Cập', CAST(14000000 AS Decimal(18, 0)), N'Vào năm 1966, có 1 sự giao phối rất ngẫu nhiên đến từ 2 chú mèo ở Toronto và Canada. 
Kết quả thực sự rất bất ngờ khi Prune ra đời và trên người hoàn toàn trụi lông và trông rất hoang dã.
Sau khi trưởng thành, Prune lại tiếp tục giao phối với mẹ của nó và kết quả là đã có nhiều chú mèo không lông khác ra đời.
Chúng chính là cụ nội loài mèo không lông Ai Cập ngày nay'
,N'So với những giống mèo khác, mèo Ai Cập có khá nhiều đặc điểm thú vị khiến cho những người yêu mèo phải mê đắm.
mèo ai cập giá
Thoạt đầu khi mới nhìn qua bạn sẽ thấy 1 chú mèo hoàn toàn nhẵn nhụi với làn da đầy nếp nhăn giống như một sinh vật vừa mới ra đời. Tuy nhiên, nếu 
có điều kiện quan sát kĩ thì bạn sẽ nhận ra thực tế không phải như vậy
Da của chúng được bao trùm bởi 1 lớp lông tơ cực kỳ mỏng và mảnh, tất nhiên là lớp lông này hoàn toàn không có tác dụng che chắn hay giữ ấm cơ thể.
Tuy nhiên, bề mặt da sẽ giúp xúc giác của mèo Ai Cập trở nên nhạy bén hơn trong mọi tình huống.
Mèo Ai Cập có đôi tai khá to, hơn hẳn so với khuôn mặt cùng 1 đôi mắt nai luôn toát lên vẻ nghiêm nghị.
Càng lớn dần theo thời gian thì vẻ nhăn nheo trên phần da của mèo Ai Cập càng giãn ra khiến chúng trở nên già nua và ngày càng dữ tợn.
Chính vì không có lớp lông bên ngoài che chắn và bảo vệ nên mèo Ai Cập rất dễ bị tổn thương. Trong quá trình chăm sóc bạn nên mua
các bộ quần áo cho dành riêng cho thú cưng để mèo Ai Cập mặc trong những ngày trời lạnh.
Mèo Ai Cập rất dễ thương, sở hữu trong mình tính cách thân thiện, thông minh, hoạt bát và cực kỳ trung thành với chủ nhân.
Không giống với tính nhút nhát của những loài mèo khác, mèo Ai Cập rất ngoan khi khách đến nhà.
mèo ai cập giá bao nhiêu
Giống mèo này rất hiếu khách và “hiểu chuyện”, chúng có thể tự đi lấy đồ chơi và tự chơi đùa một mình khi thấy chủ nhân bận.
Nét duyên dáng và “biết điều” này đã khiến rất nhiều người phải xiu lòng và bắt buộc bù đắp lại bằng việc hết mực thương yêu chúng.
Mèo Ai Cập rất thích làm nũng nên bạn sẽ thường xuyên bắt gặp cảnh chúng cọ đầu vào chân hay rúc vào lòng bạn mỗi tối.
Mèo Ai Cập thích sự ấm áp, chúng thường lần mò và nằm cạnh tivi, tấm thảm hoặc đón nắng ngoài sân vào mỗi buổi sáng bên cạnh cửa sổ…
Vốn là loài vật sống tình cảm nên bạn hoàn toàn có thể yên tâm khi thả mèo Ai Cập chơi đùa cùng những vật nuôi khác. Các em ấy sẽ 
chẳng ăn hiếp ai bao giờ mà ngược lại còn nhường nhịn và rất thân thiện.
Ngoài ra, bản tính trung thành là 1 ưu điểm nổi bật, sẽ không có chuyện mèo Ai Cập bỏ nhà đi hoang trừ khi bị chủ nhân đánh đuổi.'
,N'~/UploadFile/files/MeoAiCap_4.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 9, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (33,
N'Mèo Ai Cập', CAST(18000000 AS Decimal(18, 0)), N'Vào năm 1966, có 1 sự giao phối rất ngẫu nhiên đến từ 2 chú mèo ở Toronto và Canada. 
Kết quả thực sự rất bất ngờ khi Prune ra đời và trên người hoàn toàn trụi lông và trông rất hoang dã.
Sau khi trưởng thành, Prune lại tiếp tục giao phối với mẹ của nó và kết quả là đã có nhiều chú mèo không lông khác ra đời.
Chúng chính là cụ nội loài mèo không lông Ai Cập ngày nay'
,N'So với những giống mèo khác, mèo Ai Cập có khá nhiều đặc điểm thú vị khiến cho những người yêu mèo phải mê đắm.
mèo ai cập giá
Thoạt đầu khi mới nhìn qua bạn sẽ thấy 1 chú mèo hoàn toàn nhẵn nhụi với làn da đầy nếp nhăn giống như một sinh vật vừa mới ra đời. Tuy nhiên, nếu 
có điều kiện quan sát kĩ thì bạn sẽ nhận ra thực tế không phải như vậy
Da của chúng được bao trùm bởi 1 lớp lông tơ cực kỳ mỏng và mảnh, tất nhiên là lớp lông này hoàn toàn không có tác dụng che chắn hay giữ ấm cơ thể.
Tuy nhiên, bề mặt da sẽ giúp xúc giác của mèo Ai Cập trở nên nhạy bén hơn trong mọi tình huống.
Mèo Ai Cập có đôi tai khá to, hơn hẳn so với khuôn mặt cùng 1 đôi mắt nai luôn toát lên vẻ nghiêm nghị.
Càng lớn dần theo thời gian thì vẻ nhăn nheo trên phần da của mèo Ai Cập càng giãn ra khiến chúng trở nên già nua và ngày càng dữ tợn.
Chính vì không có lớp lông bên ngoài che chắn và bảo vệ nên mèo Ai Cập rất dễ bị tổn thương. Trong quá trình chăm sóc bạn nên mua
các bộ quần áo cho dành riêng cho thú cưng để mèo Ai Cập mặc trong những ngày trời lạnh.
Mèo Ai Cập rất dễ thương, sở hữu trong mình tính cách thân thiện, thông minh, hoạt bát và cực kỳ trung thành với chủ nhân.
Không giống với tính nhút nhát của những loài mèo khác, mèo Ai Cập rất ngoan khi khách đến nhà.
mèo ai cập giá bao nhiêu
Giống mèo này rất hiếu khách và “hiểu chuyện”, chúng có thể tự đi lấy đồ chơi và tự chơi đùa một mình khi thấy chủ nhân bận.
Nét duyên dáng và “biết điều” này đã khiến rất nhiều người phải xiu lòng và bắt buộc bù đắp lại bằng việc hết mực thương yêu chúng.
Mèo Ai Cập rất thích làm nũng nên bạn sẽ thường xuyên bắt gặp cảnh chúng cọ đầu vào chân hay rúc vào lòng bạn mỗi tối.
Mèo Ai Cập thích sự ấm áp, chúng thường lần mò và nằm cạnh tivi, tấm thảm hoặc đón nắng ngoài sân vào mỗi buổi sáng bên cạnh cửa sổ…
Vốn là loài vật sống tình cảm nên bạn hoàn toàn có thể yên tâm khi thả mèo Ai Cập chơi đùa cùng những vật nuôi khác. Các em ấy sẽ 
chẳng ăn hiếp ai bao giờ mà ngược lại còn nhường nhịn và rất thân thiện.
Ngoài ra, bản tính trung thành là 1 ưu điểm nổi bật, sẽ không có chuyện mèo Ai Cập bỏ nhà đi hoang trừ khi bị chủ nhân đánh đuổi.'
,N'~/UploadFile/files/MeoAiCap_5.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 9, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (34,
N'Mèo Anh Long Ngắn', CAST(7000000 AS Decimal(18, 0)), N'Mèo Anh là giống mèo phổ biến có nguồn gốc từ nước Anh. Xuất hiên từ nhưng
năm cuối thế kỉ 19 và trải qua một khoảng thời gian dài lai tạo để có những đặc tính tốt nhất. Hiện nay chúng đã được nuôi rất phổ biến trong các gia đình trên khắp thế giới, Việt Nam cũng không ngoại lệ.
Có hai dòng mèo Anh phố biến nhất là Anh lông ngắn (ALN) và Anh lông dài (ALD).'
,N'Aln là sản phẩm của việc lai tạo giữa mèo Ai Cập với nhiều giống khác. Thời gian sau đó chúng được phối với mèo Ba Tư và Russian Blue và trở nên phổ biến.
Màu lông của Aln khá đa dạng nhưng phổ biến nhất vẫn là màu xám xanh cổ điển. Bộ lông của chúng ngắn nhưng dày và ít rụng lông nên ít tốn thời gian chải chuốt.
Aln sở hữu khuôn mặt bánh bao, má phệ, mũi ngắn cùng đôi mắt to tròn sẽ đốn tim bạn ngay từ lần đầu tiên. Thân hình chúng tròn trịa,
đuôi to và bộ lông mịn như nhung sẽ khiến bạn muốn rinh ngay về ngôi nhà của mình đấy.
Trung bình một bé mèo Anh lông ngắn có trọng lượng từ 4 – 8kg.
Mèo Anh
Khuôn mặt bánh bao đốn tim cả những những khó tính nhất – Ảnh: Internet
Mèo Anh lông ngắn vốn không thích sự ồn ào, chúng thích chơi đùa với trẻ con, quấn chân và ngồi trong lòng chủ.
Hiếm khi thấy chúng chạy nhảy quá trớn nhưng thỉnh thoảng chúng cũng vờn qua lại với những con vật khác và đôi khi là tự chơi với cái bóng của mình.'
,N'~/UploadFile/files/MeoAnhLongNgan_3.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 6, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (35,
N'Mèo Anh Long Ngắn', CAST(8000000 AS Decimal(18, 0)), N'Mèo Anh là giống mèo phổ biến có nguồn gốc từ nước Anh. Xuất hiên từ nhưng
năm cuối thế kỉ 19 và trải qua một khoảng thời gian dài lai tạo để có những đặc tính tốt nhất. Hiện nay chúng đã được nuôi rất phổ biến trong các gia đình trên khắp thế giới, Việt Nam cũng không ngoại lệ.
Có hai dòng mèo Anh phố biến nhất là Anh lông ngắn (ALN) và Anh lông dài (ALD).'
,N'Aln là sản phẩm của việc lai tạo giữa mèo Ai Cập với nhiều giống khác. Thời gian sau đó chúng được phối với mèo Ba Tư và Russian Blue và trở nên phổ biến.
Màu lông của Aln khá đa dạng nhưng phổ biến nhất vẫn là màu xám xanh cổ điển. Bộ lông của chúng ngắn nhưng dày và ít rụng lông nên ít tốn thời gian chải chuốt.
Aln sở hữu khuôn mặt bánh bao, má phệ, mũi ngắn cùng đôi mắt to tròn sẽ đốn tim bạn ngay từ lần đầu tiên. Thân hình chúng tròn trịa,
đuôi to và bộ lông mịn như nhung sẽ khiến bạn muốn rinh ngay về ngôi nhà của mình đấy.
Trung bình một bé mèo Anh lông ngắn có trọng lượng từ 4 – 8kg.
Mèo Anh
Khuôn mặt bánh bao đốn tim cả những những khó tính nhất – Ảnh: Internet
Mèo Anh lông ngắn vốn không thích sự ồn ào, chúng thích chơi đùa với trẻ con, quấn chân và ngồi trong lòng chủ.
Hiếm khi thấy chúng chạy nhảy quá trớn nhưng thỉnh thoảng chúng cũng vờn qua lại với những con vật khác và đôi khi là tự chơi với cái bóng của mình.'
,N'~/UploadFile/files/MeoAnhLongNgan_4.png', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 6, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (36,
N'Mèo Anh Long Ngắn', CAST(6000000 AS Decimal(18, 0)), N'Mèo Anh là giống mèo phổ biến có nguồn gốc từ nước Anh. Xuất hiên từ nhưng
năm cuối thế kỉ 19 và trải qua một khoảng thời gian dài lai tạo để có những đặc tính tốt nhất. Hiện nay chúng đã được nuôi rất phổ biến trong các gia đình trên khắp thế giới, Việt Nam cũng không ngoại lệ.
Có hai dòng mèo Anh phố biến nhất là Anh lông ngắn (ALN) và Anh lông dài (ALD).'
,N'Aln là sản phẩm của việc lai tạo giữa mèo Ai Cập với nhiều giống khác. Thời gian sau đó chúng được phối với mèo Ba Tư và Russian Blue và trở nên phổ biến.
Màu lông của Aln khá đa dạng nhưng phổ biến nhất vẫn là màu xám xanh cổ điển. Bộ lông của chúng ngắn nhưng dày và ít rụng lông nên ít tốn thời gian chải chuốt.
Aln sở hữu khuôn mặt bánh bao, má phệ, mũi ngắn cùng đôi mắt to tròn sẽ đốn tim bạn ngay từ lần đầu tiên. Thân hình chúng tròn trịa,
đuôi to và bộ lông mịn như nhung sẽ khiến bạn muốn rinh ngay về ngôi nhà của mình đấy.
Trung bình một bé mèo Anh lông ngắn có trọng lượng từ 4 – 8kg.
Mèo Anh
Khuôn mặt bánh bao đốn tim cả những những khó tính nhất – Ảnh: Internet
Mèo Anh lông ngắn vốn không thích sự ồn ào, chúng thích chơi đùa với trẻ con, quấn chân và ngồi trong lòng chủ.
Hiếm khi thấy chúng chạy nhảy quá trớn nhưng thỉnh thoảng chúng cũng vờn qua lại với những con vật khác và đôi khi là tự chơi với cái bóng của mình.'
,N'~/UploadFile/files/MeoAnhLongNgan_5.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 6, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (37,
N'Mèo Exotic', CAST(9000000 AS Decimal(18, 0)), N'Bạn yêu thích một chú Mèo Ba Tư sang trọng nhưng lại không có đủ thời gian săn sóc kĩ lưỡng cho bộ lông 
của chúng? Hãy thử làm bạn với mèo Exotic là giống mèo còn khá mới, có nguồn gốc từ Ba Tư thuần chủng lai với mèo Mỹ lông ngắn vào những năm 1950. 
Do có khuôn mặt, thân hình, tính cách và cả các bệnh di truyền giống hệt mèo Ba Tư nên giới yêu mèo thường gọi mèo Exotic là mèo Ba Tư lông ngắn.'
,N'Chiều cao: 25.4cm – 30.5cm
Trọng lượng: 3.17kg – 5.4kg
Cơ thể tròn trịa mũm mĩm, chân ngắn, ngực lớn, vai rộng. Xương lớn, cơ bắp mạnh mẽ. Trọng lượng phổ biến từ 3 – 6 kg khi trưởng thành. Đuôi ngắn, dày và thường để thấp khi di chuyển
Đầu mèo Exotic to và tròn, hộp sọ rất rộng. Má căng và đầy đặn. Mõm ngắn, rộng, môi trên vểnh lên. Mũi ngắn, nhỏ và tẹt, điểm điểm giao giữa
sống mũi và trán rõ ràng; cổ ngắn và rất mập mạp; Mắt tròn, to trông cực ngây thơ và dễ thương. Hầu hết mèo Exotic có mắt màu đồng, một số ít
có màu xanh lá cây hoặc xanh da trời.
Màu mắt chúng tuỳ thuộc vào màu lông. Tai nhỏ, dựng đứng, vành tai tròn, chóp nhọn. Trong tai có nhiều lông tơ.
Exotic shorthair
Mèo Exotic lông ngắn so với giống mèo Ba Tư,  nhưng dài hơn các giống mèo lông ngắn. Tuy không sở hữu bộ lông dài thượt như mèo Ba Tư, bộ lông ngắn dày
của mèo Exotic vẫn rất tuyệt đẹp, rất dày và mượt, màu sắc rất đa dạng, có thể có các màu đen, trắng, vàng, nâu, vằn vện,đỏ, màu kem, màu hoa cà, khoang,
xám, tam thể hoặc pha trộn giữa 2 trong số các màu này…Phần lớn mèo Exotic có lông ngắn, tuy nhiên do chúng có gen lặn là lông dài nên trung bình cứ 4
chú mèo Exotic được sinh ra thì lại có 1 em lông dài. Do những em Exotic lông dài có hình dáng giống hệt mèo Ba Tư (gần như không thể phân biệt)
chúng cũng được coi là mèo Ba Tư
Tính cách
Mèo Exotic có tính cách hiền hòa, nhẹ nhàng và rất ngọt ngào. Đây là giống mèo dễ gần, tràn đầy tình cảm. Chúng rất quấn quýt
và trung thành với chủ. Một con mèo Exotic sẽ ôm lấy bạn khi bạn bế nó lên, hoặc nhảy lên đùi bạn và cuộn tròn nũng nịu khi bạn đang ngồi trên ghế.
Chúng thừa kế tính tình trầm lặng, ôn hoà từ mèo Ba Tư, thêm một chút vui vẻ thích chơi đùa từ mèo Mỹ lông ngắn.'
,N'~/UploadFile/files/MeoExotic_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 8, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (38,
N'Mèo Nga Long Dài', CAST(1200000 AS Decimal(18, 0)), N'Đúng với tên gọi của mình, mèo Nga thuần chủng có xuất xứ từ đất nước Russian 
nhưng điều đặc biệt làm nên vẻ hấp dẫn của giống loài này không chỉ dừng lại ở đấy.
Vào cuối thế kỉ 19, người ta tìm thấy loài mèo này tại nước Nga với thân hình nhỏ bé, bộ lông ngắn ôm sát và màu sắc rất riêng biệt.
mèo nga mắt 2 màuTại 1 cuộc triển lãm thường niên dành cho loài mèo được tổ chức vào năm 1875.'
,N'Sở hữu những nét độc đáo hơn so với các giống mèo khác, cấu trúc phần đầu của mèo Nga có hình tam giác đặc trưng.
mèo nga lông xù
Trong đó, phần đỉnh đầu của mèo phát triển khá to và thu gọn dần đến cằm.
Nhìn những chú mèo Nga thuần chủng, bạn có thể liên tưởng ngay tới gương mặt V Line đang rất HOT trong thời điểm hiện nay đó.
Đôi mắt màu xanh
Mèo Nga được biết đến là một trong những giống mèo sở hữu đôi mắt đẹp nhất thời điểm hiện nay.
Mắt mèo có màu xanh lá cây, sáng như những viên pha lê. Thông thường, khi những chú mèo này vừa ra đời, bạn sẽ không thấy được màu xanh trong mắt chúng.
Chỉ sau 4 tháng, màu xanh mới bắt đầu hiện hữu thực sự.
Màu mắt của mèo chỉ đậm nhất vào thời điểm chúng dậy thì, khi qua giai đoạn này, sắc xanh trong đôi mắt vẫn còn nhưng sẽ mờ dần đi.
Bộ lông màu khói
Có một số bạn thường hiểu lầm rằng mèo Nga có rất nhiều màu lông như trắng, tabby,… Tuy nhiên, đây chỉ là những chú mèo đã trải qua quá trình lai tạo.
Còn với mèo Nga thuần chủng, dù là mèo lông ngắn hay lông dài, chúng chỉ có một màu xám khói đặc trưng.
Tuy nhiên, tại rất nhiều quốc gia hay ngay cả tại Việt Nam, bộ lông của những chú mèo này vẫn được quy ước là màu xanh, một dạng biến thể sáng hơn của màu đen.'
,N'~/UploadFile/files/MeoNgaLongDai_1.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 7, 2,1)
INSERT [dbo].[ThuCung] ([MaTC], [TenTC], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaGiong], [MaLoai], [Moi]) VALUES (39,
N'Mèo Nga Long Dài', CAST(1300000 AS Decimal(18, 0)), N'Đúng với tên gọi của mình, mèo Nga thuần chủng có xuất xứ từ đất nước Russian 
nhưng điều đặc biệt làm nên vẻ hấp dẫn của giống loài này không chỉ dừng lại ở đấy.
Vào cuối thế kỉ 19, người ta tìm thấy loài mèo này tại nước Nga với thân hình nhỏ bé, bộ lông ngắn ôm sát và màu sắc rất riêng biệt.
mèo nga mắt 2 màuTại 1 cuộc triển lãm thường niên dành cho loài mèo được tổ chức vào năm 1875.'
,N'Sở hữu những nét độc đáo hơn so với các giống mèo khác, cấu trúc phần đầu của mèo Nga có hình tam giác đặc trưng.
mèo nga lông xù
Trong đó, phần đỉnh đầu của mèo phát triển khá to và thu gọn dần đến cằm.
Nhìn những chú mèo Nga thuần chủng, bạn có thể liên tưởng ngay tới gương mặt V Line đang rất HOT trong thời điểm hiện nay đó.
Đôi mắt màu xanh
Mèo Nga được biết đến là một trong những giống mèo sở hữu đôi mắt đẹp nhất thời điểm hiện nay.
Mắt mèo có màu xanh lá cây, sáng như những viên pha lê. Thông thường, khi những chú mèo này vừa ra đời, bạn sẽ không thấy được màu xanh trong mắt chúng.
Chỉ sau 4 tháng, màu xanh mới bắt đầu hiện hữu thực sự.
Màu mắt của mèo chỉ đậm nhất vào thời điểm chúng dậy thì, khi qua giai đoạn này, sắc xanh trong đôi mắt vẫn còn nhưng sẽ mờ dần đi.
Bộ lông màu khói
Có một số bạn thường hiểu lầm rằng mèo Nga có rất nhiều màu lông như trắng, tabby,… Tuy nhiên, đây chỉ là những chú mèo đã trải qua quá trình lai tạo.
Còn với mèo Nga thuần chủng, dù là mèo lông ngắn hay lông dài, chúng chỉ có một màu xám khói đặc trưng.
Tuy nhiên, tại rất nhiều quốc gia hay ngay cả tại Việt Nam, bộ lông của những chú mèo này vẫn được quy ước là màu xanh, một dạng biến thể sáng hơn của màu đen.'
,N'~/UploadFile/files/MeoNgaLongDai_2.jpg', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 100, 7, 2,1)

SET IDENTITY_INSERT [dbo].[ThuCung] OFF

/*====================================================================================*/
SET IDENTITY_INSERT [dbo].[DonHang] ON 
INSERT [dbo].[DonHang] ([MaDH], [CreatedDate], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi], [Status]) VALUES (1,
CAST(N'2021-11-04T23:51:19.487' AS DateTime), 2, N'Nguyễn Văn Dao', N'nguyenvand@gmail.com', N'0425343423', N'Ấp 3 Long Cang, Cần Đước, Long An',1)
INSERT [dbo].[DonHang] ([MaDH], [CreatedDate], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi], [Status]) VALUES (2,
CAST(N'2020-11-22T23:51:19.487' AS DateTime), 1, N'Nguyễn Văn Cảnh', N'nguyenvanc@gmail.com', N'0912345678', N'Ấp 11 Long Định, Cần Đước, Long An',1)
INSERT [dbo].[DonHang] ([MaDH], [CreatedDate], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi], [Status]) VALUES (3,
CAST(N'2021-11-03T23:51:19.487' AS DateTime), 3, N'Nguyễn Thị Anh', N'nguyenthia@gmail.com', N'0912345678', N'Ấp 11 Long Định, Cần Đước, Long An',1)
INSERT [dbo].[DonHang] ([MaDH], [CreatedDate], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi], [Status]) VALUES (4,
CAST(N'2021-11-11T23:51:19.487' AS DateTime), 4, N'Trần Hoàng Anh', N'tranvanb@gmail.com', N'0912345678', N'Ấp 11 Long Định, Cần Đước, Long An',1)

SET IDENTITY_INSERT [dbo].[DonHang] OFF

/*====================================================================================*/
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (1, 1, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (1, 2, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (1, 5, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (2, 2, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (2, 4, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (2, 5, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (2, 7, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (3, 1, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (3, 2, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (3, 10, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (3, 11, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (4, 12, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (4, 13, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (4, 14, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (4, 15, 5, CAST(25000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaTC], [SoLuong], [ThanhTien]) VALUES (4, 16, 5, CAST(25000000 AS Decimal(18, 0)))


/*================================Mã Hash = 123456 ====================================================*/
SET IDENTITY_INSERT [dbo].[KhachHang] ON 
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [XacNhanMK], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (1,
N'Nguyễn Văn Cảnh', N'nguyenvanc', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'nguyenvanc@gmail.com', N'123 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP Hồ Chí Minh', N'0981234567', N'Nam', CAST(N'1999-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [XacNhanMK], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (2,
N'Nguyễn Văn Dao', N'nguyenvand', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'nguyenvand@gmail.com', N'123 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP Hồ Chí Minh', N'0227255554', N'Nam', CAST(N'1999-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [XacNhanMK], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (3,
N'Nguyễn Thị Anh', N'nguyenthia', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'nguyenthia@gmail.com', N'123 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP Hồ Chí Minh', N'0227255434', N'Nữ', CAST(N'1999-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [XacNhanMK], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (4,
N'Nguyễn Trần Hoàng', N'nguyentranhoang', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'nguyentranhoang@gmail.com', N'123 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP Hồ Chí Minh', N'0227254554', N'Nam', CAST(N'1999-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [XacNhanMK], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (5,
N'Trần Hoàng Anh', N'tranhoanganh', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'tranhoanganh@gmail.com', N'123 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP Hồ Chí Minh', N'0227774554', N'Nam', CAST(N'1999-01-01T00:00:00.000' AS DateTime))

SET IDENTITY_INSERT [dbo].[KhachHang] OFF

/*====================================================================================*/
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_ThuCung] FOREIGN KEY([MaTC])
REFERENCES [dbo].[ThuCung] ([MaTC])
GO

ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_ThuCung]
GO

ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO

ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO

ALTER TABLE [dbo].[Giong]  WITH CHECK ADD  CONSTRAINT [FK_Giong_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO

ALTER TABLE [dbo].[Giong] CHECK CONSTRAINT [FK_Giong_Loai]
GO

ALTER TABLE [dbo].[ThuCung]  WITH CHECK ADD  CONSTRAINT [FK_ThuCung_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO

ALTER TABLE [dbo].[ThuCung] CHECK CONSTRAINT [FK_ThuCung_Loai]
GO

ALTER TABLE [dbo].[ThuCung]  WITH CHECK ADD CONSTRAINT [FK_ThuCung_Gionggggg] FOREIGN KEY([MaGiong])
REFERENCES [dbo].[Giong] ([MaGiong])
GO

ALTER TABLE [dbo].[ThuCung] CHECK CONSTRAINT [FK_ThuCung_Gionggggg]
GO

ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO

ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO

ALTER DATABASE QL_ThuCung SET READ_WRITE 
GO
GO