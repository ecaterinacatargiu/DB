/*select
update data – for at least 3 tables;
delete data – for at least 2 tables.
In the UPDATE / DELETE statements, use at least once: {AND, OR, NOT},  {<,<=,=,>,>=,<> }, IS [NOT] NULL, IN, BETWEEN, LIKE.
*/
USE Travian
GO
/*
ALTER TABLE ResourceFieldLocation
DROP Production


*/
/*A*/
/*
a.2 queries with the union operation; use UNION [ALL] and OR;

SELECT THE TROOPS THAT HAVE THE LENGHT OF THE NAME GRATER THAN 10 OR SMALLER THAN 5
SELECT THE TROOPS THAT are roman or teuton
*/


insert into LevelProduction Values(1,null),(2,null),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5)

Update Troop
Set TRname = 'SSettler'
where TRname like 'Sett%'

Update Troop
Set TRname = 'Settler'
where TRname like 'SS%'


UPDATE LevelProduction
SeT Production = 1000
where Production is NULL;


delete from LevelProduction
where RFlevel>5


UPDATE ResourceFieldLocation
SET Production = 50
where RFlevel <= 3 or Production<50

delete from Army
WHERE Quantity<10 AND Vid = 1

UPDATE Army
Set Quantity = 20
where Quantity <= 15 and TRid in (select T.TRid from Troop T where T.TRid between 3 and 25 )


update Troop
set ClayCost = 500
where ClayCost>450 and ClayCost<550


SELECT *
FROM Troop t
WHERE LEN(t.TRname)>10 OR LEN(t.TRname)<5

SELECT T.TRname
FROM Troop T
Where T.Tid = 1
UNION ALL
SELECT T1.TRname
FROM Troop T1
Where T1.Tid = 2

/*B*/
/*
b. 2 queries with the intersection operation; use INTERSECT and IN;

SELECT THE TROOPS name that appears in the Army table

select the commonbuildings that have the description's length smaller than 150 and greater than 100
*/

SELECT T.TRname
FROM Troop T
Where T.TRid in
(SELECT A.TRid
FROM Army A)

SELECT C.CBname
FROM CommonBuilding C
WHERE LEN(C.CBdescription)>100
INTERSECT
SELECT C1.CBname
From CommonBuilding C1
WHERE LEN(C1.CBdescription)<150


/*C*/
/*
c. 2 queries with the difference operation; use EXCEPT and NOT IN;

select the resource fields that have in Sarmizegetuza village the level at least 10 for each Resource field unit
select the buildings name that are not in the Sarmizegetusa village 
*/
select * from ResourceField r
WHERE r.RFid NOT IN (
SELECT RFL.RFid 
FROM ResourceFieldLocation RFL
WHERE RFL.RFlevel <10 and RFL.Vid=1)

select z.CBname
from CommonBuilding z
where z.CBid in (
select x.CBid
from CommonBuilding x
except
select y.CBid
from CommonBuildingPlace y
where y.Vid = 1)

/*
d. 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN; one query will join at least 3 tables, 
while another one will join at least two many-to-many relationships;

display all the details of the relationship between villages and buildings
DISPLAY THE SETS OF CommonBuildings and oasis that have in common a village
display the relation between the Troops and armies
display the relation between the tribes and villages
*/

Select DISTINCT v.*, p.CBlevel,X.* 
from Village v join CommonBuildingPlace p on v.Vid = p.Vid join CommonBuilding X on X.CBid = p.CBid 


select * 
from Oasis O full join CapturedOasis CO on O.Oid = CO.Oid 
FULL join Village V on V.Vid = CO.Vid FULL JOIN CommonBuildingPlace p on v.Vid = p.Vid 
full join CommonBuilding X on X.CBid = p.CBid 


select * 
from Troop T left join Army A on T.TRid = A.TRid 

select * 
from Village V right join Tribe T on T.Tid = V.Tid


/*
e. 2 queries using the IN operator to introduce a subquery in the WHERE clause; in at least one query,
the subquery should include a subquery in its own WHERE clause;

select the names of the troops that appears in the villages with the name sarmizegetusa
select the buildings types that have occurances in the game 

*/

select T.TRname
from Troop T
where T.TRid in(
Select A.TRid
from Army a
where a.Vid in(
select V.Vid
from Village V
where V.Vname = 'Sarmizegetusa'
))

