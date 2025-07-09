select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ethnicity
from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
where ethnicity is null



      
    ) dbt_internal_test