use pubs
go
if exists(select * from sysobjects where [name]='UserInfo' and type='u')
	drop table UserInfo
create table UserInfo
(
	UserId int identity(1,1) primary key,
	UserName varchar(20) Unique not null,
	[PassWord] varchar(16) not null,
	Email varchar(25) not null
)
go


use pubs
go

if exists(select * from sysobjects where [name]='AddressList' and type='u')
	drop table AddressList
create table AddressList
(
	LinkManID bigint primary key identity(1,1),--联系人ID
	LinkManName varchar(20) not null,--联系人姓名
	LinkManType int check(LinkManType>=1  and LinkManType<=4) default 4,--联系人类型
	LinkManSex varchar(6) check(LinkManSex='男'  or LinkManSex='女'),--联系人性别
	LinkManPhone varchar(13),--联系人电话
	LinkManHandPhone varchar(11),--联系人手机
	LinkManEmail varchar(30),--联系人电子邮件地址
	LInkManPostAddress text,--联系人收信地址
	LinkManAddress text,--联系人住址
	LinkManQQ  varchar(15),--联系人QQ
	LinkManMSN varchar(30),--联系人MSN
	LinkManUName varchar(20)	
)
go

insert into AddressList values('洪石丹',1,'男','0991-8801314','139********','hongbo0521@sina.com','','','177*****',
'hongbo0521@hotmail.com','admin')

select * from AddressList