select C.CBname
FROM CommonBuilding C
where C.CBid in
(
select CB.CBid from CommonBuildingPlace CB
)


/*
f. 2 queries using the EXISTS operator to introduce a subquery in the WHERE clause;
select the tribe names that has villages
select the troop names that appears in Alexandria
*/
select T.Tname
from Tribe T
Where exists(
select V.Vid from Village V where v.Tid =T.Tid
)

Select T.TRname
from Troop T
Where exists(
Select * from Army a where a.TRid = T.TRid and a.Vid = 2
)
/*
g. 2 queries with a subquery in the FROM clause;       
select the name and the production of the resources from the Sarmizegetusa village that have the production greater than 2000
Select the name of the troop and army quantity in Sarmisegetusa village  
*/
Select* from(
SELECT  F.RFtype, sum(r.Production) as production
from ResourceFieldLocation R JOIN ResourceField F on R.RFid = F.RFid JOIN Village V ON V.Vid = R.Vid
Where V.Vid=1
group by F.RFtype) as Prod
where Prod.production>2000

Select TRname, Quantity
from (
SELECT TR.TRname, A.Quantity FROM Troop TR JOIN Army A on A.TRid = TR.TRid join Village V on V.Vid = A.Vid
where V.Vid = 1
)T



/*
h. 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause;
2 of the latter will also have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX;

select the max production for each resource fields in Alexandria that have a greater production than the same resource field in Sarmizegetusa
select the sum of troops nr per each tribe having at least 4 diffrent troop types
select the min production/field for each resource field in Sarmizegetusa which has at least 4 field places near the village
select the average number of troops per army for each village which has the average greater than the average number of troops from another village

*/

select RF.RFtype,Prod.production
from(
	SELECT R.RFid, MAX(R.Production) as production
	from ResourceFieldLocation R
	Where R.Vid=2
	group by R.RFid
	having MAX(r.Production) > ALL (select MAX(R2.Production)
								   from ResourceFieldLocation R2 
								   Where R2.Vid=1 and R2.RFid = R.RFid
									)
	)as Prod join ResourceField RF on RF.RFid = Prod.RFid


select B.Tname,SUM(A.Quantity) as ArmyPower
from Troop T join Army A on A.TRid = T.TRid join Tribe B on T.Tid =b.Tid  
group by B.Tname
having COUNT(*)>3


SELECT  F.RFtype, min(R.Production) as production
from ResourceFieldLocation R JOIN ResourceField F on R.RFid = F.RFid JOIN Village V ON V.Vid = R.Vid
Where V.Vid=1
group by F.RFtype
having count(*)>3


select S.Vname,T.AverageUnitsNumberPerArmy
from
			(select V.Vid, AVG(A.Quantity) as AverageUnitsNumberPerArmy
			from Village V join Army A on V.Vid = A.Vid
			group by V.Vid
			having AVG(A.Quantity)> ANY(
						select AVG(A1.Quantity)
						from Village V1 join Army A1 on V1.Vid = A1.Vid
						where V1.Vid <> V.Vid
						group by V1.Vid)
			) T join Village S on S.Vid = T.Vid
			

/*
i. 4 queries using ANY and ALL to introduce a subquery in the WHERE clause; 2 of them should be rewritten with aggregation operators,
while the other 2 should also be expressed with [NOT] IN.

the roman army that have the quantity greater than all the gaul's troops
the resource field in Sarmizegetusa that have the production distinct BUT equal to at least one resource field in Alexandria
select the troop name that has the offence less than all the offence values from other troops from the same tribe
select the Village that have the total production different than any other villages

*/

select T.TRname 
from Troop T join Army A on A.TRid = T.TRid 
Where T.Tid = 1 and A.Quantity >All(
								select A2.Quantity from Troop T2 join Army A2 on T2.TRid = A2.TRid where T2.Tid = 3 
								)

select T.TRname 
from Troop T join Army A on A.TRid = T.TRid 
Where T.Tid = 1 and A.Quantity >( select MAX(A2.Quantity)
								  from Troop T2 join Army A2 on T2.TRid = A2.TRid where T2.Tid = 3 
								)


