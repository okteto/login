# GitHub Actions for Okteto Cloud

## Automate your development workflows using Github Actions and Okteto Cloud
GitHub Actions gives you the flexibility to build an automated software development workflows. With GitHub Actions for Okteto Cloud you can create workflows to build, deploy and update your applications in [Okteto Cloud](https://cloud.okteto.com).

Get started today with a [free Okteto Cloud account](https://cloud.okteto.com)!

## Github Action for Okteto Cloud Login

With the Okteto Cloud Login action you can automate you workflow to do an Okteto Cloud login using an API token. This action is a prerequisite for the rest of the [Okteto Cloud actions](https://github.com/okteto/actions).

## Configure your Okteto API Token

Copy [your Okteto API token](https://cloud.okteto.com/#/settings/setup) and save it [as a secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) with the name `OKTETO_TOKEN` in the GitHub repository.

## Inputs

### `token`

**Required** Your Okteto API token.

### `url`

Your Okteto Enterprise URL. Use this to run your actions in your Okteto Enterprise instance (https://okteto.com/enterprise).

## Example usage

This example runs the login action and then activates a namespace.

```yaml
# File: .github/workflows/workflow.yml
on: [push]

name: example

jobs:

  devflow:
    runs-on: ubuntu-latest
    steps:
    
    - uses: okteto/login@latest
      with:
        token: ${{ secrets.OKTETO_TOKEN }}
    
    - uses: okteto/namespace@latest
      with:
        name: cindylopez
```

## Advanced usage

### Custom Certification Authorities or Self-signed certificates

You can specify a custom certificate authority or a self-signed certificate by setting the `OKTETO_CA_CERT` environment variable. When this variable is set, the action will install the certificate in the container, and then execute the action. 

Use this option if you're using a private Certificate Authority or a self-signed certificate in your [Okteto Enterprise](http://okteto.com/enterprise) instance.  We recommend that you store the certificate as an [encrypted secret](https://docs.github.com/en/actions/reference/encrypted-secrets), and that you define the environment variable for the entire job, instead of doing it on every step.


```yaml
# File: .github/workflows/workflow.yml
on: [push]

name: example

jobs:
  devflow:
    runs-on: ubuntu-latest
    env:
      OKTETO_CA_CERT: ${{ secrets.OKTETO_CA_CERT }}
    steps:
    
    - uses: okteto/login@latest
      with:
        token: ${{ secrets.OKTETO_TOKEN }}
    
    - uses: okteto/namespace@latest
      with:
        name: cindylopez
```