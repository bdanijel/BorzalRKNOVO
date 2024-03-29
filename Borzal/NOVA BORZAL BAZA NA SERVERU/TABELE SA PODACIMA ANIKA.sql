USE [bdanijel_BORZALRKNOVO]
GO
/****** Object:  Table [dbo].[LISTA_Korisnici]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LISTA_Korisnici](
	[ID_Korisnika] [nvarchar](4) NULL,
	[Ime] [nvarchar](50) NULL,
	[Prezime] [nvarchar](50) NULL,
	[Nalog] [nvarchar](50) NULL,
	[Lozinka] [nvarchar](50) NULL,
	[Admin] [bit] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[LISTA_Korisnici] ([ID_Korisnika], [Ime], [Prezime], [Nalog], [Lozinka], [Admin]) VALUES (N'1000', N'Anika', N'', N'Borzal', N'Borzal123', 0)
/****** Object:  Table [dbo].[DodelaOvlascenja]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DodelaOvlascenja](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idenr] [varchar](4) NOT NULL,
	[PosaoID] [int] NOT NULL,
 CONSTRAINT [PK_DodelaOvlascenja] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DodelaOvlascenja] ON
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (15, N'1000', 2010)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (16, N'1000', 2020)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (22, N'1000', 3010)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (23, N'1000', 3020)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (25, N'1000', 3040)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (26, N'1000', 3050)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (27, N'1000', 3060)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (28, N'1000', 3070)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (29, N'1000', 4010)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (37, N'1000', 4020)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (43, N'1000', 5010)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (44, N'1000', 6010)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (45, N'1000', 7010)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (47, N'1000', 5020)
INSERT [dbo].[DodelaOvlascenja] ([id], [idenr], [PosaoID]) VALUES (48, N'1000', 6020)
SET IDENTITY_INSERT [dbo].[DodelaOvlascenja] OFF
/****** Object:  Table [dbo].[ADM_Poslovi]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_Poslovi](
	[PosaoID] [int] NOT NULL,
	[Oblast_Posao] [nvarchar](50) NULL,
	[StatusPosao] [int] NULL,
	[Posao] [nvarchar](50) NULL,
	[Ikona] [nvarchar](50) NULL,
	[PosaoURL] [nvarchar](50) NULL,
	[OblastID] [int] NULL,
	[RedosledPosao] [int] NULL,
 CONSTRAINT [PK_SpisakPoslova] PRIMARY KEY CLUSTERED 
(
	[PosaoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (1010, N'Dodela korisnka', 1, N'Додела корисника', N'glyphicon glyphicon-user', N'ADM_DodelaKorisnika_AdminPoslovima.aspx', 10, 1010)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (2010, N'Proizvod', 1, N'Unos proizvoda', N'icon-box', N'Proizvod.aspx', 20, 2010)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (2020, N'Proizvod', 1, N'Proizvod - Pretraga', N'icon-file-search', N'Proizvod_Pretraga.aspx', 20, 2020)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (2030, N'Izveštaji - Proizvod', 1, N'Izveštaji - Proizvod', N'icon-file-spreadsheet', N'rProizvod.aspx', 20, 2030)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (3010, N'Sirovine', 1, N'Unos sirovine', N'icon-box', N'Sirovine.aspx', 30, 3010)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (3020, N'Sirovine', 1, N'Sirovine Pretraga', N'icon-file-search', N'Sirovine_Pretraga.aspx', 30, 3020)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (3030, N'Izveštaji - Sirovine', 1, N'Izveštaji - Sirovine', N'icon-file-spreadsheet', N'rSirovine.aspx', 30, 3030)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (4010, N'Sastavnica - Unos', 1, N'Sastavnica - Unos', N'icon-road', N'Sastavnica.aspx', 40, 4010)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (4020, N'Sastavnica - Pretraga', 1, N'Sastavnica - Pretraga', N'icon-road', N'Sastavnica_Pretraga.aspx', 40, 4020)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (4030, N'Sastavnica - izveštaj', 1, N'Sastavnica - Izveštaj', N'icon-file-spreadsheet', N'rPutniNalog.aspx', 40, 4030)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (5010, N'Predatnica', 1, N'Predatnica Unos', N'icon-pencil', N'Predatnica.aspx', 50, 5010)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (5020, N'Predatnica', 1, N'Predatnica pretraga', N'icon-file-search', N'Predatnica_Pretraga.aspx', 50, 5020)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (6010, N'Trebovanje', 1, N'Trebovanje Unos', N'icon-box', N'Trebovanje.aspx', 60, 6010)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (6020, N'Trebovanje', 1, N'Trebovanje Pretraga', N'icon-file-search', N'Trebovanje_Pretraga.aspx', 60, 6020)
INSERT [dbo].[ADM_Poslovi] ([PosaoID], [Oblast_Posao], [StatusPosao], [Posao], [Ikona], [PosaoURL], [OblastID], [RedosledPosao]) VALUES (7010, N'Izvestaji', 1, N'Izveštaj Razlika', N'icon-file-spreadsheet', N'rRazlika.aspx', 70, 7010)
/****** Object:  Table [dbo].[ADM_Oblasti]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_Oblasti](
	[OblastID] [int] NOT NULL,
	[Oblast] [nvarchar](50) NULL,
	[Ikona] [nvarchar](50) NULL,
	[RedosledOblast] [int] NULL,
	[StatusOblast] [int] NULL,
	[OblastURL] [nvarchar](50) NULL,
 CONSTRAINT [PK_ADM_Oblasti] PRIMARY KEY CLUSTERED 
(
	[OblastID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADM_Oblasti] ([OblastID], [Oblast], [Ikona], [RedosledOblast], [StatusOblast], [OblastURL]) VALUES (10, N'Dodela korisnika', N'glyphicon glyphicon-user', 10, 1, N'ADM_DodelaKorisnika_AdminPoslovima.aspx')
INSERT [dbo].[ADM_Oblasti] ([OblastID], [Oblast], [Ikona], [RedosledOblast], [StatusOblast], [OblastURL]) VALUES (20, N'Proizvod', N'icon-box', 20, 1, N'#')
INSERT [dbo].[ADM_Oblasti] ([OblastID], [Oblast], [Ikona], [RedosledOblast], [StatusOblast], [OblastURL]) VALUES (30, N'Sirovine', N'icon-box', 30, 1, N'#')
INSERT [dbo].[ADM_Oblasti] ([OblastID], [Oblast], [Ikona], [RedosledOblast], [StatusOblast], [OblastURL]) VALUES (40, N'Sastavnica', N'glyphicon glyphicon-list-alt', 40, 1, N'#')
INSERT [dbo].[ADM_Oblasti] ([OblastID], [Oblast], [Ikona], [RedosledOblast], [StatusOblast], [OblastURL]) VALUES (50, N'Predatnica', N'glyphicon glyphicon-list-alt', 50, 1, N'#')
INSERT [dbo].[ADM_Oblasti] ([OblastID], [Oblast], [Ikona], [RedosledOblast], [StatusOblast], [OblastURL]) VALUES (60, N'Trebovanje', N'glyphicon glyphicon-list-alt', 60, 1, N'#')
INSERT [dbo].[ADM_Oblasti] ([OblastID], [Oblast], [Ikona], [RedosledOblast], [StatusOblast], [OblastURL]) VALUES (70, N'Izvestaji', N'icon-file-spreadsheet', 70, 1, N'#')
/****** Object:  Table [dbo].[proizvod]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proizvod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAZIV] [nvarchar](50) NULL,
 CONSTRAINT [PK_proizvod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[proizvod] ON
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (3, N'USKI REZANAC SA JAJIMA 250')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (4, N'ŠIROKI REZANAC SA JAJIMA 250')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (5, N'FIDA')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (6, N'FLEKICE')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (7, N'TRAKA NARECKANA')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (8, N'MALA KOCKA')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (9, N'ZOB KOCKA')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (10, N'USKI REZANAC SA JAJIMA 200')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (11, N'ŠIROKI REZANAC SA JAJIMA 200')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (12, N'MAKARONE SA JAJIMA 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (13, N'SPIRALA SA JAJIMA 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (14, N'RAŠČUPANA FIDA 150')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (15, N'REZANAC ZA SUPU 150')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (16, N'TRAKICA')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (17, N'FIDA 125')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (18, N'TRAKA NARECKANA 125')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (19, N'USKI REZANAC DURUM 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (20, N'ŠIROKI REZANAC DURUM 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (21, N'MAKARONA DURUM 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (22, N'SPIRALA DURUM 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (23, N'USKI REZANAC DURUM 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (24, N'ŠIROKI REZANAC DURUM 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (25, N'MAKARONA DURUM 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (26, N'SPIRALA DURUM 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (27, N'DUGI REZANAC DURUM 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (28, N'USKI REZANAC SA JAJIMA 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (29, N'ŠIROKI REZANAC SA JAJIMA 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (30, N'MAKARONA SA JAJIMA 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (31, N'SPIRALA SA JAJIMA 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (32, N'MAKARONA BEZ JAJA 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (33, N'SPIRALA BEZ JAJA 400')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (34, N'USKI REZANAC BEZ JAJA 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (35, N'ŠIROKI REZANAC BEZ JAJA 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (36, N'MAKARONA BEZ JAJA 1KG')
INSERT [dbo].[proizvod] ([ID], [NAZIV]) VALUES (37, N'SPIRALA BEZ JAJA 1KG')
SET IDENTITY_INSERT [dbo].[proizvod] OFF
/****** Object:  Table [dbo].[sirovine]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sirovine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAZIV] [varchar](50) NULL,
	[JM] [varchar](10) NULL,
 CONSTRAINT [PK_sirovine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[sirovine] ON
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (1, N'BRAŠNO T400, PŠENICNA KRUPICA, DURUM KRUPICA', N'KG')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (2, N'JAJA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (3, N'KUTIJA K-1', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (4, N'SELOTEJP', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (5, N'DIOFAN', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (6, N'KESICA MALA KOCKA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (7, N'KESICA ZOB KOCKA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (8, N'KESICA FLEKICE', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (9, N'KESICA FIDA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (10, N'KESICA TRAKA NARECKANA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (11, N'KAROTIN', N'LIT')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (12, N'KESICA ŠIROKI REZANAC', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (13, N'KESICA USKI REZANAC', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (14, N'KESICA TRAKICA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (15, N'KUTIJA 2', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (16, N'KUTIJA 12', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (17, N'KUTIJA 13', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (18, N'KUTIJA 15', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (19, N'KUTIJA 16', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (20, N'KUTIJA 3', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (21, N'KUTIJA 5', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (22, N'KUTIJA 6', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (23, N'KUTIJA 400 UR-ŠR-MAK-SPI', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (24, N'KESICA REZANAC ZA SUPU 150', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (25, N'KESICA RAŠCUPANA FIDA 150', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (26, N'KUTIJA 150', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (27, N'FOLIJA SPI-MAK 412X295 400G', N'KG')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (28, N'FOLIJA UR-ŠR 412X295 200G', N'KG')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (29, N'KUTIJA 125', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (30, N'KESICA FIDA 125', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (31, N'KESICA TRAKA NARECKANA 125', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (32, N'KUTIJA SP1 MAK-SPI 1KG', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (33, N'KUTIJA R1 UR-ŠR 1KG', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (34, N'KUTIJA R04 UR-ŠR 400', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (35, N'FOLIJA U ROLNAMA BEZ ŠTAMPE', N'KG')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (36, N'KESICA BLANKO DUPLEX 180X80X410', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (37, N'KESICA BLANKO 180X100X450', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (38, N'ETIKETA SUŠENA TESTENINA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (39, N'ETIKETA SVEŽA JAJA', N'KOM')
INSERT [dbo].[sirovine] ([ID], [NAZIV], [JM]) VALUES (40, N'ETIKETA DURUM', N'KOM')
SET IDENTITY_INSERT [dbo].[sirovine] OFF
/****** Object:  Table [dbo].[trebovanje]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trebovanje](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BROJ] [nvarchar](50) NULL,
	[RBR] [int] NULL,
	[ID_SIROVINE] [int] NULL,
	[JM] [nchar](10) NULL,
	[KOLICINA] [decimal](10, 2) NULL,
	[DATUM] [date] NULL,
 CONSTRAINT [PK_trebovanje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Broj trebovanja' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'trebovanje', @level2type=N'COLUMN',@level2name=N'BROJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Redni broj sirovine unutar trebovanja' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'trebovanje', @level2type=N'COLUMN',@level2name=N'RBR'
GO
SET IDENTITY_INSERT [dbo].[trebovanje] ON
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (699, N'1', 1, 1, N'KG        ', CAST(54000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (700, N'1', 2, 2, N'KOM       ', CAST(19000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (701, N'1', 3, 3, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (702, N'1', 4, 16, N'KOM       ', CAST(100.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (703, N'1', 5, 17, N'KOM       ', CAST(100.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (704, N'1', 6, 18, N'KOM       ', CAST(2000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (705, N'1', 7, 19, N'KOM       ', CAST(1000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (706, N'1', 8, 23, N'KOM       ', CAST(2560.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (707, N'1', 9, 29, N'KOM       ', CAST(100.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (708, N'1', 10, 26, N'KOM       ', CAST(900.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (709, N'1', 11, 6, N'KOM       ', CAST(7400.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (710, N'1', 12, 7, N'KOM       ', CAST(30200.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (711, N'1', 13, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (712, N'1', 14, 9, N'KOM       ', CAST(18000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (713, N'1', 15, 10, N'KOM       ', CAST(11000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (714, N'1', 16, 14, N'KOM       ', CAST(8000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (715, N'1', 17, 12, N'KOM       ', CAST(12700.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (716, N'1', 18, 13, N'KOM       ', CAST(16500.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (717, N'1', 19, 30, N'KOM       ', CAST(1600.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (718, N'1', 20, 31, N'KOM       ', CAST(1400.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (719, N'1', 21, 4, N'KOM       ', CAST(2380.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (720, N'1', 22, 5, N'KOM       ', CAST(1000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (721, N'1', 23, 24, N'KOM       ', CAST(9000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (722, N'1S', 1, 4, N'KOM       ', CAST(-2380.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (723, N'1S', 2, 5, N'KOM       ', CAST(-954.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (724, N'1S', 3, 24, N'KOM       ', CAST(-8000.00 AS Decimal(10, 2)), CAST(0x253F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (725, N'2', 1, 2, N'KOM       ', CAST(17959.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (726, N'2', 2, 16, N'KOM       ', CAST(142.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (727, N'2', 3, 18, N'KOM       ', CAST(2496.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (728, N'2', 4, 15, N'KOM       ', CAST(250.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (729, N'2', 5, 21, N'KOM       ', CAST(1106.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (730, N'2', 6, 22, N'KOM       ', CAST(255.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (731, N'2', 7, 23, N'KOM       ', CAST(99.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (732, N'2', 9, 9, N'KOM       ', CAST(20000.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (733, N'2', 10, 14, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (734, N'3', 1, 2, N'KOM       ', CAST(19194.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (735, N'3', 2, 3, N'KOM       ', CAST(20.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (736, N'3', 3, 17, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (737, N'3', 4, 18, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (738, N'3', 5, 19, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (739, N'3', 6, 15, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (740, N'3', 7, 20, N'KOM       ', CAST(850.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (741, N'3', 8, 21, N'KOM       ', CAST(810.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (742, N'3', 9, 22, N'KOM       ', CAST(480.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (743, N'3', 10, 23, N'KOM       ', CAST(280.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (744, N'3', 11, 29, N'KOM       ', CAST(40.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (745, N'3', 12, 26, N'KOM       ', CAST(240.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (746, N'3', 13, 33, N'KOM       ', CAST(45.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (747, N'3', 14, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (748, N'3', 15, 24, N'KOM       ', CAST(7000.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (749, N'3', 1, 16, N'KOM       ', CAST(400.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (750, N'3', 2, 19, N'KOM       ', CAST(108.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (751, N'4', 1, 2, N'KOM       ', CAST(3753.00 AS Decimal(10, 2)), CAST(0x343F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (752, N'4', 2, 27, N'KG        ', CAST(24.60 AS Decimal(10, 2)), CAST(0x343F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (753, N'4', 3, 28, N'KG        ', CAST(24.40 AS Decimal(10, 2)), CAST(0x343F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (754, N'5', 1, 2, N'KOM       ', CAST(17064.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (755, N'5', 2, 16, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (756, N'5', 3, 17, N'KOM       ', CAST(275.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (757, N'5', 4, 19, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (758, N'5', 5, 15, N'KOM       ', CAST(525.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (759, N'5', 6, 20, N'KOM       ', CAST(550.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (760, N'5', 7, 22, N'KOM       ', CAST(600.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (761, N'5', 8, 26, N'KOM       ', CAST(210.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (762, N'5', 9, 32, N'KOM       ', CAST(164.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (763, N'5', 10, 33, N'KOM       ', CAST(68.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (764, N'5', 11, 34, N'KOM       ', CAST(40.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (765, N'5', 12, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (766, N'5', 13, 7, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (767, N'5', 14, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (768, N'5', 15, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (769, N'5S', 1, 18, N'KOM       ', CAST(-2000.00 AS Decimal(10, 2)), CAST(0x3E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (770, N'5S', 2, 19, N'KOM       ', CAST(-1170.00 AS Decimal(10, 2)), CAST(0x3E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (771, N'5S', 3, 23, N'KOM       ', CAST(-2560.00 AS Decimal(10, 2)), CAST(0x3E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (772, N'5S', 4, 26, N'KOM       ', CAST(-900.00 AS Decimal(10, 2)), CAST(0x3E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (773, N'5S', 5, 7, N'KOM       ', CAST(-19000.00 AS Decimal(10, 2)), CAST(0x3E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (774, N'6', 1, 1, N'KG        ', CAST(24000.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (775, N'6', 2, 2, N'KOM       ', CAST(31968.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (776, N'6', 3, 16, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (777, N'6', 4, 18, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (778, N'6', 5, 15, N'KOM       ', CAST(200.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (779, N'6', 6, 21, N'KOM       ', CAST(870.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (780, N'6', 7, 22, N'KOM       ', CAST(450.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (781, N'6', 8, 23, N'KOM       ', CAST(120.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (782, N'6', 9, 26, N'KOM       ', CAST(225.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (783, N'6', 10, 32, N'KOM       ', CAST(90.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (784, N'6', 11, 33, N'KOM       ', CAST(105.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (785, N'6', 12, 6, N'KOM       ', CAST(14000.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (786, N'6', 13, 9, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (787, N'6', 14, 10, N'KOM       ', CAST(19000.00 AS Decimal(10, 2)), CAST(0x413F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (788, N'7', 1, 2, N'KOM       ', CAST(33780.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (789, N'7', 2, 16, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (790, N'7', 3, 17, N'KOM       ', CAST(200.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (791, N'7', 4, 19, N'KOM       ', CAST(30.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (792, N'7', 5, 15, N'KOM       ', CAST(725.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (793, N'7', 7, 21, N'KOM       ', CAST(1170.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (794, N'7', 8, 22, N'KOM       ', CAST(1728.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (795, N'7', 9, 33, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (796, N'7', 10, 11, N'LIT       ', CAST(20.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (797, N'7', 11, 4, N'KOM       ', CAST(580.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (798, N'7', 12, 8, N'KOM       ', CAST(14900.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
GO
print 'Processed 100 total records'
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (799, N'7', 13, 9, N'KOM       ', CAST(18800.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (800, N'7', 14, 10, N'KOM       ', CAST(18000.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (801, N'7', 15, 25, N'KOM       ', CAST(3740.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (802, N'8', 1, 1, N'kg        ', CAST(16000.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (803, N'8', 2, 2, N'kom       ', CAST(28903.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (804, N'8', 3, 18, N'kom       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (805, N'8', 4, 19, N'KOM       ', CAST(190.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (806, N'8', 5, 15, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (807, N'8', 7, 21, N'KOM       ', CAST(540.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (808, N'8', 8, 22, N'KOM       ', CAST(460.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (809, N'8', 9, 26, N'KOM       ', CAST(250.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (810, N'8', 10, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (811, N'8', 11, 7, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (812, N'8', 12, 10, N'KOM       ', CAST(20000.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (813, N'8', 13, 25, N'KOM       ', CAST(4000.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (814, N'8', 14, 24, N'KOM       ', CAST(3090.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (815, N'9', 1, 2, N'KOM       ', CAST(21281.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (816, N'9', 2, 18, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (817, N'9', 3, 19, N'KOM       ', CAST(304.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (818, N'9', 4, 15, N'KOM       ', CAST(600.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (819, N'9', 5, 21, N'KOM       ', CAST(832.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (820, N'9', 6, 22, N'KOM       ', CAST(900.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (821, N'9', 7, 26, N'KOM       ', CAST(225.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (822, N'9', 8, 33, N'KOM       ', CAST(75.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (823, N'9', 9, 4, N'KOM       ', CAST(600.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (824, N'9', 10, 5, N'KOM       ', CAST(138.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (825, N'9', 11, 7, N'KOM       ', CAST(6000.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (826, N'9', 12, 9, N'KOM       ', CAST(20000.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (827, N'9', 13, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (828, N'9', 14, 25, N'KOM       ', CAST(4000.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (829, N'10', 1, 2, N'KOM       ', CAST(23964.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (830, N'10', 2, 17, N'KOM       ', CAST(175.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (831, N'10', 3, 18, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (832, N'10', 4, 15, N'KOM       ', CAST(450.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (833, N'10', 5, 20, N'KOM       ', CAST(400.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (834, N'10', 6, 21, N'KOM       ', CAST(1080.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (835, N'10', 7, 22, N'KOM       ', CAST(600.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (836, N'10', 8, 26, N'KOM       ', CAST(225.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (837, N'10', 9, 9, N'KOM       ', CAST(20000.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (838, N'10', 10, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (839, N'11', 1, 1, N'KG        ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (840, N'11', 2, 1, N'KG        ', CAST(24000.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (841, N'11', 3, 2, N'KOM       ', CAST(13462.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (842, N'11', 4, 18, N'KOM       ', CAST(210.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (843, N'11', 5, 19, N'KOM       ', CAST(210.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (844, N'11', 6, 20, N'KOM       ', CAST(550.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (845, N'11', 7, 21, N'KOM       ', CAST(1260.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (846, N'11', 8, 22, N'KOM       ', CAST(180.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (847, N'11', 9, 23, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (848, N'11', 10, 26, N'KOM       ', CAST(240.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (849, N'11', 11, 11, N'LIT       ', CAST(20.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (850, N'11', 12, 4, N'KOM       ', CAST(600.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (851, N'11', 13, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (852, N'11', 14, 9, N'KOM       ', CAST(30000.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (853, N'12', 1, 2, N'KOM       ', CAST(17740.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (854, N'12', 2, 3, N'KOM       ', CAST(140.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (855, N'12', 3, 19, N'KOM       ', CAST(450.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (856, N'12', 4, 20, N'KOM       ', CAST(575.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (857, N'12', 5, 21, N'KOM       ', CAST(1200.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (858, N'12', 6, 22, N'KOM       ', CAST(840.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (859, N'12', 7, 23, N'KOM       ', CAST(109.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (860, N'12', 8, 26, N'KOM       ', CAST(210.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (861, N'12', 9, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (862, N'12', 10, 10, N'KOM       ', CAST(20000.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (863, N'12', 11, 25, N'KOM       ', CAST(4000.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (864, N'13', 1, 1, N'KG        ', CAST(6400.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (865, N'13', 2, 2, N'KOM       ', CAST(24853.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (866, N'13', 3, 16, N'KOM       ', CAST(60.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (867, N'13', 4, 18, N'KOM       ', CAST(270.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (868, N'13', 5, 15, N'KOM       ', CAST(675.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (869, N'13', 6, 21, N'KOM       ', CAST(1110.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (870, N'13', 7, 22, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (871, N'13', 8, 23, N'KOM       ', CAST(70.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (872, N'13', 9, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (873, N'13', 10, 6, N'KOM       ', CAST(14000.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (874, N'13', 11, 7, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (875, N'13', 12, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (876, N'13', 13, 9, N'KOM       ', CAST(30000.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (877, N'13', 14, 14, N'KOM       ', CAST(1690.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (878, N'13', 15, 24, N'KOM       ', CAST(4000.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (879, N'14', 1, 1, N'KG        ', CAST(24000.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (880, N'14', 2, 2, N'KOM       ', CAST(13706.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (881, N'14', 3, 19, N'KOM       ', CAST(360.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (882, N'14', 4, 20, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (883, N'14', 5, 21, N'KOM       ', CAST(690.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (884, N'14', 6, 22, N'KOM       ', CAST(690.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (885, N'14', 7, 26, N'KOM       ', CAST(225.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (886, N'14', 8, 32, N'KOM       ', CAST(180.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (887, N'14', 9, 11, N'LIT       ', CAST(25.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (888, N'14', 10, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (889, N'15', 1, 1, N'KG        ', CAST(8600.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (890, N'15', 2, 2, N'KOM       ', CAST(21946.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (891, N'15', 3, 16, N'KOM       ', CAST(175.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (892, N'15', 4, 18, N'KOM       ', CAST(270.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (893, N'15', 5, 15, N'KOM       ', CAST(575.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (894, N'15', 6, 21, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (895, N'15', 7, 22, N'KOM       ', CAST(2040.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (896, N'15', 8, 23, N'KOM       ', CAST(230.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (897, N'15', 9, 32, N'KOM       ', CAST(90.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (898, N'15', 10, 34, N'KOM       ', CAST(80.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (899, N'15', 11, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
GO
print 'Processed 200 total records'
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (900, N'15', 12, 9, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (901, N'15', 13, 10, N'KOM       ', CAST(20000.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (902, N'16', 1, 2, N'KOM       ', CAST(23296.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (903, N'16', 2, 16, N'KOM       ', CAST(15.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (904, N'16', 3, 19, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (905, N'16', 4, 20, N'KOM       ', CAST(1050.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (906, N'16', 5, 21, N'KOM       ', CAST(1170.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (907, N'16', 6, 22, N'KOM       ', CAST(690.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (908, N'16', 7, 23, N'KOM       ', CAST(80.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (909, N'16', 8, 26, N'KOM       ', CAST(240.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (910, N'16', 9, 33, N'KOM       ', CAST(125.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (911, N'16', 10, 8, N'KOM       ', CAST(24000.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (912, N'16', 11, 10, N'KOM       ', CAST(30000.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (913, N'17', 1, 2, N'KOM       ', CAST(26807.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (914, N'17', 2, 16, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (915, N'17', 3, 17, N'kom       ', CAST(100.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (916, N'17', 4, 18, N'kom       ', CAST(210.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (917, N'17', 5, 19, N'kom       ', CAST(30.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (918, N'17', 6, 15, N'KOM       ', CAST(852.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (919, N'17', 7, 20, N'KOM       ', CAST(500.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (920, N'17', 8, 21, N'KOM       ', CAST(780.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (921, N'17', 9, 22, N'KOM       ', CAST(930.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (922, N'17', 10, 33, N'KOM       ', CAST(125.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (923, N'17', 11, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (924, N'17', 12, 7, N'KOM       ', CAST(10112.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (925, N'17', 13, 9, N'KOM       ', CAST(9625.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (926, N'17', 14, 10, N'KOM       ', CAST(11325.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (927, N'17', 15, 25, N'KOM       ', CAST(6000.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (928, N'17', 16, 24, N'KOM       ', CAST(3000.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (929, N'18', 1, 1, N'kg        ', CAST(9600.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (930, N'18', 2, 2, N'KOM       ', CAST(18312.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (931, N'18', 3, 16, N'KOM       ', CAST(25.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (932, N'18', 4, 17, N'KOM       ', CAST(100.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (933, N'18', 5, 18, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (934, N'18', 6, 19, N'KOM       ', CAST(330.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (935, N'18', 7, 15, N'KOM       ', CAST(250.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (936, N'18', 8, 20, N'KOM       ', CAST(743.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (937, N'18', 9, 21, N'KOM       ', CAST(840.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (938, N'18', 10, 22, N'KOM       ', CAST(30.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (939, N'18', 11, 23, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (940, N'18', 12, 26, N'KOM       ', CAST(210.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (941, N'18', 13, 11, N'LIT       ', CAST(25.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (942, N'18', 14, 8, N'KOM       ', CAST(5550.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (943, N'18', 15, 9, N'KOM       ', CAST(18000.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (944, N'19', 1, 1, N'KG        ', CAST(24000.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (945, N'19', 2, 2, N'KOM       ', CAST(29174.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (946, N'19', 3, 3, N'KOM       ', CAST(140.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (947, N'19', 4, 16, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (948, N'19', 5, 18, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (949, N'19', 6, 19, N'KOM       ', CAST(458.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (950, N'19', 7, 15, N'KOM       ', CAST(1025.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (951, N'19', 8, 21, N'KOM       ', CAST(960.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (952, N'19', 9, 4, N'KOM       ', CAST(600.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (953, N'19', 10, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (954, N'19', 11, 6, N'KOM       ', CAST(14000.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (955, N'19', 15, 7, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (956, N'19', 13, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (957, N'19', 14, 9, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (958, N'19', 15, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (959, N'2', 8, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (960, N'7', 6, 20, N'KOM       ', CAST(375.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (961, N'8', 6, 20, N'KOM       ', CAST(546.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (962, N'20', 1, 2, N'KOM       ', CAST(29479.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (963, N'20', 2, 17, N'KOM       ', CAST(116.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (964, N'20', 3, 19, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (965, N'20', 4, 15, N'KOM       ', CAST(25.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (966, N'20', 5, 20, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (967, N'20', 6, 21, N'KOM       ', CAST(1800.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (968, N'20', 7, 22, N'KOM       ', CAST(930.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (969, N'20', 8, 23, N'KOM       ', CAST(180.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (970, N'20', 9, 26, N'KOM       ', CAST(240.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (971, N'20', 10, 34, N'KOM       ', CAST(10.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (972, N'20', 11, 9, N'KOM       ', CAST(30000.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (973, N'20', 12, 10, N'KOM       ', CAST(30000.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (974, N'21', 1, 1, N'KG        ', CAST(11200.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (975, N'21', 2, 2, N'KOM       ', CAST(22807.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (976, N'21', 3, 3, N'KOM       ', CAST(20.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (977, N'21', 4, 16, N'KOM       ', CAST(25.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (978, N'21', 5, 17, N'KOM       ', CAST(75.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (979, N'21', 6, 18, N'KOM       ', CAST(420.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (980, N'21', 7, 19, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (981, N'21', 8, 15, N'KOM       ', CAST(250.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (982, N'21', 9, 20, N'KOM       ', CAST(500.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (983, N'21', 10, 21, N'KOM       ', CAST(878.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (984, N'21', 11, 22, N'KOM       ', CAST(870.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (985, N'21', 12, 26, N'KOM       ', CAST(240.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (986, N'21', 13, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (987, N'21', 14, 9, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (988, N'21', 15, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (989, N'22', 1, 2, N'KOM       ', CAST(30676.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (990, N'22', 2, 16, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (991, N'22', 3, 17, N'KOM       ', CAST(40.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (992, N'22', 4, 18, N'KOM       ', CAST(30.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (993, N'22', 5, 19, N'KOM       ', CAST(60.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (994, N'22', 6, 15, N'KOM       ', CAST(200.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (995, N'22', 7, 20, N'KOM       ', CAST(725.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (996, N'22', 8, 21, N'KOM       ', CAST(1890.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (997, N'22', 9, 22, N'KOM       ', CAST(210.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (998, N'22', 10, 23, N'KOM       ', CAST(100.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (999, N'22', 11, 9, N'KOM       ', CAST(40000.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1000, N'22', 12, 14, N'KOM       ', CAST(12200.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
GO
print 'Processed 300 total records'
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1001, N'22', 13, 12, N'KOM       ', CAST(7162.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1002, N'22', 14, 24, N'KOM       ', CAST(4000.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1003, N'23', 1, 20, N'KOM       ', CAST(125.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1004, N'23', 2, 22, N'KOM       ', CAST(30.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1005, N'23', 3, 23, N'KOM       ', CAST(20.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1006, N'23', 4, 34, N'KOM       ', CAST(21.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1007, N'23', 5, 5, N'KOM       ', CAST(144.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1008, N'23', 6, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1009, N'24', 1, 1, N'KG        ', CAST(3200.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1010, N'24', 2, 2, N'KOM       ', CAST(30356.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1011, N'24', 3, 16, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1012, N'24', 4, 17, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1013, N'24', 5, 18, N'KOM       ', CAST(150.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1014, N'24', 6, 15, N'KOM       ', CAST(720.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1015, N'24', 7, 21, N'KOM       ', CAST(1500.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1016, N'24', 8, 22, N'KOM       ', CAST(1200.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1017, N'24', 9, 26, N'KOM       ', CAST(210.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1018, N'24', 10, 11, N'LIT       ', CAST(20.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1019, N'24', 11, 7, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1020, N'24', 12, 8, N'KOM       ', CAST(12000.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1021, N'24', 13, 9, N'KOM       ', CAST(20000.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1022, N'24', 14, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1023, N'24', 15, 25, N'KOM       ', CAST(4000.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1024, N'25', 1, 2, N'KOM       ', CAST(6845.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1025, N'25', 2, 17, N'KOM       ', CAST(20.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1026, N'25', 3, 18, N'KOM       ', CAST(30.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1027, N'25', 4, 21, N'KOM       ', CAST(60.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1028, N'25', 5, 23, N'KOM       ', CAST(240.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1029, N'25', 6, 26, N'KOM       ', CAST(30.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1030, N'25', 7, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1031, N'25', 8, 25, N'KOM       ', CAST(2000.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1032, N'26', 1, 2, N'KOM       ', CAST(5168.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1033, N'26', 2, 18, N'KOM       ', CAST(450.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1034, N'26', 3, 19, N'KOM       ', CAST(450.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1035, N'26', 4, 6, N'KOM       ', CAST(14000.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1036, N'26', 5, 27, N'KG        ', CAST(192.80 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1037, N'26', 6, 28, N'KG        ', CAST(42.40 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1038, N'26', 7, 35, N'KG        ', CAST(74.70 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1039, N'26', 8, 36, N'KOM       ', CAST(710.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1040, N'26', 9, 37, N'KOM       ', CAST(3328.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1041, N'27', 1, 1, N'KG        ', CAST(12000.00 AS Decimal(10, 2)), CAST(0xC43F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1042, N'27', 2, 2, N'KOM       ', CAST(4498.00 AS Decimal(10, 2)), CAST(0xC43F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1043, N'27', 3, 16, N'KOM       ', CAST(50.00 AS Decimal(10, 2)), CAST(0xC43F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1044, N'27', 4, 15, N'KOM       ', CAST(450.00 AS Decimal(10, 2)), CAST(0xC43F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1045, N'27', 5, 21, N'KOM       ', CAST(300.00 AS Decimal(10, 2)), CAST(0xC43F0B00 AS Date))
INSERT [dbo].[trebovanje] ([ID], [BROJ], [RBR], [ID_SIROVINE], [JM], [KOLICINA], [DATUM]) VALUES (1046, N'27', 6, 10, N'KOM       ', CAST(10000.00 AS Decimal(10, 2)), CAST(0xC43F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[trebovanje] OFF
/****** Object:  Table [dbo].[sastavnica]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sastavnica](
	[ID_PROIZVOD] [int] NOT NULL,
	[BROJ] [nvarchar](50) NULL,
	[RBR] [int] NULL,
	[ID_SIROVINA] [int] NOT NULL,
	[JM] [nvarchar](10) NULL,
	[KOLICINA] [decimal](15, 5) NULL,
 CONSTRAINT [PK_sastavnica] PRIMARY KEY CLUSTERED 
(
	[ID_PROIZVOD] ASC,
	[ID_SIROVINA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Broj sastavnice' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sastavnica', @level2type=N'COLUMN',@level2name=N'BROJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Redni broj sirove u sastavnici' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sastavnica', @level2type=N'COLUMN',@level2name=N'RBR'
GO
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (3, N'1', 1, 1, N'KG', CAST(0.26250 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (3, N'1', 2, 2, N'KOM', CAST(0.76000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (3, N'1', 4, 3, N'KOM', CAST(0.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (3, N'1', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (3, N'1', 6, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (3, N'1', 3, 13, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (4, N'2', 1, 1, N'KG', CAST(0.26250 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (4, N'2', 2, 2, N'KOM', CAST(0.76000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (4, N'2', 4, 3, N'KOM', CAST(0.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (4, N'2', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (4, N'2', 6, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (4, N'2', 3, 12, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 6, 4, N'KOM', CAST(0.00300 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 7, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 3, 9, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 8, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 4, 18, N'KOM', CAST(0.04170 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (5, N'6', 5, 21, N'KOM', CAST(0.08330 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 6, 4, N'KOM', CAST(0.00300 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 7, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 3, 8, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 8, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 4, 17, N'KOM', CAST(0.04170 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (6, N'5', 5, 20, N'KOM', CAST(0.08330 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 6, 4, N'KOM', CAST(0.00300 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 7, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 3, 10, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 8, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 4, 19, N'KOM', CAST(0.04170 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (7, N'7', 5, 22, N'KOM', CAST(0.08330 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 6, 4, N'KOM', CAST(0.00300 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 7, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 3, 6, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 8, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 5, 15, N'KOM', CAST(0.08330 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (8, N'3', 4, 16, N'KOM', CAST(0.04170 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 6, 4, N'KOM', CAST(0.00300 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 7, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 3, 7, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 8, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 5, 15, N'KOM', CAST(0.08330 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (9, N'4', 4, 16, N'KOM', CAST(0.04170 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (10, N'9', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (10, N'9', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (10, N'9', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (10, N'9', 6, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (10, N'9', 4, 23, N'KOM', CAST(0.05600 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (10, N'9', 3, 28, N'KG', CAST(0.00800 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (11, N'10', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (11, N'10', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (11, N'10', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (11, N'10', 6, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (11, N'10', 4, 23, N'KOM', CAST(0.05600 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (11, N'10', 3, 28, N'KG', CAST(0.00800 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (12, N'11', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (12, N'11', 2, 2, N'KOM', CAST(1.14000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (12, N'11', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (12, N'11', 6, 11, N'LIT', CAST(0.00040 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (12, N'11', 4, 23, N'KOM', CAST(0.05560 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (12, N'11', 3, 27, N'KG', CAST(0.00800 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (13, N'12', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (13, N'12', 2, 2, N'KOM', CAST(1.14000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (13, N'12', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (13, N'12', 6, 11, N'LIT', CAST(0.00040 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (13, N'12', 4, 23, N'KOM', CAST(0.05560 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (13, N'12', 3, 27, N'KG', CAST(0.00800 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (14, N'13', 1, 1, N'KG', CAST(0.15750 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (14, N'13', 2, 2, N'KOM', CAST(0.43000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (14, N'13', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (14, N'13', 6, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (14, N'13', 3, 25, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (14, N'13', 4, 26, N'KOM', CAST(0.06250 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (15, N'14', 1, 1, N'KG', CAST(0.15750 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (15, N'14', 2, 2, N'KOM', CAST(43.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (15, N'14', 5, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (15, N'14', 6, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (15, N'14', 3, 24, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (15, N'14', 4, 26, N'KOM', CAST(0.06250 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 1, 1, N'KG', CAST(0.21000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 2, 2, N'KOM', CAST(0.57000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 6, 4, N'KOM', CAST(0.00300 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 7, 5, N'KOM', CAST(0.00150 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 8, 11, N'LIT', CAST(0.00020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 3, 14, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 4, 19, N'KOM', CAST(0.04170 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (16, N'8', 5, 22, N'KOM', CAST(0.08330 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (19, N'15', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (19, N'15', 4, 5, N'KOM', CAST(0.00260 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (19, N'15', 3, 34, N'KOM', CAST(0.05900 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (19, N'15', 2, 35, N'KG', CAST(0.00902 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (19, N'15', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
GO
print 'Processed 100 total records'
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (20, N'16', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (20, N'16', 4, 5, N'KOM', CAST(0.00260 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (20, N'16', 3, 34, N'KOM', CAST(0.05900 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (20, N'16', 2, 35, N'KG', CAST(0.00902 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (20, N'16', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (21, N'17', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (21, N'17', 4, 5, N'KOM', CAST(0.00140 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (21, N'17', 3, 32, N'KOM', CAST(0.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (21, N'17', 2, 35, N'KG', CAST(0.00550 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (21, N'17', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (22, N'18', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (22, N'18', 4, 5, N'KOM', CAST(0.00160 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (22, N'18', 3, 23, N'KOM', CAST(0.05560 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (22, N'18', 2, 35, N'KG', CAST(0.00650 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (22, N'18', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (23, N'19', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (23, N'19', 4, 5, N'KOM', CAST(0.00060 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (23, N'19', 3, 33, N'KOM', CAST(0.16670 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (23, N'19', 2, 37, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (23, N'19', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (24, N'20', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (24, N'20', 4, 5, N'KOM', CAST(0.00060 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (24, N'20', 3, 33, N'KOM', CAST(0.16670 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (24, N'20', 2, 37, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (24, N'20', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (25, N'21', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (25, N'21', 4, 5, N'KOM', CAST(0.00350 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (25, N'21', 3, 32, N'KOM', CAST(0.12500 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (25, N'21', 2, 35, N'KG', CAST(0.00902 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (25, N'21', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (26, N'22', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (26, N'22', 4, 5, N'KOM', CAST(0.00470 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (26, N'22', 3, 32, N'KOM', CAST(0.16670 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (26, N'22', 2, 35, N'KG', CAST(0.01020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (26, N'22', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (27, N'23', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (27, N'23', 3, 3, N'KOM', CAST(0.11200 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (27, N'23', 4, 5, N'KOM', CAST(0.00320 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (27, N'23', 2, 35, N'KG', CAST(0.00950 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (27, N'23', 5, 40, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (28, N'24', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (28, N'24', 2, 2, N'KOM', CAST(2.85000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (28, N'24', 5, 5, N'KOM', CAST(0.00600 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (28, N'24', 7, 11, N'LIT', CAST(0.00040 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (28, N'24', 4, 33, N'KOM', CAST(0.16670 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (28, N'24', 3, 37, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (28, N'24', 6, 39, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (29, N'25', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (29, N'25', 2, 2, N'KOM', CAST(2.85000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (29, N'25', 5, 5, N'KOM', CAST(0.00600 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (29, N'25', 7, 11, N'LIT', CAST(0.00040 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (29, N'25', 4, 33, N'KOM', CAST(0.16670 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (29, N'25', 3, 37, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (29, N'25', 6, 39, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (30, N'26', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (30, N'26', 2, 2, N'KOM', CAST(2.85000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (30, N'26', 5, 5, N'KOM', CAST(0.00350 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (30, N'26', 7, 11, N'LIT', CAST(0.00040 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (30, N'26', 4, 32, N'KOM', CAST(0.11250 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (30, N'26', 3, 35, N'KG', CAST(0.00902 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (30, N'26', 6, 39, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (31, N'27', 1, 1, N'KG', CAST(1.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (31, N'27', 2, 2, N'KOM', CAST(2.85000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (31, N'27', 5, 5, N'KOM', CAST(0.00470 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (31, N'27', 7, 11, N'LIT', CAST(0.00040 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (31, N'27', 4, 32, N'KOM', CAST(0.16670 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (31, N'27', 3, 35, N'KG', CAST(0.01020 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (31, N'27', 6, 39, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (32, N'28', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (32, N'28', 4, 5, N'KOM', CAST(0.00140 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (32, N'28', 6, 11, N'LIT', CAST(0.00040 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (32, N'28', 3, 32, N'KOM', CAST(0.05000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (32, N'28', 2, 35, N'KG', CAST(0.00550 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (32, N'28', 5, 38, N'KOM', CAST(1.00000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (33, N'29', 1, 1, N'KG', CAST(0.42000 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (33, N'29', 3, 23, N'KOM', CAST(0.05560 AS Decimal(15, 5)))
INSERT [dbo].[sastavnica] ([ID_PROIZVOD], [BROJ], [RBR], [ID_SIROVINA], [JM], [KOLICINA]) VALUES (33, N'29', 2, 35, N'KG', CAST(0.00650 AS Decimal(15, 5)))
/****** Object:  Table [dbo].[predatnica]    Script Date: 06/12/2019 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[predatnica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BROJ] [varchar](10) NULL,
	[RBR] [int] NULL,
	[ID_PROIZVODA] [int] NULL,
	[JM] [varchar](10) NULL,
	[KOLICINA] [decimal](10, 2) NULL,
	[DATUM] [date] NULL,
 CONSTRAINT [PK_predatnica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Broj predatnice' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predatnica', @level2type=N'COLUMN',@level2name=N'BROJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Redni broj proizvoda u predatnici' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predatnica', @level2type=N'COLUMN',@level2name=N'RBR'
GO
SET IDENTITY_INSERT [dbo].[predatnica] ON
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (1, N'1', 1, 16, N'KOM', CAST(200.00 AS Decimal(10, 2)), CAST(0x263F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (2, N'2', 1, 5, N'KOM', CAST(5232.00 AS Decimal(10, 2)), CAST(0x263F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (3, N'2', 2, 16, N'KOM', CAST(2620.00 AS Decimal(10, 2)), CAST(0x2B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (4, N'3', 1, 5, N'KOM', CAST(7854.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (5, N'3', 2, 10, N'KOM', CAST(109.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (6, N'3', 3, 11, N'KOM', CAST(262.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (7, N'3', 4, 13, N'KOM', CAST(1580.00 AS Decimal(10, 2)), CAST(0x2C3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (8, N'4', 1, 5, N'KOM', CAST(3446.00 AS Decimal(10, 2)), CAST(0x2D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (9, N'4', 2, 9, N'KOM', CAST(6902.00 AS Decimal(10, 2)), CAST(0x2D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (10, N'5', 1, 6, N'KOM', CAST(7008.00 AS Decimal(10, 2)), CAST(0x303F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (11, N'5', 2, 11, N'KOM', CAST(2782.00 AS Decimal(10, 2)), CAST(0x303F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (12, N'5', 3, 17, N'KOM', CAST(224.00 AS Decimal(10, 2)), CAST(0x303F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (13, N'6', 1, 7, N'KOM', CAST(6510.00 AS Decimal(10, 2)), CAST(0x313F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (14, N'6', 2, 10, N'KOM', CAST(959.00 AS Decimal(10, 2)), CAST(0x313F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (15, N'7', 1, 5, N'KOM', CAST(6441.00 AS Decimal(10, 2)), CAST(0x323F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (16, N'7', 2, 14, N'KOM', CAST(1728.00 AS Decimal(10, 2)), CAST(0x323F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (17, N'8', 1, 3, N'KOM', CAST(560.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (18, N'8', 2, 6, N'KOM', CAST(5189.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (19, N'8', 3, 7, N'KOM', CAST(2974.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (20, N'8', 4, 17, N'KOM', CAST(1176.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (21, N'8', 5, 18, N'KOM', CAST(819.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (22, N'8', 6, 14, N'KOM', CAST(2560.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (23, N'8', 7, 15, N'KOM', CAST(832.00 AS Decimal(10, 2)), CAST(0x333F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (24, N'9', 1, 5, N'KOM', CAST(5697.00 AS Decimal(10, 2)), CAST(0x343F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (25, N'10', 1, 6, N'KOM', CAST(7080.00 AS Decimal(10, 2)), CAST(0x373F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (26, N'10', 2, 16, N'KOM', CAST(2753.00 AS Decimal(10, 2)), CAST(0x373F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (27, N'10', 3, 15, N'KOM', CAST(3248.00 AS Decimal(10, 2)), CAST(0x373F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (28, N'11', 1, 7, N'KOM', CAST(13915.00 AS Decimal(10, 2)), CAST(0x393F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (29, N'11', 2, 8, N'KOM', CAST(1265.00 AS Decimal(10, 2)), CAST(0x393F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (30, N'12', 1, 6, N'KOM', CAST(6116.00 AS Decimal(10, 2)), CAST(0x3A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (31, N'13', 1, 8, N'KOM', CAST(553.00 AS Decimal(10, 2)), CAST(0x3B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (32, N'13', 2, 9, N'KOM', CAST(8814.00 AS Decimal(10, 2)), CAST(0x3B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (33, N'14', 1, 8, N'KOM', CAST(1750.00 AS Decimal(10, 2)), CAST(0x3F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (34, N'14', 2, 12, N'KOM', CAST(1051.00 AS Decimal(10, 2)), CAST(0x3F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (35, N'15', 1, 5, N'KOM', CAST(14494.00 AS Decimal(10, 2)), CAST(0x423F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (36, N'15', 2, 7, N'KOM', CAST(15691.00 AS Decimal(10, 2)), CAST(0x423F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (37, N'15', 3, 14, N'KOM', CAST(3680.00 AS Decimal(10, 2)), CAST(0x423F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (38, N'16', 1, 4, N'KOM', CAST(347.00 AS Decimal(10, 2)), CAST(0x463F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (39, N'16', 2, 8, N'KOM', CAST(3900.00 AS Decimal(10, 2)), CAST(0x463F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (40, N'17', 1, 5, N'KOM', CAST(7709.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (41, N'17', 2, 6, N'KOM', CAST(7674.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (42, N'17', 3, 7, N'KOM', CAST(15894.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (43, N'17', 4, 16, N'KOM', CAST(2331.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (44, N'17', 5, 8, N'KOM', CAST(3517.00 AS Decimal(10, 2)), CAST(0x483F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (45, N'18', 1, 5, N'KOM', CAST(3435.00 AS Decimal(10, 2)), CAST(0x493F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (46, N'19', 1, 4, N'KOM', CAST(1340.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (47, N'19', 2, 5, N'KOM', CAST(8493.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (48, N'19', 3, 6, N'KOM', CAST(6548.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (49, N'19', 4, 7, N'KOM', CAST(12201.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (50, N'19', 5, 9, N'KOM', CAST(5826.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (51, N'19', 6, 11, N'KOM', CAST(264.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (52, N'19', 7, 15, N'KOM', CAST(2352.00 AS Decimal(10, 2)), CAST(0x4F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (53, N'20', 1, 14, N'KOM', CAST(560.00 AS Decimal(10, 2)), CAST(0x503F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (54, N'21', 1, 14, N'KOM', CAST(2496.00 AS Decimal(10, 2)), CAST(0x543F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (55, N'22', 1, 3, N'KOM', CAST(403.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (56, N'22', 2, 5, N'KOM', CAST(12867.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (57, N'22', 3, 7, N'KOM', CAST(16060.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (58, N'22', 4, 16, N'KOM', CAST(934.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (59, N'22', 5, 8, N'KOM', CAST(1273.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (60, N'22', 6, 11, N'KOM', CAST(2802.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (61, N'22', 7, 13, N'KOM', CAST(256.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (62, N'22', 8, 14, N'KOM', CAST(912.00 AS Decimal(10, 2)), CAST(0x563F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (63, N'23', 1, 9, N'KOM', CAST(8477.00 AS Decimal(10, 2)), CAST(0x573F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (64, N'24', 1, 3, N'KOM', CAST(1248.00 AS Decimal(10, 2)), CAST(0x5B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (65, N'24', 2, 14, N'KOM', CAST(2928.00 AS Decimal(10, 2)), CAST(0x5B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (66, N'25', 1, 7, N'KOM', CAST(7188.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (67, N'25', 2, 8, N'KOM', CAST(3848.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (68, N'25', 3, 10, N'KOM', CAST(298.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (69, N'25', 4, 13, N'KOM', CAST(1288.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (70, N'25', 5, 15, N'KOM', CAST(896.00 AS Decimal(10, 2)), CAST(0x5D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (71, N'26', 1, 5, N'KOM', CAST(18124.00 AS Decimal(10, 2)), CAST(0x5E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (72, N'26', 2, 6, N'KOM', CAST(9484.00 AS Decimal(10, 2)), CAST(0x5E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (73, N'27', 1, 5, N'KOM', CAST(13506.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (74, N'27', 2, 6, N'KOM', CAST(6725.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (75, N'27', 3, 16, N'KOM', CAST(2382.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (76, N'27', 4, 15, N'KOM', CAST(3392.00 AS Decimal(10, 2)), CAST(0x633F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (77, N'28', 1, 12, N'KOM', CAST(1688.00 AS Decimal(10, 2)), CAST(0x643F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (78, N'29', 1, 5, N'KOM', CAST(17131.00 AS Decimal(10, 2)), CAST(0x6A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (79, N'29', 2, 6, N'KOM', CAST(6629.00 AS Decimal(10, 2)), CAST(0x6A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (80, N'29', 3, 7, N'KOM', CAST(9171.00 AS Decimal(10, 2)), CAST(0x6A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (81, N'29', 4, 8, N'KOM', CAST(1938.00 AS Decimal(10, 2)), CAST(0x6A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (82, N'29', 5, 10, N'KOM', CAST(374.00 AS Decimal(10, 2)), CAST(0x6A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (83, N'29', 6, 14, N'KOM', CAST(3600.00 AS Decimal(10, 2)), CAST(0x6A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (84, N'30', 1, 7, N'KOM', CAST(6892.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (85, N'30', 2, 10, N'KOM', CAST(914.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (86, N'30', 3, 13, N'KOM', CAST(298.00 AS Decimal(10, 2)), CAST(0x6B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (87, N'31', 1, 4, N'KOM', CAST(970.00 AS Decimal(10, 2)), CAST(0x6C3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (88, N'31', 2, 7, N'KOM', CAST(4063.00 AS Decimal(10, 2)), CAST(0x6C3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (89, N'32', 1, 3, N'KOM', CAST(902.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (90, N'32', 2, 8, N'KOM', CAST(3449.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (91, N'32', 3, 9, N'KOM', CAST(8172.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (92, N'32', 4, 13, N'KOM', CAST(1517.00 AS Decimal(10, 2)), CAST(0x723F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (93, N'33', 1, 5, N'KOM', CAST(18611.00 AS Decimal(10, 2)), CAST(0x733F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (94, N'34', 1, 19, N'KOM', CAST(17.00 AS Decimal(10, 2)), CAST(0x773F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (95, N'34', 2, 20, N'KOM', CAST(17.00 AS Decimal(10, 2)), CAST(0x773F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (96, N'34', 3, 32, N'KOM', CAST(20.00 AS Decimal(10, 2)), CAST(0x773F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (97, N'34', 4, 33, N'KOM', CAST(18.00 AS Decimal(10, 2)), CAST(0x773F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (98, N'35', 1, 19, N'KOM', CAST(85.00 AS Decimal(10, 2)), CAST(0x783F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (99, N'35', 2, 20, N'KOM', CAST(68.00 AS Decimal(10, 2)), CAST(0x783F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (100, N'35', 3, 32, N'KOM', CAST(160.00 AS Decimal(10, 2)), CAST(0x783F0B00 AS Date))
GO
print 'Processed 100 total records'
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (101, N'35', 4, 33, N'KOM', CAST(54.00 AS Decimal(10, 2)), CAST(0x783F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (102, N'36', 1, 5, N'KOM', CAST(5789.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (103, N'36', 2, 6, N'KOM', CAST(3962.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (104, N'36', 3, 16, N'KOM', CAST(2347.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (105, N'36', 4, 12, N'KOM', CAST(263.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (106, N'36', 5, 15, N'KOM', CAST(3088.00 AS Decimal(10, 2)), CAST(0x793F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (107, N'37', 1, 7, N'KOM', CAST(18636.00 AS Decimal(10, 2)), CAST(0x7A3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (108, N'38', 1, 20, N'KOM', CAST(102.00 AS Decimal(10, 2)), CAST(0x7E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (109, N'38', 2, 32, N'KOM', CAST(40.00 AS Decimal(10, 2)), CAST(0x7E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (110, N'38', 3, 33, N'KOM', CAST(216.00 AS Decimal(10, 2)), CAST(0x7E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (111, N'39', 1, 23, N'KOM', CAST(12.00 AS Decimal(10, 2)), CAST(0x7F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (112, N'39', 2, 24, N'KOM', CAST(16.00 AS Decimal(10, 2)), CAST(0x7F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (113, N'39', 3, 36, N'KOM', CAST(18.00 AS Decimal(10, 2)), CAST(0x7F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (114, N'39', 4, 37, N'KOM', CAST(6.00 AS Decimal(10, 2)), CAST(0x7F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (115, N'40', 1, 7, N'KOM', CAST(21645.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (116, N'40', 2, 8, N'KOM', CAST(3341.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (117, N'40', 3, 9, N'KOM', CAST(1955.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (118, N'40', 4, 11, N'KOM', CAST(2959.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (119, N'40', 5, 12, N'KOM', CAST(181.00 AS Decimal(10, 2)), CAST(0x803F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (120, N'41', 1, 5, N'KOM', CAST(10561.00 AS Decimal(10, 2)), CAST(0x813F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (121, N'41', 2, 9, N'KOM', CAST(6756.00 AS Decimal(10, 2)), CAST(0x813F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (122, N'42', 1, 19, N'KOM', CAST(85.00 AS Decimal(10, 2)), CAST(0x843F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (123, N'42', 2, 20, N'KOM', CAST(85.00 AS Decimal(10, 2)), CAST(0x843F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (124, N'42', 3, 32, N'KOM', CAST(140.00 AS Decimal(10, 2)), CAST(0x843F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (125, N'42', 4, 33, N'KOM', CAST(270.00 AS Decimal(10, 2)), CAST(0x843F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (126, N'43', 1, 12, N'KOM', CAST(1149.00 AS Decimal(10, 2)), CAST(0x853F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (127, N'44', 1, 4, N'KOM', CAST(210.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (128, N'44', 2, 5, N'KOM', CAST(11584.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (129, N'44', 3, 6, N'KOM', CAST(14831.00 AS Decimal(10, 2)), CAST(0x873F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (130, N'45', 1, 29, N'KOM', CAST(8.00 AS Decimal(10, 2)), CAST(0x883F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (131, N'46', 1, 7, N'KOM', CAST(11545.00 AS Decimal(10, 2)), CAST(0x883F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (132, N'46', 2, 14, N'KOM', CAST(3568.00 AS Decimal(10, 2)), CAST(0x883F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (133, N'47', 1, 24, N'KOM', CAST(72.00 AS Decimal(10, 2)), CAST(0x8B3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (134, N'48', 1, 37, N'KOM', CAST(14.00 AS Decimal(10, 2)), CAST(0x8D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (135, N'48', 2, 32, N'KOM', CAST(120.00 AS Decimal(10, 2)), CAST(0x8D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (136, N'49', 1, 4, N'KOM', CAST(1310.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (137, N'49', 2, 5, N'KOM', CAST(12176.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (138, N'49', 3, 6, N'KOM', CAST(5944.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (139, N'49', 4, 7, N'KOM', CAST(10381.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (140, N'49', 5, 16, N'KOM', CAST(2948.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (141, N'49', 6, 8, N'KOM', CAST(2680.00 AS Decimal(10, 2)), CAST(0x8E3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (142, N'50', 1, 9, N'KOM', CAST(8843.00 AS Decimal(10, 2)), CAST(0x8F3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (143, N'51', 1, 19, N'KOM', CAST(85.00 AS Decimal(10, 2)), CAST(0x943F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (144, N'51', 2, 20, N'KOM', CAST(85.00 AS Decimal(10, 2)), CAST(0x943F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (145, N'51', 3, 32, N'KOM', CAST(100.00 AS Decimal(10, 2)), CAST(0x943F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (146, N'51', 4, 33, N'KOM', CAST(90.00 AS Decimal(10, 2)), CAST(0x943F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (147, N'52', 1, 6, N'KOM', CAST(10821.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (148, N'52', 2, 7, N'KOM', CAST(6029.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (149, N'52', 3, 13, N'KOM', CAST(1574.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (150, N'52', 4, 14, N'KOM', CAST(3056.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (151, N'52', 5, 24, N'KOM', CAST(32.00 AS Decimal(10, 2)), CAST(0x953F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (152, N'53', 1, 5, N'KOM', CAST(12931.00 AS Decimal(10, 2)), CAST(0x963F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (153, N'53', 2, 8, N'KOM', CAST(3601.00 AS Decimal(10, 2)), CAST(0x963F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (154, N'54', 1, 3, N'KOM', CAST(322.00 AS Decimal(10, 2)), CAST(0x9D3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (155, N'55', 1, 3, N'KOM', CAST(1313.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (156, N'55', 2, 7, N'KOM', CAST(10841.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (157, N'55', 3, 9, N'KOM', CAST(11215.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (158, N'55', 4, 10, N'KOM', CAST(337.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (159, N'55', 5, 11, N'KOM', CAST(363.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (160, N'55', 6, 24, N'KOM', CAST(8.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (161, N'55', 7, 29, N'KOM', CAST(16.00 AS Decimal(10, 2)), CAST(0xA33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (162, N'56', 1, 5, N'KOM', CAST(14859.00 AS Decimal(10, 2)), CAST(0xA43F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (163, N'56', 2, 8, N'KOM', CAST(3254.00 AS Decimal(10, 2)), CAST(0xA43F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (164, N'57', 1, 32, N'KOM', CAST(100.00 AS Decimal(10, 2)), CAST(0xA83F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (165, N'57', 2, 33, N'KOM', CAST(90.00 AS Decimal(10, 2)), CAST(0xA83F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (166, N'58', 1, 6, N'KOM', CAST(6125.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (167, N'58', 2, 11, N'KOM', CAST(2656.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (168, N'58', 3, 15, N'KOM', CAST(2592.00 AS Decimal(10, 2)), CAST(0xAA3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (169, N'59', 1, 5, N'KOM', CAST(19953.00 AS Decimal(10, 2)), CAST(0xAB3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (170, N'59', 2, 7, N'KOM', CAST(19830.00 AS Decimal(10, 2)), CAST(0xAB3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (171, N'60', 1, 24, N'KOM', CAST(48.00 AS Decimal(10, 2)), CAST(0xAE3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (172, N'61', 1, 8, N'KOM', CAST(3575.00 AS Decimal(10, 2)), CAST(0xAF3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (173, N'62', 1, 4, N'KOM', CAST(1235.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (174, N'62', 2, 15, N'KOM', CAST(2960.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (175, N'62', 3, 32, N'KOM', CAST(300.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (176, N'62', 4, 33, N'KOM', CAST(270.00 AS Decimal(10, 2)), CAST(0xB13F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (177, N'63', 1, 5, N'KOM', CAST(17000.00 AS Decimal(10, 2)), CAST(0xB23F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (178, N'63', 2, 6, N'KOM', CAST(9361.00 AS Decimal(10, 2)), CAST(0xB23F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (179, N'63', 3, 7, N'KOM', CAST(10525.00 AS Decimal(10, 2)), CAST(0xB23F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (180, N'64', 1, 32, N'KOM', CAST(200.00 AS Decimal(10, 2)), CAST(0xB53F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (181, N'64', 2, 33, N'KOM', CAST(180.00 AS Decimal(10, 2)), CAST(0xB53F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (182, N'65', 1, 6, N'KOM', CAST(8334.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (183, N'65', 2, 16, N'KOM', CAST(2403.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (184, N'65', 3, 8, N'KOM', CAST(2332.00 AS Decimal(10, 2)), CAST(0xB83F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (185, N'66', 1, 5, N'KOM', CAST(22968.00 AS Decimal(10, 2)), CAST(0xB93F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (186, N'66', 2, 12, N'KOM', CAST(1094.00 AS Decimal(10, 2)), CAST(0xB93F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (187, N'67', 1, 24, N'KOM', CAST(80.00 AS Decimal(10, 2)), CAST(0xBA3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (188, N'68', 1, 7, N'KOM', CAST(13803.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (189, N'68', 2, 9, N'KOM', CAST(8691.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (190, N'68', 3, 14, N'KOM', CAST(3568.00 AS Decimal(10, 2)), CAST(0xBF3F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (191, N'69', 1, 5, N'KOM', CAST(19690.00 AS Decimal(10, 2)), CAST(0xC03F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (192, N'69', 2, 24, N'KOM', CAST(8.00 AS Decimal(10, 2)), CAST(0xC03F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (193, N'69', 3, 29, N'KOM', CAST(8.00 AS Decimal(10, 2)), CAST(0xC03F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (194, N'70', 1, 5, N'KOM', CAST(8904.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (195, N'70', 2, 6, N'KOM', CAST(3798.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (196, N'70', 3, 8, N'KOM', CAST(1570.00 AS Decimal(10, 2)), CAST(0xC33F0B00 AS Date))
INSERT [dbo].[predatnica] ([ID], [BROJ], [RBR], [ID_PROIZVODA], [JM], [KOLICINA], [DATUM]) VALUES (197, N'71', 1, 7, N'KOM', CAST(11057.00 AS Decimal(10, 2)), CAST(0xC43F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[predatnica] OFF
/****** Object:  ForeignKey [FK_predatnica_proizvod]    Script Date: 06/12/2019 13:29:22 ******/
ALTER TABLE [dbo].[predatnica]  WITH CHECK ADD  CONSTRAINT [FK_predatnica_proizvod] FOREIGN KEY([ID_PROIZVODA])
REFERENCES [dbo].[proizvod] ([ID])
GO
ALTER TABLE [dbo].[predatnica] CHECK CONSTRAINT [FK_predatnica_proizvod]
GO
/****** Object:  ForeignKey [FK_sastavnica_proizvod]    Script Date: 06/12/2019 13:29:22 ******/
ALTER TABLE [dbo].[sastavnica]  WITH CHECK ADD  CONSTRAINT [FK_sastavnica_proizvod] FOREIGN KEY([ID_PROIZVOD])
REFERENCES [dbo].[proizvod] ([ID])
GO
ALTER TABLE [dbo].[sastavnica] CHECK CONSTRAINT [FK_sastavnica_proizvod]
GO
/****** Object:  ForeignKey [FK_sastavnica_sirovine]    Script Date: 06/12/2019 13:29:22 ******/
ALTER TABLE [dbo].[sastavnica]  WITH CHECK ADD  CONSTRAINT [FK_sastavnica_sirovine] FOREIGN KEY([ID_SIROVINA])
REFERENCES [dbo].[sirovine] ([ID])
GO
ALTER TABLE [dbo].[sastavnica] CHECK CONSTRAINT [FK_sastavnica_sirovine]
GO
/****** Object:  ForeignKey [FK_trebovanje_sirovine]    Script Date: 06/12/2019 13:29:22 ******/
ALTER TABLE [dbo].[trebovanje]  WITH CHECK ADD  CONSTRAINT [FK_trebovanje_sirovine] FOREIGN KEY([ID_SIROVINE])
REFERENCES [dbo].[sirovine] ([ID])
GO
ALTER TABLE [dbo].[trebovanje] CHECK CONSTRAINT [FK_trebovanje_sirovine]
GO
