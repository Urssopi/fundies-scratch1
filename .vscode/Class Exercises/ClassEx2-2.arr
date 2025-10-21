use context starter2024

fun welcome(name :: String):
  doc: "returns a greeting"
  "Welcome to class, " + name
end

check:
  welcome("Max") is "Welcome to class, Max"
  welcome("Franz") is "Welcome to class, Franz"
end

fun area(width, height):
  doc: "returns the product of two numbers" 
  width * height
end

check: 
  area(3,20) is 3 * 20
end

#Excersise 1
base-cost = 5
design-cost = 0.1

fun shirt-calculate(num-of-shirts :: Number, design :: Number) -> Number:
  doc: "returns sum of two numbers"
  (num-of-shirts * base-cost) + (design * design-cost)
end


shirt-calculate(4, string-length("Go Team!"))
shirt-calculate(7, string-length("Hello World"))


#Excersise 2

fun celsius-to-fahrenheit(celsius :: Number) -> Number:
  doc: "returns the converted value of cel to fehr"
  (celsius * (9/5)) + 32
end

celsius-to-fahrenheit(30)

fun fehrenheit-to-celsius(fehrenheit :: Number) -> Number:
  doc: "returns the converted value from fehr to cel"
  (fehrenheit - 32) * (5/9)
end

fehrenheit-to-celsius(86)