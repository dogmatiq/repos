module "repo_protokit" {
  source      = "./modules/repo"
  name        = "protokit"
  description = "🚧 Protocol Buffers code generation for Dogma applications."
  languages   = ["go"]

  copyright = {
    since = 2026
  }
}
