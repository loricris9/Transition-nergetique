******MODELO: ANALISIS DESCRIPTIVO
sort country year
xtset country year
xtsum lCO2 lpib lcorruption lenergie lrrnn lmort lsp ltrade lpib2
xtdescribe
list lCO2 lpib lcorruption lenergie lrrnn lmort lsp ltrade lpib2 in 1/10
*graficos total
twoway (scatter CO2 pib )(lowess CO2 pib)
twoway (scatter lCO2 lpib2 )(lowess lCO2 lpib2)

*grafico por decadas
twoway (scatter lCO2 lpib2 if year >= 1993 & year <= 2000 )(lowess lCO2 lpib2), title("1993-2000") saving(g1)
twoway (scatter lCO2 lpib2 if year >= 2001 & year <= 2010)(lowess lCO2 lpib2), title("2001-2010") saving(g2)
twoway (scatter lCO2 lpib2 if year >= 2011 & year <= 2020)(lowess lCO2 lpib2), title("2011-2020") saving(g3)
gr combine g1.gph  g2.gph  g3.gph 

*MODELO MCO: faut pas le prender en compte
reg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie lcorruption lsp
reg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie lsp
reg lCO2 lpib lpib2 lmort lrrnn lenergie lsp

*modele fe
xtreg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie lcorruption lsp,fe
xtreg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie lcorruption,fe
xtreg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie,fe
xtreg lCO2 lpib lpib2 lmort lrrnn lenergie,fe
estimates store fem

*modele re

xtreg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie lcorruption lsp,re
xtreg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie lcorruption,re
xtreg lCO2 lpib lpib2 lmort lrrnn ltrade lenergie,re
xtreg lCO2 lpib lpib2 lmort lrrnn lenergie,re
estimates store rem

*Cuando el valor p del test de Hausman es significativo (generalmente menor que un nivel de significancia de 0.05), se prefiere el modelo de efectos fijos (FE)
*hausman
hausman fem rem
*conclusion:se elige el modelo fe

*heterocedasticidad
xtreg lCO2 lpib lpib2 lmort lrrnn lenergie,fe
xttest3
*si p menor a 5 por ciento, hay heterocedasticidad
*hay heterocedasticidad

*autocorrelacion
xtreg lCO2 lpib lpib2 lmort lrrnn lenergie,fe
xtserial lCO2 lpib lpib2 lmort lrrnn lenergie
*hay autocorrelation

*MODELO robusto para gestionar la heterocedasticidad y la autocorrelacion


xtreg lCO2 lpib lpib2 lmort lrrnn lenergie,fe r
xtreg lCO2 lpib lpib2 lrrnn lenergie,fe r

*El test Wald es una herramienta estadística utilizada para evaluar la significancia de los coeficientes estimados en un modelo de regresión. 
*Especifica pruebas de hipótesis nulas y alternativas sobre los parámetros del modelo, y luego utiliza una aproximación asintótica normal 
*para calcular los valores p y determinar si se rechaza o no la hipótesis nula.
*En el contexto de regresión, el test Wald puede ser utilizado para probar la significancia de un solo coeficiente (simple) 
*o de múltiples coeficientes simultáneamente (compuesto). Por ejemplo, si estás interesado en determinar si un coeficiente específico es
*significativamente diferente de cero, puedes realizar un test Wald simple para ese coeficiente. 
*Por otro lado, si deseas probar si un conjunto de coeficientes tiene un efecto conjunto significativo en la variable dependiente, 
*puedes realizar un test Wald compuesto.
test

*interpretacion de resultados


**************************
**********************ANEXO
*************************
*borrar graficos guardados
erase g1.gph
erase g2.gph
erase g3.gph


