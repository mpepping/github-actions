# Docker Hub metadata action

Post a repo's README.md file as a repositories "Full Description" on Docker Hub.

`.github/workflows/push_docker_image.yml`
```yaml

name: UpdateDockerHubMetadata

on:
  push:
    branches:
    - master

jobs:
  update_docker_hub_metadata:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Update Docker hub metadata
      uses: docker://mpepping/docker-hub-metadata-github-action
      env:
        IMAGE: DOCKER_USERNAME/docker-demo
        DOCKER_USERNAME: DOCKER_USERNAME
        DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
```
