# Changes made to ER Diagram 
* Earlier we had an entity for PATIENT and PARENT/GUARDIAN. Now, we’ve updated it to a PERSON entity that can have overlapping subclasses - PATIENT, PARENT/GUARDIAN and EMERGENCY_CONTACT. We made this change because these three entities had some shared attributes and having this specialization captured it better. 
* Earlier, we had MEDICATION as a multivalued attribute. We changed it to an entity because medications are shared by many patients and there should be a table of standard medications.
* Earlier, we had our EMPLOYEE entity in a hierarchical manner where employees were either hourly or salaried and then hourly and salaried employees further had their own specializations. This led to some redundancy and so we decided that it was better to have two separate specializations for employees - one based on their pay and other based on their job type. 
* Earlier, we had notes as an attribute of the VISIT entity. After looking through other diagrams, we realized that notes were much more complex than that and so we decided to make NOTES an entity. Both service providers and nurses can take notes for a patient and each visit can have many notes associated with it, so making it its own entity captured all these complexities better. 

# Changelog 
1. 10/14/2019: Added ER Diagram 
2. 11/04/2019: Updated ER Diagram based on feedback 
3. 11/04/2019: Added ER Mapping
