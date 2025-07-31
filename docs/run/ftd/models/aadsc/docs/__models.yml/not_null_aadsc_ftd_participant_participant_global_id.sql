
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select participant_global_id
from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
where participant_global_id is null



  
  
      
    ) dbt_internal_test