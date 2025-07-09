





  
  
with ftd_condition as (
    select 
       c.study_code::text as "Study Code",
       c.participant_global_id::text as "Participant Global Id",
       c.participant_external_id::text as "Participant External Id",
       c.event_id::text as "Event ID",
       c.event_type::text as "Event Type",
       c.condition_or_measure_source_text::text as "Condition Measure Source Text",
       c.age_at_first_patient_engagement::integer as "Age At Condition Measure Observation",
       c.condition_interpretation::text as "Condition Interpretation",
       c.condition_status::text as "Condition Status",
       c.condition_data_source::text as "Condition Data Source",
       c.hpo_label::text as "HPO Label",
       c.hpo_code::text as "HPO Code",
       c.mondo_label::text as "MONDO Label",
       c.mondo_code::text as "MONDO Code",
       c.maxo_label::text as "MAXT Label",
       c.maxo_code::text as "MAXO Code",
       c.other_label::text as "Other Label",
       c.other_code::text as "Other Code",
       c.measure_value::float as "Measure Value",
       c.measure_unit::text as "Measure Unit"
    from "dbt"."main_aadsc_data"."aadsc_ftd_condition" as c
)

select
    *
from ftd_condition c

