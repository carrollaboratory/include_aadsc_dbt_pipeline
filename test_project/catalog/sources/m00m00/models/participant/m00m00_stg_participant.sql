{{ config(materialized='table') }}

    with source as (
        select 
        "Study Code"::text as "study_code",
       "Participant Global ID"::text as "participant_global_id",
       "Participant External ID"::text as "participant_external_id",
       "Event ID"::integer as "event_id",
       "Event Type"::text as "event_type",
       "Condition or Measure Source Text"::text as "condition_or_measure_source_text",
       "Age at Condition or Measure Observation"::text as "age_at_condition_or_measure_observation",
       "Condition Interpretation"::text as "condition_interpretation",
       "Condition Status"::text as "condition_status",
       "Condition Data Source"::text as "condition_data_source",
       "HPO Label"::text as "hpo_label",
       "HPO Code"::text as "hpo_code",
       "MONDO Label"::text as "mondo_label",
       "MONDO Code"::text as "mondo_code",
       "MAXO Label"::text as "maxo_label",
       "MAXO Code"::text as "maxo_code",
       "Other Label"::text as "other_label",
       "Other Code"::text as "other_code",
       "Measure Value"::float as "measure_value",
       "Measure Unit"::text as "measure_unit"
        from {{ source('m00m00','participants_m00m00') }}
    )

    select 
        *,
        concat(study_code, '-', participant_global_id) as ftd_key
    from source
    