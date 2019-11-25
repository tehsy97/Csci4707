create table Hourly
(
	EId int not null
		primary key,
	Hourly_rate decimal(15,2) null,
	constraint Hourly_Employee_EId_fk
		foreign key (EId) references Employee (EId)
);

