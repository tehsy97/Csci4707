create table ServiceProvider
(
	EId int not null
		primary key,
	SId int not null,
	constraint ServiceProvider_SId_uindex
		unique (SId),
	constraint ServiceProvider_Employee_EId_fk
		foreign key (EId) references Employee (EId)
			on update cascade on delete cascade
);

