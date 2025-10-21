use context dcic2024
include csv
include data-source

fun tick(s :: Number):
  doc: "returns s+1"
  if (num-is-integer(s) == true) and (s >= 0) and (s <= 59):
    s + 1
  else if s == 60:
    0
  else:
    "Invalid Input"
    end
end

tick(10)

fun rock-paper-scissors(p1 :: String, p2 :: String) -> String:
  if (p1 == "rock") and (p2 == "paper"):
    "Player 2 wins"
  else if (p1 == "scissors") and (p2 == "rock"):
    "Player 2 wins"
  else if (p1 == "paper") and (p2 == "scissors"):
    "Player 2 wins"
  else if (p1 == "paper") and (p2 == "rock"):
    "Player 1 wins"
  else if (p1 == "scissors") and (p2 == "paper"):
    "Player 1 wins"
  else if (p1 == "rock") and (p2 == "scissors"):
    "Player 1 wins"
  else if p1 == p2:
    "Tie"
  else:
    "Invalid Input"
end end

rock-paper-scissors("paper", "rock")

planets = table: Planet :: String, Distance :: Number
  row: "Mecrury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Saturn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end

mars = planets.row-n(3)
mars["Distance"]

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
#*Predicates*
fun is_long_flight(row :: Row) -> Boolean:
  row["distance"] >= 1500
end 
fun is_morning_sched_dep(row :: Row) -> Boolean:
  row["sched_dep_time"] < 1200
end
fun if_dept_delay(row :: Row) -> Boolean:
  row["dep_delay"] >= 30
end


long-dist-flights = filter-with(flights, is_long_flight)

long-time-flights = order-by(long-dist-flights, "air_time", false)

longest-flight = long-time-flights.row-n(0)

longest-flight["carrier"]
longest-flight["origin"]
longest-flight["dest"]

bad-delay= filter-with(flights, lam(r): (r["dep_delay"] >= 30) and (r["sched_dep_time"] < 1200) end)

bad-flights = filter-with(bad-delay, lam(r): r["distance"] > 500 end)

worst-flights = order-by(bad-flights, "dep_delay", false)

worst-flight = worst-flights.row-n(0)
worst-flight["flight"]
worst-flight["origin"]
worst-flight["dep_delay"]

fixed-dep-delay = transform-column(worst-flights, "dep_delay", lam(r): if r < 0: r == 0 else: r end end)

fixed-delay = transform-column(fixed-dep-delay, "arr_delay", lam(r): if r < 0: r == 0 else: r end end)

mph = build-column(fixed-delay, "effective_speed", lam(r): if r["air_time"] > 0: r["distance"] / (r["air_time"] / 60) else: r == 0 end end)

fastest-flights = order-by(mph, "effective_speed", false)

fastest-flight = fastest-flights.row-n(0)
fastest-flight["carrier"]
fastest-flight["origin"]
fastest-flight["dest"]

fun apply-arrival-discount(t :: Table) -> Table:
  if (0 <= t["arr_delay"]) and (t["arr_delay"] <= 45):
    "arr_delay" / 0.80
  else:
    "arr_delay"
  end
end

tests = transform-column(flights, "arr_delay", lam(t): if (0 <= t) and (t <= 45): t / 0.80 else: t end end)

apply-arrival-discount(flights)
check:
  apply-arrival-discount(flights) is tests
end