# Marketing Analytics Engineering

This project simulates a **modern marketing analytics warehouse** for a direct-to-consumer ecommerce business.

It transforms **raw marketing and ecommerce data** into **analytics-ready tables** that answer questions like:  
1. How much revenue did each channel generate?  
2. What are CAC, ROAS, and LTV by campaign?  
3. Which channels are profitable?

Built with **dbt** using analytics engineering best practices: *raw → staging → intermediate → marts*.

All data is currently **synthetic**, but the pipeline is designed to work with **live data via Fivetran**.

---

## Marketing Analytics Dashboard

This dashboard shows revenue, customer acquisition cost (CAC), return on ad spend (ROAS), and lifetime value (LTV) by marketing channel, built on a modern ELT stack (Supabase → Fivetran → Snowflake → dbt → Power BI).

![Marketing Analytics](dashboard.png)

---

## Tech Stack

- Snowflake (trial account)  
- dbt Core (local)  
- Fivetran (trial)  
- GitHub  
- SQL  

*Note: dbt Cloud was used initially during a trial period. The project now runs locally on dbt Core.*

---

## Running Without Trial Accounts

This project is warehouse- and ingestion-tool agnostic.

If Snowflake or Fivetran trial accounts expire, you can run the same dbt project by:
- Connecting dbt to any supported warehouse (Snowflake, BigQuery, Redshift, Postgres)
- Loading the required `RAW` tables using any ingestion method (Fivetran, Airbyte, manual loads, or CSVs)

As long as the `RAW` tables follow the data contract (`users`, `orders`, `user_sources`, `marketing_spend`), all dbt models will run without changes.

---

## What This Project Shows

- End-to-end ELT pipeline (Fivetran → Snowflake → dbt)  
- SQL-based transformations  
- Dimensional modeling (facts and dimensions)  
- Attribution, CAC, ROAS, and LTV modeling  
- Data quality testing  

Designed for BI dashboards and reporting.

---

## Architecture

Fivetran → Snowflake (RAW) → dbt Staging → dbt Analytics → BI

---

## Data Requirements

dbt expects the following tables in the Snowflake **RAW** schema:

- `users`  
- `orders`  
- `user_sources`  
- `marketing_spend`  

These tables are populated with synthetic data now and will be loaded by **Fivetran** in production.

---

## Outputs

The dbt models produce analytics-ready tables including:
- Channel-level revenue  
- Campaign-level CAC and ROAS  
- Customer lifetime value (LTV)  
- Attributed order and revenue models  

These tables are designed to be consumed directly by BI tools.

---

## How to Run

1. Create a Snowflake database and a schema named `RAW`
2. Configure `profiles.yml` to connect dbt to Snowflake
3. Run the project:

```bash
dbt deps
dbt run
dbt test
```

---

## Future Enhancements

- Add CI/CD with GitHub Actions to automatically run dbt tests and deploy models  
- Add Power BI slicers for date, channel, and campaign   
- Add data quality monitoring and alerts  
- Replace Fivetran with another ingestion tool (Airbyte, manual loads, or CSVs) once the trial expires