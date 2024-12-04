# Sam's Subs Data Warehouse (DATA 5360 Group 6)

This project implements a data warehouse for Sam's Subs restaurant chain using dbt (data build tool). The data warehouse follows a dimensional modeling approach with fact and dimension tables to enable efficient analytics and reporting.

## Project Structure

The data warehouse consists of the following key models:

### Dimension Tables

- **dim_customer**: Customer information including:

  - Customer ID and name
  - Date of birth
  - Contact details (phone number)

- **dim_date**: Calendar dimension with:

  - Date attributes (day, month, quarter, year)
  - Day of week/month
  - Week of year

- **dim_employee**: Employee details containing:

  - Employee ID and name
  - Date of birth

- **dim_product**: Product information with:

  - Product ID and name
  - Unit price
  - Sandwich details (length, bread type)

- **dim_store**: Store location details including:
  - Store ID
  - Address information (street, city, state, zip)

### Fact Tables

- **fact_inventory**: Tracks inventory changes including:

  - Product, store, employee and date keys
  - Quantity changes

- **fact_orderline**: Order line item transactions with:
  - Product, store, customer and employee keys
  - Order date and number
  - Quantity, unit price and points earned

### Source Data

The data is sourced from raw ingest tables in the following schema within snowflake

GROUP6PROJECT.RAW_SAMSSUBS:

- s_Customer: Raw customer data
- s_Employee: Raw employee records
- s_Order: Order header information
- s_OrderLineItem: Order line item details
- s_Product: Product catalog data
- s_Sandwich: Sandwich specifications
- s_Store: Store location data

## Development

This project is built using:

- dbt for data transformation and modeling
- Snowflake as the storage layer
- Python for data validation and testing

## Getting Started

1. Install dbt and configure your data warehouse connection
2. Run `dbt deps` to install dependencies
3. Run `dbt build` to create the models
4. Run `dbt test` to validate the data

## Documentation

Model documentation is maintained in YAML files with descriptions for tables and columns. Tests are configured to ensure data quality and referential integrity.

## Tableau Visuals

Attached in this repository is a Tableau workbook that visualizes the data warehouse. Open up the workbook and connect to the data warehouse to explore the data.
