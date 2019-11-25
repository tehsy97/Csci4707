create table InitialAssessment
(
	VId int not null
		primary key,
	Height float null,
	Weight float null,
	Blood_pressure float null,
	Temperature float null,
	NId int not null,
	constraint InitialAssessment_Visit_VId_fk
		foreign key (VId) references Visit (VId)
);

