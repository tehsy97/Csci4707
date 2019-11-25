create table Notes
(
	Note_id int not null,
	Notes text null,
	VId int not null,
	Service_EId int not null,
	Nurse_EId int not null,
	primary key (Note_id, VId),
	constraint Notes_Nurse_EId_fk
		foreign key (Nurse_EId) references Nurse (EId),
	constraint Notes_ServiceProvider_EId_fk
		foreign key (Service_EId) references ServiceProvider (EId),
	constraint Notes_Visit_VId_fk
		foreign key (VId) references Visit (VId)
);

