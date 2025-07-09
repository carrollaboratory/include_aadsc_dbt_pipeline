-- Specifies the schema dynamically instead of the usual location in dbt_profile.yaml





  
  
with ftd_participant as (
    select
        p.study_code::text as "Study Code",
        p.participant_global_id::text as "Participant Global Id",
        p.participant_external_id::text as "Participant External Id",
        p.family_id::text as "Family Id",
        p.family_type::text as "Family Type",
        p.father_id::text as "Father Id",
        p.mother_id::text as "Mother Id",
        p.sibling_id::text as "Sibling Id",
        p.other_family_member_id::text as "Other Family Member Id",
        p.family_relationship::text as "Family Relationship",
        p.sex::text as "Sex",
        p.race::text as "Race",
        p.ethnicity::text as "Ethnicity",
        p.down_syndrome_status::text as "Down Syndrome Status",
        p.age_at_first_patient_engagement::integer as "Age At First Participant Engagement",
        p.first_patient_engagement_event::text as "First Participant Engagement Event",
        p.outcomes_vital_status::text as "Outcomes Vital Status",
        p.age_at_last_vital_status::integer as "Age At Last Vital Status",
    from "dbt"."main_aadsc_data"."aadsc_ftd_participant" as p
)

select
    *
from ftd_participant


