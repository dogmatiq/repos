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

On releases, the Railway job invokes an optional `ci-railway::` Makefile hook
after applying configuration and before waiting for healthy deployments. It
receives `RAILWAY_TOKEN` and `RAILWAY_IMAGE_TAG`. Use it for operations the Railway
configuration cannot perform, such as creating custom-domain attachments. The
injected no-op default keeps the hook optional; a failing hook fails the job.
