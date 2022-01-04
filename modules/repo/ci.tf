locals {
  workflow         = var.workflow == "(default)" ? var.languages[0] : var.workflow
  workflow_content = local.workflow != null ? file("${path.module}/../../.github/workflows/shared-${local.workflow}.yml") : null
  workflow_ref_content = local.workflow != null ? templatefile(
    "${path.module}/../../templates/workflow-ci.yml.tftpl",
    { workflow = local.workflow }
  ) : null
  enable_branch_protection = local.workflow != null && !var.private # not supported by private repos on free-tier
}

resource "github_repository_file" "workflow_config" {
  count = local.workflow == null ? 0 : 1

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/ci.yml"
  commit_message      = "Update GitHub Actions configuration based on Terraform configuration"
  overwrite_on_create = true
  content             = local.workflow_ref_content
}

resource "github_branch_protection" "default_branch" {
  count = local.enable_branch_protection ? 1 : 0

  repository_id = github_repository.this.node_id
  pattern       = github_repository.this.default_branch

  # Add "required status checks" for each of the jobs in the workflow.
  #
  # Annoyingly, GitHub identifies the jobs by their display name, which is made
  # up of the job name from the workflow file in each repository _AND_ the job
  # name from the shared workflow they refer to.
  #
  # We build the cross-product of these names below by parsing the YAML files.
  required_status_checks {
    strict = true
    contexts = flatten(
      [for key, ref in yamldecode(local.workflow_ref_content).jobs :
        [for key, shared in yamldecode(local.workflow_content).jobs : "${ref.name} / ${shared.name}"]
      ]
    )
  }
}