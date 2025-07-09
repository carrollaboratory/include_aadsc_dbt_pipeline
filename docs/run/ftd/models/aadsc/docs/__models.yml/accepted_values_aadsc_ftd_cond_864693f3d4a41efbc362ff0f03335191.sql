select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        condition_status as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
    group by condition_status

)

select *
from all_values
where value_field not in (
    'Current','Resolved','History Of'
)



      
    ) dbt_internal_test