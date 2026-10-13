SELECT
CASE WHEN risk_score < 150 THEN 'Low Risk'
WHEN risk_score < 300 THEN 'Medium Risk' ELSE 'High Risk' END risk_band,
CASE WHEN profit >= (SELECT PERCENTILE_CONT(.75) WITHIN GROUP (ORDER BY profit) FROM customers)
THEN 'High Profit' ELSE 'Standard Profit' END profit_band,
COUNT(*) customers, ROUND(AVG(profit),2) avg_profit,
ROUND(AVG(utilization_pct),2) avg_utilization,
ROUND(100.0*AVG(default_flag),2) default_rate_pct
FROM customers GROUP BY 1,2 ORDER BY 1,2;
