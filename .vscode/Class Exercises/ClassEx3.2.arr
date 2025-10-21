use context dcic2024
include csv
include data-source

workouts = table: date :: String, activity :: String, duration :: Number
  row: "2025", "Running", 30
end

#|
recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv", default-options)
    
    sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer 
end

recipes

world-bank = load-table:
  country :: String,
  life-exp :: Number,
  gdp :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/life_exp_gdp.csv", default-options)
  sanitize life-exp using num-sanitizer
  sanitize gdp using num-sanitizer
end

lr-plot(world-bank, "gdp", "life-exp")
|#

plant-sighting = load-table:
  plant-common_name :: String, 
  location-latitude :: String,
  location-longitude :: Number,
  date_sighted :: Number,
  soil_type :: String,
  plant_height_cm :: String, 
  plant_color :: String
source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
end

plant-sighting.length()