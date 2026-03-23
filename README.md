# HR-Attrition-Analysis-SQL-PowerBI

## 🔎 Overview
This project analyzes employee attrition patterns to uncover key factors influencing workforce turnover. Using **SQL for data auditing, analysis, and derived feature creation**, along with **Power BI for visualization**, the project transforms employee data into actionable insights for HR decision-making.

The analysis identifies high-risk employee segments, investigates key attrition drivers, and provides **data-driven recommendations** to improve retention strategies.

---

## Business Problem Statement
Employee attrition can significantly impact organizational productivity, increase recruitment costs, and disrupt team stability. Understanding the key factors driving employee turnover is critical for HR departments to design effective retention strategies.

---

## ❓ Key Business Questions  
  
- What is the overall attrition rate in the organization?    
- Which departments and job roles experience the highest attrition?  
- Which employee age groups or demographic segments show higher attrition risk?
- How does salary (Monthly Income) influence employee attrition?  
- Does overtime contribute to higher employee attrition?  
- How does the promotion gap impact attrition?  
- How do employee experience factors (job satisfaction, work-life balance, environment) influence attrition?    
- Which employee segments are at the highest risk of attrition based on combined factors?

---

## 🛠️ Project Workflow

### 1️⃣ Data Auditing & Validation
- 🔍 Verified **data types, null values and duplicates** to ensure data integrity  
- 📊 Identified non-informative constant columns (e.g., `EmployeeCount`, `StandardHours`, `Over18`)  
- ⚙️ Derived analytical columns **directly in SQL queries**:  
  - **Promotion Gap Groups:** 0–2 yrs, 3–6 yrs, 7+ yrs  
  - **Income Slabs:** Low, Medium, High  
  - **Age Groups:** <30, 30–45, 45+  
  - **Attrition Risk Segments:** High, Moderate, Medium, Low (combining Income + Overtime + Promotion Gap)  

*Audit queries and summaries are in `1_Data_Auditing_&_Validation/`*

---

### 2️⃣ Exploratory Data Analysis (EDA)
- 📊 SQL-based aggregation and descriptive statistics:
  - Avg Age, Avg Salary,  Total Employees  
  - Attrition Count &  Attrition Rate  
  -  Attrition distribution across Departments, Job Roles, Workload, Compensation, Promotion Gap, and Satisfaction Factors  
- Metrics were prepared for **business analysis and visualization**  

---

### 3️⃣ Business Analysis (SQL)
- Answered key business questions:  
  -  Which Departments / Job Roles experience the highest attrition?  
  -  Does Salary, ⏱ Overtime, or 📉 Promotion Gap influence attrition?  
  -  Which Employee Segments are high-risk?  
- Derived groups and **risk segments entirely within SQL queries**  
- Queries are in `3_Business_Analysis_SQL/business_queries.sql`  

---

### 4️⃣ Power BI Visualizations
- 📊 Created **view using sql** and imported into Power BI for dashboards  
- Visualizations highlight:  
  -  Attrition by Department, Job Role, and Demographics  
  -  Compensation vs Attrition trends  
  -  Overtime & Promotion Gap impact  
  -  High-Risk Employee Segments  
- Dashboard file: `4_PowerBI_Visualizations/dashboards.pbix`  
- Screenshots for quick review: `4_PowerBI_Visualizations/visuals_screenshots/`  

---

## 📊 Key Insights  

The Macro View  
- Overall attrition rate is **16.12%**, serving as the baseline for identifying high-risk segments  

Who is Leaving?  
- Highest attrition among **young employees (18–30): 25.91%**  
- Early tenure (**0–2 years: 29.82%**) shows maximum exits  
- **Entry-level (Job Level 1): 26.34%** most affected  

👉 Early-career employees are the most vulnerable segment  

Where is Attrition Highest?  
- **Sales Representatives: 39.76%**  
- **Laboratory Technicians: 23.94%**  

👉 Attrition is concentrated in specific roles, not organization-wide  

Why are Employees Leaving?  

- **Overtime impact:**  
  30.53% (overtime) vs 10.44% (non-overtime)
  
  Work-Life Balance: Identified a 66.6% attrition trigger specifically among Sales representatives who frequently work Overtime.

- **Low income effect:**  
  ≤ 5,000 income group → 21.76% attrition  

- **Promotion–salary paradox:**  
  Early promotions (0–2 years) still show high attrition due to low salary  

- **Career stagnation:**  
  Long promotion gaps (6+ years) increase attrition  

- **Employee experience impact:**  
  Low job satisfaction, poor work-life balance (31.25%), and low environment satisfaction (25.35%) are strongly associated with higher attrition  

High-Risk Segment (Key Finding)  

- **Low Income + Overtime + No Promotion (6+ years)**  
- 👉 **70% attrition rate**  

👉 This segment represents the most critical retention risk  

---

### 🧠 Final Insight  

Attrition is driven by the **interaction of compensation, workload, career growth, and employee experience**, not individual factors.  

👉 Multi-factor analysis is essential to identify and address high-risk employee segments  

---
## 🧠 Strategic Synthesis & Recommendations
Attrition is rarely driven by a single factor; it is the **compounding effect** of financial dissatisfaction and physical burnout. 

1. **Targeted Retention:** Prioritize salary benchmarking for the "0-2 year promotion" group to ensure "dry promotions" (title change without pay) are avoided.
2. **Workload Optimization:** Review Sales department structures to mitigate the 66.6% "Overtime Trigger."
3. **Data-Driven Culture:** Move from reactive hiring to proactive retention by monitoring these identified "High-Risk" segments in real-time within the Power BI dashboard.
**Recommendations:**  
- 💰 Adjust compensation for underpaid roles  
- 📈 Provide promotions and career growth opportunities  
- ⏱ Monitor and manage overtime in high-risk departments  


---

## 🛠️ Tools & Technologies
- **SQL:** Data auditing, derived columns, business analysis  
- **Power BI:** Interactive dashboards using SQL-aggregated data  
- **Git/GitHub:** Version control and project documentation  

---


