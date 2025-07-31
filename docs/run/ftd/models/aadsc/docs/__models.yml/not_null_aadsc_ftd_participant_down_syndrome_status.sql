
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select down_syndrome_status
from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
where down_syndrome_status is null



  
  
      
    ) dbt_internal_test