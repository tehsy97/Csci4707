create table Employee
(
	EId int not null
		primary key,
	Ssn int not null,
	FName varchar(30) null,
	MName varchar(30) null,
	LName varchar(30) null,
	DId int not null,
	constraint Employee_Ssn_uindex
		unique (Ssn),
	constraint Employee_Department_Id_fk
		foreign key (DId) references Department (Id)
);

