
  
    
    

    create  table
      "dbt"."main_aadsc_tgt_data"."tgt_study__dbt_tmp"
  
    as (
      




  
  
WITH src_study AS (
    SELECT
        *
    FROM "dbt"."main_aadsc_data"."aadsc_ftd_study"
)
SELECT * FROM src_study


    );
  
  