
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select study_title
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where study_title is null



  
  
      
    ) dbt_internal_test