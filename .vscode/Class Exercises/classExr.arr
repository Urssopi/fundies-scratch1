use context starter2024
include image
#create an orange triangle 
triangle-size = 35
triangle-opacity = "solid"
triangle-color = "orange"
orange-triangle = triangle(triangle-size, triangle-opacity, triangle-color)
orange-triangle

#create a blue square
side-length = 30
square-opacity = "solid"
square-color = "blue"

square(side-length, square-opacity, square-color)

#yellow circle on top of black rectangle
radius = 20
opacity = "solid"
circle-colour = "yellow"
yellow-circle = circle(radius, opacity, circle-colour)

#black rectangle
width = 110
length1 = 200
rectangle-color = "black"
black-rectangle = rectangle(width, length1, opacity, rectangle-color)

#display image
circle-rect = above(yellow-circle, black-rectangle)

#Yellow circles side by side
double-circ = beside(yellow-circle, yellow-circle)
#Second circle above image
above(double-circ, black-rectangle)

#Create a Flag with three stipes, a star, and a moon
first-stripe = rectangle(70, 100, "solid", "black")
second-stripe = rectangle(70, 100, "solid", "blue")
third-stripe = rectangle(70, 100, "solid", "black")
middle-circle = circle(30, "solid", "white")
moon-circle = circle(25, "solid", "black")
star-circle = circle(10, "solid", "white")

flag-back = beside(first-stripe, beside(second-stripe, third-stripe))

flag-half = overlay-xy(middle-circle, -5, -20, flag-back)

flag-quarter = overlay-xy(moon-circle, -15, -20, flag-half)

overlay-xy(star-circle, -35, -30, flag-quarter)