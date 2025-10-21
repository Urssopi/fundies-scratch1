use context starter2024
import math as M
import statistics as S

#Table
cafe-data =
  table: day, drinks-sold
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

#| Transforming to list 
cafe-data.get-column("drinks-sold")
sales = cafe-data.get-column("drinks-sold")
M.max(sales)      # maximum sales
S.mean(sales)     # average sales
M.sum(sales)      # total sold
S.median(sales)
|#

#New list
discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = filter(is-real-code, unique-codes)

first-code = real-codes.get(0)

lower-codes = map(string-to-upper, real-codes)

#For each loops

fun add-two(numbers :: List<Number>) -> List<Number> block:
  doc: "adds two to each number in a list"
  var added-two = [list: ]
  for each(n from numbers):
    added-two := added-two.append([list: n + 2])
  end
  added-two
where:
  add-two([list: 1, 2, 3]) is [list: 3, 4, 5]
end

#Exercise 1
list-1 = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

uni-codes = distinct(list-1)

fun non-dupe(aws :: String) -> Boolean:
  not(string-to-lower(aws) == aws)
end

one-each = filter(non-dupe, uni-codes)

all-lower = map(string-to-lower, one-each)

#Removes maybe 
fun def-aws(aws :: String) -> Boolean:
  not(string-to-lower(aws) == "maybe")
end
  
filter(lam(aws): not(string-to-lower(aws) == "maybe") end, all-lower)

#For loops exercise
#Calculates product
fun product(numbers :: List) block:
  var result = 1
  for each(item from numbers):
    result := item * result
    end
  result
where:
  product([list: 2, 4, 1]) is 8
end

#Calculates sum of only even nums 

fun is-even(n :: Number) -> Boolean:
  num-modulo(n, 2) == 0
end

fun sum-even-numbers(integers :: List) block:
  var result = 1
  for each(item from integers):
    result := item + result 
  end
  result
where:
  sum-even-numbers([list: 1, 2, 3, 4]) is 6
end