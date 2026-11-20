# Dogmatiq Repositories

This repository contains a Terraform configuration that is responsible for
managing the lifetime and settings of the Git repositories within the Dogmatiq
organization.

**All repositories in the organization must be created by making a pull-request to
this repository.**

## Shared CI Makefile entry points

The Build job runs `make ci`. Extend the shared Makefile packages with `ci::`
recipes/prerequisites for repository-specific checks; generated caller workflows
remain managed by Terraform.

The Docker job sets up detected Go, mise and Node tools, builds the production
image with `make docker`, then invokes an optional `ci-docker::` Makefile hook.
The hook has an injected no-op double-colon default, so existing consumers need
no additional target. Extend it to run image integration/smoke tests without
building another copy of the image. Both steps receive the same `DOCKER_TAGS`:
`dev` for ordinary checks, or the `v*` tag for releases. Repositories using the
Docker package can resolve the image as `$(DOCKER_REPO):$(firstword $(DOCKER_TAGS))`.

Tagged releases keep the existing `make docker-push` path and registry login.
That path pushes rather than loading the image, so a hook that runs it locally
must pull the already-pushed image first. The release-publishing workflow and
Terraform caller templates are unchanged.

Run the same hook locally after building the image:

```sh
make docker
make --eval='ci-docker::' ci-docker
```

## Railway private image credential

Set the sensitive Terraform workspace variable `railway_github_pat` to a classic
GitHub PAT with only `read:packages`. Pass it to private repositories that enable
`railway_project`; Stories currently uses it. Terraform stores it as the
production Railway shared variable `GITHUB_TOKEN`. Public repositories and
repositories without Railway projects receive no copy. Archiving removes the
credential along with the CI deployment token, while retaining the project.

This Railway variable is separate from GitHub Actions' built-in `GITHUB_TOKEN`.
It is not automatically injected into application containers or configured as
an image-pull credential; deployment code must explicitly consume it for that
purpose. Terraform state contains the sensitive value; do not commit it or
expose it through outputs.
