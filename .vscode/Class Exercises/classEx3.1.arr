use context starter2024
fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below nothing"
  if temp-in-C >= 27:
    "sun hat"
  else if temp-in-C < 10:
    "winter hat"
  else:
    "no hat"
  end
end

fun add-glasses(outfit :: String) -> String:
  outfit + ", and glasses"
end

fun choose-outfit(temp-in-C :: Number) -> String:
  doc: "Chooses and outfit based on temp then adds glasses"
  outfit = choose-hat(temp-in-C) 
  add-glasses(outfit)
end
  
choose-outfit(35)

fun choose-hat-or-visor(temp-in-C :: Number, has-visor :: Boolean) -> String:
  if (temp-in-C > 30) and (has-visor == true):
    "Wear visor"
  else:
    "Wear any other hat bruh idek"
end
end

choose-hat-or-visor(31, true)