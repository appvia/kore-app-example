### Deploying an application in Kore

The following details the step taken to deploy and application in to Kore. The application itself is nothing more than nginx server proxying into httpbin.

#### Key points

* We are using the embedded cert-manager and ingress controller.
* We are using http01 as the challenge so I manually create a dns record to point to the ingress.
* We create need to create a network policy to ingress and for the cert-manager challenge.

#### Steps:

```shell
# Create the infrastructure for deployments
$ kore create cluster -p gke-budget-cluster -a <allocation>
# Create an environment for deployment
$ kore create namespace app
# Create a robot token to deploy with
$ kore create robot app --description "Deployment token for app" --show-config
# Assign the permissions to the robot account
$ kore assign plan kore.deployment
```

The robot token and be configured in two ways; either using the environment variables or taking the entire configuration file and using it as a whole.

We simply need to add the secrets below into CI.

```
KORE_SERVER=http://<api>
KORE_TEAM=<team>
KORE_REFRESH_TOKEN=<token from file generate by kore create robot>
```

Alternatively you can use entire file as a secret (either base64 or direct depending on CI) and as a secret.

```
KORE_CONFIG=<path to file> kore [commands]
```

You can go ahead an deploy application.
```

