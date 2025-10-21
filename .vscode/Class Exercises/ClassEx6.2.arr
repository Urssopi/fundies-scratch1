use context dcic2024


fruits = link("lychee", link("dates", link("mango", link("durian", empty))))

#Exercise 1
fun string-concat(l):
  cases (List) l:
    | empty => ""
    | link(f, r) => f + string-concat(r)
  end
end

string-concat(fruits)

#Exercise 2
fun str-upper(l):
  cases (List) l:
    | empty => ""
    | link(f, r) => string-to-upper(f) + " " + str-upper(r)
  end
end

str-upper(fruits)

num-list = [list: 1.5342, 2.436, 3.3562, 4.7463, 5.298357, 6.6]

fun max-num(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => num-max(f, max-num(r))
  end
end

max-num(num-list)

fun round-nums(l):
  cases (List) l:
    | empty => empty
    | link(f, r) => link(num-round(f), round-nums(r))
  end
end
round-nums(num-list)