# Database Project

## Description

This repository contains a database project prepared as the capstone project for the Meta Database Engineer specialization. The database includes a model and data that has been synthetically generated and is not authentic. This project is intended solely for educational purposes.

## Project Structure
## ERD model
- `db-capstone-project/ERD` - directory containing png and svg files with database model
## SQL code
- `complete_database.sql` - SQL script for creating the database schema.
- `forward_engineering_code/forward_engineereing_little_lemon_capstone_project.sql` - SQL script for export model into database by forward engineering in MySQL Workbench.
## All stored procedures are included into complete_database code
- `stored_procedures_code/add_booking_stored_procedure.sql` - SQL script containing code for add booking stored procedure
- `stored_procedures_code/cancel_booking_stored_procedure.sql` - SQL script containing code for cancel booking stored procedure
- `stored_procedures_code/cancel_booking_stored_order.sql` - SQL script containing code for cancel order stored procedure
- `stored_procedures_code/check_booking_stored_procedure.sql` - SQL script containing code for check booking stored procedure
- `stored_procedures_code/get_max_quantity_stored_preocedure.sql` - SQL script containing code for get max quantity stored preocedure
- `stored_procedures_code/manage_booking_alias_add_valid_booking_stored_procedure.sql` - SQL script containing code for manage booking alias add valid_booking stored procedure
- `stored_procedures_code/place_an_order_stored_procedure.sql` - SQL script containing code for place an order stored procedure
- `stored_procedures_code/update_booking_stored_procedure.sql` - SQL script containing code for update booking stored procedure

- `db-capstone-project/prepared_statement_code/GetOrderDetailsPreparedStatement.sql` - SQL script containing code for prepared statement which let get details of an order
## Workbooks and charts created in Tableau
- `db-capstone-project/Workbooks_and_charts` - directory containing charts and workbooks created on the basis of example data from database as well as spreadsheet from the excersise
- `readme.md` - This file, containing a description of the project and additional information.
- `license` - The MIT license file.

## Using the Project

1. Clone the repository:
    ```bash
    git clone https://github.com/MarSzach/db-capstone-project.git
    ```

2. Run the SQL scripts on your database:
The imported database should be set up to run on localhost. 
In order to connect to the database little_lemon_db using the code from the little_lemon_db_client.ipynb notebook, 
it is required to assign the correct login and password values to variables in auth.py file which is not included and should be created on user's own machine.
The login and password should be authorisation credentials from user's own mysql environment 

## Data Information

The data inserted into the database has been generated using synthetic data generation tools. These data are not authentic and are created solely for demonstration purposes.

## License

This project is licensed under the MIT License. See the license file for more details.

