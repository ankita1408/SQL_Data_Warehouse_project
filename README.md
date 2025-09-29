# 🧠 Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive **data warehousing and analytics solution**, from building a data warehouse to generating actionable insights.  

Designed as a **portfolio project**, it highlights **industry best practices** in data engineering and analytics — following the **Medallion Architecture (Bronze, Silver, Gold layers)** for scalability and clarity.

---

## 🏗️ Data Architecture

The project follows **Medallion Architecture**, with three key layers:

- **Bronze Layer:** Stores raw data as-is from the source systems. Data is ingested from CSV files into SQL Server Database.  
- **Silver Layer:** Cleansed and standardized data, ready for integration and analysis.  
- **Gold Layer:** Business-ready data modeled into a **Star Schema** for reporting and analytics.

![Data Warehouse Architecture](docs/DATA%20WAREHOUSE-Architeture.drawio.png)

---

## 📖 Project Overview

This project demonstrates the full data engineering and analytics lifecycle:

- **Data Architecture:** Designing a modern data warehouse using Medallion layers.  
- **ETL Pipelines:** Extracting, transforming, and loading data from ERP and CRM sources.  
- **Data Modeling:** Building fact and dimension tables optimized for analytical queries.  
- **Analytics & Reporting:** Creating SQL-based reports and dashboards for actionable insights.

---

## 🎯 Skills and Roles Showcased

This project is ideal for showcasing your expertise in:

- SQL Development  
- Data Architecture  
- Data Engineering  
- ETL Pipeline Development  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Tools and Resources

Everything used here is **free and open source**!  

- **Datasets:** CSV files (ERP and CRM data sources)  
- **SQL Server Express:** Lightweight SQL Server instance  
- **SQL Server Management Studio (SSMS):** GUI for SQL operations  
- **Git & GitHub:** Version control and project hosting  
- **DrawIO:** Architecture and data model diagrams  
- **Notion:** Project management and documentation  

---

## 🚀 Project Requirements

### 🏗️ Building the Data Warehouse (Data Engineering)

**Objective:**  
Develop a modern data warehouse using **SQL Server** to consolidate sales data and enable analytical reporting.

**Specifications:**

- Import data from **ERP and CRM** (CSV files)  
- Clean and standardize data for analytics  
- Integrate sources into a single data model  
- Model data using **Star Schema**  
- Document architecture and naming conventions

---

### 📊 Analytics & Reporting (Data Analysis)

**Objective:**  
Use SQL-based analytics to deliver insights into:

- Customer Behavior  
- Product Performance  
- Sales Trends  

These insights help stakeholders make **data-driven decisions**.

---

## 🧱 Project Documentation

Explore all supporting documentation and visuals:

| File | Description |
|------|--------------|
| [DATA WAREHOUSE - Architecture](docs/DATA%20WAREHOUSE-Architecture.drawio.png) | Visual overview of the data warehouse architecture |
| [DATA WAREHOUSE - Data Flow](docs/DATA%20WAREHOUSE-Data%20Flow.drawio.png) | End-to-end data flow across layers |
| [DATA WAREHOUSE - Data Layers](docs/DATA%20WAREHOUSE-Data%20layers.drawio.png) | Breakdown of Bronze, Silver, and Gold layers |
| [DATA WAREHOUSE - ETL](docs/DATA%20WAREHOUSE-ETL.drawio.png) | ETL pipeline design and transformations |
| [Data Catalog](docs/data_catalog.md) | List of datasets, fields, and metadata |
| [Naming Conventions](docs/naming_conventions.md) | Table and column naming standards |

---

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/ # Raw datasets (ERP and CRM)
├── docs/ # Documentation and visuals
├── scripts/ # SQL scripts for ETL and transformations
│ ├── bronze/ # Extract and load raw data
│ ├── silver/ # Clean and transform data
│ ├── gold/ # Create analytical models
├── tests/ # Data quality and validation tests
├── README.md # Project overview
├── LICENSE # License 
```



---

## 🧠 Key Learnings

Through this project, I practiced:

- Implementing **end-to-end data pipelines** using SQL Server  
- Designing **Medallion Architecture** (Bronze, Silver, Gold)  
- Applying **data cleansing, transformation, and modeling**  
- Building **analytical queries** for real-time insights  
- Using **Git/GitHub** for version control and collaboration  

---

## 📈 Example Insights

Some key insights generated from this project include:

- 📊 **Top 10 Products** by revenue and quantity sold  
- 💹 **Monthly Sales Trends** and growth metrics  
- 👥 **Customer Segmentation** by purchase frequency and value  
- 🏆 **Best Performing Regions** and products  

---

## 💡 Future Enhancements

Planned future upgrades to make the project even better:

- 🔄 Automate ETL using **Python or Azure Data Factory**  
- 📈 Build **Power BI dashboards** for data visualization  
- 🧮 Add **incremental loading** and data historization  
- ☁️ Explore **cloud deployment** on Azure or AWS  

---
📜 License

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.


