@AbapCatalog.sqlViewName: 'ZSQL_IBP_MATMOV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction: { enabled: true}
@EndUserText.label: 'Z_IBP_MATMOVEMENTS'
define view Z_IBP_MATMOVEMENTS as  
select  key ebeln as DOCID,key le_vbeln   as LE_VBELN ,key werks as LOCFR,key umwrk as LOCID,key matnr as PRDID,key charg as BATCHID,key CONCAT(cpudt,cputm) as OTIME , sum(menge) as QTY , 'I' as RECORD_TYPE
from matdoc
where vgart='WL' and blart='WL' and ebeln!='' and xauto='' and werks!='' and umwrk!='' and shkzg='H'  
group by ebeln,le_vbeln,werks,umwrk,matnr,charg,cpudt,cputm
union
select  ebeln as DOCID, '-' as LE_VBELN ,'-' as LOCFR ,key werks as LOCID,key matnr as PRDID,key charg as BATCHID,key CONCAT(cpudt,cputm) as OTIME ,sum(menge) as QTY , 'R' as RECORD_TYPE
from matdoc
where ( blart = 'WA' or blart = 'WE') and   (bwart ='101' or bwart = '102') and ebeln!='' and werks!='' and xauto='' and   shkzg='S' 
group by ebeln,werks,matnr,charg,cpudt,cputm;
