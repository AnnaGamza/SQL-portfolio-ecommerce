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

---

## Step 1: General Business Metrics
Analysis of financial performance and operational efficiency for "The Look" eCommerce.

### Key Scripts:
- **01_monthly_sales_analysis.sql**: Tracks Monthly Revenue, Profit, and AOV trends.
- **02_annual_revenue_leakage.sql**: Quantifies "Revenue Leakage" (Cancellations/Returns) using Window Functions (`PARTITION BY`).

### Business Value:
- **Leakage Audit**: Identified that ~25% of potential revenue is lost due to non-completed orders.

---

## Step 2: User & Market Analysis
Deep dive into customer demographics and brand loyalty patterns.

### Key Scripts:
- **03_top_countries_demographics.sql**: Global market share and Average Order Value (AOV) by country.
- **04_customer_retention.sql**: Annual breakdown of New vs. Returning customers using Window Functions (`ROW_NUMBER`).

### Business Value:
- **High-Value Markets**: Identified UK as a top AOV market despite lower volume compared to China.
- **Retention Trends**: Monitored the growth of "Returning Customers" to evaluate brand stickiness.
- **Data Integrity**: Handled "multi-item order" duplicates by grouping timestamps before analysis.

---

## Step 3: Inventory & Product Analysis
Comprehensive evaluation of category profitability, bestsellers, and supplier quality control.

### Key Scripts:
- **05_category_profitability.sql**: Calculates net profit and margins across 26 categories.
- **06_top_selling_products.sql**: Identifies high-volume "Star" products by revenue contribution.
- **07_high_risk_brands.sql**: Analyzes Brand Return Rates by filtering out non-shipped orders for precision.

### Business Value:
- **Margin Leaders**: Found that **Suits & Sport Coats** yield the highest efficiency (~60% margin).
- **Quality Audit**: Flagged brands like **Vintage** and **Glamourmom** with >30% return rates, indicating potential sizing/quality issues.
- **Data Integrity**: Used `NULLIF` and status-specific filtering to ensure accurate return metrics, avoiding data inflation from cancelled orders.
