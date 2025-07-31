
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select study_code
from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
where study_code is null



  
  
      
    ) dbt_internal_test