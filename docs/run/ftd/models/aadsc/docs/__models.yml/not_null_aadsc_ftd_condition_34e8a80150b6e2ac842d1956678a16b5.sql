select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select age_at_condition_measure_observation
from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
where age_at_condition_measure_observation is null



      
    ) dbt_internal_test