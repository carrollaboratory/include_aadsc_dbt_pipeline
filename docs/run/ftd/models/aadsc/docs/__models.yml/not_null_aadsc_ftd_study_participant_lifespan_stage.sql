
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select participant_lifespan_stage
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where participant_lifespan_stage is null



  
  
      
    ) dbt_internal_test