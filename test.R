library(data.table)
library(ggplot2)

 dta=fread('C:/Users/Georgievova/Documents/stanice_data/198000.txt')

dta1=dta[,.(T10=quantile(TMP,0.1),T30=quantile(TMP,0.3), T50=quantile(TMP,0.5), 
            T70=quantile(TMP,0.7), T90=quantile(TMP, 0.9)), by=month(DTM)]

ggplot(dta1)+
  geom_ribbon(aes(month, ymin=T10, ymax=T90), alpha=0.1)+
  geom_ribbon(aes(month, ymin=T30, ymax=T70), fill='green',alpha=0.1)+
  geom_line(aes(month, T50), col='red')+
  theme_minimal()


dta1=dta[,.(P10=quantile(P,0.1),P30=quantile(P,0.3), P50=quantile(P,0.5), P70=quantile(P,0.7), P90=quantile(P, 0.9)), by=month(DTM)]

ggplot(dta1)+
  geom_ribbon(aes(month, ymin=P10, ymax=P90), alpha=0.1)+
  geom_ribbon(aes(month, ymin=P30, ymax=P70), fill='green',alpha=0.1)+
  geom_line(aes(month, P50), col='red')+
  theme_minimal()
