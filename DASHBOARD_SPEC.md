# Power BI Dashboard Specification

## Page 1 — Risk & Profitability Executive View
Cards: Customers, Default Rate, Revenue, Profit, Avg Utilization.
Visuals: Risk Band Distribution, Profit by Risk Band, Default Rate by Product.

## Page 2 — Risk Monitoring
Visuals: Utilization vs Default, Delinquencies vs Default, Risk Score Distribution, High-Risk Customers.

## Page 3 — Customer Decision Matrix
Matrix: Risk Band × Profit Band.
Actions:
- Low risk + high profit → Premium / cross-sell
- Low risk + low profit → Nurture
- High risk + high profit → Monitor / reprice
- High risk + low profit → Reduce exposure

## Key DAX
Customers = DISTINCTCOUNT(Customers[customer_id])
Revenue = SUM(Customers[annual_revenue])
Profit = SUM(Customers[profit])
Default Rate = DIVIDE(SUM(Customers[default_flag]),[Customers])
Avg Utilization = AVERAGE(Customers[utilization_pct])
