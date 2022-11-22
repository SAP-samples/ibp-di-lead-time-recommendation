------------------------------------------------------------------------------------
----------------------------- SC event view ----------------------------------------
------------------------------------------------------------------------------------
create  view sapemp.sceventv2 as	
( select *,to_timestamp(substr(otimew,1,19)) otime from
(
--PUOS creation event
select ebeln docid,ebelp itid,lifnr locid,matnr prdid,menge qty,aedat otimew,'PUOS' typ from
sapemp.ekkpo e1 where lifnr!=''

union

--PUOI event
select docid,itid,locid,prdid,sum(qty) qty,add_seconds('20000101',sum(wqty*seconds_between('20000101',otimew))/sum(wqty)) otimew,'PUOI' typ from
(select ebeln docid,ebelp itid,matnr prdid,werks locid,cpudt||cputm otimew,sum(to_int(replace(replace(shkzg,'S','-1'),'H','1'))*menge) qty,sum(to_int(replace(replace(shkzg,'S','0'),'H','1'))*menge) wqty from
sapemp.ekbe e
where bwart in ('641','642')
group by ebeln,ebelp,werks,matnr,cpudt,cputm)
group by docid,itid,locid,prdid having sum(qty)<>0 and sum(wqty)<>0

union

--PUOR event
select docid,itid,locid,prdid,sum(qty) qty,add_seconds('20000101',sum(wqty*seconds_between('20000101',otimew))/sum(wqty)) otimew,'PUOR' typ from
(select ebeln docid,ebelp itid,matnr prdid,werks locid,cpudt||cputm otimew,sum(to_int(replace(replace(shkzg,'S','1'),'H','-1'))*menge) qty,sum(to_int(replace(replace(shkzg,'S','1'),'H','0'))*menge) wqty from
sapemp.ekbe e
where bwart in ('101','102') and matnr!=''
group by ebeln,ebelp,werks,matnr,cpudt,cputm)
group by docid,itid,locid,prdid having sum(qty)<>0 and sum(wqty)<>0

union

--PROI event
select docid,'' itid,locid,prdid,sum(qty) qty,add_seconds('20000101',sum(wqty*seconds_between('20000101',otimew))/sum(wqty)) otimew,'PROI' typ from
(select m.aufnr docid,m.matnr prdid,m.werks locid,sum(to_int(replace(replace(m.shkzg,'S','-1'),'H','1'))*m.menge) qty,sum(to_int(replace(replace(m.shkzg,'S','0'),'H','1'))*m.menge) wqty,m.cpudt||m.cputm otimew 
	from sapemp.matdoc m where m.bwart in ('261','262')
	group by m.aufnr,m.matnr,m.werks,m.cpudt,m.cputm)	
group by docid,prdid,locid having sum(qty)<>0 and sum(wqty)<>0

union

--PROR event
select docid,'' itid,locid,prdid,sum(qty) qty,add_seconds('20000101',sum(wqty*seconds_between('20000101',otimew))/sum(wqty)) otimew,'PROR' typ from
(select m.aufnr docid,m.matnr prdid,m.werks locid,sum(to_int(replace(replace(m.shkzg,'S','1'),'H','-1'))*m.menge) qty,sum(to_int(replace(replace(m.shkzg,'S','1'),'H','0'))*m.menge) wqty,m.cpudt||m.cputm otimew 
	from sapemp.matdoc m 
  	where m.blart in ('WA','WE') and m.bwart in ('101','102') and m.aufnr!='' and m.werks!='' and m.xauto=''
	group by m.aufnr,m.matnr,m.werks,m.cpudt,m.cputm)
	group by docid,prdid,locid having sum(qty)<>0 and sum(wqty)<>0
)
order by docid,itid,locid,prdid,otimew
);