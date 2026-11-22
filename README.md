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

The Docker job builds images with `make docker` and publishes `v*` tags with
`make docker-push`.

## Railway deployments

Hosting infrastructure and registry credentials are managed in
[dogmatiq/infra](https://github.com/dogmatiq/infra). Its repository bindings supply
Actions variables `RAILWAY_PROJECT_ID`, `RAILWAY_SERVICE_NAME` and
`RAILWAY_ENVIRONMENT_NAME`, plus the `RAILWAY_TOKEN` secret.

For bound repositories, tagged CI runs deploy the published
`ghcr.io/<owner>/<repository>:<tag>` image after Build and Docker succeed. The
Railway job waits for the deployment it triggered to reach `SUCCESS`. Its token
must grant access to the bound project's environment.
