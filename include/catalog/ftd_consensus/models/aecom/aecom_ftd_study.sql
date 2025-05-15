{{ config(materialized='table', schema='aecom_data') }}

SELECT 
    study_code::TEXT AS "study_code",
    study_title::TEXT AS "study_title",
    program::TEXT AS "program",
    study_description::TEXT AS "study_description",
    principal_investigator_name::TEXT AS "principal_investigator_name",
    study_contact_name::TEXT AS "study_contact_name",
    study_contact_institution::TEXT AS "study_contact_institution",
    study_contact_email::TEXT AS "study_contact_email",
    vbr_email::TEXT AS "vbr_email",
    vbr_url::TEXT AS "vbr_url",
    vbr_readme::TEXT AS "vbr_readme",
    research_domain::TEXT AS "research_domain",
    participant_lifespan_stage::TEXT AS "participant_lifespan_stage",
    selection_criteria::TEXT AS "selection_criteria",
    study_design::TEXT AS "study_design",
    clinical_data_source_type::TEXT AS "clinical_data_source_type",
    data_category::TEXT AS "data_category",
    study_website::TEXT AS "study_website",
    dbgap::TEXT AS "dbgap",
    publication::TEXT AS "publication",
    expected_number_of_participants::TEXT AS "expected_number_of_participants",
    guid_type::TEXT AS "guid_type",
    guid_mapped::TEXT AS "guid_mapped",
    acknowledgments::TEXT AS "acknowledgments",
    citation_statement::TEXT AS "citation_statement"
FROM {{ ref('aecom_stg_study') }}

