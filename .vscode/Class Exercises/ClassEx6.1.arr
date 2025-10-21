use context starter2024
data MobileRecord:
    phone(title :: String, model :: String, color :: String, storage :: Number)
end 

phone-1 = phone("iPhone", "13 Pro", "Green", 64)
phone-2 = phone("iPhone", "17 Pro", "Orange", 512)

phone-2.storage
phone-1.storage

fun phone-price(m :: MobileRecord) -> Number:
  base-price = 500
  m.storage + base-price
end

phone-price(phone-2)

data Priority:
  | low
  | medium
  | high
end

data Status:
  | todo
  | in-progress
  | done
end

task3 = high
task2 = medium
task1 = low 

check:
  is-low(task1) is true
  is-Priority(task3) is true
  is-high(task3) is true
end

 data Task:
  | task(description :: String, priority :: Priority, status :: Status)
  | note(description :: String)
end

task-1 = task("Dishes", low, todo)
task-2 = task("Pay council tax", high, in-progress)
note-1 = note("Post Office closes at 4:30")

fun status-to-string(s :: Status) -> String:
    cases (Status) s:
    | todo => "To do"
    | in-progress => "In progress"
    | done => "Done"
  end
end

fun priority-to-string(p :: Priority) -> String:
  cases (Priority) p:
    | low => "❕TASK:"
    | medium => "❗️TASK:"
    | high => "‼️ TASK:"
  end
end

fun describe(t :: Task) -> String:
  cases (Task) t:
    | task(d, p, s) => priority-to-string(p) + " " + d + ", " + status-to-string(s)
    | note(d) => "📝 " + d
  end
end
describe(task-1)




#|data Tempurature:
  | celsius(degrees :: Number)
  | kelvin(degrees :: Number)
  | fahrenheit(degrees :: Number)
end

temp1 = kelvin(1000)

fun to-celsius(t :: Tempurature):
  cases (Tempurature) t:
    | fahrenheit(d) => (5/9) / (d - 32)
    | kelvin(d) => d - 273.15
end
end

to-celsius(temp1)
|#


data WeatherReport:
  | sunny(tempurature :: Number)
  | rainy(tempurature :: Number, precipitation :: Number)
  | snowy(tempurature :: Number, precipitation :: Number, wind-speed :: Number)
end

today = sunny(65)

fun is-severe(w :: WeatherReport) -> Boolean:
 cases(WeatherReport) w:
    | sunny(t) => if t > 35: true else: false end
    | rainy(p) => if p > 20: true else: false end
    | snowy(ws) => if ws > 30: true else: false end
    end
end
 
is-severe(today)