
  
    
    

    create  table
      "dbt"."main_aadsc_data"."aadsc_ftd_participant__dbt_tmp"
  
    as (
      

    with
    source as (
        select 
            clinical.ftd_index::text as "ftd_index",
            'AADSC' as "study_code",
                
    /* 
        This macro generates the sql required to create a primary or foreign key
        by the md5 on a composite string method.

        Example usage - lacking double brackets:
           generate_md5_composite_key("p", ['id','dob'])
        generates the following sql
            'p' || '_' || md5(studyid || CAST(coalesce(id, '') AS TEXT) || '|' || CAST(coalesce(dob, '') AS TEXT))
        results in an id with the following format
            p_a32b29ffb1a85590c4a6d4cbeec18636
    */
    
    
        

        
    
    'c' || '_' || md5('aadsc' || '|' || CAST(coalesce(clinical.MASKED_ID, '') AS TEXT))
    

      
            ::text as "participant_external_id",
            'Other' as "family_type",
            'Proband' as "family_relationship",
                case
                when  clinical.sex = 'Female'
                    then 'Female'
                when  clinical.sex = 'Male'
                    then 'Male'
                when  clinical.sex is null
                    then 'Unknown'
                else null
            end as "sex",
            case
                when  clinical.race = 'Black/African American'
                    then 'Black or African American'
                when  clinical.race = 'Native Hawaiian'
                    then 'Native Hawaiian or Other Pacific Islander'
                when  clinical.race = 'Two or more races'
                    then 'More than one race'
                when  clinical.race = 'Other Pacific Islander'
                    then 'Native Hawaiian or Other Pacific Islander'
                when  clinical.race = 'XXNative Hawaiian/Other Pacific Islander'
                    then 'Native Hawaiian or Other Pacific Islander'
                when  clinical.race = 'American Indian or Alaskan Native'
                    then 'American Indian or Alaska Native'
                when  clinical.race = 'Unknown'
                    then 'Unknown'
                when  clinical.race = 'Asian'
                    then 'Asian'
                when  clinical.race = 'White'
                    then 'White'
                when  clinical.race is null
                    then 'Unknown'
                else 'Unknown'
            end as "race",
                case
                when  clinical.ethnicity = 'Hispanic/Latino Origin'
                    then 'Hispanic or Latino'
                when  clinical.ethnicity = 'Not of Hispanic or Latino Origin'
                    then 'Not Hispanic or Latino'
                when  clinical.ethnicity = 'Patient Refused'
                    then 'Prefer not to answer'
                when  clinical.ethnicity = 'Unknown'
                    then 'Unknown'
                when  clinical.ethnicity is null
                    then 'Unknown'
                else null
            end as "ethnicity",            
                case
                when  clinical.ds_diagnosis = '1'
                    then 'T21'
                when  clinical.ds_diagnosis is null
                    then 'D21'
                else 'D21'
            end as "down_syndrome_status",
                case
                when  clinical.age = 'Age 90 or older'
                    then 0
                when  clinical.age is null
                    then 0
                else FLOOR(CAST(clinical.age AS FLOAT) * 365.25)
            end as "age_at_first_patient_engagement",
            'Unknown' as "first_patient_engagement_event",
        from "dbt"."main_main"."aadsc_stg_clinical" as clinical
    )

    select 
       source.ftd_index,
       source.study_code, --req
       null::text as "participant_global_id", --req, created after the pipeline
       source.participant_external_id, --req
       null::text as "family_id",
       source.family_type, --req
       null::text as "father_id",
       null::text as "mother_id",
       null::text as "sibling_id",
       null::text as "other_family_member_id",
       source.family_relationship, --req
       source.sex, --req
       source.race, --req
       source.ethnicity, --req
       source.down_syndrome_status, --req
       source.age_at_first_patient_engagement, --req
       source.first_patient_engagement_event, --req
       null::text as "outcomes_vital_status",
       null::integer as "age_at_last_vital_status"
    from source
    );
  
  