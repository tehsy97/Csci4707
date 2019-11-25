create table PatientHasEmergencyContact
(
	EId int not null,
	PId int not null,
	Relationship varchar(30) null,
	primary key (EId, PId),
	constraint Patient_EmergencyContact_EId_fk
		foreign key (EId) references EmergencyContact (EId),
	constraint Patient_EmergencyContact_PId_fk
		foreign key (PId) references Patient (PId)
);

