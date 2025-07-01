
    
    

with all_values as (

    select
        age_at_condition_measure_observation as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
    group by age_at_condition_measure_observation

)

select *
from all_values
where value_field not in (
    'nan'
)


