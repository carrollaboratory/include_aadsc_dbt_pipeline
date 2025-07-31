
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select data_category
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where data_category is null



  
  
      
    ) dbt_internal_test