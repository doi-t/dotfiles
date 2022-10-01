locals {
  apps = [
    "git", "gh", "starship",
    "go", "pyenv", "tfenv",
    "bat", "tree",

    # cask
    "visual-studio-code",
    # "docker", https://github.com/shihanng/terraform-provider-installer/issues/42
    "slack", "slack", "zoom",
    "1password", "todoist", "kindle",
  ]
}

resource "installer_brew" "this" {
  for_each = toset(local.apps)
  name     = each.key
}
