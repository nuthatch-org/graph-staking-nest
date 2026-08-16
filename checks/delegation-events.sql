-- Pinned fixture: the full normalised event surface of this narrow nest.
SELECT
  event_type,
  COUNT(*) AS event_count,
  MIN(block_number) AS first_block,
  MAX(block_number) AS last_block
FROM delegation_events
GROUP BY event_type
ORDER BY event_type;
