select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select program
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where program is null



      
    ) dbt_internal_test