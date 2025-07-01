-- Specifies the schema dynamically instead of the usual location in dbt_profile.yaml





  
  
with ftd_participant as (
    select
        p.study_code::text as "studyCode",
        p.participant_global_id::text as "participantGlobalId",
        p.participant_external_id::text as "participantExternalId",
        p.family_id::text as "familyId",
        p.family_type::text as "familyType",
        p.father_id::text as "fatherId",
        p.mother_id::text as "motherId",
        p.sibling_id::text as "siblingId",
        p.other_family_member_id::text as "otherFamilyMemberId",
        p.family_relationship::text as "familyRelationship",
        p.sex::text as "sex",
        p.race::text as "race",
        p.ethnicity::text as "ethnicity",
        p.down_syndrome_status::text as "downSyndromeStatus",
        p.age_at_first_patient_engagement::integer as "ageAtFirstParticipantEngagement",
        p.first_patient_engagement_event::text as "firstParticipantEngagementEvent",
        p.outcomes_vital_status::text as "outcomesVitalStatus",
        p.age_at_last_vital_status::integer as "ageAtLastVitalStatus",
    from "dbt"."main_aadsc_data"."aadsc_ftd_participant" as p
)

select
    *
from ftd_participant


