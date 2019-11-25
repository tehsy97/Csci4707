create table NurseAssistsVisit
(
	EId int not null,
	VId int not null,
	primary key (EId, VId),
	constraint NurseAssistsVisit_Nurse_EId_fk
		foreign key (EId) references Nurse (EId)
			on update cascade on delete cascade,
	constraint NurseAssistsVisit_Visit_VId_fk
		foreign key (VId) references Visit (VId)
			on update cascade on delete cascade
);

