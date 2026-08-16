-- Normalised Graph Network delegation activity. This is intentionally the same vocabulary Lodestar
-- consumes: the raw event tables remain available when a consumer needs protocol-level detail.
CREATE VIEW delegation_events AS
SELECT
  tx_hash || '-' || CAST(log_index AS VARCHAR) AS id,
  'delegation' AS event_type,
  "serviceProvider" AS indexer,
  delegator,
  tokens_dec::VARCHAR AS tokens,
  block_number,
  block_timestamp AS timestamp,
  tx_hash
FROM staking__tokens_delegated
UNION ALL
SELECT tx_hash || '-' || CAST(log_index AS VARCHAR), 'undelegation', "serviceProvider", delegator,
  tokens_dec::VARCHAR, block_number, block_timestamp, tx_hash
FROM staking__tokens_undelegated
UNION ALL
SELECT tx_hash || '-' || CAST(log_index AS VARCHAR), 'withdrawal', "serviceProvider", delegator,
  tokens_dec::VARCHAR, block_number, block_timestamp, tx_hash
FROM staking__delegated_tokens_withdrawn
UNION ALL
SELECT tx_hash || '-' || CAST(log_index AS VARCHAR), 'withdrawal', indexer, delegator,
  tokens_dec::VARCHAR, block_number, block_timestamp, tx_hash
FROM staking__stake_delegated_withdrawn;
