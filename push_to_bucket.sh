#!/bin/bash

## Sync all sensitive/chanagable data
## Requires gcloud utils and a bucket to be set up at this location
gsutil -m rsync -d -r -C secrets gs://personal-server-bucket/secrets
gsutil -m rsync -d -r -C public_projects  gs://personal-server-bucket/public_projects
gsutil -m rsync -d -r -C private_projects  gs://personal-server-bucket/private_projects
