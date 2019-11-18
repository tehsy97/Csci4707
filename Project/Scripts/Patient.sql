create table Patient
(
	PId int default 0 not null
		primary key,
	FName varchar(30) null,
	MName varchar(30) null,
	LName varchar(30) null,
	House_number int null,
	Street varchar(100) null,
	City varchar(30) null,
	State varchar(30) null,
	Zip int null,
	Day int null,
	Month int null,
	Year int null,
	Has_insurance tinyint(1) null
);
