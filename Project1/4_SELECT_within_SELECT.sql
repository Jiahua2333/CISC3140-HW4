-- List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
  WHERE continent = 'Europe' and gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')

-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name,continent
    FROM world
 WHERE continent in (SELECT continent FROM world WHERE name='Argentina' or name = 'Australia')
order by name

-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world
  WHERE population > (select population from world where name = 'Canada') and
        population < (select population from world where name = 'Poland')

-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name, concat(round(population /(SELECT population FROM world WHERE name='Germany')*100, 0), '%')
FROM world
WHERE continent = 'Europe'

-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp 
                           FROM world
                          WHERE continent = 'Europe' and gdp > 0)

-- Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area
FROM world as w1
WHERE area = (SELECT max(area) FROM world as w2 where w1.continent=w2.continent)

-- List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
FROM world as w1
WHERE name = (SELECT min(name) FROM world as w2 where w1.continent=w2.continent)

-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name,continent,population
FROM world
where continent not in (select distinct continent from world where population >25000000)

-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name,continent
FROM world as w1
where w1.population/3 > (SELECT max(population) FROM world as w2 where w1.continent=w2.continent and w1.population<>w2.population)