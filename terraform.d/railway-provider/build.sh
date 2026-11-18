#!/usr/bin/env bash
# Rebuild the HCP Terraform Linux/amd64 provider from pinned upstream source.
# The adjacent patch is the complete source for our project-token extension.
set -euo pipefail

bundle_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
repo_dir=$(cd -- "$bundle_dir/../.." && pwd)
provider_version=0.6.3-dogmatiq.1
provider_address=registry.terraform.io/dogmatiq/railway
upstream_commit=5681181e2bd954b5cdd9a28b02b76795fd1618fd
output_dir="$repo_dir/terraform.d/plugins/$provider_address/$provider_version/linux_amd64"

# These settings make builds independent of local compiler defaults and paths.
export GOTOOLCHAIN=go1.27.4
export CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOAMD64=v1
export GOFLAGS= GOEXPERIMENT=

source_dir=$(mktemp -d)
trap 'rm -rf -- "$source_dir"' EXIT

git -C "$source_dir" init --quiet
git -C "$source_dir" fetch --quiet --depth=1 \
  https://github.com/terraform-community-providers/terraform-provider-railway.git \
  "$upstream_commit"
git -C "$source_dir" checkout --quiet --detach FETCH_HEAD
git -C "$source_dir" apply "$bundle_dir/project-token.patch"

mkdir -p -- "$output_dir"
(
  cd -- "$source_dir"
  go build -mod=readonly -trimpath -buildvcs=false \
    -ldflags "-s -w -buildid= -X main.version=$provider_version -X main.providerAddress=$provider_address" \
    -o "$output_dir/terraform-provider-railway_v$provider_version" .
)
