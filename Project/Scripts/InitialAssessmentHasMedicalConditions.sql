create table InitialAssessmentHasMedicalConditions
(
	Medical_condition varchar(30) not null,
	VId int not null,
	primary key (VId, Medical_condition),
	constraint InitialAssessmentHasMedicalConditions_InitialAssessment_VId_fk
		foreign key (VId) references InitialAssessment (VId)
);

