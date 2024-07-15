resource "github_repository_file" "codecov" {
  count = local.enable_codecov ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "codecov.yml"
  overwrite_on_create = true
  commit_author       = module.github.commit_author.name
  commit_email        = module.github.commit_author.email
  commit_message      = "Regenerate codecov.io configuration from template."

  content = templatefile(
    "${path.module}/../../templates/codecov.yml.tftpl",
    {
      ignore = [
        "**/fixtures",
        "**/*_nocoverage.go",
        "*_nocoverage.go",
      ],
    }
  )
}
