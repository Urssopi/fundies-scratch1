use context dcic2024
include csv
include data-source
import lists as L
import math as M
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
  source: csv-table-file("flights_sample53.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end
#Exercise 2
# Trim spaces at both ends
fun trim(s :: String) -> String:
  doc: "Remove spaces from the given string."
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end

fun upper(s :: String) -> String:
  doc: "Turns all strings into uppercase"
  string-to-upper(s)
end

fun missing-tailnum(r :: String) -> String:
  if r == "":
    "UNKNOWN"
  else:
    r
    end
end

fun norm-dep-time(time :: Number) -> String block:
  doc: "Turn departure time into HH/MM format"
  hour = num-floor(time / 100)
  min = num-modulo(time, 100)
  to-string(hour) + ":" + to-string(min)
end

fixed-tailnum = transform-column(flights, "tailnum", missing-tailnum)

fixed-dep-delay = transform-column(fixed-tailnum, "dep_delay", lam(r): if r < 0: 0 else: r end end)

fixed-arr-delay = transform-column(fixed-dep-delay, "arr_delay", lam(r): if r < 0: 0 else: r end end)

dedup-key = build-column(fixed-arr-delay, "dedup_key", lam(r): to-string(r["flight"]) + "-" + upper(trim(r["carrier"])) + "-" + norm-dep-time(r["dep_time"]) end)

group(dedup-key, "dedup_key")
count(dedup-key, "dedup_key")

#Exercise 3
fun normalize-airline-name(s :: Row) -> String:
  if s["carrier"] == "UA":
    "United Airlines"
  else if s["carrier"] == "AA":
    "American Airlines"
  else if s["carrier"] == "B6":
    "Jet Blue"
  else if s["carrier"] == "DL":
    "Delta Airlines"
  else if s["carrier"] == "EV":
    "Express Jet"
  else if s["carrier"] == "WN":
    "Southwest Airlines"
  else if s["carrier"] == "OO":
    "Skywest Airlines"
  else:
    "Other"
  end
end

  
norm-airline = build-column(dedup-key, "airline", normalize-airline-name)









freq-bar-chart(norm-airline, "airline")

histogram(dedup-key, "distance", 0)

scatter-plot(dedup-key, "air_time", "distance")

dist-list = dedup-key.get-column("distance")

fun dist-sum(f) block:
  doc: "calculates sum of all elements"
  var result = 0
  for each(item from f):
    result := item + result
  end
  result
end
dist-sum(dist-list)


fun dist-avg(f) block:
  doc:"calculates average of elements"
  var sem = 0
  for each(item from f) block:
    sem := item + sem
  end
  result = sem / L.length(f)
  result
end

dist-avg(dist-list)

fun dist-max(f) block:
  doc: "finds biggest element in list"
  var max = 0
  for each(item from f) block:
    max := M.max(f)
  end
  max
end
    
dist-max(dist-list)