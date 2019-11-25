create table Salaried
(
	EId int not null
		primary key,
	Salary decimal(15,2) null,
	constraint Salaried_Employee_EId_fk
		foreign key (EId) references Employee (EId)
);

