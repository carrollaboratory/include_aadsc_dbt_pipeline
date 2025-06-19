{{ config(materialized='table', schema='aadsc_data') }}

    with
    source as (
        select 
            'PH_STUDY_CODE' as "study_code",
            'PH_G_ID'::text as "participant_global_id",
            'PH_EX_ID'::text as "participant_external_id",
            clinical.sex::text as "sex",
            clinical.race::text as "race",
            clinical.ethnicity::text as "ethnicity",
                CASE
                WHEN clinical.ds_diagnosis = 1
                    THEN 'T21'
                ELSE 
                    'D21'
            ::text END as "down_syndrome_status",
                CASE 
                WHEN clinical.age == 'Age 90 or older'
                    THEN NULL
                ELSE
                    floor(cast(clinical.age as float))
            ::integer END as "age_at_first_patient_engagement"
        from {{ ref('aadsc_stg_clinical') }} as clinical
    )

    select 
       source.study_code,
       source.participant_global_id,
       source.participant_external_id,
       NULL as "family_id",
       NULL as "family_type",
       NULL as "father_id",
       NULL as "mother_id",
       NULL as "sibling_id",
       NULL as "other_family_member_id",
       NULL as "family_relationship",
       source.sex,
       source.race,
       source.ethnicity,
       source.down_syndrome_status,
       source.age_at_first_patient_engagement,
       NULL as "first_patient_engagement_event",
       NULL as "outcomes_vital_status",
       NULL as "age_at_last_vital_status"
    from source
    