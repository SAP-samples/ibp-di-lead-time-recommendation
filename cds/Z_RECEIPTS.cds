@AbapCatalog.sqlViewName: 'Z_SQL_RECEIPTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction: { enabled: true}
@EndUserText.label: 'Z_RECEIPTS'
define view Z_RECEIPTS as select key ebeln as docid, key werks as locid,key matnr as prdid,key charg as batchid,key CONCAT(cpudt,cputm) as otime ,sum(menge) as qty
from matdoc
where ( blart = 'WA' or blart = 'WE') and   (bwart ='101' or bwart = '102') and ebeln!='' and werks!='' and xauto='' and   shkzg='S'
and cpudt>='<your choice, e.g. 20180401>'
group by ebeln,werks,matnr,charg,cpudt,cputm



