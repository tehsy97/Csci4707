create table Insurance
(
	Provider_name varchar(30) not null,
	Member_id int not null,
	Group_id int not null,
	Start_date date null,
	End_date date null,
	Copay decimal(15,2) null,
	PId int not null,
	primary key (Provider_name, Member_id, Group_id),
	constraint Insurance_Patient_PId_fk
		foreign key (PId) references Patient (PId)
);

