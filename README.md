📊 Stack Overflow Developer Insights Dashboard
An End-to-End Business Intelligence Project using SQL & Power BI

📌 Project Overview
The objective of this project was to transform raw, unstructured survey data from the Stack Overflow Annual Developer Survey Dataset into an executive-ready business intelligence solution. The final interactive dashboard provides actionable insights into global developer compensation, technology stack premiums, experience ROI, and the evolution of modern remote/hybrid work models.

🛠️ Tech Stack & Tools Used
Data Extraction & Engineering: SQL (Structured Query Language)

Business Intelligence & Visualization: Microsoft Power BI

Data Modeling: Relational Modeling (Star Schema implementation)

Analytics Expressions: DAX (Data Analysis Expressions)

🗄️ Phase 1: Data Engineering & Transformation (SQL)
Before visualizing, the raw dataset required intensive preprocessing to ensure data integrity and query efficiency.

Data Cleansing: Authored optimized SQL scripts to handle missing records, filter out outlier salary noise, and standardize inconsistent categorical responses.

Database Normalization: Deconstructed massive flat-file survey records into organized relational tables, optimizing columns and constraints for storage efficiency.

Feature Engineering: Leveraged SQL conditional logic (CASE WHEN) and window functions to group continuous variables (such as years of experience) into logical analytical segments (Experience Groups).

📈 Phase 2: Data Modeling & Analytics (Power BI)
1. Relational Architecture
Instead of loading a single flat table, I built a highly performing Star Schema within Power BI by establishing proper 1:to-many relationships between the SQL-derived Fact and Dimension tables. This architecture ensures instantaneous cross-filtering response times when users interact with visual objects.

2. DAX Calculations
Engineered custom Data Analysis Expressions (DAX) to handle dynamic calculations regardless of the active filter context:

Total Respondents: Calculates unique survey participants dynamically using distinct count logic.

Weighted Average Salary: Computes real-time salary averages across disparate dimensions.

🎨 Phase 3: Dashboard Architecture & UI/UX Design
The dashboard was engineered with strict adherence to modern corporate report design practices to optimize the end-user's cognitive load:

Executive Visual Hierarchy: Designed using a top-down scanning methodology. High-level metric anchors (Total Respondents, Average Salary) capture immediate attention, leading seamlessly into secondary breakdown dimensions.

Interactive Navigation UX: Integrated a space-saving Dropdown Search Slicer for country-level filtering. By leveraging text-indexing, end-users can target individual regional markets (e.g., Sri Lanka) without disrupting the layout.

Direct Labels Over Legends: Configured localized category and percentage data labels directly onto the Workplace Donut Chart slices. This removes color-legend dependency, accelerating data reading speeds.

<img width="745" height="470" alt="Screenshot 2026-07-05 145508" src="https://github.com/user-attachments/assets/37418a2e-83ce-4bd5-85ef-b891cb488a81" />

💡 Key Analytical Insights Delivered
Tech Stack Premium: Successfully isolated niche programming languages and databases that command a higher salary premium in the global tech ecosystem.

Workplace Dynamics: Visualized the salary index difference between Remote, Hybrid, and In-person development roles, validating the monetary scale of flexible work frameworks.

Experience ROI: Highlighted specific career milestones where compensation scales exponentially with experience.

🏆 Key Skills Demonstrated
Advanced SQL Data Manipulation

Relational Data Modeling (Star Schema)

Business Intelligence UI/UX Architecture

Advanced DAX Engineering

Strategic Data Storytelling
