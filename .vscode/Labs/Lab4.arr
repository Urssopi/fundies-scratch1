use context dcic2024
include csv
include data-source

#Import Table
flights = load-table: 
  rownames,
  dep_time,
  sched_dep_time,
  dep_delay,
  arr_time,
  sched_arr_time,
  arr_delay,
  carrier,
  flight,
  tailnum,
  origin,
  dest,
  air_time,
  distance,
  hour, 
  minute,
  time_hour
  source: csv-table-file("flights.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end

fun is_long_flight(row :: Row) -> Boolean:
  doc: "Checks if a rows distance in greater than or equal to 1500"
  row["distance"] >= 1500
end

#Filters only flights that are 1500 mi or longer 
long-dist = filter-with(flights, is_long_flight)

#Orders the longest flights first 
long-flights = order-by(long-dist, "air_time", false)
longest-flight = long-flights.row-n(0)


fun is_delayed_departure(row :: Row) -> Boolean:
  doc: "Checks if flight is delayed more than 30 mins"
  row["dep_delay"] >= 30
end

fun is_morning_sched_dep(row :: Row) -> Boolean:
  doc: "Checks if flight is in the morning"
  row["sched_dep_time"] < 1200
end

#Filter flights with a 30 min delay or longer and before 12:00
delayed-flights = filter-with(flights, lam(r): r["dep_delay"] >= 30 end)
late-morn-flights = filter-with(delayed-flights, lam(r): r["sched_dep_time"] < 1200 end)

#
bad-flights = filter-with(late-morn-flights, lam(r): r["distance"] > 500 end)

worst-delays = order-by(bad-flights, "dep_delay", false)

worst-flight = worst-delays.row-n(0)
worst-flight["flight"]
worst-flight["origin"]
worst-flight["dep_delay"]

#Exercise 3

dep-to-zero = transform-column(worst-delays, "dep_delay", lam(r): if r < 0: 0  else: r end end)

arr-to-zero = transform-column(dep-to-zero, "arr_delay", lam(r): if r < 0: 0  else: r end end)

#building new column 

effective-speed = arr-to-zero.build-column("effective_speed", lam(r): r["distance"] / (r["air_time"] / 60) end)

best-flights = order-by(effective-speed, "effective_speed", false)

best-flight = best-flights.row-n(0)
best-flight["carrier"]
best-flight["origin"]
best-flight["dest"]

#Excersice 4

  transform-column(flights, "arr_delay", lam(t): if (0 <= t <= 45): t / 0.20 else: t end end)