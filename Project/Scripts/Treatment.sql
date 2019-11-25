create table Treatment
(
	Name varchar(30) not null,
	`ICD-10-PCS-Code` varchar(30) not null
		primary key,
	Cost decimal(15,2) null,
	constraint Treatment_Name_uindex
		unique (Name)
);

