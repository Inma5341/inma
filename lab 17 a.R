monthly_revenue<-c(50000,55000,60000,58000,62000,65000,70000,75000,78000,80000,85000,90000)
monthly_expenses<-c(35000,38000,40000,42000,45000,48000,50000,52000,55000,58000,60000,62000)
profit<-monthly_revenue-monthly_expenses
tax_rate<-0.3
profit_after_tax<-profit*(1-tax_rate)
profit_margin<-round(profit_after_tax/monthly_revenue*100.0)
mean_profit_after_tax<-round(mean(profit_after_tax),)
good_months<-which(profit_after_tax>mean_profit_after_tax)
bad_months<-which(profit_after_tax<mean_profit_after_tax)
best_month<-which.max(profit_after_tax)
worst_month<-which.min(profit_after_tax)
results_vector<-c("monthly revenue"=monthly_revenue/1000,
                  "monthly expenses"=monthly_expenses/1000,
                  "profit"=round(profit/1000,2),
                  "profit after tax"=round(profit_after_tax/1000,2),
                  "profile margin"=paste0(profit_margin,"%"),
                  "mean profit after tax for the year"=mean_profit_after_tax,
                  "good months"=good_months,
                  "bad months"=bad_months,
                  "best month"=best_month,
                  "worst month"=worst_month)
print(results_vector)
result_data<-data.frame(month=1:12,
                        Revenue=monthly_revenue,
                        Expenses=monthly_expenses,
                        Profit=profit,
                        Profit_After_Tax=profit_after_tax,
                        Profit_Margin=profit_margin)
write.csv(result_data,"financial_result.csv",row.names=FALSE)
