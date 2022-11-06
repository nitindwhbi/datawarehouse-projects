
delete from sch_pizza_edw.dim_date;

insert into sch_pizza_edw.dim_date(date_id, date, year, month, monthname, day, dayofyear, weekdayname, calendarweek, quartal, weekend, is_holiday, period)
SELECT
    row_number() over (order by datum) as date_id,
	datum as Date,
	extract(year from datum) AS Year,
	extract(month from datum) AS Month,
	-- Localized month name
	to_char(datum, 'TMMonth') AS MonthName,
	extract(day from datum) AS Day,
	extract(doy from datum) AS DayOfYear,
	-- Localized weekday
	to_char(datum, 'TMDay') AS WeekdayName,
	-- ISO calendar week
	extract(week from datum) AS CalendarWeek,
	'Q' || to_char(datum, 'Q') AS Quartal,
	-- Weekend
	CASE WHEN extract(isodow from datum) in (6, 7) THEN 'Weekend' ELSE 'Weekday' END AS Weekend,
	-- Fixed holidays
        CASE WHEN to_char(datum, 'MMDD') IN ('0101', '0704', '1225', '1226')
		THEN 'Yes' ELSE 'No' END
		AS is_holiday,
    -- Some periods of the year, adjust for your organisation and country
	CASE WHEN to_char(datum, 'MMDD') BETWEEN '0701' AND '0831' THEN 'Summer break'
	     WHEN to_char(datum, 'MMDD') BETWEEN '1115' AND '1225' THEN 'Christmas season'
	     WHEN to_char(datum, 'MMDD') > '1225' OR to_char(datum, 'MMDD') <= '0106' THEN 'Winter break'
		ELSE 'Normal' END
		AS Period
	FROM (
	-- There are 3 leap years in this range, so calculate 365 * 10 + 3 records
	SELECT '2022-01-01'::DATE + sequence.day AS datum
	FROM generate_series(0,1000) AS sequence(day)
	GROUP BY sequence.day
     ) DQ
order by 1;