create table Department
(
    Id   int         not null
        primary key,
    Name varchar(30) not null,
    constraint Department_Name_uindex
        unique (Name)
);

create table Diagnosis
(
    Name             varchar(30)    not null,
    `ICD-10-CM-Code` varchar(30)    not null
        primary key,
    Cost             decimal(15, 2) null,
    constraint Diagnosis_Name_uindex
        unique (Name)
);

create table EmergencyContact
(
    EId   int         not null
        primary key,
    FName varchar(30) null,
    MName varchar(30) null,
    LName varchar(30) null
);

create table EmergencyContactHasPhoneNumbers
(
    EId          int         not null,
    Phone_Number varchar(15) not null,
    primary key (EId, Phone_Number),
    constraint EmergencyContactHasPhoneNumbers_EmergencyContact_fk
        foreign key (EId) references EmergencyContact (EId)
            on update cascade on delete cascade
);

create table Employee
(
    EId   int         not null
        primary key,
    Ssn   int         not null,
    FName varchar(30) null,
    MName varchar(30) null,
    LName varchar(30) null,
    DId   int         not null,
    constraint Employee_Ssn_uindex
        unique (Ssn),
    constraint Employee_Department_Id_fk
        foreign key (DId) references Department (Id)
);

create table Hourly
(
    EId         int            not null
        primary key,
    Hourly_rate decimal(15, 2) null,
    constraint Hourly_Employee_EId_fk
        foreign key (EId) references Employee (EId)
);

create table IntakeClerk
(
    EId int not null
        primary key,
    constraint IntakeClerk_Employee_EId_fk
        foreign key (EId) references Employee (EId)
);

create table Medication
(
    MId  int         not null
        primary key,
    Name varchar(30) not null,
    constraint Medication_Name_uindex
        unique (Name)
);

create table Nurse
(
    EId int not null
        primary key,
    NId int not null,
    constraint Nurse_NId_uindex
        unique (NId),
    constraint Nurse_Employee_EId_fk
        foreign key (EId) references Employee (EId)
);

create table OtherSupport
(
    EId int not null
        primary key,
    constraint `Other/Support_Employee_EId_fk`
        foreign key (EId) references Employee (EId)
);

create table Parent
(
    Parent_id int         not null
        primary key,
    FName     varchar(30) null,
    MName     varchar(30) null,
    LName     varchar(30) null
);

create table ParentHasPhoneNumbers
(
    Parent_id    int         not null,
    Phone_Number varchar(15) not null,
    primary key (Parent_id, Phone_Number),
    constraint `Parent/GuardianHasPhoneNumbers_Parent_Parent_id_fk`
        foreign key (Parent_id) references Parent (Parent_id)
);

create table Patient
(
    PId           int         not null
        primary key,
    FName         varchar(30) null,
    MName         varchar(30) null,
    LName         varchar(30) null,
    House_number  int         null,
    Street        varchar(30) null,
    City          varchar(30) null,
    State         varchar(30) null,
    Zip           int         null,
    Day           int         null,
    Month         int         null,
    Year          int         null,
    Has_insurance varchar(15) null
);

create table Insurance
(
    Provider_name varchar(30)    not null,
    Member_id     int            not null,
    Group_id      int            not null,
    Start_date    date           null,
    End_date      date           null,
    Copay         decimal(15, 2) null,
    PId           int            not null,
    primary key (Provider_name, Member_id, Group_id),
    constraint Insurance_Patient_PId_fk
        foreign key (PId) references Patient (PId)
);

create table PatientHasEmergencyContact
(
    EId          int         not null,
    PId          int         not null,
    Relationship varchar(30) null,
    primary key (EId, PId),
    constraint Patient_EmergencyContact_EId_fk
        foreign key (EId) references EmergencyContact (EId),
    constraint Patient_EmergencyContact_PId_fk
        foreign key (PId) references Patient (PId)
);

create table PatientHasParent
(
    Parent_id    int         not null,
    PId          int         not null,
    Relationship varchar(30) null,
    primary key (PId, Parent_id),
    constraint `PatientHasParent/Guardian_Parent_Parent_id_fk`
        foreign key (Parent_id) references Parent (Parent_id),
    constraint `PatientHasParent/Guardian_Patient_PId_fk`
        foreign key (PId) references Patient (PId)
);

create table PatientHasPhoneNumbers
(
    PId         int         not null,
    PhoneNumber varchar(15) not null,
    primary key (PId, PhoneNumber),
    constraint PatientHasPhoneNumbers_Patient_PId_fk
        foreign key (PId) references Patient (PId)
            on update cascade on delete cascade
);

create table Salaried
(
    EId    int            not null
        primary key,
    Salary decimal(15, 2) null,
    constraint Salaried_Employee_EId_fk
        foreign key (EId) references Employee (EId)
);

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

create table Doctor
(
    EId int not null
        primary key,
    constraint Doctor_ServiceProvider_EId_fk
        foreign key (EId) references ServiceProvider (EId)
            on update cascade on delete cascade
);

