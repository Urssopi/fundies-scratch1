use context dcic2024

include csv
include data-source

orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

fun is-morning(r :: Row) -> Boolean:
  r["time"] < "12:00"
where:
  is-morning(orders.row-n(0)) is true
  is-morning(orders.row-n(4)) is false
end

morning-value-orders = filter-with(orders, is-morning)

filter-with(orders, lam(r): r["time"] < "12:00"end)

order-by(orders, "time", false)

lastest-value = orders.row-n(5)
lastest-value["amount"]

something = load-table:
  location :: String,
  subject :: String,
  date :: String
  source: csv-table-url("https://pdi.run/f25-2000-photos.csv", default-options)
end
forest-table = filter-with(something, lam(o): o["subject"] == "Forest"end)

order-forest = order-by(forest-table, "date", false)
lastest-date = order-forest.row-n(0)
lastest-date["date"]

something

loca-count = count(something, "location")

order-by(loca-count, "count", false)

freq-bar-chart(something, "location")
#|
high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
where:
  is-high-value(orders.row-n(0)) is true
  is-high-value(orders.row-n(2)) is true
end

new-high-orders = filter-with(orders, is-high-value)
new-high-orders

check:
  new-high-orders is high-value-orders
end

filter-with(orders, lam(o): o["amount"] >= 8.0 end)
|#

