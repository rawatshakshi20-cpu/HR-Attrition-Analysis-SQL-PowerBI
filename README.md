# HR-Attrition-Analysis-SQL-PowerBI

# HR Attrition Analysis – IBM Dataset

## 🔎 Overview
This project analyzes employee attrition patterns to uncover key factors influencing workforce turnover. Using **SQL for data auditing, analysis, and derived feature creation**, along with **Power BI for visualization**, the project transforms employee data into actionable insights for HR decision-making.

The analysis identifies high-risk employee segments, investigates key attrition drivers, and provides **data-driven recommendations** to improve retention strategies.

---

## 🛠️ Project Workflow

### 1️⃣ Data Auditing & Validation
- 🔍 Verified **data types, null values and duplicates** to ensure data integrity  
- 📊 Identified non-informative constant columns (e.g., `EmployeeCount`, `StandardHours`, `Over18`)  
- ⚙️ Derived analytical columns **directly in SQL queries**:  
  - 📈 **Promotion Gap Groups:** 0–2 yrs, 3–6 yrs, 7+ yrs  
  - 💰 **Income Slabs:** Low, Medium, High  
  - 🎂 **Age Groups:** <30, 30–45, 45+  
  - ⚠️ **Attrition Risk Segments:** High, Moderate, Medium, Low (combining Income + Overtime + Promotion Gap)  

*Audit queries and summaries are in `1_Data_Auditing_&_Validation/`*

---

### 2️⃣ Exploratory Data Analysis (EDA)
- 📊 SQL-based aggregation and descriptive statistics:
  - 🎂 Avg Age, 💰 Avg Salary, 👥 Total Employees  
  - ❌ Attrition Count & 🔹 Attrition Rate  
  - 📍 Attrition distribution across Departments, Job Roles, Workload, Compensation, Promotion Gap, and Satisfaction Factors  
- Metrics were prepared for **business analysis and visualization**  

---

### 3️⃣ Business Analysis (SQL)
- Answered key business questions:  
  - 🏢 Which Departments / Job Roles experience the highest attrition?  
  - 💰 Does Salary, ⏱ Overtime, or 📉 Promotion Gap influence attrition?  
  - ⚠️ Which Employee Segments are high-risk?  
- Derived groups and **risk segments entirely within SQL queries**  
- Queries are in `3_Business_Analysis_SQL/business_queries.sql`  

---

### 4️⃣ Power BI Visualizations
- 📊 Created **views from SQL queries** and imported into Power BI for dashboards  
- Visualizations highlight:  
  - 🏢 Attrition by Department, Job Role, and Demographics  
  - 💰 Compensation vs Attrition trends  
  - ⏱ Overtime & Promotion Gap impact  
  - ⚠️ High-Risk Employee Segments  
- Dashboard file: `4_PowerBI_Visualizations/dashboards.pbix`  
- Screenshots for quick review: `4_PowerBI_Visualizations/visuals_screenshots/`  

---

### 5️⃣ Insights & Recommendations
**Early Career Attrition (0–2 years):**  
- 💰 Low salary + ⏱ High overtime → early exits  

**Late Career Attrition (7+ years):**  
- 📉 Career stagnation + lack of promotion → turnover despite higher salary  

**High-Risk Segment:**  
- ⚠️ Low Income + ⏱ Overtime + 📉 Long Promotion Gap  

**Recommendations:**  
- 💰 Adjust compensation for underpaid roles  
- 📈 Provide promotions and career growth opportunities  
- ⏱ Monitor and manage overtime in high-risk departments  

*Full insights are in `5_Insights_&_Recommendations/insights_recommendations.md`*

---

## 🛠️ Tools & Technologies
- **SQL:** Data auditing, derived columns, business analysis  
- **Power BI:** Interactive dashboards using SQL-aggregated data  
- **Git/GitHub:** Version control and project documentation  

---

## 🚀 How to Run
1. Clone the repository:
```bash
git clone https://github.com/yourusername/HR-Attrition-Analysis-IBM-Dataset.git
