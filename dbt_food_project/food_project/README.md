food_project
📖 Project Overview
food_project is a dbt (data build tool) project designed to transform, clean, and model restaurant data from multiple sources (CSV, JSON, Excel) and make it analytics-ready in Google BigQuery. The project follows modern data engineering best practices, organizing data models into clear stages: staging, dimensions, and facts.

🚀 Objectives
Consolidate and standardize restaurant data from various raw sources.

Build modular data models (staging, dimensions, facts) to support analytics and reporting.

Ensure data quality and documentation using dbt’s testing and documentation features.

Enable analysts and data scientists to access reliable, well-structured data.

🏗️ Project Structure
text
food_project/
│
├── models/
│   ├── staging/       # Raw data cleaning and preparation (stg)
│   ├── dimensions/    # Dimension tables (dim)
│   ├── facts/         # Fact tables (fact)
│   └── marts/         # (Optional) Data marts for business use cases
│
├── seeds/             # Reference or seed data
├── macros/            # Custom SQL macros
├── tests/             # Custom data tests
├── analyses/          # Ad-hoc analyses or exploratory queries
├── snapshots/         # Data versioning and change tracking
├── dbt_project.yml    # Project configuration (see attached file)
└── README.md          # Project documentation (this file)
⚙️ Getting Started
Install Requirements

Python 3.8+

dbt-core and dbt-bigquery:

bash
pip install dbt-core dbt-bigquery
Configure BigQuery Connection

Create a profiles.yml in your ~/.dbt/ directory with your BigQuery project and credentials.

Run dbt Models

bash
dbt run
Run Data Quality Tests

bash
dbt test
Generate and View Documentation

bash
dbt docs generate
dbt docs serve
🗂️ Data Sources
Restaurants: Main data from CSV, JSON, and Excel files, loaded into the resturant table in BigQuery.

Country Codes: Reference data from Excel.

🧩 Data Modeling Stages
Staging (stg_): Cleans and standardizes raw source data.

Dimensions (dim_): Descriptive tables (e.g., restaurants, countries).

Facts (fact_): Transactional or event tables (e.g., ratings, orders).

Marts: (Optional) Curated tables for analytics and reporting.

🛡️ Data Quality & Documentation
Column-level tests like not_null and unique are applied to key fields.

All models and columns are documented in schema.yml files.

Interactive documentation can be generated and browsed using dbt docs.

📚 Resources
dbt documentation

Discourse Q&A

dbt Community Slack

dbt Events

dbt Blog

📝 Notes
Always use the correct BigQuery Project ID in your configuration.

You can add more models, tests, or documentation as your project grows.

For questions or contributions, open an Issue or Pull Request on GitHub.