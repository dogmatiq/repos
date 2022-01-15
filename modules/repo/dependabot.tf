resource "github_repository_file" "dependabot_config" {
  count = local.enable_dependabot ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/dependabot.yml"
  overwrite_on_create = true

  commit_message = <<EOF
Regenerate Dependabot configuration from template.

This file is managed by the Terraform configuration at https://github.com/dogmatiq/repos,
do not edit it manually!
EOF

  content = templatefile(
    "${path.module}/../../templates/dependabot.yml.tftpl",
    {
      ecosystems = compact([
        "github-actions",
        contains(var.languages, "go") ? "gomod" : "",
        contains(var.languages, "js") ? "npm" : "",
      ])
    }
  )
}

resource "github_repository_file" "dependabot_workflow_config" {
  count = local.enable_dependabot_auto_merge ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/dependabot.yml"
  overwrite_on_create = true

  commit_message = <<EOF
Regenerate workflow configuration from template.

This file is managed by the Terraform configuration at https://github.com/dogmatiq/repos,
do not edit it manually!
EOF

  content = templatefile(
    "${path.module}/../../templates/workflow-dependabot.yml.tftpl",
    {}
  )
}
