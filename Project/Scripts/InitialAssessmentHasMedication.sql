create table InitialAssessmentHasMedication
(
	MId int not null,
	VId int not null,
	Dose varchar(30) null,
	Frequency varchar(30) null,
	Strength varchar(10) null,
	primary key (VId, MId),
	constraint InitialAssessmentHasMedication_InitialAssessment_VId_fk
		foreign key (VId) references InitialAssessment (VId),
	constraint InitialAssessmentHasMedication_Medication_MId_fk
		foreign key (MId) references Medication (MId)
);

