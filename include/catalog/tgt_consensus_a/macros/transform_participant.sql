{% macro transform_participant(source_table) %}
with ftd_participant as (
    select
        p.study_code::text as "Study Code",
        p.participant_global_id::text as "Participant Global ID",
        p.participant_external_id::text as "Participant External ID",
        p.family_id::text as "Family ID",
        p.family_type::text as "Family Type",
        p.father_id::text as "Father ID",
        p.mother_id::text as "Mother ID",
        p.sibling_id::text as "Sibling ID",
        p.other_family_member_id::text as "Other Family Member ID",
        p.family_relationship::text as "Family Relationship",
        p.sex::text as "Sex",
        p.race::text as "Race",
        p.ethnicity::text as "Ethnicity",
        p.down_syndrome_status::text as "Down Syndrome Status",
        p.age_at_first_patient_engagement::integer as "Age at First Patient Engagement ",
        p.first_patient_engagement_event::text as "First Patient Engagement Event",
        p.outcomes_vital_status::text as "Outcomes Vital Status",
        p.age_at_last_vital_status::integer as "Age at Last Vital Status",
    from {{ ref(source_table) }} as p
)

select
    *
from ftd_participant

{% endmacro %}
