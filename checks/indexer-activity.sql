-- Pinned fixture: the busiest indexers and their normalised activity counts.
SELECT indexer, delegations, undelegations, withdrawals, last_activity_at
FROM indexer_delegation_activity
ORDER BY delegations DESC, undelegations DESC, withdrawals DESC, indexer
LIMIT 25;
