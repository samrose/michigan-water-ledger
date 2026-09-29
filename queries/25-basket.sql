-- key: basket
-- store: postgres
-- shape: objects
-- datasets:
-- about: The freshwater-economy basket: the nine industries counted, and the stated basis for each (registry)
SELECT naics, sector, basis
FROM registry.industry_basket
WHERE basket = 'freshwater_economy'
ORDER BY naics
