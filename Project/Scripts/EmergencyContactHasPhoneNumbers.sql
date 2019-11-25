create table EmergencyContactHasPhoneNumbers
(
	EId int not null,
	Phone_Number varchar(15) not null,
	primary key (EId, Phone_Number),
	constraint EmergencyContactHasPhoneNumbers_EmergencyContact_fk
		foreign key (EId) references EmergencyContact (EId)
			on update cascade on delete cascade
);

