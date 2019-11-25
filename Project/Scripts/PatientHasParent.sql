create table PatientHasParent
(
	Parent_id int not null,
	PId int not null,
	Relationship varchar(30) null,
	primary key (PId, Parent_id),
	constraint `PatientHasParent/Guardian_Parent_Parent_id_fk`
		foreign key (Parent_id) references Parent (Parent_id),
	constraint `PatientHasParent/Guardian_Patient_PId_fk`
		foreign key (PId) references Patient (PId)
);

