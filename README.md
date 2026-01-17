# Marketing Analytics Engineering Platform

## Overview
This project demonstrates an end-to-end **marketing analytics engineering workflow**, transforming raw marketing and transactional data into analytics-ready models and business metrics.

It reflects a real-world analytics stack used by growth, marketing, and finance teams to evaluate performance, attribution, and ROI.

The project is implemented using **dbt Core** and follows analytics engineering best practices including layered modeling, data quality testing, and metric standardization.

---

## Key Features
- End-to-end marketing analytics pipeline
- dbt-based transformation layer (raw → staging → marts)
- Business-ready metrics such as CAC, ROAS, and LTV
- Data quality and integrity testing
- Analytics-ready fact and dimension tables
- Example BI dashboard for stakeholder consumption

---

## Tech Stack
- **Data Warehouse:** Snowflake
- **Transformation:** dbt Core
- **Modeling:** Dimensional (facts & dimensions)
- **Visualization:** BI dashboard (sample output included)
- **Development Mode:** Local execution (no dbt Cloud required)

---

## Architecture
```text
Marketing Sources / Transactions
            ↓
        Snowflake (RAW)
            ↓
          dbt Core
  (staging → intermediate → marts)
            ↓
       BI / Analytics Layer
```

This architecture mirrors a production analytics stack while remaining fully runnable in a local development environment.

---

## Project Structure
```text
models/
├── staging/
├── intermediate/
├── marts/
```

---

## Layering Principles
- **Staging:** One-to-one with source tables, minimal logic
- **Intermediate:** Shared transformations and joins
- **Marts:** Business metrics optimized for analytics and BI

---

## Local Development Setup
This project runs locally using **dbt Core**. Cloud orchestration tools are not required. 

Environment variables can be configured using the provided `.env.example` file.

---

## Prerequisites
- Python 3.9+
- Snowflake account
- pip

---

## Step 1: Install dbt
```bash
pip install dbt-snowflake
```

---

## Step 2: Configure dbt profile
Create or update `~/.dbt/profiles.yml`:

```yaml
marketing_analytics:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <account>
      user: <user>
      password: <password>
      role: <role>
      warehouse: <warehouse>
      database: <database>
      schema: raw
      threads: 4
```

---

## Step 3: Verify connection
```bash
dbt debug
```

---

## Step 4: Run models and tests
```bash
dbt run
dbt test
```

---

## Step 5: Generate documentation
```bash
dbt docs generate
dbt docs serve
```

---

## Data Quality & Testing
This project uses dbt schema tests defined alongside models in `schema.yml` files to enforce data quality, including:
- `not_null` and `unique` tests on primary keys in staging and mart models
- Relationship tests to ensure referential integrity between staging and mart layers
- Validation of required fields that support downstream analytics and BI


---

## Data Contracts & Assumptions
- One row per user in the users table
- One row per order in the orders table
- Marketing spend is reported daily at the campaign level
- Attribution model is last-touch
- All monetary values are in a single currency

---

## Analytics Output
The final marts layer powers an example BI dashboard that answers:
- How much are we spending to acquire customers?
- Which campaigns generate the highest ROAS?
- How does customer lifetime value compare across channels?

A sample dashboard output is included in the repository.

---

## Why This Project
This project was built to demonstrate:
- Analytics engineering best practices
- Real-world marketing analytics modeling
- How raw operational data becomes decision-ready metrics
- Clear separation of concerns in data transformations

---

## Future Enhancements
- CI-based dbt testing
- Incremental models for large fact tables
- Multi-touch attribution modeling
- Orchestration with Airflow or Prefect
- Environment separation (dev / prod)

---

## Notes
This repository is intentionally designed to run locally using open-source tooling. Cloud-native features are represented conceptually where appropriate.
