select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select principal_investigator_name
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where principal_investigator_name is null



      
    ) dbt_internal_test