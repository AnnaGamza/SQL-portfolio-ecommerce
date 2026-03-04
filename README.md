# SQL-portfolio-ecommerce
## Step 0: Environment Setup & Data Ingestion
Before starting the analysis, the working environment was configured to ensure data integrity and performance.

### Key Actions:
- **Database Setup**: Created a PostgreSQL database named `ecommerce_project`.
- **Data Modeling**: Defined schemas for 4 main tables (`users`, `products`, `orders`, `order_items`) using optimized data types:
  - `NUMERIC` for financial accuracy in prices and costs.
  - `TIMESTAMP` for time-series analysis.
- **Data Loading**: Verified data import from CSV files into PostgreSQL.
- **Logical Integrity**: Established logical relationships between the Fact table (`order_items`) and Dimension tables (`products`, `users`) based on the ER diagram.
