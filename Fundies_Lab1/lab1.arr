include image 
#T-Shirt Shop Question 1
(12 + 3) * 5
(12 + 3) * 7

#T-Shirt Shop Question 2
perimiter = 2 * (420 + 594) 
perimiter * 0.10

#String suprises question 1
"Designs for Everyone!"

#String suprises question 2
"red"
"blue"
"green"
"red" + "blue"

#Traffic Light
blkRec = rectangle(40, 110, "solid", "black")
redCir = circle(15, "solid", "red")
yelCir = circle(15, "solid", "yellow")
greCir = circle(15, "solid", "green")
pole = rectangle(10, 60, "solid", "grey")

lights = above(redCir , (above(yelCir, greCir)))

trafficLight = overlay-xy((lights), -5, -10, (blkRec))

above(trafficLight, pole)

#Broken Code hunt
#Goal: A rectangle with width 50 and height 20, solid black
rectangle(50, 20, "solid", "black")

circle(30, "solid", "red")

#Create a Flag
background = beside(rectangle(100, 100, "solid", "blue"), rectangle(100, 100, "solid", "white"))

overlay(circle(30, "outline", "white"), overlay(triangle(30, "solid", "brown"), background))

#Shield 
diamond = rotate(45, square(100, "solid", "gray"))

overlay(triangle(30, "solid", "brown"), overlay(circle(30, "solid", "white"),  diamond))