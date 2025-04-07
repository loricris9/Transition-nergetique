******descargar base de datos del banco mundial
ssc install wbopendata
ssc install ltimbimata
ssc install cointreg
ssc install xtdcce2
ssc install resetxt
adoupdate
*para revisar los indicadores:
 help wbopendata
 *indicador de PIB
 wbopendata, indicator(NY.GDP.PCAP.CD)
 *indicador CO2
 wbopendata, indicator(EN.ATM.CO2E.PC)
 *indicador consumo de energia 1
 wbopendata, indicator(EG.USE.PCAP.KG.OE)
 *indicador consumo de energia 2
 wbopendata, indicator(EG.USE.COMM.GD.PP.KD)
 *corrupcion indicador
 wbopendata, indicator(IQ.CPA.TRAN.XQ)
 *rrnn
 wbopendata, indicator(NY.GDP.TOTL.RT.ZS)
 *gni per capita
 wbopendata, indicator(NY.GNP.PCAP.PP.CD)
 *gini BM
 wbopendata, indicator(SI.POV.GINI)
 *mortalidad
 wbopendata, indicator(SP.DYN.IMRT.IN)
*poblacion
 wbopendata, indicator(SP.POP.TOTL)
*Merchandise trade
 wbopendata, indicator(TG.VAL.TOTL.GD.ZS)
 *corrupcion 2
 wbopendata, indicator(CC.EST)
 *estabilidad politica
 wbopendata, indicator(PV.EST)
******luego de descargar cada base de datos, se convertirar una a una en panel
 *co2
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\co2.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr CO2
egen id = group(countryname year)
reshape wide CO2, i(id) j(varnum)
do vardesc.do  
*PIB
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\pib.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr pib
egen id = group(countryname year)
reshape wide pib, i(id) j(varnum)
do vardesc.do  
*energia1
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\energie1.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr ene1
egen id = group(countryname year)
reshape wide ene1, i(id) j(varnum)
do vardesc.do  
*energia2
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\energie2.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr ene2
egen id = group(countryname year)
reshape wide ene2, i(id) j(varnum)
do vardesc.do  
*corr1
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\corruption1.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr corr1
egen id = group(countryname year)
reshape wide corr1, i(id) j(varnum)
do vardesc.do  
*corr2
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\corruption2.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr corr2
egen id = group(countryname year)
reshape wide corr2, i(id) j(varnum)
do vardesc.do  
*RRNN
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\rrnn.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr rrnn
egen id = group(countryname year)
reshape wide rrnn, i(id) j(varnum)
do vardesc.do  
*gni1
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\gni1.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr gni1
egen id = group(countryname year)
reshape wide gni1, i(id) j(varnum)
do vardesc.do  
*gni2
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\gni2.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr gni2
egen id = group(countryname year)
reshape wide gni2, i(id) j(varnum)
do vardesc.do  
rename gni21 gni2
save "C:\Users\HP\Desktop\ULH\M2\analyse de données\gni2p.dta"
*mort
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\mortalidadenf.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr mort
egen id = group(countryname year)
reshape wide mort, i(id) j(varnum)
do vardesc.do  
rename mort1 mort
save "C:\Users\HP\Desktop\ULH\M2\analyse de données\mortp.dta"
*population
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\population.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr pop
egen id = group(countryname year)
reshape wide pop, i(id) j(varnum)
do vardesc.do  
rename pop1 pop
save "C:\Users\HP\Desktop\ULH\M2\analyse de données\popp.dta"
*trade
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\trade.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr trade
egen id = group(countryname year)
reshape wide trade, i(id) j(varnum)
do vardesc.do 
rename trade1 trade
save "C:\Users\HP\Desktop\ULH\M2\analyse de données\tradep.dta"
*SP
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\sp.dta"
drop indicatorcode 
gen id = _n
reshape long yr, i(id) j(year)
encode indicatorname, gen(varnum)
label save varnum using vardesc, replace 
drop id indicatorname
rename yr sp
egen id = group(countryname year)
reshape wide sp, i(id) j(varnum)
do vardesc.do  
rename sp1 sp
save "C:\Users\HP\Desktop\ULH\M2\analyse de données\spp.dta"
*******hacer el merge
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\pibp.dta", clear
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\co2p.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\corr1p.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\ene1p.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\gni1p.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\mortp.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\popp.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\rrnnp.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\spp.dta", nogen
merge 1:1 id year using "C:\Users\HP\Desktop\ULH\M2\analyse de données\tradep.dta", nogen
save "C:\Users\HP\Desktop\ULH\M2\analyse de données\bbdd.dta"
*****volver countryname el indicador para el panel, hacerlo antes
encode countryname, generate(country_id)
rename country_id country

***CONVERTIR A PANEL
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\bbdd.dta"
sort country year
xtset country year
*What determines whether your panel is balanced are not the panel identifier and time variable per se, but the combination of all variables. It is clear that you have missing values
order country year CO2 pib corruption energie mort pop rrnn sp trade pib2

******limpiea de data
*eliminar paises
*eliminar datos antes de 1991 y luego elimnar datos del ano 2021 2022
drop if year < 1993
drop if year > 2020
use "C:\Users\HP\Desktop\ULH\M2\analyse de données\bbdd1.dta"

******tratando valores vacios

* Paso 1: Calcular la media de cada variable
foreach var of varlist CO2 corruption mort sp trade { 
    summarize `var', meanonly
    scalar `var'_media = r(mean)
}

* Paso 2: Llenar los valores faltantes con las medias calculadas
foreach var of varlist CO2 corruption mort sp trade { 
    replace `var' = `var'_media if missing(`var')
}

foreach var of varlist energie { 
    summarize `var', meanonly
    scalar `var'_media = r(mean)
}

* Paso 2: Llenar los valores faltantes con las medias calculadas
foreach var of varlist energie { 
    replace `var' = `var'_media if missing(`var')
}

*crear la variable cuadratica:

gen lpbi2=lpbi^2
*et generar otros logaritmos

***************************************************
*******************ANEXO***************************
 *algunos codigos de variables que puedo descargar
 EG.EGY.PRIM.PP.KD  Energy intensity level of primary energy(MJ/$2011 PPP GDP)
 IQ.CPA.TRAN.XQ    CPIA transparency, accountability, and corruption in the public sector rating(1=low to 6=high)
 NY.GDP.TOTL.RT.ZS    Total natural resources rents (% of GDP)
 NY.GNP.PCAP.PP.CD    GNI per capita, PPP (current international $)
 SI.POV.GINI        GINI index (World Bank estimate)
 SP.DYN.IMRT.IN     Mortality rate, infant (per 1,000 live births)
 SP.POP.TOTL     Population, total
 SP.POP.GROW    Population growth (annual %)
 TG.VAL.TOTL.GD.ZS      Merchandise trade (% of GDP)
 CC.EST            Control of Corruption: Estimate
 PV.EST           Political Stability and Absence of Violence/Terrorism: Estimate
 EG.USE.PCAP.KG.OE   Energy use (kg of oil equivalent per capita)
 EG.USE.COMM.GD.PP.KD  Energy use (kg of oil equivalent) per $1,000 GDP (constant 2017 PPP)
****
encode country, generate(country_id)