create table PhysiciansAssistant
(
    EId int not null
        primary key,
    constraint Physcians_Assistant_ServiceProvider_EId_fk
        foreign key (EId) references ServiceProvider (EId)
);

create table Treatment
(
    Name              varchar(30)    not null,
    `ICD-10-PCS-Code` varchar(30)    not null
        primary key,
    Cost              decimal(15, 2) null,
    constraint Treatment_Name_uindex
        unique (Name)
);

create table Visit
(
    VId           int            not null
        primary key,
    In_time       time           null,
    Out_time      time           null,
    Day           int            null,
    Month         int            null,
    Year          int            null,
    Bill          decimal(15, 2) null,
    PId           int            not null,
    Intake_EId    int            not null,
    Service_EId   int            not null,
    Provider_name varchar(30)    null,
    Member_Id     int            null,
    Group_Id      int            null,
    Online_form   blob           null,
    constraint Visit_Insurance_Provider_name_Member_id_Group_id_fk
        foreign key (Provider_name, Member_Id, Group_Id) references Insurance (Provider_name, Member_id, Group_id),
    constraint Visit_IntakeClerk_EId_fk
        foreign key (Intake_EId) references IntakeClerk (EId),
    constraint Visit_Patient_PId_fk
        foreign key (PId) references Patient (PId),
    constraint Visit_ServiceProvider_EId_fk
        foreign key (Service_EId) references ServiceProvider (EId)
);

create table Form
(
    Form_id           int         not null
        primary key,
    Approved          tinyint(1)  null,
    VId               int         not null,
    Parent_id         int         not null,
    PId               int         not null,
    `ICD-10-PCS-Code` varchar(30) not null,
    constraint Form_Parent_Parent_id_fk
        foreign key (Parent_id) references Parent (Parent_id),
    constraint Form_Patient_PId_fk
        foreign key (PId) references Patient (PId),
    constraint `Form_Treatment_ICD-10-PCS-Code_fk`
        foreign key (`ICD-10-PCS-Code`) references Treatment (`ICD-10-PCS-Code`),
    constraint Form_Visit_VId_fk
        foreign key (VId) references Visit (VId)
);

create table InitialAssessment
(
    VId            int   not null
        primary key,
    Height         float null,
    Weight         float null,
    Blood_pressure float null,
    Temperature    float null,
    NId            int   not null,
    constraint InitialAssessment_Visit_VId_fk
        foreign key (VId) references Visit (VId)
);

create table InitialAssessmentHasMedicalConditions
(
    Medical_condition varchar(30) not null,
    VId               int         not null,
    primary key (VId, Medical_condition),
    constraint InitialAssessmentHasMedicalConditions_InitialAssessment_VId_fk
        foreign key (VId) references InitialAssessment (VId)
);

create table InitialAssessmentHasMedication
(
    MId       int         not null,
    VId       int         not null,
    Dose      varchar(30) null,
    Frequency varchar(30) null,
    Strength  varchar(10) null,
    primary key (VId, MId),
    constraint InitialAssessmentHasMedication_InitialAssessment_VId_fk
        foreign key (VId) references InitialAssessment (VId),
    constraint InitialAssessmentHasMedication_Medication_MId_fk
        foreign key (MId) references Medication (MId)
);

create table Notes
(
    Note_id     int  not null,
    Notes       text null,
    VId         int  not null,
    Service_EId int  not null,
    Nurse_EId   int  not null,
    primary key (Note_id, VId),
    constraint Notes_Nurse_EId_fk
        foreign key (Nurse_EId) references Nurse (EId),
    constraint Notes_ServiceProvider_EId_fk
        foreign key (Service_EId) references ServiceProvider (EId),
    constraint Notes_Visit_VId_fk
        foreign key (VId) references Visit (VId)
);

create table NurseAssistsVisit
(
    EId int not null,
    VId int not null,
    primary key (EId, VId),
    constraint NurseAssistsVisit_Nurse_EId_fk
        foreign key (EId) references Nurse (EId)
            on update cascade on delete cascade,
    constraint NurseAssistsVisit_Visit_VId_fk
        foreign key (VId) references Visit (VId)
            on update cascade on delete cascade
);

create table VisitHasDiagnosis
(
    `ICD-10-CM-Code` varchar(30) not null,
    VId              int         not null,
    SId              int         not null,
    primary key (`ICD-10-CM-Code`, VId),
    constraint VisitHasDiagnosis_Diagnosis_Code_fk
        foreign key (`ICD-10-CM-Code`) references Diagnosis (`ICD-10-CM-Code`),
    constraint VisitHasDiagnosis_Visit_VId_fk
        foreign key (VId) references Visit (VId)
            on update cascade on delete cascade
);

create table VisitHasTreatment
(
    `ICD-10-PCS-Code` varchar(30) not null,
    VId               int         not null,
    primary key (`ICD-10-PCS-Code`, VId),
    constraint VisitHasTreatment_Treatment_Code_fk
        foreign key (`ICD-10-PCS-Code`) references Treatment (`ICD-10-PCS-Code`),
    constraint VisitHasTreatment_Visit_VId_fk
        foreign key (VId) references Visit (VId)
            on update cascade on delete cascade
);

