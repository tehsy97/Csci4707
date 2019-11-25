create table PhysiciansAssistant
(
	EId int not null
		primary key,
	constraint Physcians_Assistant_ServiceProvider_EId_fk
		foreign key (EId) references ServiceProvider (EId)
);

