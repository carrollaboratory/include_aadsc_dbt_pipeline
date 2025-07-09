select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        participant_lifespan_stage as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_study"
    group by participant_lifespan_stage

)

select *
from all_values
where value_field not in (
    'Fetal','Neonatal','Pediatric','Adult'
)



      
    ) dbt_internal_test