{{ config(materialized='table') }}

SELECT * FROM default_db.m00m00_raw_data.participant
