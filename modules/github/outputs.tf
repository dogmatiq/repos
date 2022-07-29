output "org" {
  description = "The GitHub organization."
  value       = "dogmatiq"
}

output "app" {
  description = "The GitHub app used to perform GitHub API operations."
  value = {
    id              = "164888"
    installation_id = "22283767"
  }
}

output "commit_author" {
  description = "The Git commit author."
  value = {
    name  = "dogmatiq-automation[bot]"
    email = "97779210+dogmatiq-automation[bot]@users.noreply.github.com"
  }
}
