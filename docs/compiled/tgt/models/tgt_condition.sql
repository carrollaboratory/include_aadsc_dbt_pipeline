




  
  
with ftd_condition as (
    select 
       c.study_code::text as "studyCode",
       c.participant_global_id::text as "participantGlobalId",
       c.participant_external_id::text as "participantExternalId",
       c.event_id::text as "eventID",
       c.event_type::text as "eventType",
       c.condition_or_measure_source_text::text as "conditionMeasureSourceText",
       c.age_at_first_patient_engagement::integer as "ageAtConditionMeasureObservation",
       c.condition_interpretation::text as "conditionInterpretation",
       c.condition_status::text as "conditionStatus",
       c.condition_data_source::text as "conditionDataSource",
       c.hpo_label::text as "hpoLabel",
       c.hpo_code::text as "hpoCode",
       c.mondo_label::text as "mondoLabel",
       c.mondo_code::text as "mondoCode",
       c.maxo_label::text as "maxoLabel",
       c.maxo_code::text as "maxoCode",
       c.other_label::text as "otherLabel",
       c.other_code::text as "otherCode",
       c.measure_value::float as "measureValue",
       c.measure_unit::text as "measureUnit"
    from "dbt"."main_main"."aadsc_stg_clinical" as c
)

select
    *
from ftd_condition c

