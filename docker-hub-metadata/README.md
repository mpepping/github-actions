# Docker Hub metadata action

Run `pdk validate` on Puppet code:

```ruby
workflow "Set Docker Hub metadata" {
  on = "push"
  resolves = ["Validator"]
}

action "Validator" {
  uses = "docker://mpepping/docker-hub-metadata-github-action"
}
```
