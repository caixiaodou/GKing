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
	LinkManID bigint primary key identity(1,1),--��ϵ��ID
	LinkManName varchar(20) not null,--��ϵ������
	LinkManType int check(LinkManType>=1  and LinkManType<=4) default 4,--��ϵ������
	LinkManSex varchar(6) check(LinkManSex='��'  or LinkManSex='Ů'),--��ϵ���Ա�
	LinkManPhone varchar(13),--��ϵ�˵绰
	LinkManHandPhone varchar(11),--��ϵ���ֻ�
	LinkManEmail varchar(30),--��ϵ�˵����ʼ���ַ
	LInkManPostAddress text,--��ϵ�����ŵ�ַ
	LinkManAddress text,--��ϵ��סַ
	LinkManQQ  varchar(15),--��ϵ��QQ
	LinkManMSN varchar(30),--��ϵ��MSN
	LinkManUName varchar(20)	
)
go

insert into AddressList values('��ʯ��',1,'��','0991-8801314','139********','hongbo0521@sina.com','','','177*****',
'hongbo0521@hotmail.com','admin')

select * from AddressList