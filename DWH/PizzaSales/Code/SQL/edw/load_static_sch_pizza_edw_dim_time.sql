
delete from sch_pizza_edw.dim_time;

insert into sch_pizza_edw.dim_time (time_id, timeofday, quarterhour, daytimename, daynight)
select
    row_number() over (order by second) as time_id,
    to_char(second, 'hh24:mi:ss') AS TimeOfDay,
	-- Extract and format quarter hours
	to_char(second - (extract(minute from second)::integer % 15 || 'minutes')::interval, 'hh24:mi') ||
	' – ' ||
	to_char(second - (extract(minute from second)::integer % 15 || 'minutes')::interval + '14 minutes'::interval, 'hh24:mi')
		as QuarterHour,
	-- Names of day periods
	case when to_char(second, 'hh24:mi') between '06:00' and '08:29'
		then 'Morning'
	     when to_char(second, 'hh24:mi') between '08:30' and '11:59'
		then 'AM'
	     when to_char(second, 'hh24:mi') between '12:00' and '17:59'
		then 'PM'
	     when to_char(second, 'hh24:mi') between '18:00' and '22:29'
		then 'Evening'
	     else 'Night'
	end as DaytimeName,
	-- Indicator of day or night
	case when to_char(second, 'hh24:mi') between '07:00' and '19:59' then 'Day'
	     else 'Night'
	end AS DayNight
from (SELECT '0:00:00'::time + (sequence.second || ' seconds')::interval AS second
	FROM generate_series(0,86399) AS sequence(second)
	GROUP BY sequence.second
     ) DQ
order by 1;