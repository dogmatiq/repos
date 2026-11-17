# Dogmatiq Repositories

This repository contains a Terraform configuration that is responsible for
managing the lifetime and settings of the Git repositories within the Dogmatiq
organization.

**All repositories in the organization must be created by making a pull-request to
this repository.**

## Railway

Each repository can optionally have its own Railway project. This configuration
manages the project and publishes its manually supplied production deployment
token as a GitHub Actions secret. The application's `.railway/railway.ts` owns
the services and resources within that project.

Enable a project in the repository's module declaration:

```hcl
railway_project = {
  name  = "Dogma Example"
  token = lookup(var.railway_deployment_tokens, "example", null)
}
```

Omitting `railway_project` disables Railway for the repository. Set it to `{}` to
create a project named after the repository, or supply `name` to override that
name. Projects are not shared between repositories. Supply the project's
production token as `token` to create the repository's `RAILWAY_TOKEN` Actions
secret. No project-name variable is needed: the Railway CLI resolves the project
and environment from the token.

### Terraform Cloud variables

Create a variable set named **Railway**, attached to the **dogmatiq/repos**
workspace, with these **Terraform** variables:

| Variable | Sensitive | Value |
|----------|-----------|-------|
| `railway_api_token` | Yes | A Railway account or workspace API token authorized to manage projects in the configured workspace. |
| `railway_deployment_tokens` | Yes | An HCL map of repository names to tokens for their projects' production environments. Enable the **HCL** option. |

Create the provider API token in Railway's account/workspace token settings. This
is a different credential from a project's deployment token. The Terraform
provider does not currently support creating deployment tokens; create those in
each project's settings, selecting its production environment.

For example, the deployment-token variable has this shape:

```hcl
{
  example = "<Dogma Example production token>"
  stories = "<Dogma Stories production token>"
}
```

The deployment-token map defaults to empty. This lets Terraform create a new
project before its token exists. Add the token to the variable set and apply
again to distribute it. Removing a map entry removes the corresponding GitHub
Actions secrets. Secret values are stored in Terraform state; keep them out of
the repository. The GitHub App used by Terraform needs repository **Secrets**
write permission.

### Importing the existing projects

Before the first apply, import the existing projects into the `repos` workspace
so Terraform adopts them instead of creating duplicates:

```sh
terraform init
terraform import 'module.repo_example.railway_project.this[0]' 03ab8cc0-2454-4d2f-bb22-98460d3df7bc
terraform import 'module.repo_stories.railway_project.this[0]' d7aaf0f0-1ea5-46fc-81f1-6fc6fd1d6288
terraform plan
```

CLI imports require the provider credentials locally as well as access to the
Terraform Cloud workspace. Supply `TF_VAR_railway_api_token` securely; remote
workspace variables are not automatically available to local import operations.
Review the plan before applying. Existing services, volumes, and databases are
outside this Terraform configuration. Project deletion is blocked by
`prevent_destroy` while its resource declaration remains in place.
