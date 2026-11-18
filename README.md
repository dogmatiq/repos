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
the services, databases, and custom domains within that project, including each
domain's target port. For example, the example application's configuration must
retain `example.dogmatiq.io` on port `8080`.

Enable a project in the repository's module declaration:

```hcl
railway_project = {
  workspace_id = var.railway_workspace_id
  token        = lookup(var.railway_deployment_tokens, "example", null)
}
```

Omitting `railway_project` disables Railway for the repository. Removing it from
an existing configuration plans deletion of the project, its services and
databases, and the repository's deployment secret. Review that destruction in
the Terraform plan before applying.

Supply `workspace_id` to create a project named after the repository. Projects
are not shared between repositories. Supply the project's production token as
`token` to create the repository's `RAILWAY_TOKEN` Actions secret. No project-name
variable is needed: the Railway CLI resolves the project and environment from
the token.

Add the module's `railway_token_setup_required` output to the list in `railway.tf`
when enabling another repository, so its setup instructions appear in the root
Terraform output.

### Terraform Cloud variables

Create a variable set named **Railway**, attached to the **dogmatiq/repos**
workspace, with these **Terraform** variables:

| Variable | Sensitive | Value |
|----------|-----------|-------|
| `railway_api_token` | Yes | A Railway account or workspace API token authorized to manage projects in the configured workspace. |
| `railway_workspace_id` | No | The ID of the Railway workspace that owns the projects. |
| `railway_deployment_tokens` | Yes | An HCL map of repository names to tokens for their projects' production environments. Enable the **HCL** option. |

Create the provider API token in Railway's account/workspace token settings. This
is a different credential from a project's deployment token. The Terraform
provider does not currently support creating deployment tokens; create those in
each project's settings, selecting its production environment.

For example, the deployment-token variable has this shape:

```hcl
{
  example = "<example production token>"
  stories = "<stories production token>"
}
```

The deployment-token map defaults to empty. For a new project, first apply with
its token absent to create the project. The `railway_token_setup_required` output
lists repositories that still need tokens, with a link to each project's token
settings. Create the production token, add it to the variable set, and apply
again to distribute it. The repository then disappears from that output.
Removing a map entry removes the corresponding GitHub Actions secret. Secret
values are stored in Terraform state; keep them out of the repository. The GitHub
App used by Terraform needs repository **Secrets** write permission.

### Importing the existing projects

Before the first apply, import the existing projects into the `repos` workspace
so Terraform adopts them instead of creating duplicates:

```sh
terraform init
terraform import 'module.repo_example.railway_project.this[0]' 03ab8cc0-2454-4d2f-bb22-98460d3df7bc
terraform import 'module.repo_stories.railway_project.this[0]' d7aaf0f0-1ea5-46fc-81f1-6fc6fd1d6288
terraform plan
```

The imported projects will be renamed to `example` and `stories` to match their
repository names.

CLI imports require the provider credentials locally as well as access to the
Terraform Cloud workspace. Supply `TF_VAR_railway_api_token` securely and set
`TF_VAR_railway_workspace_id`; remote workspace variables are not automatically
available to local import operations.
Review the plan before applying. Existing services, volumes, and databases are
not managed individually by this Terraform configuration, but deleting their
project also deletes them.
