





    with 
    unpivot_df as (
    -- Convert from 'wide' to 'long' src data format.
    -- Uses union all strategy as it is available across dbs.
    -- Output schema: 'ftd_index','masked_id','age','sex','race','ethnicity','extraction_date','bmi','height','weight','condition','assertion'(1,bmi,height,or weight)
    
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'bmi' as condition,
            cast(bmi as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where bmi IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'height' as condition,
            cast(height as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where height IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'weight' as condition,
            cast(weight as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where weight IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'abnormalities_of_gait_and_mobility' as condition,
            cast(abnormalities_of_gait_and_mobility as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where abnormalities_of_gait_and_mobility IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'achalasia' as condition,
            cast(achalasia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where achalasia IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'acute_bronchitis' as condition,
            cast(acute_bronchitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_bronchitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'acute_kidney_failure' as condition,
            cast(acute_kidney_failure as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_kidney_failure IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'acute_myocardial_infarction' as condition,
            cast(acute_myocardial_infarction as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_myocardial_infarction IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'acute_nasopharyngitis' as condition,
            cast(acute_nasopharyngitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_nasopharyngitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'acute_recurrent_sinusitis' as condition,
            cast(acute_recurrent_sinusitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_recurrent_sinusitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'acute_sinusitis' as condition,
            cast(acute_sinusitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where acute_sinusitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'all_malignant_neoplamsm' as condition,
            cast(all_malignant_neoplamsm as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where all_malignant_neoplamsm IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'allergic_rhinitis' as condition,
            cast(allergic_rhinitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where allergic_rhinitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'appendicitis' as condition,
            cast(appendicitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where appendicitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'atherosclerotic_heart_disease_of_native_coronary_artery' as condition,
            cast(atherosclerotic_heart_disease_of_native_coronary_artery as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where atherosclerotic_heart_disease_of_native_coronary_artery IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_alopecia_status' as condition,
            cast(auto_alopecia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_alopecia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_arthropathy_status' as condition,
            cast(auto_arthropathy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_arthropathy_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_atopic_status' as condition,
            cast(auto_atopic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_atopic_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_celiac_status' as condition,
            cast(auto_celiac_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_celiac_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_dermatomyositis_status' as condition,
            cast(auto_dermatomyositis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_dermatomyositis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_graves_status' as condition,
            cast(auto_graves_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_graves_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_hashimoto_status' as condition,
            cast(auto_hashimoto_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_hashimoto_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_hemol_anemia_status' as condition,
            cast(auto_hemol_anemia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_hemol_anemia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_herpetiformis_status' as condition,
            cast(auto_herpetiformis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_herpetiformis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_hidradenitis_status' as condition,
            cast(auto_hidradenitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_hidradenitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_kawasaki_status' as condition,
            cast(auto_kawasaki_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_kawasaki_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_menieres_status' as condition,
            cast(auto_menieres_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_menieres_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_myositis_status' as condition,
            cast(auto_myositis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_myositis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_narcolepsy_status' as condition,
            cast(auto_narcolepsy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_narcolepsy_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_neutropenia_status' as condition,
            cast(auto_neutropenia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_neutropenia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_other_specify' as condition,
            cast(auto_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_planus_status' as condition,
            cast(auto_planus_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_planus_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_psoriasis_status' as condition,
            cast(auto_psoriasis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_psoriasis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_psoriatic_arth_status' as condition,
            cast(auto_psoriatic_arth_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_psoriatic_arth_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_rh_arthritis_status' as condition,
            cast(auto_rh_arthritis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_rh_arthritis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_rls_status' as condition,
            cast(auto_rls_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_rls_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_sarcoidosis_status' as condition,
            cast(auto_sarcoidosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_sarcoidosis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_sclerosus_status' as condition,
            cast(auto_sclerosus_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_sclerosus_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_sle_status' as condition,
            cast(auto_sle_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_sle_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_t1_diabetes_status' as condition,
            cast(auto_t1_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_t1_diabetes_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'auto_thrombo_purpura_status' as condition,
            cast(auto_thrombo_purpura_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where auto_thrombo_purpura_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_asd_age' as condition,
            cast(cardiac_asd_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_asd_age IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_cardiomyopathy_status' as condition,
            cast(cardiac_cardiomyopathy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_cardiomyopathy_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_conditions' as condition,
            cast(cardiac_conditions as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_conditions IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_congestive_status' as condition,
            cast(cardiac_congestive_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_congestive_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_hypertension_status' as condition,
            cast(cardiac_hypertension_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_hypertension_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_mi_status' as condition,
            cast(cardiac_mi_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_mi_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_other_chd_specify' as condition,
            cast(cardiac_other_chd_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_other_chd_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_other_specify' as condition,
            cast(cardiac_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_pda_age' as condition,
            cast(cardiac_pda_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_pda_age IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_pfo_age' as condition,
            cast(cardiac_pfo_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_pfo_age IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_tof_age' as condition,
            cast(cardiac_tof_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_tof_age IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cardiac_vsd_age' as condition,
            cast(cardiac_vsd_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cardiac_vsd_age IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cerebrovascular_diseases' as condition,
            cast(cerebrovascular_diseases as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cerebrovascular_diseases IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cervical_myelopathy' as condition,
            cast(cervical_myelopathy as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cervical_myelopathy IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'change_in_skin_texture' as condition,
            cast(change_in_skin_texture as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where change_in_skin_texture IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'cholesteatoma_of_external_ear' as condition,
            cast(cholesteatoma_of_external_ear as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where cholesteatoma_of_external_ear IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'chronic_cough' as condition,
            cast(chronic_cough as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_cough IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'chronic_ischemic_heart_diseases' as condition,
            cast(chronic_ischemic_heart_diseases as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_ischemic_heart_diseases IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'chronic_kidney_disease' as condition,
            cast(chronic_kidney_disease as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_kidney_disease IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'chronic_nasopharyngitis' as condition,
            cast(chronic_nasopharyngitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where chronic_nasopharyngitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'constipation' as condition,
            cast(constipation as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where constipation IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'develop_expressive_status' as condition,
            cast(develop_expressive_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where develop_expressive_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'develop_mixed_status' as condition,
            cast(develop_mixed_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where develop_mixed_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'disorder_of_adrenal_gland_unspecified' as condition,
            cast(disorder_of_adrenal_gland_unspecified as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where disorder_of_adrenal_gland_unspecified IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'do_not_resuscitate_status' as condition,
            cast(do_not_resuscitate_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where do_not_resuscitate_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'ds_diagnosis' as condition,
            cast(ds_diagnosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ds_diagnosis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'dysmenorrhea' as condition,
            cast(dysmenorrhea as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where dysmenorrhea IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'dysphagia' as condition,
            cast(dysphagia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where dysphagia IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_congen_diabetes_status' as condition,
            cast(endo_congen_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_congen_diabetes_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_diabetes_conditions' as condition,
            cast(endo_diabetes_conditions as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_diabetes_conditions IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_graves_status' as condition,
            cast(endo_graves_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_graves_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_hyperthyroid_status' as condition,
            cast(endo_hyperthyroid_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_hyperthyroid_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_hypothyroid_status' as condition,
            cast(endo_hypothyroid_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_hypothyroid_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_other_specify' as condition,
            cast(endo_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_t1_diabetes_status' as condition,
            cast(endo_t1_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_t1_diabetes_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_t2_diabetes_status' as condition,
            cast(endo_t2_diabetes_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_t2_diabetes_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_thyroid_other_specify' as condition,
            cast(endo_thyroid_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_thyroid_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_vitaminb_status' as condition,
            cast(endo_vitaminb_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_vitaminb_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'endo_vitamind_status' as condition,
            cast(endo_vitamind_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where endo_vitamind_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'ent_etd_status' as condition,
            cast(ent_etd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_etd_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'ent_hearing_status' as condition,
            cast(ent_hearing_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_hearing_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'ent_laryngo_status' as condition,
            cast(ent_laryngo_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_laryngo_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'ent_osa_status' as condition,
            cast(ent_osa_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_osa_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'ent_rhinitis_status' as condition,
            cast(ent_rhinitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where ent_rhinitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'esophagitis' as condition,
            cast(esophagitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where esophagitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_amblyopia' as condition,
            cast(eye_amblyopia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_amblyopia IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_astigmatism' as condition,
            cast(eye_astigmatism as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_astigmatism IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_blind' as condition,
            cast(eye_blind as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_blind IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_cataracts' as condition,
            cast(eye_cataracts as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_cataracts IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_glaucoma' as condition,
            cast(eye_glaucoma as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_glaucoma IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_hyperopia' as condition,
            cast(eye_hyperopia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_hyperopia IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_keratoconus' as condition,
            cast(eye_keratoconus as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_keratoconus IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_myopia' as condition,
            cast(eye_myopia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_myopia IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_nystagmus' as condition,
            cast(eye_nystagmus as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_nystagmus IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_ptosis' as condition,
            cast(eye_ptosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_ptosis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_retina' as condition,
            cast(eye_retina as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_retina IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'eye_strabismus' as condition,
            cast(eye_strabismus as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where eye_strabismus IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'fatty_liver' as condition,
            cast(fatty_liver as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where fatty_liver IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'female_pcos_status' as condition,
            cast(female_pcos_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where female_pcos_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'follicular_disorder' as condition,
            cast(follicular_disorder as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where follicular_disorder IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_celiac_status' as condition,
            cast(gi_celiac_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_celiac_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_diverticulitis_status' as condition,
            cast(gi_diverticulitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_diverticulitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_esophageal_atresia_status' as condition,
            cast(gi_esophageal_atresia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_esophageal_atresia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_gerd_status' as condition,
            cast(gi_gerd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_gerd_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_hemorrhoids_status' as condition,
            cast(gi_hemorrhoids_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_hemorrhoids_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_hirschsprung_status' as condition,
            cast(gi_hirschsprung_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_hirschsprung_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_ibs_status' as condition,
            cast(gi_ibs_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_ibs_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_other_specify' as condition,
            cast(gi_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_peptic_ulcers_status' as condition,
            cast(gi_peptic_ulcers_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_peptic_ulcers_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'gi_pyloric_stenosis_status' as condition,
            cast(gi_pyloric_stenosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where gi_pyloric_stenosis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'heme_amkl_status' as condition,
            cast(heme_amkl_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_amkl_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'heme_aml_status' as condition,
            cast(heme_aml_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_aml_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'heme_b_all_status' as condition,
            cast(heme_b_all_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_b_all_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'heme_leuk_rxn_status' as condition,
            cast(heme_leuk_rxn_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_leuk_rxn_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'heme_other_cancer_status' as condition,
            cast(heme_other_cancer_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_other_cancer_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'heme_other_specify' as condition,
            cast(heme_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'heme_tmd_status' as condition,
            cast(heme_tmd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where heme_tmd_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'hernia' as condition,
            cast(hernia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where hernia IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'impacted_cerumen' as condition,
            cast(impacted_cerumen as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where impacted_cerumen IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_c_diff_status' as condition,
            cast(infection_c_diff_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_c_diff_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_cellulitis_status' as condition,
            cast(infection_cellulitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_cellulitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_gout_status' as condition,
            cast(infection_gout_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_gout_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_impetigo_status' as condition,
            cast(infection_impetigo_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_impetigo_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_otitis_status' as condition,
            cast(infection_otitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_otitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_periodontitis_status' as condition,
            cast(infection_periodontitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_periodontitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_sinus_status' as condition,
            cast(infection_sinus_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_sinus_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_tb_status' as condition,
            cast(infection_tb_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_tb_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_uti_status' as condition,
            cast(infection_uti_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_uti_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'infection_zoster_status' as condition,
            cast(infection_zoster_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where infection_zoster_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'lymph_anemia_status' as condition,
            cast(lymph_anemia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where lymph_anemia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'male_cancer_status' as condition,
            cast(male_cancer_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_cancer_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'male_hypospadias_status' as condition,
            cast(male_hypospadias_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_hypospadias_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'male_phimosis_status' as condition,
            cast(male_phimosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_phimosis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'male_testicles_status' as condition,
            cast(male_testicles_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where male_testicles_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'metrorrhagia' as condition,
            cast(metrorrhagia as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where metrorrhagia IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'neuro_alz_status' as condition,
            cast(neuro_alz_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_alz_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'neuro_dementia_status' as condition,
            cast(neuro_dementia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_dementia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'neuro_epilepsy_status' as condition,
            cast(neuro_epilepsy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_epilepsy_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'neuro_moya_status' as condition,
            cast(neuro_moya_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_moya_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'neuro_other_specify' as condition,
            cast(neuro_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'neuro_palsy_status' as condition,
            cast(neuro_palsy_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_palsy_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'neuro_parkinson_status' as condition,
            cast(neuro_parkinson_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where neuro_parkinson_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'nonalcoholic_steatohepatitis' as condition,
            cast(nonalcoholic_steatohepatitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where nonalcoholic_steatohepatitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'onychomycosis' as condition,
            cast(onychomycosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where onychomycosis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'orthostatic_hypotension' as condition,
            cast(orthostatic_hypotension as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where orthostatic_hypotension IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'overweight_and_obesity' as condition,
            cast(overweight_and_obesity as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where overweight_and_obesity IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_add_adhd_status' as condition,
            cast(psych_add_adhd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_add_adhd_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_anxiety_status' as condition,
            cast(psych_anxiety_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_anxiety_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_autism_status' as condition,
            cast(psych_autism_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_autism_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_bipolar_status' as condition,
            cast(psych_bipolar_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_bipolar_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_depression_status' as condition,
            cast(psych_depression_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_depression_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_ocd_status' as condition,
            cast(psych_ocd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_ocd_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_odd_status' as condition,
            cast(psych_odd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_odd_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_other_specify' as condition,
            cast(psych_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_panic_status' as condition,
            cast(psych_panic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_panic_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_ptsd_status' as condition,
            cast(psych_ptsd_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_ptsd_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psych_schizophrenia_status' as condition,
            cast(psych_schizophrenia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psych_schizophrenia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'psychiatric_disorders' as condition,
            cast(psychiatric_disorders as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where psychiatric_disorders IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'pulm_asthma_status' as condition,
            cast(pulm_asthma_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where pulm_asthma_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'pulm_other_specify' as condition,
            cast(pulm_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where pulm_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'pulm_pulm_hypertension_status' as condition,
            cast(pulm_pulm_hypertension_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where pulm_pulm_hypertension_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skel_arthritis_status' as condition,
            cast(skel_arthritis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_arthritis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skel_osteoarthritis_status' as condition,
            cast(skel_osteoarthritis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_osteoarthritis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skel_osteoporosis_status' as condition,
            cast(skel_osteoporosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_osteoporosis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skel_scoliosis_status' as condition,
            cast(skel_scoliosis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skel_scoliosis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_acne_age' as condition,
            cast(skin_acne_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_acne_age IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_acne_status' as condition,
            cast(skin_acne_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_acne_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_alopecia_age' as condition,
            cast(skin_alopecia_age as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_alopecia_age IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_alopecia_status' as condition,
            cast(skin_alopecia_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_alopecia_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_athlete_status' as condition,
            cast(skin_athlete_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_athlete_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_atopic_status' as condition,
            cast(skin_atopic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_atopic_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_cellulitis_status' as condition,
            cast(skin_cellulitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_cellulitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_hidradenitis_status' as condition,
            cast(skin_hidradenitis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_hidradenitis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_psoriasis_status' as condition,
            cast(skin_psoriasis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_psoriasis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_rosacea_status' as condition,
            cast(skin_rosacea_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_rosacea_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'skin_seborrheic_status' as condition,
            cast(skin_seborrheic_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where skin_seborrheic_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'spondylosis' as condition,
            cast(spondylosis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where spondylosis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'tinea_barbae_and_tinea_capitis' as condition,
            cast(tinea_barbae_and_tinea_capitis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where tinea_barbae_and_tinea_capitis IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'tinea_cruris' as condition,
            cast(tinea_cruris as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where tinea_cruris IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'unspecified_blepharitis_unspecified_eye__unspecified_eyelid' as condition,
            cast(unspecified_blepharitis_unspecified_eye__unspecified_eyelid as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where unspecified_blepharitis_unspecified_eye__unspecified_eyelid IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urinary_incontinence' as condition,
            cast(urinary_incontinence as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urinary_incontinence IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urinary_retention' as condition,
            cast(urinary_retention as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urinary_retention IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urogen_agenesis_status' as condition,
            cast(urogen_agenesis_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_agenesis_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urogen_hydroneph_status' as condition,
            cast(urogen_hydroneph_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_hydroneph_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urogen_kidney_dz_status' as condition,
            cast(urogen_kidney_dz_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_kidney_dz_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urogen_kidney_status' as condition,
            cast(urogen_kidney_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_kidney_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urogen_other_specify' as condition,
            cast(urogen_other_specify as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_other_specify IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'urogen_reflux_status' as condition,
            cast(urogen_reflux_status as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where urogen_reflux_status IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'vitamin_b12_deficiency' as condition,
            cast(vitamin_b12_deficiency as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where vitamin_b12_deficiency IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'vitamin_d_deficiency' as condition,
            cast(vitamin_d_deficiency as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where vitamin_d_deficiency IS NOT NULL
        union all
    
        select
            ftd_index, MASKED_ID, AGE, SEX, RACE, ETHNICITY, EXTRACTION_DATE,
            'xerosis_cutis' as condition,
            cast(xerosis_cutis as varchar) as assertion
        from "dbt"."main_main"."aadsc_stg_clinical"
        where xerosis_cutis IS NOT NULL
        
    
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
        "icd10cm_label",
        "loinc_label",
        "loinc_code"
    from "dbt"."main"."annotations" as a
    where "icd9_codes_with_prefix" is not null 
        or "icd10_codes_with_prefix" is not null 
        or "icdO_codes_with_prefix" is not null
        or "loinc_code" is not null
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
                when clinical.assertion = '1'
                    then 'Observed'
                when  clinical.assertion = '0'
                    then 'Not Observed'
                when  clinical.assertion is null
                    then null
                else null -- NULL for bmi, height, weight
            end as "condition_interpretation",
            ha.hpo_label,
            ha.hpo_code,
            ma.mondo_label,
            ma.mondo_code,
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select COALESCE("icd10cm_label","loinc_label",'') 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix", "loinc_code"
                          limit 1)::text
                else null 
            end as "other_label",
                case 
                when ha.hpo_code is null and ma.mondo_code is null
                    then (select COALESCE("icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix","loinc_code",'') 
                          from other_annotations 
                          where condition_name = clinical.condition
                          order by "icd9_codes_with_prefix", "icd10_codes_with_prefix", "icdO_codes_with_prefix", "loinc_code"
                          limit 1)::text
                else null 
            end as "other_code",
                case
                when clinical.condition in ('bmi','height','weight')
                    then clinical.assertion
                else null
            end as "measure_value",
                case
                when  clinical.condition = 'bmi'
                    then 'kg/m2' 
                when  clinical.condition = 'height'
                    then 'in'
                when  clinical.condition = 'weight'
                    then 'lb'
                else null
            end as "measure_unit",
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
    null::integer as "age_at_first_patient_engagement",
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
    source.measure_value as "measure_value",
    source.measure_unit as "measure_unit"
from source