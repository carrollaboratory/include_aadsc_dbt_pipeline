select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select participant_external_id
from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
where participant_external_id is null



      
    ) dbt_internal_test