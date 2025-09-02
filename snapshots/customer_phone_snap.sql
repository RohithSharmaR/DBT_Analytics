{% snapshot customer_phone %}
    {{
        config(
            target_schema='TANSFORMATION',
            target_database='deve_db',
            unique_key='customer_id',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='updated_at',
            dbt_valid_to_current="to_date('9999-12-31')"
        )
    }}

    select * from {{ source('raw', 'customer_details') }}
 {% endsnapshot %}