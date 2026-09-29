-- key: awards
-- store: postgres
-- shape: objects
-- datasets: fed_assistance_awards
-- about: Every FY2025 federal assistance award to a Michigan recipient that a freshwater topic rule admits, with the rule that admitted it
SELECT geo_id AS geo, level, agency, cfda_number AS cfda, cfda_title AS program,
       recipient_name AS recipient, amount, matched_rule AS rule, action_date AS date
FROM published.fed_assistance_awards
WHERE topic = 'freshwater' AND year = 2025 AND geo_id LIKE '26%'
ORDER BY amount DESC, award_id
