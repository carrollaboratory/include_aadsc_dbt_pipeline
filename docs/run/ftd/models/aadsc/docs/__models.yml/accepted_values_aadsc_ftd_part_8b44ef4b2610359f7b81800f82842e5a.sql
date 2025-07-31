
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        outcomes_vital_status as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
    group by outcomes_vital_status

)

select *
from all_values
where value_field not in (
    'Dead','Alive','Unknown or not available'
)



  
  
      
    ) dbt_internal_test