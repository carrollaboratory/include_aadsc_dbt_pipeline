{{ config(materialized='table', schema='aadsc_data') }}

    with source as (
        select 
        GEN_UNKNOWN.study_code::text as "study_code",
       GEN_UNKNOWN.participant_global_id::text as "participant_global_id",
       GEN_UNKNOWN.participant_external_id::text as "participant_external_id",
       GEN_UNKNOWN.family_id::text as "family_id",
       GEN_UNKNOWN.family_type::text as "family_type",
       GEN_UNKNOWN.father_id::text as "father_id",
       GEN_UNKNOWN.mother_id::text as "mother_id",
       GEN_UNKNOWN.sibling_id::text as "sibling_id",
       GEN_UNKNOWN.other_family_member_id::text as "other_family_member_id",
       GEN_UNKNOWN.family_relationship::text as "family_relationship",
       clinical.sex::text as "sex",
       clinical.race::text as "race",
       clinical.ethnicity::text as "ethnicity",
       GEN_UNKNOWN.down_syndrome_status::text as "down_syndrome_status",
       GEN_UNKNOWN.age_at_first_patient_engagement::integer as "age_at_first_patient_engagement",
       GEN_UNKNOWN.first_patient_engagement_event::text as "first_patient_engagement_event",
       GEN_UNKNOWN.outcomes_vital_status::text as "outcomes_vital_status",
       GEN_UNKNOWN.age_at_last_vital_status::integer as "age_at_last_vital_status"
        from {{ ref('aadsc_stg_clinical') }} as clinical
        
    )

    select 
        * 
    from source
    