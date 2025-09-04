USE [project1]
GO
/****** Object:  Table [dbo].[aa]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aa](
	[id] [int] NULL,
	[name] [char](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acchive]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acchive](
	[empserial] [int] NULL,
	[name] [varchar](40) NULL,
	[salary] [money] NULL,
	[address1] [varchar](50) NULL,
	[Modfidedate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[addresss]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresss](
	[id] [int] NULL,
	[name] [varchar](30) NULL,
	[state] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checks]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checks](
	[id] [int] NOT NULL,
	[name] [varchar](40) NULL,
	[age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commaseparated]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commaseparated](
	[Trainingid] [int] NULL,
	[Traning] [varchar](30) NULL,
	[Classroom] [varchar](40) NULL,
	[startdate] [time](7) NULL,
	[Duration] [numeric](12, 2) NULL,
	[WK] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp2]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp2](
	[empserial] [int] NULL,
	[name] [varchar](30) NULL,
	[salary] [money] NULL,
	[address1] [varchar](60) NULL,
	[namesaddress] [varchar](60) NULL,
	[Modfidedate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empl]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empl](
	[empserial] [int] NULL,
	[name] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nullv]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nullv](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[id] [int] NULL,
	[name] [varchar](30) NULL,
	[salary] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[station]    Script Date: 9/17/2023 2:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE station2(
	[id] [int] NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](30) NULL,
	[len_n] [int] NULL,
	[Long_t] [int] NULL,
	compt as [len_n] +[Long_t] 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Checks]  WITH CHECK ADD CHECK  (([age]>=(18)))
GO
insert into station2 values( 12389,'Debirbrhan','ankober',6,6)
select * from station2
alter table [dbo].[station]
drop column com
select * from [dbo].[station]

insert into station2
select * from station
select * from station2 
delete from station
where Long_t is null
delete from station

insert into station
select [id],[city] ,[state],[len_n],[Long_t] from station2
select * from station2

delete from station
where id in(
select id
from(
select *
from(
 select id,count(*) as nu
from station 
group by id)as r
where r.nu>=2) as r2 
)
select * from station

