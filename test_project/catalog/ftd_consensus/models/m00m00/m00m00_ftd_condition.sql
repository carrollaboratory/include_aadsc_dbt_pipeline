{{ config(materialized='table', schema='m00m00_data') }}

    with source as (
        select 
        participant.study_code::text as "study_code",
       participant.participant_global_id::text as "participant_global_id",
       participant.participant_external_id::text as "participant_external_id",
       participant.event_id::text as "event_id",
       participant.event_type::text as "event_type",
       participant.condition_or_measure_source_text::text as "condition_or_measure_source_text",
       participant.age_at_condition_or_measure_observation::integer as "age_at_condition_or_measure_observation",
       participant.condition_interpretation::text as "condition_interpretation",
       participant.condition_status::text as "condition_status",
       participant.condition_data_source::text as "condition_data_source",
       participant.hpo_label::text as "hpo_label",
       participant.hpo_code::text as "hpo_code",
       participant.mondo_label::text as "mondo_label",
       participant.mondo_code::text as "mondo_code",
       participant.maxo_label::text as "maxo_label",
       participant.maxo_code::text as "maxo_code",
       participant.other_label::text as "other_label",
       participant.other_code::text as "other_code",
       participant.measure_value::integer as "measure_value",
       participant.measure_unit::text as "measure_unit"
        from {{ ref('m00m00_stg_participant') }} as participant
        join {{ ref('m00m00_stg_condition') }} as condition using (ftd_key)
    )

    select 
        * 
    from source
    