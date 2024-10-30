# Release

This document contains all information related to release.

## Versioning Scheme

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Generally, the versioning scheme looks like the following formats where `X` is an unsigned integer:

- **Release candidates (RCs):** `X.X.X-rc.X`
- **Full releases:** `X.X.X`

## Overview

If only `gitmgr` has changed, release `gitmgr` alone.
If `libgitmgr` has changed, release `libgitmgr` and _then_ `gitmgr`.

## Checklist for `libgitmgr`

Steps should be executed in sequential order.

- [ ] Checkout and rebase `master` to its latest commit and checkout a new branch
- [ ] Change the `version` field in [`Cargo.toml`](../lib/libgitmgr/Cargo.toml) to the new tag
- [ ] Use the new version in the `gitmgr` [`Cargo.toml`](../lib/gitmgr/Cargo.toml) file
- [ ] Change the version in [`CHANGELOG.md`](../CHANGELOG.md) and uncomment the following line: `<!--The latest version contains all changes.-->` (skip this for release candidates)
- [ ] Verify that everything looks/works as expected:

```shell
cargo xtask ci
```

- [ ] Create and _do not merge_ a commit with the following message: `Update libgitmgr to <tag>`
- [ ] Test and verify the publishing workflow:

```shell
cargo publish --dry-run -p libgitmgr
```

- [ ] Merge the preparation commit into `master`
- [ ] Publish the crate:

```shell
cargo publish -p libgitmgr
```

- [ ] Verify that the [crate](https://crates.io/crates/libgitmgr) on `crates.io` looks correct
- [ ] Ensure that the [docs](https://docs.rs/libgitmgr/latest/libgitmgr/) on `docs.rs` look correct

## Checklist for `gitmgr`

Steps should be executed in sequential order.

- [ ] Checkout and rebase `master` to its latest commit, then checkout a new branch
- [ ] Change the `version` field in [`Cargo.toml`](../bin/gitmgr/Cargo.toml) to the new tag
- [ ] Change the version in [`CHANGELOG.md`](../CHANGELOG.md) and uncomment the following line: `<!--The latest version contains all changes.-->` (skip this for release candidates)
- [ ] Verify that everything looks/works as expected:

```shell
cargo xtask ci
```

- [ ] Create and _do not merge_ a commit with the following message: `Update gitmgr to <tag>`
- [ ] Test and verify the publishing workflow:

```shell
cargo publish --dry-run -p gitmgr
```

- [ ] Merge the preparation commit into `master`
- [ ] Checkout and rebase `master` to its latest commit, which should be the aforementioned commit
- [ ] Tag and push the tag:

```shell
git tag <tag>
git push --tags origin master
```

- [ ] Publish the crate:

```shell
cargo publish -p gitmgr
```

- [ ] Verify that the [crate](https://crates.io/crates/gitmgr) on `crates.io` looks correct
- [ ] Download and install the crate:

```shell
# Full releases
cargo install --locked gitmgr

# Release candidates (RCs)
cargo install --locked --version <tag> gitmgr
```

- [ ] Verify that the [GitHub release](https://github.com/trinhminhtriet/gitmgr/releases) on the repository's releases page looks correct
