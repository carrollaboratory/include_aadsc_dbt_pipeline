select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select clinical_data_source_type
from "dbt"."main_aadsc_data"."aadsc_ftd_study"
where clinical_data_source_type is null



      
    ) dbt_internal_test