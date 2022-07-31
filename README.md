# GitHub Action for Swift

This action executes [Swift](https://swift.org) and generates github action annotations from swift warnings/errors.

## Usage

An example to executing Swift follows:

```yaml
name: Swift

on:
  push:
    paths:
      - '.github/workflows/swift.yml' # File path to this yaml
      - '**/*.swift'
  pull_request:
    paths:
      - '.github/workflows/swift.yml' # File path to this yaml
      - '**/*.swift'

jobs:
  swift-on-docker:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: sinoru/actions-swift@v1
        with:
          swift-image-tag: 'latest'
          args: 'build'
      - uses: sinoru/actions-swift@v1
        with:
          swift-image-tag: 'latest'
          args: 'test'

  swift-without-docker:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: sinoru/actions-swift@v1
        with:
          swift-version: '5.6.3'
          args: 'build'
      - uses: sinoru/actions-swift@v1
        with:
          args: 'test'
```
