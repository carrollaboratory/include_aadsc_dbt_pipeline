
    
    

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