select R.RFtype, L.Pnr, L.Production 
from ResourceField R join ResourceFieldLocation L on R.RFid = L.RFid 
where L.Vid = 1 and L.Production = ANY(
									select Distinct L2.Production 
									from ResourceFieldLocation L2
									where L2.Vid = 2 
									)



select R.RFtype, L.Pnr, L.Production 
from ResourceField R join ResourceFieldLocation L on R.RFid = L.RFid 
where L.Vid = 1 and L.Production  in (
									select Distinct L2.Production 
									from ResourceFieldLocation L2
									where L2.Vid = 2 
									)

select T.TRname
from Troop T
where T.offence<ALL(select T1.offence 
						from Troop T1
						where T1.TRid <> T.TRid and T1.Tid  =T.Tid)


select T.TRname
from Troop T
where T.offence<(   select MIN(T1.offence) 
					from Troop T1
					where T1.TRid <> T.TRid and T1.Tid  =T.Tid)




select distinct V.Vname
from(
	select SUM(RFL.Production) as production, V.Vid
			 from ResourceFieldLocation RFL join ResourceField RF ON RFL.RFid = RF.RFid JOIN Village V ON V.Vid=RFL.Vid
			 GROUP BY V.Vid
	)as Prod join Village V on V.Vid = Prod.Vid 
where production <> ANY(
			 select SUM(RFL2.Production) as production
			 from ResourceFieldLocation RFL2 join Village V1 ON V1.Vid=RFL2.Vid
			 where V1.Vid <>V.Vid
			 GROUP BY V1.Vid
					)



select distinct V.Vname
from(
	select SUM(RFL.Production) as production, V.Vid
			 from ResourceFieldLocation RFL join ResourceField RF ON RFL.RFid = RF.RFid JOIN Village V ON V.Vid=RFL.Vid
			 GROUP BY V.Vid
	)as Prod join Village V on V.Vid = Prod.Vid 
where production NOT IN(
			 select SUM(RFL2.Production) as production
			 from ResourceFieldLocation RFL2 join Village V1 ON V1.Vid=RFL2.Vid
			 where V1.Vid <>V.Vid
			 GROUP BY V1.Vid
					)



/*select the top 3 biggest distinct army quantities from Sarmizegetusa*/
select distinct top 3 A.quantity from Army A where A.Vid =1 order by A.Quantity desc

/*select the top 4 most productive fields in Alexandria if the village we suppose there is a bonus of 25% iron from a nearby village*/
select distinct top 10 T.production, R.RFtype
from (select F.RFid,
				case when F.RFid=3 then F.production*1.25
				else F.Production
				end as production
		from ResourceFieldLocation F
		where F.Vid = 2
		)as T join ResourceField R on R.RFid = T.RFid
order by T.production desc


/*Select the total production of Sarmizegetusa in a day*/
select SUM(RFL.Production)*24 as TotalProduction
			 from ResourceFieldLocation RFL join ResourceField RF ON RFL.RFid = RF.RFid JOIN Village V ON V.Vid=RFL.Vid
			 where V.Vid=1


/*

select the time needed for full recovery for the village from the resourse point of view [max(lost resources / total production)] if after a fast attack all the defender troups are killed, for each village 

*/

select V.Vname, F.HoursForRecovery
from(
	select TimeForR.Vid, MAX(TimeForRecovery) as HoursForRecovery
	from
		(select Vid, 
			 case when RFid = 1 THEN lumber/production
				  when RFid = 2 THEN clay/production
				  when RFid = 3 THEN iron/production
			 End as TimeForRecovery
		 from
			(select SUM(RFL.Production) as production, RF.RFid
			 from ResourceFieldLocation RFL join ResourceField RF ON RFL.RFid = RF.RFid JOIN Village V ON V.Vid=RFL.Vid
			 where RF.RFid <> 4
			 GROUP BY RF.RFid
			 ) as Prod,
			(
			 select sum(ClayCost*Quantity) as clay, sum(IronCost*Quantity) as iron, sum(LumberCost*Quantity) as lumber, V.Vid as Vid
			 from Village V join Army A on V.Vid  = A.Vid join Troop T on T.Tid = V.Tid
			 group by V.Vid
			 ) as Cost 
		 ) as TimeForR 
group by TimeForR.Vid
) as F join Village V on F.Vid = V.Vid