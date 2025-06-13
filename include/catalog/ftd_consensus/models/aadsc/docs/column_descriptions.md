{% docs aadsc_ftd_condition_description %}
Model for aadsc_ftd_condition.
{% enddocs %}


{% docs aadsc_ftd_condition_study_code %}
Unique identifier for the study, assigned by DCC
{% enddocs %}


{% docs aadsc_ftd_condition_participant_global_id %}
Unique INCLUDE global identifier for the participant, assigned by DCC
{% enddocs %}


{% docs aadsc_ftd_condition_participant_external_id %}
Unique, de-identified identifier for the participant, assigned by data contributor. External IDs must be two steps removed from personal information in the study records.
{% enddocs %}


{% docs aadsc_ftd_condition_event_id %}
Identifier for event (Visit, Survey completion, Sample collection, etc.) to which the Condition data are linked, if applicable. There may be multiple events linked to a Participant.
{% enddocs %}


{% docs aadsc_ftd_condition_event_type %}
Type of event for which Event ID is given (Visit, Survey completion, Sample collection, etc.)
{% enddocs %}


{% docs aadsc_ftd_condition_condition_or_measure_source_text %}
Co-occurring Condition (phenotype or diagnosis) or Measure (observation with numeric value), as described by data contributor. The Down Syndrome Genetic Diagnosis will be rolled into this field.
{% enddocs %}


{% docs aadsc_ftd_condition_age_at_condition_or_measure_observation %}
Age in days at which Condition or Measure was observed, recorded, or diagnosed
{% enddocs %}


{% docs aadsc_ftd_condition_condition_interpretation %}
Whether Condition was observed or not
{% enddocs %}


{% docs aadsc_ftd_condition_condition_status %}
Whether the Condition is ongoing, has been resolved, or this is a general history of the condition without known dates
{% enddocs %}


{% docs aadsc_ftd_condition_condition_data_source %}
Whether Condition information was obtained by the investigator or reported by participant/family member
{% enddocs %}


{% docs aadsc_ftd_condition_hpo_label %}
Label for Condition in the Human Phenotype Ontology (HPO)
{% enddocs %}


{% docs aadsc_ftd_condition_hpo_code %}
Code for Condition in the Human Phenotype Ontology (HPO)
{% enddocs %}


{% docs aadsc_ftd_condition_mondo_label %}
Label for Condition in the Mondo Disease Ontology (MONDO)
{% enddocs %}


{% docs aadsc_ftd_condition_mondo_code %}
Code for Condition in the Mondo Disease Ontology (Mondo)
{% enddocs %}


{% docs aadsc_ftd_condition_maxo_label %}
Label for Condition in the Medical Action Ontology (MAXO)
{% enddocs %}


{% docs aadsc_ftd_condition_maxo_code %}
Code for condition in the Medical Action Ontology (MAXO)
{% enddocs %}


{% docs aadsc_ftd_condition_other_label %}
Label for Condition in another ontology (if no match in HPO, MONDO, or MAXO)
{% enddocs %}


{% docs aadsc_ftd_condition_other_code %}
Code for Condition in another ontology (if no match in HPO, MONDO, or MAXO)
{% enddocs %}


{% docs aadsc_ftd_condition_measure_value %}
Numeric value of Measure
{% enddocs %}


{% docs aadsc_ftd_condition_measure_unit %}
Unit that is associated with Measure Value (e.g. kg, cm, %, x10^9/L, etc.)
{% enddocs %}


{% docs aadsc_ftd_participant_description %}
Model for aadsc_ftd_participant.
{% enddocs %}


{% docs aadsc_ftd_participant_study_code %}
Unique identifier for the study, assigned by DCC
{% enddocs %}


{% docs aadsc_ftd_participant_participant_global_id %}
Unique INCLUDE global identifier for the participant, assigned by DCC
{% enddocs %}


{% docs aadsc_ftd_participant_participant_external_id %}
Unique, de-identified identifier for the participant, assigned by data contributor. External IDs must be two steps removed from personal information in the study records.
{% enddocs %}


{% docs aadsc_ftd_participant_family_id %}
Unique identifier for family to which Participant belongs, assigned by data contributor
{% enddocs %}


{% docs aadsc_ftd_participant_family_type %}
Structure of family members participating in the study
{% enddocs %}


{% docs aadsc_ftd_participant_father_id %}
Participant External ID for Participant's father (NA if Participant is not the proband)
{% enddocs %}


