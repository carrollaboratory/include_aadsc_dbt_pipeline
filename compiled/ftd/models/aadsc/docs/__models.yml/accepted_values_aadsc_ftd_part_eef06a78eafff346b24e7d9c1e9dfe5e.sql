
    
    

with all_values as (

    select
        down_syndrome_status as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
    group by down_syndrome_status

)

select *
from all_values
where value_field not in (
    'D21','T21'
)


