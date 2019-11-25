create table Nurse
(
	EId int not null
		primary key,
	NId int not null,
	constraint Nurse_NId_uindex
		unique (NId),
	constraint Nurse_Employee_EId_fk
		foreign key (EId) references Employee (EId)
);

