
  
    
    

    create  table
      "dbt"."main_aadsc_data"."aadsc_ftd_condition__dbt_tmp"
  
    as (
      





    with 
    unpivot_df as (
    -- Convert from 'wide' to 'long' src data format.
    -- Uses union all strategy as it is available across dbs.
    -- Output schema: 'ftd_index','masked_id','age','sex','race','ethnicity','extraction_date','bmi','height','weight','condition','assertion'
    
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'bmi' as condition,
            cast(bmi as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where bmi = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'abnormalities_of_gait_and_mobility' as condition,
            cast(abnormalities_of_gait_and_mobility as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where abnormalities_of_gait_and_mobility = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'achalasia' as condition,
            cast(achalasia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where achalasia = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'acute_bronchitis' as condition,
            cast(acute_bronchitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_bronchitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'acute_kidney_failure' as condition,
            cast(acute_kidney_failure as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_kidney_failure = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'acute_myocardial_infarction' as condition,
            cast(acute_myocardial_infarction as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_myocardial_infarction = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'acute_nasopharyngitis' as condition,
            cast(acute_nasopharyngitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_nasopharyngitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'acute_recurrent_sinusitis' as condition,
            cast(acute_recurrent_sinusitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_recurrent_sinusitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'acute_sinusitis' as condition,
            cast(acute_sinusitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_sinusitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'all_malignant_neoplamsm' as condition,
            cast(all_malignant_neoplamsm as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where all_malignant_neoplamsm = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'allergic_rhinitis' as condition,
            cast(allergic_rhinitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where allergic_rhinitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'appendicitis' as condition,
            cast(appendicitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where appendicitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'atherosclerotic_heart_disease_of_native_coronary_artery' as condition,
            cast(atherosclerotic_heart_disease_of_native_coronary_artery as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where atherosclerotic_heart_disease_of_native_coronary_artery = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_alopecia_status' as condition,
            cast(auto_alopecia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_alopecia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_arthropathy_status' as condition,
            cast(auto_arthropathy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_arthropathy_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_atopic_status' as condition,
            cast(auto_atopic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_atopic_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_celiac_status' as condition,
            cast(auto_celiac_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_celiac_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_dermatomyositis_status' as condition,
            cast(auto_dermatomyositis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_dermatomyositis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_graves_status' as condition,
            cast(auto_graves_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_graves_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_hashimoto_status' as condition,
            cast(auto_hashimoto_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_hashimoto_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_hemol_anemia_status' as condition,
            cast(auto_hemol_anemia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_hemol_anemia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_herpetiformis_status' as condition,
            cast(auto_herpetiformis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_herpetiformis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_hidradenitis_status' as condition,
            cast(auto_hidradenitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_hidradenitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_kawasaki_status' as condition,
            cast(auto_kawasaki_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_kawasaki_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_menieres_status' as condition,
            cast(auto_menieres_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_menieres_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_myositis_status' as condition,
            cast(auto_myositis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_myositis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_narcolepsy_status' as condition,
            cast(auto_narcolepsy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_narcolepsy_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_neutropenia_status' as condition,
            cast(auto_neutropenia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_neutropenia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_other_specify' as condition,
            cast(auto_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_planus_status' as condition,
            cast(auto_planus_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_planus_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_psoriasis_status' as condition,
            cast(auto_psoriasis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_psoriasis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_psoriatic_arth_status' as condition,
            cast(auto_psoriatic_arth_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_psoriatic_arth_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_rh_arthritis_status' as condition,
            cast(auto_rh_arthritis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_rh_arthritis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_rls_status' as condition,
            cast(auto_rls_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_rls_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_sarcoidosis_status' as condition,
            cast(auto_sarcoidosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_sarcoidosis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_sclerosus_status' as condition,
            cast(auto_sclerosus_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_sclerosus_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_sle_status' as condition,
            cast(auto_sle_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_sle_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_t1_diabetes_status' as condition,
            cast(auto_t1_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_t1_diabetes_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'auto_thrombo_purpura_status' as condition,
            cast(auto_thrombo_purpura_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_thrombo_purpura_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_asd_age' as condition,
            cast(cardiac_asd_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_asd_age = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_cardiomyopathy_status' as condition,
            cast(cardiac_cardiomyopathy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_cardiomyopathy_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_conditions' as condition,
            cast(cardiac_conditions as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_conditions = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_congestive_status' as condition,
            cast(cardiac_congestive_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_congestive_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_hypertension_status' as condition,
            cast(cardiac_hypertension_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_hypertension_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_mi_status' as condition,
            cast(cardiac_mi_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_mi_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_other_chd_specify' as condition,
            cast(cardiac_other_chd_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_other_chd_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_other_specify' as condition,
            cast(cardiac_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_pda_age' as condition,
            cast(cardiac_pda_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_pda_age = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_pfo_age' as condition,
            cast(cardiac_pfo_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_pfo_age = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_tof_age' as condition,
            cast(cardiac_tof_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_tof_age = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cardiac_vsd_age' as condition,
            cast(cardiac_vsd_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_vsd_age = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cerebrovascular_diseases' as condition,
            cast(cerebrovascular_diseases as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cerebrovascular_diseases = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cervical_myelopathy' as condition,
            cast(cervical_myelopathy as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cervical_myelopathy = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'change_in_skin_texture' as condition,
            cast(change_in_skin_texture as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where change_in_skin_texture = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'cholesteatoma_of_external_ear' as condition,
            cast(cholesteatoma_of_external_ear as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cholesteatoma_of_external_ear = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'chronic_cough' as condition,
            cast(chronic_cough as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_cough = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'chronic_ischemic_heart_diseases' as condition,
            cast(chronic_ischemic_heart_diseases as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_ischemic_heart_diseases = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'chronic_kidney_disease' as condition,
            cast(chronic_kidney_disease as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_kidney_disease = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'chronic_nasopharyngitis' as condition,
            cast(chronic_nasopharyngitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_nasopharyngitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'constipation' as condition,
            cast(constipation as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where constipation = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'develop_expressive_status' as condition,
            cast(develop_expressive_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where develop_expressive_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'develop_mixed_status' as condition,
            cast(develop_mixed_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where develop_mixed_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'disorder_of_adrenal_gland_unspecified' as condition,
            cast(disorder_of_adrenal_gland_unspecified as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where disorder_of_adrenal_gland_unspecified = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'do_not_resuscitate_status' as condition,
            cast(do_not_resuscitate_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where do_not_resuscitate_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'ds_diagnosis' as condition,
            cast(ds_diagnosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ds_diagnosis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'dysmenorrhea' as condition,
            cast(dysmenorrhea as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where dysmenorrhea = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'dysphagia' as condition,
            cast(dysphagia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where dysphagia = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_congen_diabetes_status' as condition,
            cast(endo_congen_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_congen_diabetes_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_diabetes_conditions' as condition,
            cast(endo_diabetes_conditions as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_diabetes_conditions = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_graves_status' as condition,
            cast(endo_graves_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_graves_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_hyperthyroid_status' as condition,
            cast(endo_hyperthyroid_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_hyperthyroid_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_hypothyroid_status' as condition,
            cast(endo_hypothyroid_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_hypothyroid_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_other_specify' as condition,
            cast(endo_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_t1_diabetes_status' as condition,
            cast(endo_t1_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_t1_diabetes_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_t2_diabetes_status' as condition,
            cast(endo_t2_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_t2_diabetes_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_thyroid_other_specify' as condition,
            cast(endo_thyroid_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_thyroid_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_vitaminb_status' as condition,
            cast(endo_vitaminb_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_vitaminb_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'endo_vitamind_status' as condition,
            cast(endo_vitamind_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_vitamind_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'ent_etd_status' as condition,
            cast(ent_etd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_etd_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'ent_hearing_status' as condition,
            cast(ent_hearing_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_hearing_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'ent_laryngo_status' as condition,
            cast(ent_laryngo_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_laryngo_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'ent_osa_status' as condition,
            cast(ent_osa_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_osa_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'ent_rhinitis_status' as condition,
            cast(ent_rhinitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_rhinitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'esophagitis' as condition,
            cast(esophagitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where esophagitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_amblyopia' as condition,
            cast(eye_amblyopia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_amblyopia = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_astigmatism' as condition,
            cast(eye_astigmatism as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_astigmatism = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_blind' as condition,
            cast(eye_blind as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_blind = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_cataracts' as condition,
            cast(eye_cataracts as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_cataracts = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_glaucoma' as condition,
            cast(eye_glaucoma as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_glaucoma = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_hyperopia' as condition,
            cast(eye_hyperopia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_hyperopia = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_keratoconus' as condition,
            cast(eye_keratoconus as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_keratoconus = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_myopia' as condition,
            cast(eye_myopia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_myopia = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_nystagmus' as condition,
            cast(eye_nystagmus as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_nystagmus = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_ptosis' as condition,
            cast(eye_ptosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_ptosis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_retina' as condition,
            cast(eye_retina as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_retina = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'eye_strabismus' as condition,
            cast(eye_strabismus as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_strabismus = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'fatty_liver' as condition,
            cast(fatty_liver as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where fatty_liver = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'female_pcos_status' as condition,
            cast(female_pcos_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where female_pcos_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'follicular_disorder' as condition,
            cast(follicular_disorder as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where follicular_disorder = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_celiac_status' as condition,
            cast(gi_celiac_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_celiac_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_diverticulitis_status' as condition,
            cast(gi_diverticulitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_diverticulitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_esophageal_atresia_status' as condition,
            cast(gi_esophageal_atresia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_esophageal_atresia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_gerd_status' as condition,
            cast(gi_gerd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_gerd_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_hemorrhoids_status' as condition,
            cast(gi_hemorrhoids_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_hemorrhoids_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_hirschsprung_status' as condition,
            cast(gi_hirschsprung_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_hirschsprung_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_ibs_status' as condition,
            cast(gi_ibs_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_ibs_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_other_specify' as condition,
            cast(gi_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_peptic_ulcers_status' as condition,
            cast(gi_peptic_ulcers_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_peptic_ulcers_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'gi_pyloric_stenosis_status' as condition,
            cast(gi_pyloric_stenosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_pyloric_stenosis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'heme_amkl_status' as condition,
            cast(heme_amkl_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_amkl_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'heme_aml_status' as condition,
            cast(heme_aml_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_aml_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'heme_b_all_status' as condition,
            cast(heme_b_all_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_b_all_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'heme_leuk_rxn_status' as condition,
            cast(heme_leuk_rxn_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_leuk_rxn_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'heme_other_cancer_status' as condition,
            cast(heme_other_cancer_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_other_cancer_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'heme_other_specify' as condition,
            cast(heme_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'heme_tmd_status' as condition,
            cast(heme_tmd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_tmd_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'hernia' as condition,
            cast(hernia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where hernia = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'impacted_cerumen' as condition,
            cast(impacted_cerumen as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where impacted_cerumen = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_c_diff_status' as condition,
            cast(infection_c_diff_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_c_diff_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_cellulitis_status' as condition,
            cast(infection_cellulitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_cellulitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_gout_status' as condition,
            cast(infection_gout_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_gout_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_impetigo_status' as condition,
            cast(infection_impetigo_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_impetigo_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_otitis_status' as condition,
            cast(infection_otitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_otitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_periodontitis_status' as condition,
            cast(infection_periodontitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_periodontitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_sinus_status' as condition,
            cast(infection_sinus_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_sinus_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_tb_status' as condition,
            cast(infection_tb_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_tb_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_uti_status' as condition,
            cast(infection_uti_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_uti_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'infection_zoster_status' as condition,
            cast(infection_zoster_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_zoster_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'lymph_anemia_status' as condition,
            cast(lymph_anemia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where lymph_anemia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'male_cancer_status' as condition,
            cast(male_cancer_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_cancer_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'male_hypospadias_status' as condition,
            cast(male_hypospadias_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_hypospadias_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'male_phimosis_status' as condition,
            cast(male_phimosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_phimosis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'male_testicles_status' as condition,
            cast(male_testicles_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_testicles_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'metrorrhagia' as condition,
            cast(metrorrhagia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where metrorrhagia = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'neuro_alz_status' as condition,
            cast(neuro_alz_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_alz_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'neuro_dementia_status' as condition,
            cast(neuro_dementia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_dementia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'neuro_epilepsy_status' as condition,
            cast(neuro_epilepsy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_epilepsy_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'neuro_moya_status' as condition,
            cast(neuro_moya_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_moya_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'neuro_other_specify' as condition,
            cast(neuro_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'neuro_palsy_status' as condition,
            cast(neuro_palsy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_palsy_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'neuro_parkinson_status' as condition,
            cast(neuro_parkinson_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_parkinson_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'nonalcoholic_steatohepatitis' as condition,
            cast(nonalcoholic_steatohepatitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where nonalcoholic_steatohepatitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'onychomycosis' as condition,
            cast(onychomycosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where onychomycosis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'orthostatic_hypotension' as condition,
            cast(orthostatic_hypotension as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where orthostatic_hypotension = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'overweight_and_obesity' as condition,
            cast(overweight_and_obesity as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where overweight_and_obesity = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_add_adhd_status' as condition,
            cast(psych_add_adhd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_add_adhd_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_anxiety_status' as condition,
            cast(psych_anxiety_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_anxiety_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_autism_status' as condition,
            cast(psych_autism_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_autism_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_bipolar_status' as condition,
            cast(psych_bipolar_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_bipolar_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_depression_status' as condition,
            cast(psych_depression_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_depression_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_ocd_status' as condition,
            cast(psych_ocd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_ocd_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_odd_status' as condition,
            cast(psych_odd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_odd_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_other_specify' as condition,
            cast(psych_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_panic_status' as condition,
            cast(psych_panic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_panic_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_ptsd_status' as condition,
            cast(psych_ptsd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_ptsd_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psych_schizophrenia_status' as condition,
            cast(psych_schizophrenia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_schizophrenia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'psychiatric_disorders' as condition,
            cast(psychiatric_disorders as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psychiatric_disorders = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'pulm_asthma_status' as condition,
            cast(pulm_asthma_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where pulm_asthma_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'pulm_other_specify' as condition,
            cast(pulm_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where pulm_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'pulm_pulm_hypertension_status' as condition,
            cast(pulm_pulm_hypertension_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where pulm_pulm_hypertension_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skel_arthritis_status' as condition,
            cast(skel_arthritis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_arthritis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skel_osteoarthritis_status' as condition,
            cast(skel_osteoarthritis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_osteoarthritis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skel_osteoporosis_status' as condition,
            cast(skel_osteoporosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_osteoporosis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skel_scoliosis_status' as condition,
            cast(skel_scoliosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_scoliosis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_acne_age' as condition,
            cast(skin_acne_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_acne_age = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_acne_status' as condition,
            cast(skin_acne_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_acne_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_alopecia_age' as condition,
            cast(skin_alopecia_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_alopecia_age = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_alopecia_status' as condition,
            cast(skin_alopecia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_alopecia_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_athlete_status' as condition,
            cast(skin_athlete_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_athlete_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_atopic_status' as condition,
            cast(skin_atopic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_atopic_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_cellulitis_status' as condition,
            cast(skin_cellulitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_cellulitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_hidradenitis_status' as condition,
            cast(skin_hidradenitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_hidradenitis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_psoriasis_status' as condition,
            cast(skin_psoriasis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_psoriasis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_rosacea_status' as condition,
            cast(skin_rosacea_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_rosacea_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'skin_seborrheic_status' as condition,
            cast(skin_seborrheic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_seborrheic_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'spondylosis' as condition,
            cast(spondylosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where spondylosis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'tinea_barbae_and_tinea_capitis' as condition,
            cast(tinea_barbae_and_tinea_capitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where tinea_barbae_and_tinea_capitis = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'tinea_cruris' as condition,
            cast(tinea_cruris as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where tinea_cruris = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'unspecified_blepharitis_unspecified_eye__unspecified_eyelid' as condition,
            cast(unspecified_blepharitis_unspecified_eye__unspecified_eyelid as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where unspecified_blepharitis_unspecified_eye__unspecified_eyelid = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urinary_incontinence' as condition,
            cast(urinary_incontinence as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urinary_incontinence = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urinary_retention' as condition,
            cast(urinary_retention as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urinary_retention = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urogen_agenesis_status' as condition,
            cast(urogen_agenesis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_agenesis_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urogen_hydroneph_status' as condition,
            cast(urogen_hydroneph_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_hydroneph_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urogen_kidney_dz_status' as condition,
            cast(urogen_kidney_dz_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_kidney_dz_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urogen_kidney_status' as condition,
            cast(urogen_kidney_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_kidney_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urogen_other_specify' as condition,
            cast(urogen_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_other_specify = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'urogen_reflux_status' as condition,
            cast(urogen_reflux_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_reflux_status = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'vitamin_b12_deficiency' as condition,
            cast(vitamin_b12_deficiency as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where vitamin_b12_deficiency = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'vitamin_d_deficiency' as condition,
            cast(vitamin_d_deficiency as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where vitamin_d_deficiency = 1
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE, HEIGHT, WEIGHT,
            'xerosis_cutis' as condition,
            cast(xerosis_cutis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where xerosis_cutis = 1
        
    
    )
    ,mondo_annotations as (
    select
        distinct
        "condition_name" ::text as condition_name,
        "mondo_codes_with_prefix" ::text as mondo_code,
        "mondo_label" ::text as mondo_label
        from "dbt"."main"."annotations" as a
        where "mondo_codes_with_prefix" is not null
            or "mondo_label" is not null
    )
    ,hpo_annotations as (
    select
        distinct
        "condition_name" ::text as condition_name,
        "hpo_codes_with_prefix" ::text as hpo_code,
        "hpo_label" ::text as hpo_label
    from "dbt"."main"."annotations" as a
    where "hpo_codes_with_prefix" is not null
        or "hpo_label" is not null
    )
    ,other_annotations as (
    select
        distinct
        "condition_name" ::text as condition_name,
        "icd9_codes_with_prefix",
        "icd10_codes_with_prefix",
        "icdO_codes_with_prefix",
        "icd10cm_label"
    from "dbt"."main"."annotations" as a
    where "icd9_codes_with_prefix" is not null 
        or "icd10_codes_with_prefix" is not null 
        or "icdO_codes_with_prefix" is not null
    )
    ,source as (
        select 
            clinical.ftd_index,
            'AADSC' as "study_code",
                
    /* 
        This macro generates the sql required to create a primary or foreign key
        by the md5 on a composite string method.

        Example usage - lacking double brackets:
           generate_md5_composite_key("p", ['id','dob'])
        generates the following sql
            'p' || '_' || md5(studyid || CAST(coalesce(id, '') AS TEXT) || '|' || CAST(coalesce(dob, '') AS TEXT))
        results in an id with the following format
            p_a32b29ffb1a85590c4a6d4cbeec18636
    */
    
    
        

        
    
    'c' || '_' || md5('aadsc' || '|' || CAST(coalesce(clinical.MASKED_ID, '') AS TEXT))
    


            ::text as "participant_external_id",
            clinical.condition::text as "condition_or_measure_source_text",
                case
                when  clinical.age = 'Age 90 or older'
                    then 0
                when  clinical.age is null
                    then 0
                else FLOOR(CAST(clinical.age AS FLOAT) * 365.25)
            end as "age_at_first_patient_engagement",
                case
                when  clinical.assertion = '1'
                    then 'Observed'
                when  clinical.assertion = '0'
                    then 'Not Observed'
                when  clinical.assertion is null
                    then null
                else null
            end as "condition_interpretation",
            ha.hpo_label,
            ha.hpo_code,
            ma.mondo_label,
            ma.mondo_code,
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select "icd10cm_label" 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix"
                          limit 1)::text
                else null 
            end as "other_label",
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select COALESCE("icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix",'') 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix"
                          limit 1)::text
                else null 
            end as "other_code",
        from unpivot_df as clinical
        left join mondo_annotations as ma
            on ma.condition_name = clinical.condition
        left join hpo_annotations as ha
            on ha.condition_name = clinical.condition
    )


select 
    source.ftd_index,
    source.study_code, --req
    null::text as "participant_global_id", --req, created after the pipeline
    source.participant_external_id, --req
    null::text as "event_id",
    null::text as "event_type",
    null::integer as "age_at_condition_measure_observation",
    source.condition_or_measure_source_text,
    source.age_at_first_patient_engagement,
    source.condition_interpretation,
    null::text as "condition_status",
    null::text as "condition_data_source",
    source.hpo_label,
    source.hpo_code,
    source.mondo_label,
    source.mondo_code,
    null::text as "maxo_label",
    null::text as "maxo_code",
    source.other_label,
    source.other_code,
    null::text as "measure_value",
    null::text as "measure_unit"
from source
    );
  
  