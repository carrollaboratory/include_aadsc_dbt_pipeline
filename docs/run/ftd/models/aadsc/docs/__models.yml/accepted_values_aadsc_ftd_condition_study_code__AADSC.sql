
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        study_code as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
    group by study_code

)

select *
from all_values
where value_field not in (
    'AADSC'
)



  
  
      
    ) dbt_internal_test