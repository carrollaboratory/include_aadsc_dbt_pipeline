
    
    

with all_values as (

    select
        study_design as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_study"
    group by study_design

)

select *
from all_values
where value_field not in (
    'Case-Control','Case Set','Control Set','Clinical Trial','Cross-Sectional','Family/Twins/Trios','Interventional','Longitudinal','Tumor vs Matched Normal'
)


