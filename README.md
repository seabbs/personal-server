


# Set-up

1. Add required secrets to the `secrets` folder. Subdirectories are named based on the container they provide secrets for. Required container secrets are, 
	1. `fcdashboard` - folder containing a copy of the loanbook saved as `loanbook.csv`.
	1. `rstudio` - folder containing the Rstudio server crediantials (`creds.env`) saved as `USER=` and `PASSWORD=`.

1. Add docker network

```bash
docker network create shinyproxy-net
```

1. Pull all images.

```bash
 docker-compose -f containers/docker-compose.yml pull --ignore-pull-failures
```

1. Build all images.

```bash
 docker-compose -f containers/docker-compose.yml build
```

1. Launch all services

```bash
 docker-compose up
```

There should now be a shinyproxy instance at `8080` and a jenkins instance at `9090`. All the commands seen here (except for the transfer of secrets has been implemented in the `set-up-server.sh` bash script).

# Kubernetes (to be implemented)

I plan to convert the docker infrastructure deployed above with `docker-compose` to kubernetes. I plan to do this using the managed google cloud service and have yet to find a functional example. Let me know if you have any thoughts on this.

# To do's

- [ ] Set up scheduling:
		- Rstudio server to refresh daily
		- H2o tweets, every 15 minutes
		- H2o tweets summary, every month
		- Cheatsheets, daily