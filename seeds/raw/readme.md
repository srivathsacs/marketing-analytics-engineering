This folder contains CSV files that simulate production ingestion outputs.

In a production environment, these tables would be populated in Snowflake via managed ingestion tools (e.g., Fivetran).

For local execution and reproducibility, the same schemas are represented here as dbt seeds, without changing the downstream modeling or architecture.