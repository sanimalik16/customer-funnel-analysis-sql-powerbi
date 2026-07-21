create database client_site_funnel_analysis;

select count(*) as `Total Rows` from client_site_dataset;
select count(distinct `User ID`) as `Unique Users` from client_site_dataset;
select count(distinct `Session ID`) as `Unique Session ID` from client_site_dataset;
select distinct `Event` from client_site_dataset;

select `Event`, count(*) as `Total Events` from client_site_dataset group by `Event` order by `Total Events` desc;
select `Event`, count(distinct `User ID`) as `Total Users` from client_site_dataset group by `Event` order by `Total Users` desc;
select count(distinct case when `Event` = 'Browse' then `User ID` end) as `Browse Users`,
       count(distinct case when `EVent` = 'Purchase' then `User ID` end) as `Purchase Users`,
       round( count(distinct case when `EVent` = 'Purchase' then `User ID` end) * 100.0 /
			  count(distinct case when `Event` = 'Browse' then `User ID` end), 2) as `Conversion Rate`     
from client_site_dataset;

select sum(`Revenue`) as `Total Revenue` from client_site_dataset;
select `Region`, sum(`Revenue`) as `Total Revenue` from client_site_dataset group by `Region` order by `Total Revenue` desc;
select `Channel`, sum(`Revenue`) as `Total Revenue` from client_site_dataset group by `Channel` order by `Total Revenue` desc;
select `Device`, sum(`Revenue`) as `Total Revenue` from client_site_dataset group by `Device` order by `Total Revenue` desc;

select `User ID`, sum(`Revenue`) as `Total Revenue` from client_site_dataset group by `User ID` order by `Total Revenue` desc limit 5;
select `Channel`, sum(`Revenue`) as `Total Revenue` from client_site_dataset group by `Channel` order by `Total Revenue` desc limit 1;
select `Region`, sum(`Revenue`) as `Total Revenue` from client_site_dataset group by `Region` order by `Total Revenue` desc limit 1;
select `Device`, round( count(distinct case when `EVent` = 'Purchase' then `User ID` end) * 100.0 /
			  count(distinct case when `Event` = 'Browse' then `User ID` end), 2) as `Conversion Rate`
              from client_site_dataset group by `Device` order by `Conversion Rate` desc;

select `Event`, count(distinct `User ID`) as `Users` from client_site_dataset group by `Event` order by field(`Event`, 'Browse', 'Add to Cart', 'Checkout', 'Purchase' );