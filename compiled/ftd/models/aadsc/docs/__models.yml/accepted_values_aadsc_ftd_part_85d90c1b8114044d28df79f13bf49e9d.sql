
    
    

with all_values as (

    select
        family_relationship as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_participant"
    group by family_relationship

)

select *
from all_values
where value_field not in (
    'Proband','Father','Mother','Sibling','Other relative','Unrelated control'
)


