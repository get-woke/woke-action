# woke-action

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/caitlinelfring/woke-action?logo=github&sort=semver)](https://github.com/caitlinelfring/woke-action/releases)

Woke GitHub Actions allow you to execute [`woke`](https://github.com/caitlinelfring/woke) command within GitHub Actions.

The output of the actions can be viewed from the Actions tab in the main repository view.

## Usage

The most common usage is to run `woke` on a file/directory. This workflow can be configured by adding the following content to the GitHub Actions workflow YAML file (ie in `.github/workflows/woke.yaml`).

```yaml
name: 'woke GitHub Actions'
on:
  - pull_request
jobs:
  woke:
    name: 'woke'
    runs-on: ubuntu-latest
    steps:
      - name: 'Checkout'
        uses: actions/checkout@master

      - name: 'woke'
        uses: caitlinelfring/woke-action@master
        with:
          # Cause the check to fail on any broke rules
          fail_on_error: true
```

## Inputs

Inputs to configure the `woke` GitHub Actions.

| Input            | Default               | Description                                                                                       |
|------------------|-----------------------|---------------------------------------------------------------------------------------------------|
| `woke_args`      | `.`                   | (Optional) Additional flags to run woke with (see <https://github.com/caitlinelfring/woke#usage>) |
| `woke_version`   | latest                | (Optional) Release version of `woke` (defaults to latest version)                                 |
| `fail_on_error`  | `false`               | (Optional) Fail the GitHub Actions check for any failures.                                        |
| `workdir`        | `.`                   | (Optional) Run `woke` this working directory relative to the root directory.                      |
| `github_token`   | `${{ github.token }}` | (Optional) Custom GitHub Access token (ie `${{ secrets.MY_CUSTOM_TOKEN }}`).                      |

## License

This application is licensed under the MIT License, you may obtain a copy of it
[here](https://github.com/caitlinelfring/woke-action-reviewdog/blob/main/LICENSE).
