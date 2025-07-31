
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        condition_interpretation as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
    group by condition_interpretation

)

select *
from all_values
where value_field not in (
    'Observed','Not Observed'
)



  
  
      
    ) dbt_internal_test