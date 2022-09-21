# GitHub Action to GCP Storage Bucket

This simple action uses the [gsutil tool](https://cloud.google.com/storage/docs/gsutil) to download a directory with a remote GCP Storage bucket

## Usage

### `workflow.yml`

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: gcp-storage-download

on:
  push:
    branches:
      - master

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: braineanear/gcp-storage-download@main
        env:
          GCP_SERVICE_ACCOUNT_KEY_FILE: ${{ secrets.GCP_SERVICE_ACCOUNT_KEY_FILE }}
          GCP_STORAGE_BUCKET: ${{ secrets.GCP_STORAGE_BUCKET }}
          SOURCE_DIR: "my-file.extension"
          DEST_DIR: "my-file.extension"
```

### Configuration

The following settings must be passed as environment variables as shown in the example. Sensitive information, especially `GCP_SERVICE_ACCOUNT_KEY_FILE`, should be [set as encrypted secrets](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables) — otherwise, they'll be public to anyone browsing your repository's source code and CI logs

| Key | Value | Suggested Type | Required | Default |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| `GCP_SERVICE_ACCOUNT_KEY_FILE` | Your JSON GCP service account key file. [More info here](https://cloud.google.com/storage/docs/authentication/managing-hmackeys) | `Secret ENV` | **Yes** | N/A |
| `GCP_STORAGE_BUCKET` | Your GCP Storage bucket name For example, `my-project` | `Secret ENV` | **Yes** | N/A |
| `SOURCE_DIR` | The local directory (or file) you wish to sync/upload to GCP Storage. For example, `public` | `ENV` | **Yes** | N/A |
| `DEST_DIR` | The directory inside of the GCP Storage bucket you wish to sync/upload to. For example, `my_project/assets`. Defaults to the root of the bucket | `ENV` | No | `/` (root of bucket) |

## License

This project is distributed under the [MIT license](LICENSE)

