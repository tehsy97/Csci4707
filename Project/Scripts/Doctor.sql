create table Doctor
(
	EId int not null
		primary key,
	constraint Doctor_ServiceProvider_EId_fk
		foreign key (EId) references ServiceProvider (EId)
			on update cascade on delete cascade
);

