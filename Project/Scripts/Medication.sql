create table Medication
(
	MId int not null
		primary key,
	Name varchar(30) not null,
	constraint Medication_Name_uindex
		unique (Name)
);

