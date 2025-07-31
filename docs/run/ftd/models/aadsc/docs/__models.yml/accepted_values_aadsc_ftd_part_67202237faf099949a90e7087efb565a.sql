
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        race as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
    group by race

)

select *
from all_values
where value_field not in (
    'American Indian or Alaska Native','Asian','Black or African American','More than one race','Native Hawaiian or Other Pacific Islander','Other','White','Prefer not to answer','Unknown','East Asian','Latin American','Middle Eastern or North African','South Asian'
)



  
  
      
    ) dbt_internal_test