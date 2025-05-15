{{ config(materialized='table') }}

SELECT * FROM aecom_src_data.combined
