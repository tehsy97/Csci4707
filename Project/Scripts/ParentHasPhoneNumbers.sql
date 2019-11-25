create table ParentHasPhoneNumbers
(
	Parent_id int not null,
	Phone_Number varchar(15) not null,
	primary key (Parent_id, Phone_Number),
	constraint `Parent/GuardianHasPhoneNumbers_Parent_Parent_id_fk`
		foreign key (Parent_id) references Parent (Parent_id)
);

