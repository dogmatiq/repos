#!/usr/bin/env bash
# Rebuild the HCP Terraform Linux/amd64 provider from pinned upstream source.
# The source submodule pins our extension to the community provider.
set -euo pipefail

bundle_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
repo_dir=$(cd -- "$bundle_dir/../.." && pwd)
provider_version=0.6.3-dogmatiq.2
provider_address=registry.terraform.io/dogmatiq/railway
source_path=terraform.d/railway-provider/source
source_dir="$repo_dir/$source_path"
output_dir="$repo_dir/terraform.d/plugins/$provider_address/$provider_version/linux_amd64"

# These settings make builds independent of local compiler defaults and paths.
export GOTOOLCHAIN=go1.27.4
export CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOAMD64=v1
export GOFLAGS= GOEXPERIMENT=

git -C "$repo_dir" submodule update --init -- "$source_path"
if [[ -n $(git -C "$source_dir" status --porcelain) ]]; then
  printf '%s\n' 'Commit provider source changes before rebuilding the bundle.' >&2
  exit 1
fi

mkdir -p -- "$output_dir"
(
  cd -- "$source_dir"
  go build -mod=readonly -trimpath -buildvcs=false \
    -ldflags "-s -w -buildid= -X main.version=$provider_version" \
    -o "$output_dir/terraform-provider-railway_v$provider_version" .
)
