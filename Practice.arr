use context dcic2024

fun kil-mil(k :: Number) -> Number:
  doc:"coverts kilometers to miles"
  k * 0.625
end

kil-mil(33)

fun air(aqi :: Number) -> String:
  if aqi <= 50:
    "Good"
  else if aqi <= 100:
    "Moderate"
  else if aqi <= 150:
    "Unheatly"
  else:
    "Hazerdous"
    end
end

air(151)


basket = table: item :: String, price :: Number, quantity :: Number
  row: "apple", 0.50, 10
  row: "orange", 0.75, 5
  row: "watermelon", 2.99, 2
end

fun add-total(t :: Table) -> Table:
  build-column(t, "total", lam(r): r["price"] * r["quantity"] end)
end

fwe = add-total(basket)
aa = order-by(fwe, "total", false)
gg = aa.row-n(0)
gg["total"]

fun tempu(temp :: Number, unit :: String):
  if unit == "c" block:
    c-f = ((temp * 1.8) + 32) 
    c-k = (temp + 273.15)
    c-f + c-k
  else if unit == "f":
    f-k = ((temp + 459.67) * (5/9))
    f-c = ((5/9) * (temp - 32))
    f-c + f-c
  else if unit == "k":
    k-c = (temp - 273.15)
    k-f = ((temp - 273.15) * (9/5)) + 32
    num-to-string(k-c) + " " + num-to-string(k-f)
  else:
    "Invalid Input"
end
end

tempu(4, "k")

fun aqi-cat(aqi1, pollutant):
  if (aqi1 == 200) and (pollutant == "PM2.5"):
    "Very Unhealthy"
  else:
    air(aqi1)
  end
end

aqi-cat(200, "PM2.5")