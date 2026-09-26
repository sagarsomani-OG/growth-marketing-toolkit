# growth-marketing-toolkit
# 📈 Growth Marketing & Experimentation Toolkit

A curated collection of operational frameworks, analytical SQL models, experimentation playbooks, and go-to-market templates designed for data-driven B2B/B2C growth teams.

---

## 🎯 Purpose

Modern growth sits at the intersection of data analysis, rapid experimentation, and structured product marketing. This repository serves as a repeatable operating system for:
- Prioritizing and executing high-velocity A/B tests.
- Querying core SaaS/product retention and unit economics metrics.
- Running disciplined go-to-market launches with clear tiering.

---

## 📁 Toolkit Modules

### 1. Experimentation & CRO (`/01_experimentation`)
- **ICE / RICE Scoring Matrix**: Standardized formula to evaluate Impact, Confidence, and Ease across backlogs.
- **A/B Test Run-Rate Guide**: Guardrails against early stopping, sample ratio mismatches (SRM), and false positives.
- **Debrief Template**: A single-page summary documenting winners, losers, and next iterations.

### 2. Analytics & SQL Queries (`/02_analytics_and_sql`)
- **User Retention Cohorts (`user_retention_cohorts.sql`)**: Monthly/weekly rolling cohort retention using window functions.
- **LTV/CAC Payback Models**: Queries to track blended vs. paid customer acquisition costs and payback periods.
- **Churn Waterfall**: Monthly recurring revenue (MRR) expansion, contraction, and churn tracking.

### 3. Product Marketing & GTM (`/03_gtm_and_positioning`)
- **Launch Tiering Framework (Tier 1 to 3)**: Resource allocation rules based on feature impact and audience size.
- **Feature Adoption Checklist**: Cross-functional checklist across product, lifecycle email, and paid channels.

### 4. Attribution & Media Planning (`/04_attribution_and_paid`)
- **Blended ROAS vs. Marketing Efficiency Ratio (MER)**: Guidelines for navigating post-privacy multi-touch attribution.
- **Budget Reallocation Model**: Framework for moving capital toward marginal efficiency.

---

## 🚀 Quick Usage

### Using SQL Queries
All queries in `/02_analytics_and_sql` are written in ANSI SQL and compatible with standard data warehouses (Snowflake, BigQuery, PostgreSQL). 

Adjust the table alias schema at the top of each query to match your event tracking structure:
\`\`\`sql
-- Replace with your platform's event table
WITH base_events AS (
    SELECT user_id, event_timestamp, event_name
    FROM analytics.events
)
\`\`\`

---

## 🤝 Contributing & License
Contributions, feedback, and issue submissions are welcome. Licensed under the [MIT License](LICENSE).
