# Docker Hub metadata action

Post a repo's README.md file as a repositories "Full Description" on Docker Hub.

```ruby
workflow "Set Docker Hub metadata" {
  on = "push"
  resolves = ["Metadata"]
}

action "Metadata" {
  uses = "docker://mpepping/docker-hub-metadata-github-action"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  env = {
    IMAGE = "mpepping/docker-demo"
  }
}
```
