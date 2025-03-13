
-- SELECT 
--   state, 
--   year, 
--   tempf, 
--   tempc, 
--   AVG(tempc) OVER(
--     PARTITION BY state
--     ORDER BY year
--   ) as running_avg_temp
-- FROM
--   state_climate;

-- SELECT 
--   state,
--   year,
--   tempf,
--   tempc,
--   FIRST_VALUE (tempc) OVER (
--     PARTITION BY state
--     ORDER BY tempc
--   ) lowest_state
--   FROM
--     state_climate;

-- SELECT
--   state,
--   year,
--   tempf,
--   tempc,
--   LAST_VALUE (tempc) OVER (
--     PARTITION BY state
--     ORDER BY tempc 
--     RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
--   ) highest_temp
--   FROM 
--     state_climate;

-- SELECT
--   state,
--   year,
--   tempf,
--   tempc,
--   tempc - LAG(tempc, 1, tempc) OVER(
--     PARTITION BY state
--     ORDER BY year
--   ) change_in_temp
-- FROM state_climate;

-- SELECT 
--   state,
--   year,
--   tempc,
--   RANK() OVER (
--     ORDER BY tempc
--   ) coldest_year
-- FROM state_climate;

-- SELECT 
--   state,
--   year,
--   tempc,
--   RANK() OVER (
--     PARTITION BY state
--     ORDER BY tempc DESC
--   ) warmest_rank
-- FROM state_climate;

-- SELECT
--   year, 
--   state,
--   tempc,
--   NTILE(4) OVER (
--     PARTITION BY state
--     ORDER BY tempc
--   ) quartile
-- FROM state_climate;

SELECT
  year, 
  state,
  tempc,
  NTILE(5) OVER (
    ORDER BY tempc
  ) quintile
FROM state_climate;


