select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select family_type
from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
where family_type is null



      
    ) dbt_internal_test