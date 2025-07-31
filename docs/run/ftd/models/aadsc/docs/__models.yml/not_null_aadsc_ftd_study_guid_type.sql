
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select guid_type
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where guid_type is null



  
  
      
    ) dbt_internal_test