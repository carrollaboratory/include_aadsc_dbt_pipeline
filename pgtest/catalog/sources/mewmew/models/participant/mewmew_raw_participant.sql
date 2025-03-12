{{ config(materialized='table') }}

SELECT * FROM default_db.mewmew_raw_data.participant
