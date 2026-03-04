# Data Dictionary

This folder contains the raw datasets for "The Look" eCommerce project. 

## Tables Overview

### 1. users.csv
Contains customer profiles and demographic data.
* **Key Columns:** `id`, `age`, `gender`, `country`, `traffic_source`.

### 2. products.csv
The product catalog including financial cost data.
* **Key Columns:** `id`, `cost`, `retail_price`, `category`, `brand`.

### 3. order_items.csv
The core transactional table. Each row represents an item in an order.
* **Key Columns:** `id`, `order_id`, `user_id`, `product_id`, `status`, `sale_price`, `created_at`.

### 4. orders.csv
High-level order information.
* **Key Columns:** `order_id`, `user_id`, `status`, `created_at`, `num_of_item`.

---
**Source:** [Looker Ecommerce Dataset (Kaggle)](https://www.kaggle.com/datasets/mustafakeser4/looker-ecommerce-bigquery-dataset)
