create table PatientHasPhoneNumbers
(
	PId int not null,
	PhoneNumber varchar(15) not null,
	primary key (PId, PhoneNumber),
	constraint PatientHasPhoneNumbers_Patient_PId_fk
		foreign key (PId) references Patient (PId)
			on update cascade on delete cascade
);

