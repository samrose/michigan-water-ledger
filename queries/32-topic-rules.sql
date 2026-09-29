-- key: topicRules
-- store: postgres
-- shape: objects
-- datasets:
-- about: The rules that admit an award to the freshwater topic (a program number or a keyword), and the basis for each (registry)
SELECT kind, value, basis
FROM registry.topic_rule
WHERE topic = 'freshwater'
ORDER BY kind, value
