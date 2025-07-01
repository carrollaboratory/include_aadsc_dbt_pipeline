
    
    

with all_values as (

    select
        research_domain as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_study"
    group by research_domain

)

select *
from all_values
where value_field not in (
    'Behavior and Behavior Mechanisms','Congenital Heart Defects','Immune System Diseases','Hematologic Diseases','Sleep Wake Disorders','All Co-occurring Conditions','Other'
)


