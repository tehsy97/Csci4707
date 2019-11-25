create table Form
(
	Form_id int not null
		primary key,
	Approved tinyint(1) null,
	VId int not null,
	Parent_id int not null,
	PId int not null,
	`ICD-10-PCS-Code` varchar(30) not null,
	constraint Form_Parent_Parent_id_fk
		foreign key (Parent_id) references Parent (Parent_id),
	constraint Form_Patient_PId_fk
		foreign key (PId) references Patient (PId),
	constraint `Form_Treatment_ICD-10-PCS-Code_fk`
		foreign key (`ICD-10-PCS-Code`) references Treatment (`ICD-10-PCS-Code`),
	constraint Form_Visit_VId_fk
		foreign key (VId) references Visit (VId)
);

