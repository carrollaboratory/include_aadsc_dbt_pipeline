




  
  
WITH src_study AS (
    SELECT
        study_code as "Study Code",
        study_title as "Study Title",
        program as "Program",
        study_description as "Study Description",
        principal_investigator_name as "Principal Investigator Name",
        study_contact_name as "Study Contact Name",
        study_contact_institution as "Study Contact Institution",
        study_contact_email as "Study Contact Email",
        vbr_email as "VBR Email",
        vbr_url as "VBR URL",
        vbr_readme as "VBR Readme",
        research_domain as "Research Domain",
        participant_lifespan_stage as "Participant Lifespan Stage",
        selection_criteria as "Selection Criteria",
        study_design as "Study Design"
    FROM "dbt"."main_aadsc_data"."aadsc_ftd_study"
)
SELECT * FROM src_study

