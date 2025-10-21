use context dcic2024
include csv
  include data-source

#Leap year function
fun leap-year(days :: Number) -> String:
  doc: "This function determines weather or not a year is a leap year based on the number of days" 
  if days > 365:
    "True"
  else:
    "False"
    end
where:
  leap-year(366) is "True"
  leap-year(365) is "False"
end
  
leap-year(366)

#Clock ticking function 
fun clock-tick(seconds :: Number):
  doc: "This takes in a number and adds 1, unless it exceeds 59 than it resets to zero"
  if (num-is-integer(seconds) == true) and (seconds >= 0) and (seconds < 59):
    seconds + 1
  else if seconds == 59:
    0
  else:
    "Invalid Input"
end
end
clock-tick(58.1)

#Rock paper scissors function
fun rock-paper-scissors(player1 :: String, player2 :: String) -> String:
  if (player1 == "Rock") and (player2 == "Paper"):
    "Player 2 Wins"
  else if (player1 == "Rock") and (player2 == "Scissors"):
    "Player 1 Wins"
  else if (player2 == "Rock") and (player1 == "Paper"):
    "Player 1 Wins"
  else if (player2 == "Rock") and (player1 == "Scissors"):
    "Player 2 Wins"
  else if player1 == player2:
    "Tie"
  else:
    "Invalid Input"
end
end

rock-paper-scissors("Scissors", "Scissors")

#Planet table

planet-table = table: Planet :: String, Distance :: Number
  row: "Mercury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Saturn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end

mars = planet-table.row-n(3)
mars["Distance"]

 #Problem 5
something = load-table:
  year :: Number,
  day :: Number,
  month :: String,
  rate :: Number
  source: csv-table-file("boe_rates.csv", default-options)
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize rate using num-sanitizer
end


something.length()
median(something, "rate")
modes(something, "rate")
order-by(something, "rate", true)
order-by(something, "rate", false)

