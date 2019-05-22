workflow "pdk-validate docker build" {
  on = "push"
  resolves = [
    "push pdk-validate",
  ]
}

action "pdk-validate is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "pdk-validate docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["pdk-validate is master"]
  secrets = [
    "DOCKER_USERNAME",
    "DOCKER_PASSWORD",
  ]
}

action "build pdk-validate" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["pdk-validate docker registry"]
  args = "build -t mpepping/pdk-validate-github-action ./pdk-validate"
}

action "push pdk-validate" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build pdk-validate"]
  args = "push mpepping/pdk-validate-github-action"
}

workflow "shellcheck docker build" {
  on = "push"
  resolves = [
    "push shellcheck",
  ]
}

action "shellcheck is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "shellcheck docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["shellcheck is master"]
  secrets = [
    "DOCKER_USERNAME",
    "DOCKER_PASSWORD",
  ]
}

action "build shellcheck" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["shellcheck docker registry"]
  args = "build -t mpepping/shellcheck-github-action ./shellcheck"
}

action "push shellcheck" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build shellcheck"]
  args = "push mpepping/shellcheck-github-action"
}

workflow " dockerhub-metadata build" {
  resolves = [
    "push docker-hub-metadata",
  ]
  on = "push"
}

action "docker-hub-metadata is master" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "docker-hub-metadata docker registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["docker-hub-metadata is master"]
  secrets = [
    "DOCKER_USERNAME",
    "DOCKER_PASSWORD",
  ]
  env = {
    IMAGE = "mpepping/docker-demo"
  }
}

action "build docker-hub-metadata" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["docker-hub-metadata docker registry"]
  args = "build -t mpepping/docker-hub-metadata-github-action ./docker-hub-metadata"
}

action "push docker-hub-metadata" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["build docker-hub-metadata"]
  args = "push mpepping/docker-hub-metadata-github-action"
}
