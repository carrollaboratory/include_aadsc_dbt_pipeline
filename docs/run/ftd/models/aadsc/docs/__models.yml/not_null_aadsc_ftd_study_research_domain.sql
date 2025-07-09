select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select research_domain
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where research_domain is null



      
    ) dbt_internal_test