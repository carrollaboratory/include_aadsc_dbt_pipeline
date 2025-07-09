select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        guid_type as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_study"
    group by guid_type

)

select *
from all_values
where value_field not in (
    'NDAR','Other','No GUID'
)



      
    ) dbt_internal_test