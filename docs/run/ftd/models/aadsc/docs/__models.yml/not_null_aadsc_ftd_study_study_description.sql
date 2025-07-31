
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select study_description
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where study_description is null



  
  
      
    ) dbt_internal_test