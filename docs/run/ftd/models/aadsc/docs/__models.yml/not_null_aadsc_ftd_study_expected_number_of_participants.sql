
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select expected_number_of_participants
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where expected_number_of_participants is null



  
  
      
    ) dbt_internal_test