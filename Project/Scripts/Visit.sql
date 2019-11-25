create table Visit
(
	VId int not null
		primary key,
	In_time time null,
	Out_time time null,
	Day int null,
	Month int null,
	Year int null,
	Bill decimal(15,2) null,
	PId int not null,
	Intake_EId int not null,
	Service_EId int not null,
	Provider_name varchar(30) null,
	Member_Id int null,
	Group_Id int null,
	Online_form blob null,
	constraint Visit_Insurance_Provider_name_Member_id_Group_id_fk
		foreign key (Provider_name, Member_Id, Group_Id) references Insurance (Provider_name, Member_id, Group_id),
	constraint Visit_IntakeClerk_EId_fk
		foreign key (Intake_EId) references IntakeClerk (EId),
	constraint Visit_Patient_PId_fk
		foreign key (PId) references Patient (PId),
	constraint Visit_ServiceProvider_EId_fk
		foreign key (Service_EId) references ServiceProvider (EId)
);

