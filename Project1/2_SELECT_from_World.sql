-- show the name, continent and population of all countries.
SELECT name, continent, population FROM world

-- Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population
 FROM world
WHERE population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'.
SELECT name, population/1000000
 FROM world
where continent LIKE 'South America'

-- Show the name and population for France, Germany, Italy
SELECT name, population
 FROM world
where name in ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
SELECT name
 FROM world
where name LIKE '%United%'

-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
 FROM world
where population > 250000000 OR area > 3000000

-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area
 FROM world
where (population > 250000000 AND area <= 3000000) OR (population <= 250000000 AND area > 3000000)

-- For South America show population in millions and GDP in billions both to 2 decimal places.
-- Round(value, number of decimal places)
SELECT name, round(population/1000000, 2), round(gdp/1000000000, 2)
 FROM world
where continent LIKE 'South America'

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, round(gdp/population, -3)
 FROM world
where gdp > 1000000000000

-- Show the name and capital where the name and the capital have the same number of characters
SELECT name, capital
  FROM world
 WHERE len(name) = len(capital)

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
where left(name, 1) = left(capital, 1) and name <> capital

-- Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%u%' 
  and name LIKE '%a%' 
  and name LIKE '%o%' 
  and name LIKE '%i%'
  and name LIKE '%e%'
  and name NOT LIKE '% %'
