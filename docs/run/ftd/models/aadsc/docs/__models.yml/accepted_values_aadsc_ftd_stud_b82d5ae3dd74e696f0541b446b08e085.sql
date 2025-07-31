
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        study_code as value_field,
        count(*) as n_records

    from "dbt"."main_aadsc_data"."aadsc_ftd_study"
    group by study_code

)

select *
from all_values
where value_field not in (
    'AADSC','ABC-DS','AECOM-DS','BrainPower','BRI-DSR','DECIDAS','DS-COG-ALL','DS-Nexus','DS-PCGC','DS-Sleep','DS360-CHD','DSC','EXcEEDS','HTP','INCLUDE-GUIDs','OPTimal','TEAM-DS','X01-deSmith','X01-Hakonarson'
)



  
  
      
    ) dbt_internal_test