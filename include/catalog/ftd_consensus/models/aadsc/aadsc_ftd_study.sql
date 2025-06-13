{{ config(materialized='table', schema='aadsc_data') }}

    with source as (
        select 
        GEN_UNKNOWN.study_code::text as "study_code",
       GEN_UNKNOWN.study_title::text as "study_title",
       GEN_UNKNOWN.program::text as "program",
       GEN_UNKNOWN.study_description::text as "study_description",
       GEN_UNKNOWN.principal_investigator_name::text as "principal_investigator_name",
       GEN_UNKNOWN.study_contact_name::text as "study_contact_name",
       GEN_UNKNOWN.study_contact_institution::text as "study_contact_institution",
       GEN_UNKNOWN.study_contact_email::text as "study_contact_email",
       GEN_UNKNOWN.vbr_email::text as "vbr_email",
       GEN_UNKNOWN.vbr_url::text as "vbr_url",
       GEN_UNKNOWN.vbr_readme::text as "vbr_readme",
       GEN_UNKNOWN.research_domain::text as "research_domain",
       GEN_UNKNOWN.participant_lifespan_stage::text as "participant_lifespan_stage",
       GEN_UNKNOWN.selection_criteria::text as "selection_criteria",
       GEN_UNKNOWN.study_design::text as "study_design",
       GEN_UNKNOWN.clinical_data_source_type::text as "clinical_data_source_type",
       GEN_UNKNOWN.data_category::text as "data_category",
       GEN_UNKNOWN.study_website::text as "study_website",
       GEN_UNKNOWN.dbgap::text as "dbgap",
       GEN_UNKNOWN.publication::text as "publication",
       GEN_UNKNOWN.expected_number_of_participants::text as "expected_number_of_participants",
       GEN_UNKNOWN.guid_type::text as "guid_type",
       GEN_UNKNOWN.guid_mapped::text as "guid_mapped",
       GEN_UNKNOWN.acknowledgments::text as "acknowledgments",
       GEN_UNKNOWN.citation_statement::text as "citation_statement"
        from {{ ref('aadsc_stg_clinical') }} as clinical
        
    )

    select 
        * 
    from source
    