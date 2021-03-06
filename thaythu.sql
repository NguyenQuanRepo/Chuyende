USE [master]
GO
/****** Object:  Database [CHUNGKHOAN]    Script Date: 16/04/21 4:06:01 CH ******/
CREATE DATABASE [CHUNGKHOAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHUNGKHOAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CHUNGKHOAN.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CHUNGKHOAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CHUNGKHOAN_log.ldf' , SIZE = 11200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CHUNGKHOAN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHUNGKHOAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHUNGKHOAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHUNGKHOAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECOVERY FULL 
GO
ALTER DATABASE [CHUNGKHOAN] SET  MULTI_USER 
GO
ALTER DATABASE [CHUNGKHOAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHUNGKHOAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHUNGKHOAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CHUNGKHOAN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CHUNGKHOAN', N'ON'
GO
USE [CHUNGKHOAN]
GO
/****** Object:  Table [dbo].[BANG_GIA_TRUC_TUYEN]    Script Date: 16/04/21 4:06:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANG_GIA_TRUC_TUYEN](
	[MACP] [char](7) NOT NULL,
	[DM_GIA3] [float] NULL,
	[DM_KL3] [int] NULL,
	[DM_GIA2] [float] NULL,
	[DM_KL2] [int] NULL,
	[DM_GIA1] [float] NULL,
	[DM_KL1] [int] NULL,
	[KL_GIA] [float] NULL,
	[KL_KL] [int] NULL,
	[DB_GIA1] [float] NULL,
	[DB_KL1] [int] NULL,
	[DB_GIA2] [float] NULL,
	[DB_KL2] [int] NULL,
	[DB_GIA3] [float] NULL,
	[DB_KL3] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 16/04/21 4:06:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MACP] [char](7) NOT NULL,
	[NGAYDAT] [datetime] NOT NULL CONSTRAINT [DF__LENHDAT_NGAYDAT]  DEFAULT (getdate()),
	[LOAIGD] [nchar](1) NOT NULL,
	[LOAILENH] [nchar](10) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[GIADAT] [float] NOT NULL,
	[TRANGTHAILENH] [nvarchar](30) NULL,
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LENHKHOP]    Script Date: 16/04/21 4:06:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHKHOP](
	[IDKHOP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYKHOP] [datetime] NOT NULL,
	[SOLUONGKHOP] [int] NOT NULL,
	[GIAKHOP] [float] NOT NULL,
	[IDLENHDAT] [int] NULL,
 CONSTRAINT [PK__LENHKHOP__F336C59879AC3042] PRIMARY KEY CLUSTERED 
(
	[IDKHOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_MACP]    Script Date: 16/04/21 4:06:01 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_MACP] ON [dbo].[BANG_GIA_TRUC_TUYEN]
(
	[MACP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LENHKHOP]  WITH CHECK ADD  CONSTRAINT [FK_LENHKHOP_LENHDAT] FOREIGN KEY([IDLENHDAT])
REFERENCES [dbo].[LENHDAT] ([ID])
GO
ALTER TABLE [dbo].[LENHKHOP] CHECK CONSTRAINT [FK_LENHKHOP_LENHDAT]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_GIADAT] CHECK  (([GIADAT]>(0)))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_GIADAT]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_LOAIGD] CHECK  (([LOAIGD]='M' OR [LOAIGD]='B'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_LOAIGD]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_LOAILENH] CHECK  (([LOAILENH]='LO' OR [LOAILENH]='ATO' OR [LOAILENH]='ATC'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_LOAILENH]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_SOLUONG] CHECK  (([SOLUONG]>=(0)))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_SOLUONG]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_TRANGTHAILENH] CHECK  (([TRANGTHAILENH]=N'Chờ khớp' OR [TRANGTHAILENH]=N'Khớp lệnh 1 phần' OR [TRANGTHAILENH]=N'Khớp hết' OR [TRANGTHAILENH]=N'Đã hủy' OR [TRANGTHAILENH]=N'Chưa khớp'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_TRANGTHAILENH]
GO
/****** Object:  StoredProcedure [dbo].[CursorLoaiGD]    Script Date: 16/04/21 4:06:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CursorLoaiGD]
  @OutCrsr CURSOR VARYING OUTPUT, 
  @macp NVARCHAR( 10), @Ngay NVARCHAR( 50),  @LoaiGD CHAR 
AS
SET DATEFORMAT DMY 
IF (@LoaiGD='M') 
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@macp 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT DESC, NGAYDAT 
ELSE
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID,NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@macp 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT, NGAYDAT 
OPEN @OutCrsr

GO
/****** Object:  StoredProcedure [dbo].[RESET_BGTT]    Script Date: 16/04/21 4:06:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RESET_BGTT]
AS
BEGIN
	DELETE FROM dbo.BANG_GIA_TRUC_TUYEN

END

GO
/****** Object:  StoredProcedure [dbo].[SP_BUILD_BGTT]    Script Date: 16/04/21 4:06:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery64.sql|7|0|C:\Users\phong\AppData\Local\Temp\~vs9095.sql
CREATE PROCEDURE [dbo].[SP_BUILD_BGTT] 
 @LoaiGD NCHAR(1), 
    @MACP CHAR(10),   @NGAYDAT DATETIME ,    @GIADAT FLOAT 
AS
   
		-- Xóa table ảo nếu tồn tại
        IF EXISTS ( SELECT  *
                    FROM    tempdb.sys.tables
                    WHERE   name like '#TEMP_BGLD%' )
            DROP TABLE #TEMP_BGLD

			--BANG GIA LENH DAT

	     IF EXISTS ( SELECT  *
                    FROM    tempdb.sys.tables
                    WHERE   name like '#TEMP_BGLB_TOP2%' )
            DROP TABLE #TEMP_BGLB_TOP2

		 IF EXISTS ( SELECT  *
                    FROM    tempdb.sys.tables
                    WHERE   name like '#TEMP_BGLM_TOP2%' )
         DROP TABLE #TEMP_BGLM_TOP2






		

		

		
		-- lấy ra danh sách LÊNH ĐẶT cần thao tác bỏ vào tảng tạm #TEMP_BGLD
        SELECT  MACP ,
                GIADAT ,
                Sum(ISNULL(SOLUONG, 0)) AS KL
        INTO    #TEMP_BGLD
        FROM    dbo.LENHDAT
        WHERE   MACP = @MACP
                AND DAY(NGAYDAT) = DAY(@NGAYDAT)
                AND MONTH(NGAYDAT) = MONTH(@NGAYDAT)
                AND YEAR(NGAYDAT) = YEAR(@NGAYDAT)
                AND LOAIGD = @LoaiGD
                AND SOLUONG > 0
        GROUP BY MACP ,  GIADAT


		
	
		 
	

        IF ( @LoaiGD = 'M' )
            BEGIN
               
			    SELECT  *
                INTO    #TEMP_BGLM_TOP2
                FROM    ( SELECT    * ,
                                    ROW_NUMBER() OVER ( ORDER BY GIADAT DESC) AS Row_Number
                          FROM      #TEMP_BGLD
                        ) Temp
                WHERE   Row_Number <= 3



				-- trường hợp đặc biệt(xử lý display BGTT): xóa giá trị các record trước khi insert mới vào trong BGTT
								
				UPDATE  dbo.BANG_GIA_TRUC_TUYEN
				SET     DM_GIA3 = 0, DM_KL3 = 0,DM_GIA2 = 0,DM_GIA1 = 0, DM_KL1 = 0,
						DM_KL2 = 0
				WHERE   MACP = @MACP





                IF EXISTS (SELECT * FROM #TEMP_BGLM_TOP2 WHERE Row_Number = 1)
                 BEGIN  -- merge operation
                        IF EXISTS ( SELECT  *
                                    FROM    dbo.BANG_GIA_TRUC_TUYEN
                                    WHERE   MACP = @MACP )
                            BEGIN
                                UPDATE  dbo.BANG_GIA_TRUC_TUYEN
                                SET     DM_GIA1 = ( SELECT  GIADAT
                                                    FROM    #TEMP_BGLM_TOP2
                                                    WHERE   Row_Number = 1
                                                  ) ,
                                        DM_KL1 = ( SELECT   KL
                                                   FROM     #TEMP_BGLM_TOP2
                                                   WHERE     Row_Number = 1
                                                 )
                                WHERE   MACP = @MACP



								---- trường hợp đặc biệt: xóa giá trị còn lại của dòng dùng để chứa dữ liệu record có  Row_Number = 2 trong table BGTT
								---- nếu chỉ một một hình dữ liệu record có Row_number = 1  được cho vào table BGTT
								
								--UPDATE  dbo.BANG_GIA_TRUC_TUYEN
        --                        SET     DM_GIA2 = 0,
        --                                DM_KL2 = 0
        --                        WHERE   MACP = @MACP

                            END
                        ELSE
                            BEGIN
                                INSERT  INTO dbo.BANG_GIA_TRUC_TUYEN
                                        ( MACP ,
                                          DM_GIA1 ,
                                          DM_KL1
                                        )
                                        SELECT  MACP ,
                                                GIADAT ,
                                                KL
                                        FROM    #TEMP_BGLM_TOP2
                                        WHERE   Row_Number = 1
                            END
                 END 
                IF EXISTS (SELECT * FROM #TEMP_BGLM_TOP2 WHERE Row_Number = 2)
                        BEGIN
						
								UPDATE  dbo.BANG_GIA_TRUC_TUYEN
                                SET     DM_GIA2 = ( SELECT  GIADAT
                                                    FROM    #TEMP_BGLM_TOP2
                                                    WHERE   Row_Number = 2
                                                  ) ,
                                        DM_KL2 = ( SELECT   KL
                                                   FROM     #TEMP_BGLM_TOP2
                                                   WHERE   Row_Number = 2
                                                 )
                                WHERE   MACP = @MACP
						END
						   

			    IF EXISTS (SELECT * FROM #TEMP_BGLM_TOP2 WHERE Row_Number = 3)
                        BEGIN
						
								UPDATE  dbo.BANG_GIA_TRUC_TUYEN
                                SET     DM_GIA2 = ( SELECT  GIADAT
                                                    FROM    #TEMP_BGLM_TOP2
                                                    WHERE   Row_Number = 3
                                                  ) ,
                                        DM_KL2 = ( SELECT   KL
                                                   FROM     #TEMP_BGLM_TOP2
                                                   WHERE   Row_Number = 3
                                                 )
                                WHERE   MACP = @MACP
						END
						
       END
	ELSE 
	BEGIN
				 SELECT  *
                    INTO    #TEMP_BGLB_TOP2
                    FROM    ( SELECT    * , ROW_NUMBER() OVER ( ORDER BY GIADAT ASC) AS Row_Number
                              FROM      #TEMP_BGLD
                            ) Temp
                    WHERE   Row_Number <= 3

             
				-- trường hợp đặc biệt(xử lý display BGTT): xóa giá trị các record trước khi insert mới vào trong BGTT
								
				UPDATE  dbo.BANG_GIA_TRUC_TUYEN
				SET     DB_GIA2 = 0,DB_GIA1 = 0, DB_GIA3 = 0,DB_KL3 = 0, DB_KL1 = 0,
						DB_KL2 = 0
				WHERE   MACP = @MACP

            
                 IF EXISTS (SELECT * FROM #TEMP_BGLB_TOP2 WHERE Row_Number = 1)
                    BEGIN  -- merge operation
                        IF EXISTS ( SELECT  *
                                    FROM    dbo.BANG_GIA_TRUC_TUYEN
                                    WHERE   MACP = @MACP )
                            BEGIN
                                UPDATE  dbo.BANG_GIA_TRUC_TUYEN
                                SET     DB_GIA1 = ( SELECT  GIADAT
                                                    FROM    #TEMP_BGLB_TOP2
                                                   WHERE   Row_Number = 1
                                                  ) ,
                                        DB_KL1 = ( SELECT   KL
                                                   FROM     #TEMP_BGLB_TOP2
                                                   WHERE   Row_Number = 1
                                                 )
                                WHERE   MACP = @MACP

                            END
                        ELSE
                            BEGIN
                                INSERT  INTO dbo.BANG_GIA_TRUC_TUYEN
                                        ( MACP ,
                                          DB_GIA1 ,
                                          DB_KL1
                                        )
                                        SELECT  MACP ,
                                                GIADAT ,
                                                KL
                                        FROM    #TEMP_BGLB_TOP2
                                        WHERE   Row_Number = 1
                            END
                    END 
             IF EXISTS (SELECT * FROM #TEMP_BGLB_TOP2 WHERE Row_Number = 2)
                        BEGIN
						
								UPDATE  dbo.BANG_GIA_TRUC_TUYEN
                                SET     DB_GIA2 = ( SELECT  GIADAT
                                                    FROM    #TEMP_BGLB_TOP2
                                                    WHERE  Row_Number = 2
                                                  ) ,
                                        DB_KL2 = ( SELECT   KL
                                                   FROM     #TEMP_BGLB_TOP2
                                                   WHERE  Row_Number = 2
                                                 )
                                WHERE   MACP = @MACP
						END

		IF EXISTS (SELECT * FROM #TEMP_BGLB_TOP2 WHERE Row_Number = 3)
							BEGIN
						
									UPDATE  dbo.BANG_GIA_TRUC_TUYEN
									SET     DB_GIA3 = ( SELECT  GIADAT
														FROM    #TEMP_BGLB_TOP2
														WHERE  Row_Number = 3
														) ,
											DB_KL3 = ( SELECT   KL
														FROM     #TEMP_BGLB_TOP2
														WHERE  Row_Number = 3
														)
									WHERE   MACP = @MACP
			
	END

		-- xóa mã cổ phiếu trong bảng nếu không còn lệnh đặt
		  DECLARE @check BIGINT
		  
		  SELECT    @check = SUM(ISNULL(DM_KL3, 0) + ISNULL(DM_KL2, 0) +   ISNULL(DM_KL1, 0) +  ISNULL(DB_KL1, 0) + ISNULL(DB_KL2, 0) + ISNULL(DB_KL3, 0))
		  FROM dbo.BANG_GIA_TRUC_TUYEN
		  WHERE MACP = @MACP

		  IF (@check = 0)
		  BEGIN
		  	
			DELETE FROM dbo.BANG_GIA_TRUC_TUYEN WHERE MACP = @MACP

		  END

		  END


	

GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH_LO]    Script Date: 16/04/21 4:06:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KHOPLENH_LO]
    @macp NVARCHAR(10) ,
    @Ngay NVARCHAR(50) ,
    @LoaiGD CHAR ,
    @soluongMB INT ,
    @giadatMB FLOAT
AS --Viết SP tính số lượng cổ phiếu khớp theo thuật toán khớp lệnh liên tục khi có 1 lệnh mua hoặc bán được gởi đến bảng LENHDAT
   
    DECLARE @Ngay_Convert DATETIME
               
    SET @Ngay_Convert = CONVERT(DATETIME, @Ngay)


	 SET DATEFORMAT DMY
    DECLARE @CrsrVar CURSOR ,
        @ngaydat NVARCHAR(50) ,
        @soluong INT ,
        @giadat FLOAT ,
        @soluongkhop INT ,
        @giakhop FLOAT ,
        @IDLENHDAT INT ,
        @soluongkhopALL INT

    SET @soluongkhopALL = 0
    IF ( @LoaiGD = 'B' )
        EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'M'
    ELSE
        EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'B'
  
    FETCH NEXT FROM @CrsrVar  INTO @IDLENHDAT, @ngaydat, @soluong, @giadat
 
    WHILE ( @@FETCH_STATUS <> -1
            AND @soluongMB > 0
          )
        BEGIN
    --  Trường hợp lệnh gởi vào là lệnh bán
            IF ( @LoaiGD = 'B' )
                IF ( @giadatMB <= @giadat )
                    BEGIN
                       IF @soluongMB >= @soluong
                        BEGIN
                                SET @soluongkhop = @soluong
                                SET @giakhop = @giadat
                                SET @soluongMB = @soluongMB - @soluong

                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = 0, TRANGTHAILENH = N'Khớp hết'
                                WHERE CURRENT OF @CrsrVar
                            END
                        ELSE
                            BEGIN
                                SET @soluongkhop = @soluongMB
                                SET @giakhop = @giadat
       
                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = SOLUONG - @soluongMB , TRANGTHAILENH = N'Khớp lệnh 1 phần'
                                WHERE CURRENT OF @CrsrVar
                                SET @soluongMB = 0
                            END

	   		 -- cập nhật tổng số lượng khớp của lệnh gưi vào
                       SET @soluongkhopALL = @soluongkhopALL + @soluongkhop
                              
                       
			 -- Cập nhật table LENHKHOP
                        INSERT  INTO dbo.LENHKHOP
                                ( NGAYKHOP ,
                                  SOLUONGKHOP ,
                                  GIAKHOP ,
                                  IDLENHDAT
	                            )
                        VALUES  ( GETDATE() , -- NGAYKHOP - datetime   
                                  @soluongkhop , -- SOLUONGKHOP - int
                                  @giakhop , -- GIAKHOP - float
                                  @IDLENHDAT -- IDLENHDAT - int
	                            )
			-- Câp nhật thông tin vào 	[dbo].[BANG_GIA_TRUC_TUYEN]
						IF EXISTS(SELECT * FROM dbo.BANG_GIA_TRUC_TUYEN WHERE MACP = @macp)
						BEGIN
							UPDATE dbo.BANG_GIA_TRUC_TUYEN
							SET KL_GIA = @giakhop, KL_KL = @soluongkhop
							WHERE MACP = @macp
						END
						ELSE
                        BEGIN
                        	INSERT INTO dbo.BANG_GIA_TRUC_TUYEN( MACP ,  KL_GIA , KL_KL )
                        	VALUES  ( @macp, @giakhop, @soluongkhop )
                        	       
                        END


                    END
                ELSE
                    GOTO THOAT

    -- Còn Trường hợp lệnh gởi vào là lệnh mua
            IF ( @LoaiGD = 'M' )
                IF ( @giadatMB >= @giadat )
                    BEGIN
                        IF @soluongMB >= @soluong
                            BEGIN
                                SET @soluongkhop = @soluong
                                SET @giakhop = @giadat
                                SET @soluongMB = @soluongMB - @soluong
                               
							    UPDATE  dbo.LENHDAT
                                SET     SOLUONG = 0, TRANGTHAILENH = N'Khớp hết'
                                WHERE CURRENT OF @CrsrVar
                            END
                        ELSE
                            BEGIN
                                SET @soluongkhop = @soluongMB

							  
                                SET @giakhop = @giadat
       
                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = SOLUONG - @soluongMB, TRANGTHAILENH = N'Khớp lệnh 1 phần'
                                WHERE CURRENT OF @CrsrVar
                                SET @soluongMB = 0
                            END
                      
					  -- cập nhật tổng số lượng khớp của lệnh gưi vào
                        SET @soluongkhopALL = @soluongkhopALL + @soluongkhop
                                
			 -- Cập nhật table LENHKHOP
                        INSERT  INTO dbo.LENHKHOP
                                ( NGAYKHOP ,
                                  SOLUONGKHOP ,
                                  GIAKHOP ,
                                  IDLENHDAT
	                            )
                        VALUES  ( GETDATE() , -- NGAYKHOP - datetime   
                                  @soluongkhop , -- SOLUONGKHOP - int
                                  @giakhop , -- GIAKHOP - float
                                  @IDLENHDAT -- IDLENHDAT - int
	                            )

		     	-- Câp nhật thông tin vào 	[dbo].[BANG_GIA_TRUC_TUYEN]
						IF EXISTS(SELECT * FROM dbo.BANG_GIA_TRUC_TUYEN WHERE MACP = @macp)
						BEGIN
							UPDATE dbo.BANG_GIA_TRUC_TUYEN
							SET KL_GIA = @giakhop, KL_KL = @soluongkhop
							WHERE MACP = @macp
						END
						ELSE
                        BEGIN
                        	INSERT INTO dbo.BANG_GIA_TRUC_TUYEN( MACP ,  KL_GIA , KL_KL )
                        	VALUES  ( @macp, @giakhop, @soluongkhop )
                        	       
                        END


    
                    END
                ELSE
                    GOTO THOAT
 



            FETCH NEXT FROM @CrsrVar INTO @IDLENHDAT, @ngaydat, @soluong,
                @giadat
            
        END
    THOAT:
    IF ( @soluongMB > 0  AND @soluongkhopALL > 0)
        BEGIN
            INSERT  INTO LENHDAT
                    ( MACP ,
                      NGAYDAT ,
                      LOAIGD ,
                      LOAILENH ,
                      SOLUONG ,
                      GIADAT ,
                      TRANGTHAILENH
                    )
            VALUES  ( @macp ,
                      @ngaydat ,
                      @LoaiGD ,
                      N'LO' ,
                      @soluongMB ,
                      @giadatMB ,
                      N'Khớp lệnh 1 phần'
                    )
        END
	ELSE IF ( @soluongMB > 0  AND @soluongkhopALL = 0)
		BEGIN

			
             

		 INSERT  INTO LENHDAT
                    ( MACP ,
                      NGAYDAT ,
                      LOAIGD ,
                      LOAILENH ,
                      SOLUONG ,
                      GIADAT ,
                      TRANGTHAILENH
                    )
            VALUES  ( @macp ,
                      @Ngay_Convert ,
                      @LoaiGD ,
                      N'LO' ,
                      @soluongMB ,
                      @giadatMB ,
                      N'Chờ khớp'
                    )
		END




	
	-- in ra kết quả  số lượng cổ phiếu khớp theo thuật toán khớp lệnh liên tục khi có 1 lệnh mua hoặc bán được gởi đến bảng LENHDAT
    PRINT N'Số lương cổ phiếu khớp: ' + CAST(@soluongkhopALL AS NVARCHAR(10))
    CLOSE @CrsrVar
    DEALLOCATE @CrsrVar




GO
USE [master]
GO
ALTER DATABASE [CHUNGKHOAN] SET  READ_WRITE 
GO
