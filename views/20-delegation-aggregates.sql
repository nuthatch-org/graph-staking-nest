CREATE VIEW delegation_activity_daily AS
SELECT
  date_trunc('day', to_timestamp(timestamp)) AS day,
  event_type,
  COUNT(*) AS event_count,
  SUM(CAST(tokens AS DECIMAL(38, 0)))::VARCHAR AS tokens
FROM delegation_events
GROUP BY day, event_type;

CREATE VIEW indexer_delegation_activity AS
SELECT
  indexer,
  COUNT(*) FILTER (WHERE event_type = 'delegation') AS delegations,
  COUNT(*) FILTER (WHERE event_type = 'undelegation') AS undelegations,
  COUNT(*) FILTER (WHERE event_type = 'withdrawal') AS withdrawals,
  MAX(timestamp) AS last_activity_at
FROM delegation_events
GROUP BY indexer;
