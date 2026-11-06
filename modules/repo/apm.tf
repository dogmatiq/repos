# Terraform created each repository's apm.yml, but no longer manages it.
# Dependabot keeps its package versions up to date, using the "apm" ecosystem in
# dependabot.yml, and developers edit it directly to add or remove packages.
# Terraform forgets the files without deleting them.
removed {
  from = github_repository_file.apm_config

  lifecycle {
    destroy = false
  }
}
