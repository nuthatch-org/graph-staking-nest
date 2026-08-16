# Graph Staking nest

An installable Nuthatch nest for the Graph Protocol's HorizonStaking delegation activity on Arbitrum One.
It is the packaged source of the nest serving Lodestar's Delegation Activity feed.

```sh
nuthatch init --from https://github.com/nightswatchhq/graph-staking-nest
nuthatch dev --dir graph-staking-nest --rpc https://your-archive-rpc
```

## Query surface

`delegation_events` is the compatibility view for the Graph Network subgraph's delegation activity
feed. It gives one normalised event stream with `delegation`, `undelegation`, and `withdrawal` types.
`delegation_activity_daily` and `indexer_delegation_activity` are the aggregate views intended for
operator dashboards.

The raw `staking__*` tables remain the ground truth. The view maps only the four declared events;
it does not claim current delegated balances, which require a broader staking-state fold.

## Provenance and release gate

The contract is HorizonStaking at `0x00669A4CF01450B64E8A2A20E9b1FCB71E61eF03`, from block
`42,449,585`. Its ABI is vendored. Before this repository is marked available in the catalogue, the
checks directory must contain fixed-block fixtures matching the Lodestar production result and the
network subgraph.
