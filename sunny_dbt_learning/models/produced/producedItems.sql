with dedupQuery as
(
    select 
        *,
        row_number() over (partition by id order by updatedDate desc) as deduplicateID
    from 
        {{ source('default', 'items') }}
)
select
    id,
    name,
    category,
    updatedDate
from 
    dedupQuery
where 
    deduplicateID = 1