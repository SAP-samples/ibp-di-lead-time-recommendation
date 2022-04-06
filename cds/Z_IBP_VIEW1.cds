@AbapCatalog.sqlViewName: 'Z_IBP_SQLVIEW1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction: { enabled: true}
@EndUserText.label: 'Z_IBP_VIEW1'
define view Z_IBP_VIEW1 as select   key ebeln as docid,key werks as locfr,key umwrk as locid,key matnr as prdid,key charg as batchid,key CONCAT(cpudt,cputm) as otime , sum(menge) as qty ,'I' as SOURCE
from matdoc
where vgart='WL' and blart='WL' and ebeln!='' and xauto='' and werks!='' and umwrk!='' and shkzg='H' and cpudt>='<your choice, e.g. 20180401>'
group by ebeln,werks,umwrk,matnr,charg,cpudt,cputm;