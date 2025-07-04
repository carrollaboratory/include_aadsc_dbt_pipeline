
    
    

with all_values as (

    select
        ethnicity as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
    group by ethnicity

)

select *
from all_values
where value_field not in (
    'Hispanic or Latino','Not Hispanic or Latino','Prefer not to answer','Unknown'
)


