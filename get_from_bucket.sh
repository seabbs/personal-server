#!/bin/bash

## Sync all sensitive/chanagsutil -m rsync -d -r secrets  gs://personal-server-bucket/secrets
## Requires gcloud utils and a bucket to be set up at this location
gsutil -m rsync -d -r gs://personal-server-bucket/secrets secrets
gsutil -m rsync -d -r gs://personal-server-bucket/public_projects public_projects
gsutil -m rsync -d -r gs://personal-server-bucket/private_projects private_projects  