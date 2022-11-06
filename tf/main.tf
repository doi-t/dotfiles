locals {
  apps = [
    "git", "gh", "pre-commit", "starship", "chezmoi",
    "bat", "tree", "ripgrep", "exa", "fzf", "tldr",
    "jq", "wget", "neovim",
    "pyenv", "tfenv", "direnv",
    "awscli", "poetry",
    "go", "goreleaser",

    # cask
    "visual-studio-code", "iterm2",
    # "docker", https://github.com/shihanng/terraform-provider-installer/issues/42
    "slack", "zoom",
    "1password", "todoist", "amethyst",
    "amethyst", "kindle",
  ]
}

resource "installer_brew" "this" {
  for_each = toset(local.apps)
  name     = each.key
}
