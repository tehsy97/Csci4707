create table IntakeClerk
(
	EId int not null
		primary key,
	constraint IntakeClerk_Employee_EId_fk
		foreign key (EId) references Employee (EId)
);

