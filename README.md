### Deploying an application in Kore

```shell
# Creating the infra
$ kore create cluster -p gke-budget-cluster -a <allocation>

# Create an environment for deployment
$ kore create namespace app

# Create a robot token to deploy with
$ kore create robot app --description "Deployment token for app" --show-config

# You can take the token from the configuration or the entire configuration file
# either or. Assuming the token directly. I added the following to my circleci
# secrets

KORE_SERVER=http://<api>
KORE_TEAM=<team>
KORE_REFRESH_TOKEN=<token from file>

# Or you can add the file directly / base64 into the secrets and use that

# Assign the permissions to the robot account
$ kore assign plan kore.deployment

You can the deploy
```

