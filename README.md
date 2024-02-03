

# Olist Data Transformation: A dbt Project
This project delves into the Olist e-commerce platform dataset, leveraging the power of Snowflake, a modern cloud-based data warehouse, and dbt for data transformation and modeling. It showcases skills in data cleaning, transformation logic, building dimensional and fact tables following a star schema approach, and ultimately utilizing the transformed data for insights and visualization in Power BI.

## Table of Contents

- [Key Features](#keyfeatures)
- [Technical Details](#technical-details)
- [Project Structure](#project-structure)
- [Visualisation](#visualisation)

## Key Features

- Utilizes dbt to perform various data transformations on the raw Olist dataset.
- Implements data cleaning, formatting, and derivation of new metrics.
- Builds a multi-layered dbt project structure with "stage", "intermediate", and "mart" models.
- Employs dimensional and fact tables following a star schema for efficient data analysis.
- Provides a foundation for further exploration and visualization in Power BI.

## Technical Details

- Data source: Olist dataset 
- Transformation tool: dbt
- Data Warehouse: Snowflake
- Modeling approach: Star schema with dimensional and fact tables 
- Visualization tool: Power BI


## Project Structure

### Olist RAW Data structure:

![data](https://i.imgur.com/HRhd2Y0.png)

### Stage Models:
- Handled missing values and formatting.
- Following stage models are built and materialized as views:
  
  ![stage models](https://github.com/ToghrulJabbarli/olist/blob/main/screenshots/view.png)
  
### Intermediate Models:
- Most of the joins and aggregations are done in this stage.
- Dimensional tables of customers, products, seller and fact table of orders are created.
  
### Mart Models:
- Business specific models are created such as orders_by_time, products_by_category and seller_performance.

#### Intermediate and Mart models are materialized as tables:

![stage models](https://github.com/ToghrulJabbarli/olist/blob/main/screenshots/tables.png)


## Visualisation
- Visualised result using Power BI.

![stage models](https://github.com/ToghrulJabbarli/olist/blob/main/screenshots/powerbi_sheet.png)

  
### Impacts
- Revenue growth of 18.4% from 2017 to 2018, exceeding industry average and demonstrating strong business performance. This significant increase showcases the effectiveness of our marketing and sales strategies.
- Identifying 'beleza e saude'(beauty and health) as the highest revenue-generating category allowed us to tailor targeted promotions and product offerings, potentially contributing to the observed revenue growth.
- Maintaining an average delivery time of 12.65 days across a large order volume indicates efficient logistics and fulfillment operations, potentially leading to higher customer satisfaction and repeat business
- By understanding the most popular category ('cama_mesa_banho' eng:bedclothes, table dressing and bath towels), we can optimize inventory management and allocate resources strategically, potentially improving order fulfillment speed and customer satisfaction.
