create table VisitHasDiagnosis
(
	`ICD-10-CM-Code` varchar(30) not null,
	VId int not null,
	SId int not null,
	primary key (`ICD-10-CM-Code`, VId),
	constraint VisitHasDiagnosis_Diagnosis_Code_fk
		foreign key (`ICD-10-CM-Code`) references Diagnosis (`ICD-10-CM-Code`),
	constraint VisitHasDiagnosis_Visit_VId_fk
		foreign key (VId) references Visit (VId)
			on update cascade on delete cascade
);

