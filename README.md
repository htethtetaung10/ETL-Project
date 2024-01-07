**Python Project for ETL Process**

This project performs ETL process for operating flight revenue analysis by using Python, Pandas and PostgreSQL. The data used in this project is from Bureau of Transportation Statics website (https://www.transtats.bts.gov/Data_Elements.aspx?Data=2).

For ETL process, first extract data from csv files. Second, transform extracted data into passenger load factor as mentioned above. In this stage, PLF is calculated for domestic and international respectively. Third, the transformed data and revenue data from extracted data are loaded into PostgreSQL database. Regarding database testing, some rows from the respective tables are retrieved to make sure that the loaded data is correct.
