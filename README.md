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
  - 🏢 Which Departments / Job Roles experience the highest attrition?  
  - 💰 Does Salary, ⏱ Overtime, or 📉 Promotion Gap influence attrition?  
  - ⚠️ Which Employee Segments are high-risk?  
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

### 5️⃣ Insights & Recommendations

## The Macro View (Baseline Metric)
* **Overall Attrition Rate: 16.12%**

Workforce Segmentation (The "Who")
* **Generational Risk:** Attrition is highest among **Young Employees (18–30) at 25.91%**.
* **The Onboarding Gap:** Early tenure (**0–2 years**) shows a peak exit rate of **29.82%**.
* **Job Level Volatility:** **Entry-level (Level 1)** positions are the most unstable at **26.34%**.
* 👉 **Insight:** The organization faces a "leaky bucket" problem with early-career talent, suggesting a gap in long-term value propositions for new hires.

Operational Hotspots (The "Where")
* **Departmental Outliers:** Attrition is not uniform; it is concentrated in **Sales (39.76%)** and **Laboratory Technicians (23.94%)**.
* **The Overtime Multiplier:** In a bivariate analysis, **Sales Representatives working Overtime** reached a critical attrition rate of **66.6%**. 
* 👉 **Insight:** Operational pressure (Overtime) is the primary "trigger" that turns a high-pressure role into an unsustainable one.

Diagnostic Drivers (The "Why")
* **The Overtime Correlation:** Employees working Overtime are **3x more likely to exit** (30.53%) than their peers (10.44%).
* **The Promotion–Salary Paradox:** Data reveals that employees in the **0–2 year promotion bracket** still exhibit high attrition. 
    * **Root Cause:** Average salary for this group remains below retention thresholds. A title change without a competitive market adjustment is insufficient for retention.
* **Career Stagnation:** Stagnation becomes a flight risk after **6+ years** without a promotion, regardless of previous loyalty.
* **Sentiment Drivers:** Low **Work-Life Balance (31.25%)**, **Environment Satisfaction (25.35%)**, and **Job Satisfaction** scores serve as leading indicators for future turnover.

The "Perfect Storm" (Key Finding)
Through advanced SQL filtering and segment naming, I identified the most critical retention risk:
* **High-Risk Profile:** Employees with **Low Income + Overtime + 6+ Year Promotion Gap**.
* **Result:** **70% Attrition Rate.**
* 👉 **Strategic Takeaway:** This segment represents a predictable failure point. Addressing even one factor (e.g., eliminating overtime for this group) could significantly lower the probability of exit.

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
