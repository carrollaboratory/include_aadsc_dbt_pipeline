






    with 
    source as (
        select
        
            "Study Code"::text AS "study_code"
            ,
        
            "Study Title"::text AS "study_title"
            ,
        
            "Program"::text AS "program"
            ,
        
            "Study Description"::text AS "study_description"
            ,
        
            "Principal Investigator Name"::text AS "principal_investigator_name"
            ,
        
            "Study Contact Name"::text AS "study_contact_name"
            ,
        
            "Study Contact Institution"::text AS "study_contact_institution"
            ,
        
            "Study Contact Email"::text AS "study_contact_email"
            ,
        
            "VBR Email"::text AS "vbr_email"
            ,
        
            "VBR URL"::text AS "vbr_url"
            ,
        
            "VBR Readme"::text AS "vbr_readme"
            ,
        
            "Research Domain"::text AS "research_domain"
            ,
        
            "Participant Lifespan Stage"::text AS "participant_lifespan_stage"
            ,
        
            "Selection Criteria"::text AS "selection_criteria"
            ,
        
            "Study Design"::text AS "study_design"
            ,
        
            "Clinical Data Source Type"::text AS "clinical_data_source_type"
            ,
        
            "Data Category"::text AS "data_category"
            ,
        
            "Study Website"::text AS "study_website"
            ,
        
            "dbGaP"::text AS "dbgap"
            ,
        
            "Publication"::text AS "publication"
            ,
        
            "Expected Number of Participants"::text AS "expected_number_of_participants"
            ,
        
            "GUID Type"::text AS "guid_type"
            ,
        
            "GUID Mapped"::text AS "guid_mapped"
            ,
        
            "Acknowledgments"::text AS "acknowledgments"
            ,
        
            "Citation Statement"::text AS "citation_statement"
            ,
        
            "DOI"::text AS "doi"
            ,
        
            "DOI Citation"::text AS "doi_citation"
            ,
        
            "one"::text AS "one"
            ,
        
            "two"::text AS "two"
            ,
        
            "three"::text AS "three"
            ,
        
            "four"::text AS "four"
            
        
    from "dbt"."main"."studies" as s
    WHERE "Study Code" = 'AADSC'
    )

select 
*
from source