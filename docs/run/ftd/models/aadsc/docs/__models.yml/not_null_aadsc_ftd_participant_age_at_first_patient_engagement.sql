select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select age_at_first_patient_engagement
from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
where age_at_first_patient_engagement is null



      
    ) dbt_internal_test