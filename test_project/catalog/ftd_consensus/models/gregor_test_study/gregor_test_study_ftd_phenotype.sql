{{ config(materialized='table', schema='gregor_test_study_data') }}

    with source as (
        select 
        GEN_UNKNOWN.study_code::text as "study_code",
       GEN_UNKNOWN.participant_global_id::text as "participant_global_id",
       GEN_UNKNOWN.participant_external_id::text as "participant_external_id",
       GEN_UNKNOWN.event_id::text as "event_id",
       GEN_UNKNOWN.event_type::text as "event_type",
       GEN_UNKNOWN.condition_or_measure_source_text::text as "condition_or_measure_source_text",
       GEN_UNKNOWN.age_at_condition_or_measure_observation::integer as "age_at_condition_or_measure_observation",
       GEN_UNKNOWN.condition_interpretation::text as "condition_interpretation",
       GEN_UNKNOWN.condition_status::text as "condition_status",
       GEN_UNKNOWN.condition_data_source::text as "condition_data_source",
       GEN_UNKNOWN.hpo_label::text as "hpo_label",
       GEN_UNKNOWN.hpo_code::text as "hpo_code",
       GEN_UNKNOWN.mondo_label::text as "mondo_label",
       GEN_UNKNOWN.mondo_code::text as "mondo_code",
       GEN_UNKNOWN.maxo_label::text as "maxo_label",
       GEN_UNKNOWN.maxo_code::text as "maxo_code",
       GEN_UNKNOWN.other_label::text as "other_label",
       GEN_UNKNOWN.other_code::text as "other_code",
       GEN_UNKNOWN.measure_value::integer as "measure_value",
       GEN_UNKNOWN.measure_unit::text as "measure_unit"
        from {{ ref('gregor_test_study_stg_participant') }} as participant
        join {{ ref('gregor_test_study_stg_phenotype') }} as phenotype using (ftd_key)
    )

    select 
        * 
    from source
    