{% docs aadsc_ftd_participant_mother_id %}
Participant External ID for Participant's mother (NA if Participant is not the proband)
{% enddocs %}


{% docs aadsc_ftd_participant_sibling_id %}
Participant External ID for Participant's sibling(s) (NA if Participant is not the proband)
{% enddocs %}


{% docs aadsc_ftd_participant_other_family_member_id %}
Participant External ID for Participant's other family members (NA if Participant is not the proband)
{% enddocs %}


{% docs aadsc_ftd_participant_family_relationship %}
Relationship of Participant to proband
{% enddocs %}


{% docs aadsc_ftd_participant_sex %}
Sex of Participant
{% enddocs %}


{% docs aadsc_ftd_participant_race %}
Race of Participant
{% enddocs %}


{% docs aadsc_ftd_participant_ethnicity %}
Ethnicity of Participant
{% enddocs %}


{% docs aadsc_ftd_participant_down_syndrome_status %}
Down Syndrome status of participant
{% enddocs %}


{% docs aadsc_ftd_participant_age_at_first_patient_engagement %}
Age in days of Participant at first recorded study event (enrollment, visit, observation, sample collection, survey completion, etc.). Age at enrollment is preferred, if available.
{% enddocs %}


{% docs aadsc_ftd_participant_first_patient_engagement_event %}
Event for which Age at First Patient Engagement is given (e.g. enrollment, visit, observation, sample collection, survey completion, etc.). Age at enrollment is preferred, if available.
{% enddocs %}


{% docs aadsc_ftd_participant_outcomes_vital_status %}
Whether participant is alive or dead
{% enddocs %}


{% docs aadsc_ftd_participant_age_at_last_vital_status %}
Age in days when participant's vital status was last recorded
{% enddocs %}


{% docs aadsc_ftd_study_description %}
Model for aadsc_ftd_study.
{% enddocs %}


{% docs aadsc_ftd_study_study_code %}
Study Code
{% enddocs %}


{% docs aadsc_ftd_study_study_title %}
Study Title
{% enddocs %}


{% docs aadsc_ftd_study_program %}
Program
{% enddocs %}


{% docs aadsc_ftd_study_study_description %}
Study Description
{% enddocs %}


{% docs aadsc_ftd_study_principal_investigator_name %}
Principal Investigator Name
{% enddocs %}


{% docs aadsc_ftd_study_study_contact_name %}
Study Contact Name
{% enddocs %}


{% docs aadsc_ftd_study_study_contact_institution %}
Study Contact Institution
{% enddocs %}


{% docs aadsc_ftd_study_study_contact_email %}
Study Contact Email
{% enddocs %}


{% docs aadsc_ftd_study_vbr_email %}
VBR Email
{% enddocs %}


{% docs aadsc_ftd_study_vbr_url %}
VBR URL
{% enddocs %}


{% docs aadsc_ftd_study_vbr_readme %}
VBR Readme
{% enddocs %}


{% docs aadsc_ftd_study_research_domain %}
Research Domain
{% enddocs %}


{% docs aadsc_ftd_study_participant_lifespan_stage %}
Participant Lifespan Stage
{% enddocs %}


{% docs aadsc_ftd_study_selection_criteria %}
Selection Criteria
{% enddocs %}


{% docs aadsc_ftd_study_study_design %}
Study Design
{% enddocs %}


{% docs aadsc_ftd_study_clinical_data_source_type %}
Clinical Data Source Type
{% enddocs %}


{% docs aadsc_ftd_study_data_category %}
Data Category
{% enddocs %}


{% docs aadsc_ftd_study_study_website %}
Study Website
{% enddocs %}


{% docs aadsc_ftd_study_dbgap %}
dbGaP "phs" accession code(s) associated with this Study
{% enddocs %}


{% docs aadsc_ftd_study_publication %}
Publication
{% enddocs %}


{% docs aadsc_ftd_study_expected_number_of_participants %}
Expected Number of Participants
{% enddocs %}


{% docs aadsc_ftd_study_guid_type %}
GUID Type
{% enddocs %}


{% docs aadsc_ftd_study_guid_mapped %}
 For studies using NDAR GUIDs -have the GUIDs been added to the INCLUDE GUID M...
{% enddocs %}


{% docs aadsc_ftd_study_acknowledgments %}
Acknowledgments
{% enddocs %}


{% docs aadsc_ftd_study_citation_statement %}
Citation Statement
{% enddocs %}