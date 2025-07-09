select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        clinical_data_source_type as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_study"
    group by clinical_data_source_type

)

select *
from all_values
where value_field not in (
    'Medical Record','Investigator Assessment','Participant or Caregiver Report','Other','Unknown'
)



      
    ) dbt_internal_test