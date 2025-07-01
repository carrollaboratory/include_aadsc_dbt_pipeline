
    
    

with all_values as (

    select
        family_type as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
    group by family_type

)

select *
from all_values
where value_field not in (
    'Control-only','Duo','Other','Proband-only','Trio','Trio Plus'
)


