This directory contains information specific to the Delay Discount Exploring the Mind data stream.

It defines the transformations used to flatten, structure, organize, and maintain the delay discount data received by
the warehouse team. This document defines model interdependencies and provides additional information about model
maintenance and creation. This is supplemental to the documentation created by `dbt docs generate`

## Table of Contents

- [dbt Documentation Generation](../../../README.md#dbt-documentation-generation)
- [Delay Discount](#delay-discount)
- [Transformation Models](#transformation-models)

## Delay Discount

The delay discount transformation tasks are linearly processed and defined. This section defines the expected limitation
and run orders of these models.

## Pre-requisites

There are no pre-requisite exceptions defined for the delay discount data stream separate from
the [current documentation](../README.md#pre-requisites).

## Environment Variables

There are no environment variable additions defined for the delay discount data stream separate from
the [current documentation](../README.md#environment-variables)

## Transformation Models

1. A source table, `delay_discount`, is provided by the lake team. This table contains `delay_discount` data that has
   passed lake team schema validation mechanisms. This table contains metadata about each source record, as well as the
   JSON formatted participant response payload.
2. This table is snapshotted by `delay_discount_source_snap` to capture data changes.
3. `delay_discount` is the source table for the `stg_delay_discount_wh_identified_table`. This incremental table stores
   data from the source table while flattening the data into nullable, STRING typed columns. All participant provided
   data is in a nullable mode and STRING type to prevent any potential data drops.
4. The staging table feeds incremental updates to the `delay_discount_wh_identified_table`. This table structures,
   organizes, and enriches the identified data. This table uses the operational tables defined
   in [Pre-requisites](#pre-requisites) to add date shift and research origin information for each record. This
   information will be used to de-identify the records in the data marts.
5. The identified table model is snapshotted to apply type-2 slowly changing dimensions to the model. This will allow
   data to be transformed as designed by the pipeline or on an ad-hoc basis as required while maintaining a full data
   lineage. This snapshot is titled `delay_discount_identified_snap`.
6. The `delay_discount_wh_identified_table` is the branching point for multiple tiers of data.
    1. `delay_discount_wh_controlled_table` - The warehouse version of the data that is expected to be representative of
       controlled tier data. The warehouse version contains operational fields that the researcher released version will
       not contain. The researcher data of each record is de-identified at this point.
        1. `delay_discount_controlled_snap` applies type-2 slowly changing dimensions.
            1. The `delay_discount_res_controlled_table` is a specific white list of fields from the warehouse table
               that will be queryable by the researcher. It is a subset of fields in
               the `delay_discount_wh_controlled_table`.
                1. `delay_discount_res_controlled_outcomes_view` is a view of `delay_discount_res_controlled_table`.
                   This view provides the `outcomes` and `metadata` information for a participant only. It is based on
                   the researcher table. It is supplemental to the base table.
                2. `delay_discount_res_controlled_trialdata_view` is a view of
                   the `delay_discount_res_controlled_table`. This view provides the `trial_data` information for a
                   participant. It is based on the researcher table. It is supplemental to the base table.
    2. `delay_discount_wh_registered_table` - The warehouse version of the data that is expected to be representative of
       registered tier data. The warehouse version contains operational fields that the researcher released version will
       not contain.
        1. `delay_discount_registered_snap` applies type-2 slowly changing dimensions.
            1. The `delay_discount_res_registered_table` is a specific white list of fields from the warehouse table
               that will be given to the researcher. It is a subset of fields in
               the `delay_discount_wh_registered_table`.
                1. `delay_discount_res_registered_outcomes_view` is a view of `delay_discount_res_registered_table`.
                   This view provides the `outcomes` and `metadata` information for a participant only. It is based on
                   the researcher table. It is supplemental to the base table.
                2. `delay_discount_res_registered_trialdata_view` is a view of
                   the `delay_discount_res_registered_table`. This view provides the `trial_data` information for a
                   participant. It is based on the researcher table. It is supplemental to the base table.
