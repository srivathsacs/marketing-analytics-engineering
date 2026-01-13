# Marketing Analytics Engineering

This project simulates a **modern marketing analytics warehouse** for a direct-to-consumer ecommerce business.

It transforms **raw ad and ecommerce data** into **analytics-ready tables** that answer questions like:
1. How much revenue did each channel generate?
2. What are CAC, ROAS, and LTV by campaign?
3. Which channels are profitable?

Built with **dbt** using analytics engineering best practices: *staging → facts & dimensions → metrics*.

All data is **synthetic**.

---

## What This Project Shows

- SQL-based transformations  
- Dimensional modeling  
- Data quality testing  
- Marketing performance metrics  

Designed for BI dashboards and reporting.

---

## Architecture


Sources → Raw Tables → dbt Staging → dbt Analytics → BI


---

## What’s Next

1. **Expand dbt**
   - Add more models, tests, and metrics  

2. **Improve schema.yml**
   - Add column tests and business definitions  

3. **Add Fivetran**
   - Ingest Google Ads, Facebook Ads, Shopify, Stripe  

4. **Portfolio polish**
   - Add diagrams and example dashboards  