create table Diagnosis
(
	Name varchar(30) not null,
	`ICD-10-CM-Code` varchar(30) not null
		primary key,
	Cost decimal(15,2) null,
	constraint Diagnosis_Name_uindex
		unique (Name)
);

