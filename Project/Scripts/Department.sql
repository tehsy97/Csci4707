create table Department
(
	Id int not null
		primary key,
	Name varchar(30) not null,
	constraint Department_Name_uindex
		unique (Name)
);

