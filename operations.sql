-- Expression with the highest number of new unicorns 
WITH cte_1 AS (
    -- Counting distinct industries and their new unicorn counts
    SELECT DISTINCT(i.industry), COUNT(i.*) AS new_unicorns
    FROM industries i
    JOIN dates d ON i.company_id = d.company_id
    WHERE EXTRACT(YEAR FROM d.date_joined) IN (2019,2020,2021)
    GROUP BY i.industry
    ORDER BY new_unicorns DESC
    LIMIT 3
),
-- Expression with yearly unicorn counts and average valuation
cte_2 AS (
    -- Aggregating yearly unicorn counts and average valuation by industry
    SELECT i.industry, EXTRACT(YEAR FROM d.date_joined) AS year, COUNT(i.*) AS num_unicorns, AVG(f.valuation) AS average_valuation
    FROM industries i
    JOIN dates d ON i.company_id = d.company_id
    JOIN funding f ON i.company_id = f.company_id
    WHERE EXTRACT(YEAR FROM d.date_joined) IN (2019,2020,2021) AND i.industry IN (SELECT industry FROM cte_1)
    GROUP BY industry, year
)
-- Final result 
SELECT industry, year, num_unicorns, ROUND(AVG(average_valuation / 1000000000), 2) AS average_valuation_billions
FROM cte_2
GROUP BY industry, num_unicorns, year, average_valuation
ORDER BY industry, year DESC;
