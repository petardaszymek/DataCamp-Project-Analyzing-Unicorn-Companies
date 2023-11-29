# DataCamp-Project-Analyzing-Unicorn-Companies
This SQL script analyzes trends in high-growth companies based on a provided unicorns database. The goal is to identify the top-performing industries in terms of new unicorns and their average valuations.

1. **Common Table Expression (CTE) for Top Industries:** 
   - `cte_1` counts the distinct industries and their new unicorn counts, focusing on the years 2019, 2020, and 2021. It selects the top 3 industries by the number of new unicorns.

2. **Common Table Expression (CTE) for Yearly Unicorn Counts and Average Valuation:**
   - `cte_2` aggregates the yearly unicorn counts and average valuation for the selected industries from `cte_1`. It filters the data for the years 2019, 2020, and 2021.

3. **Final Result:**
   - The main query selects the industry, year, number of unicorns, and the rounded average valuation in billions. It groups the results by industry, number of unicorns, year, and average valuation, ordered by industry and year in descending order.

This query provides valuable insights into industry trends, helping the investment firm make informed decisions about structuring their portfolio based on the emergence of high-value companies.
