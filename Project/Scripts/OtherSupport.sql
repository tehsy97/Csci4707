create table OtherSupport
(
	EId int not null
		primary key,
	constraint `Other/Support_Employee_EId_fk`
		foreign key (EId) references Employee (EId)
);

