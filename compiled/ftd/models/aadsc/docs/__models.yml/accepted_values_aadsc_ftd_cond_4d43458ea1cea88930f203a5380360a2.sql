
    
    

with all_values as (

    select
        condition_data_source as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_condition"
    group by condition_data_source

)

select *
from all_values
where value_field not in (
    'Clinical','Self-reported'
)


