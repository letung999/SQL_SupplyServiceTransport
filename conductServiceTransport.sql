
create database serviceTransport
go
use serviceTransport
create table kindOfCar(/*loai xe*/
idOfCar varchar(100) not null primary key,
carOfManufactuer varchar(100) not null,
numOfSeats int not null
)
create table fee(
idOfFee varchar(10) not null primary key,
bill decimal(5,2) not null
)
create table serviceFrom(
idOfSupplier  varchar(20) not null primary key,
nameOfSupplier varchar(200) not null,
address varchar(100) not null,
phone varchar(100) not null,
idOfBorrow varchar(20) not null,
)
create table kindOfService(
idOfSevice varchar(10) not null primary key,
nameService varchar(50) not null,
)
create table registerForService(
idOfRegister varchar(10) not null,
idOfSupplier  varchar(20) not null,
idOfSevice varchar(10) not null,
idOfFee varchar(10) not null,
idOfCar varchar(100) not null,
startDay date not null,
endDay date not null,
numOfRegister int not null,
constraint FK1 foreign key(idOfSupplier) references serviceFrom(idOfSupplier),
constraint FK2 foreign key(idOfSevice) references kindOfService(idOfSevice),
constraint FK3 foreign key(idOfFee) references fee(idOfFee),
constraint FK4 foreign key(idOfCar) references kindOfCar(idOfCar)
)
go
insert into kindOfCar values
('C1','Honda',4),
('C2','Toyota',6),
('C3','Hondacivic',8),
('C4','nissan',4),
('C5','mercedes',4),
('C6','mishubishi',6)
go
insert into fee values
('MP1',10),
('MP2',15),
('MP3',11),
('MP4',13),
('MP5',17)
go
insert into serviceFrom values
('SP1','CTy TTHH Rang Dong','Thu Duc','033 88 555','001'),
('SP2','CTy TTHH Anh Sang','Binh Thanh','033 88 888','002'),
('SP3','CTy TTHH Dong Du','Tan Binh','033 88 558','003'),
('SP4','CTy TTHH Chin Ngia','Binh Tan','033 88 808','004'),
('SP5','CTy TTHH Binh Tam','Go Vap','033 88 998','005'),
('SP6','CTy TTHH Sao Vang','Hoc Mon','033 88 988','006'),
('SP7','CTy TTHH Hong Hanh','Thu Duc','033 88 788','007'),
('SP8','CTy TTHH Mai Linh','Thu Duc','033 88 838','008')
go
insert into kindOfService values
('SV1','Dich Vu Taxi'),
('SV2','Dich Vu Du Lich'),
('SV3','Dich Vu Dam Cuoi'),
('SV4','Dich Vu Y Te')
go
insert into registerForService values
('R1','SP1','SV1','MP1','C1','2020-10-07','2020-10-09',4),
('R2','SP1','SV2','MP1','C2','2020-10-08','2020-10-11',5),
('R3','SP2','SV3','MP1','C3','2020-10-09','2020-10-12',3),
('R4','SP3','SV4','MP2','C4','2020-10-10','2020-10-13',5),
('R5','SP3','SV1','MP2','C1','2020-10-11','2020-10-14',7),
('R6','SP4','SV2','MP3','C2','2020-10-12','2020-10-15',9),
('R7','SP5','SV3','MP4','C3','2020-10-13','2020-10-16',11),
('R8','SP6','SV4','MP4','C4','2020-10-14','2020-10-17',15),
('R9','SP7','SV1','MP5','C5','2020-10-09','2020-10-09',20),
('R10','SP8','SV2','MP5','C6','2020-10-07','2020-10-09',22)
/*
Cài đặt dữ liệu
Câu 1: Hãy tự định nghĩa kiểu dữ liệu cho các cột, sau đó tạo đầy đủ lược đồ cơ sở dữ liệu
quan hệ như mô tả ở trên.

Câu 2: Nhập toàn bộ dữ liệu mẫu đã được minh họa ở trên vào cơ sở dữ liệu

Truy Vấn
Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ

Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
thuộc hãng xe “mercedes” với mức phí có đơn giá là 20.000 VNĐ/km

Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
cấp và giảm dần theo mã số thuế

Câu 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
cung cấp là '2020-10-07' and '2020-10-15'

Câu 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
chỉ được liệt kê một lần

Câu 8: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra

Câu 9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
thuộc dòng xe “toyota” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “merxedes”

Câu 10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
tren hai phương tiện lần nào cả.
*/
select c.numOfSeats, c.carOfManufactuer from kindOfCar as c where c.numOfSeats>5
-------------------------------------------------------------------------------------------------------------------
select *  from registerForService as r
inner join kindOfCar as k on r.idOfCar = k.idOfCar 
inner join fee as f on f.idOfFee = r.idOfFee
where (k.carOfManufactuer ='Toyota' or k.carOfManufactuer = 'mercedes')
and (f.bill>=10 and f.bill<=13)
-------------------------------------------------------------------------------------------------------------------
select * from registerForService as r
inner join serviceFrom as sv on r.idOfSupplier = sv.idOfSupplier
order by sv.nameOfSupplier
-------------------------------------------------------------------------------------------------------------------
select * from registerForService as r
inner join serviceFrom as sv on r.idOfSupplier = sv.idOfSupplier
order by sv.idOfBorrow desc
-------------------------------------------------------------------------------------------------------------------
select k.carOfManufactuer, COUNT(r.idOfCar) from registerForService as r, kindOfCar as k
where r.idOfCar = k.idOfCar and r.startDay between '2020-10-07' and '2020-10-15'
group by k.carOfManufactuer
-----------------------------------------------------------------------------------------------------------------
select count (distinct(r.idOfCar)) from registerForService as r
-----------------------------------------------------------------------------------------------------------------
select k.carOfManufactuer, f.bill, ks.nameService, k.numOfSeats
from kindOfCar as k,registerForService as r,fee as f, kindOfService as ks
where r.idOfCar = k.idOfCar and r.idOfFee = f.idOfFee
and ks.idOfSevice = r.idOfSevice
group by k.carOfManufactuer, f.bill, ks.nameService, k.numOfSeats
------------------------------------------------------------------------------------------------------------------
select *from serviceFrom as sf 
inner join registerForService as r on sf.idOfSupplier = r.idOfSupplier
inner join kindOfCar as k on k.idOfCar = r.idOfCar
where k.carOfManufactuer ='Toyota' or k.carOfManufactuer ='nissan'
-------------------------------------------------------------------------------------------------------------------
select sf.nameOfSupplier, count(r.idOfSupplier)as numOfSupport from serviceFrom as sf, registerForService as r
where sf.idOfSupplier = r.idOfSupplier
group by sf.nameOfSupplier
having count(r.idOfSupplier) > 1