# Big Data Engineering Project on Azure

## Project Overview
This is a Big Data Engineering Project on Azure. Data will be ingested from 2 data sources and ingested into the Data Lake in Azure. After data transformation and running a Machine Learning model, the results are sent back to the Data Lake. Then, Azure Synapse is used to connect to the Data Lake and generate reports.


## About Data
### Data Background
This dataset is from StackOverflow, a famous online IT developer community. The dataset records daily online posts, including post types and users' information.

The dates in the dataset have been modified to be current. Therefore, every day you will see today's Posts data. The 3 tables are located in 2 data sources: RDS and Azure Storage Blob Container.

- **RDS:** The Users and PostTypes tables are stored on an RDS Postgres database and need to be updated weekly.
  - Host: `de-rds.czm23kqmbd6o.ca-central-1.rds.amazonaws.com`
  - Master username: `postgres`
  - Password: `Password`
  - Database: `stack`
  - Port: `5432`

- **Azure Storage Blob:** The daily Posts data files are in parquet format, stored under the storage account `wcddestorageexternal`, container `de-project-st`, and folder `Posts_today`.
  - Storage account access key: `Storage account access key`

## Business Requirements
### Data Lake Requirements
- Create a Data Lake with hierarchical namespace.
- Use Azure Data Factory for data ingestion and processing.
- Connect to an AWS RDS Postgres database and ingest PostTypes and Users tables weekly.
- Connect to a WeCloudData Azure blob container to copy daily Posts parquet files into the Data Lake.

### Machine Learning Process Requirements
- Create a Databricks notebook to process data and feed it into a Machine Learning model.
- The model classifies the topic of each post and outputs the results.
- Use Spark to list and order topics by their numbers.

### Chart Requirements
- Create a chart on Synapse displaying the top 10 topics of the day.

## Project Infrastructure
All infrastructure is built on Azure:
- **Azure Data Lake:** For storing ingested files, Machine Learning data, and output files.
- **Azure Data Factory (ADF):** For the entire pipeline from data ingestion to Machine Learning.
- **Azure Synapse:** For data analysis and generating reports.

## Part One: Data Ingestion
1. **Connect to Postgres Database and Azure Blob Container:**
   - Use Azure Data Factory to ingest Users and PostTypes tables from the Postgres database to the Data Lake.
   - Connect to Azure Storage to copy the Posts files daily.

## Part Two: Data Transformation
1. **Data Transformation in Azure Data Factory:**
   - Create a Databricks notebook to run data transformation and Machine Learning.
   - Output results for BI dashboards.

## Part Three: Data Visualization
1. **Use Synapse to generate a chart displaying the top 10 topics.**

## Implementation Details
### Data Lake
- Create a storage account with hierarchical namespace enabled.
- Create a container named `bd-project` with folders for `postTypes`, `Users`, and `Posts`.

### Data Factory
- Create two pipelines:
  1. `copyOnceWeek`: Copies PostTypes and Users tables weekly.
  2. `copyPostsEveryday`: Copies daily Posts files.

- Create linked services and datasets for connecting to the data sources and destinations.
- Create copy and delete activities in the pipelines to manage the data flow.

### Databricks Integration
1. **Create an Azure Databricks workspace, compute cluster, and notebook.**
2. **Allow Databricks to access your Storage container:**
   - Register an app in Azure and assign it the role of Storage Blob Data Contributor.
3. **Mount your Storage container to the Databricks directory:**
   - Use the provided script to mount the storage container.

### Model Deployment
1. **Create a Databricks notebook for model deployment.**
2. **Generate a summary file with topics and quantities for BI reports.**
3. **Add the Databricks activity to the Data Factory pipeline.**

## License
Specify the license under which your project is distributed.

