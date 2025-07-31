
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select family_relationship
from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
where family_relationship is null



  
  
      
    ) dbt_internal_test