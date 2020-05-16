This work is part of the management of air quality in Brussels. The Brussels Institute for Environmental Management (IBGE) proposed that we model and spatialize the concentration of nitrogen monoxide and nitrogen dioxide.

The dynamics of nitrogen oxide concentrations were analyzed on the basis of hourly measurements from a network of measurment stations. It is modeled from black carbon concentrations. The establishment of a characteristic curve of the NO / NO2 ratio then allows to determine the concentrations of these two compounds separately.

The results are finally presented in the form of maps.


In this repository, you will find documents :
- Report.pdf : the written report of the project;
- Presentation.pptx : the slides used for the oral presentation in the presence of an IBGE member;
- NO_conc.pdf : map of NO concentrations during peak hours;
- NO2_conc.pdf : map of NO2 concentrations during peak hours;
- NO2_prob.pdf : map of probabilities to exceed NO2 threshold during off-peak hours;

and scripts :
- spat.R : generate a file containing spatialized NO and NO2 concentrations;
- data_traitment.R : import hourly data;
- ModeleRapportNO_NO2.R : minimize RMSE to determine W coefficients at stations;
- modeleNOxpond.R : compute NO, NO2 and NOx concentrations at stations measuring BC, plot measured and modeled data;
- graphe_journee_moyenne.R : plot measured and modeled data along a mean day;
- residus.R : generate a residus.csv file;
