-- analysis/look_table.sql
select
*
from {{ ref('aadsc_ftd_participant') }}
limit 50