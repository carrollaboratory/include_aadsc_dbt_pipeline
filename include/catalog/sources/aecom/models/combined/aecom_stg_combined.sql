{{ config(materialized='table') }}

WITH source AS (
    SELECT 
       "Participant ID"::TEXT AS "participant_id",
       "Study Code"::TEXT AS "study_code",
       "dbGaP"::TEXT AS "dbgap",
       "DS Status"::TEXT AS "ds_status",
       "Gender"::TEXT AS "gender",
       "Ethnicity"::TEXT AS "ethnicity",
       "Race"::TEXT AS "race",
       "Exact Age"::TEXT AS "exact_age",
       "AHI"::TEXT AS "ahi",
       "OI"::TEXT AS "oi",
       "ID"::TEXT AS "id",
       "Axial"::TEXT AS "axial",
       "Saggital"::TEXT AS "saggital",
       "Coronal"::TEXT AS "coronal",
       "MRI Quality"::TEXT AS "mri_quality",
       "Remarks"::TEXT AS "remarks"
    FROM {{ ref('aecom_src_combined') }}
)

SELECT 
    *,
    CONCAT(study_code, '-', participant_id) AS ftd_key
FROM source
