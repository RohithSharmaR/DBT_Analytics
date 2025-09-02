{% snapshot snapshot_name %}
    {{
        config(
            target_schema='TANSFORMATION',
            target_database='deve_db',
            unique_key='customer_id',
            strategy='check',
            invalidate_hard_deletes=False,
            check_cols=["first_name","phone"]
        )
    }}

    select * from {{ source('raw', 'customer_details_no_update') }}
 {% endsnapshot %}