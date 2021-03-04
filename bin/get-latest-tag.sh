#!/usr/bin/env bash

cd digital-form-builder
git fetch --all --tags
latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
export TAG=${DESIGNER_TAG=${latest_tag}}
echo "TAG=$TAG"