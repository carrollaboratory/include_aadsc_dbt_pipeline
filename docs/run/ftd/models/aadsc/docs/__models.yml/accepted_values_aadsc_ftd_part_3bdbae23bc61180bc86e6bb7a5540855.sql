
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        sex as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
    group by sex

)

select *
from all_values
where value_field not in (
    'Female','Male','Other','Unknown'
)



  
  
      
    ) dbt_internal_test