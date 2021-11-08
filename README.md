# Helm Push to Artifactory Github Action

## Inputs

### chart-path

**Required** - The path to the helm chart to push

### local-artifactory-repository

**Required** - The url of the helm-local artifactory repository to push to

### artifactory-username

**Required** - Your artifactory username

### artifactory-api-key

**Required** - Your artifactory API KEY or password

## Outputs

### output

The command output

## Example usage

```yaml
uses: sixgill/actions-helm-push-artifactory
with:
  chart-path: deployments/my-super-awesome-chart
  local-artifactory-repository: https://plainsight.jfrog.io/artifactory/helm-local
  artifactory-username: ${{ secrets.MY_USERNAME }}
  artifactory-api-key: ${{ secrets.MY_API_KEY }}
```