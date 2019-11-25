create table VisitHasTreatment
(
	`ICD-10-PCS-Code` varchar(30) not null,
	VId int not null,
	primary key (`ICD-10-PCS-Code`, VId),
	constraint VisitHasTreatment_Treatment_Code_fk
		foreign key (`ICD-10-PCS-Code`) references Treatment (`ICD-10-PCS-Code`),
	constraint VisitHasTreatment_Visit_VId_fk
		foreign key (VId) references Visit (VId)
			on update cascade on delete cascade
);

