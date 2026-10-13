import pandas as pd
df=pd.read_csv("../data/customers.csv")
df["risk_band"]=pd.cut(df.risk_score,[-1,150,300,10000],labels=["Low","Medium","High"])
df["profit_band"]=pd.qcut(df.profit,4,labels=["Q1","Q2","Q3","Q4"])
segment=df.groupby(["risk_band","profit_band"],observed=False).agg(
customers=("customer_id","count"),profit=("profit","sum"),default_rate=("default_flag","mean")).reset_index()
segment.to_csv("../data/risk_profit_segments.csv",index=False)
print(segment)
