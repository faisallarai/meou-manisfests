## Author: Issaka Faisal

## Getting Started.

<a name="One"></a>

## Design

![alt text](https://lucid.app/publicSegments/view/18ea80c3-8e4c-4c31-95b7-27b836c5f01c/image.png)

<a name="Two"></a>

## Prerequisite:

1. kubectl
2. kustomize
3. argocd

<a name="Three"></a>

## Manual installation.

### ArgoCD:

1. Run the command.

   - `kubectl apply -k argocd/`
   - `kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'`
   - `` export ARGOCD_SERVER=`kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname'` ``
   - `` export ARGO_PWD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d` ``
   - `argocd login $ARGOCD_SERVER --username admin --password $ARGO_PWD --insecure`

### MongoDB:

1. Run the command.

   - `kubectl apply -k mongodb/`

### Redis:

1. Run the command.

   - `kubectl apply -k redis/`

### NodeJS API:

1. Run the command.

   - `kubectl apply -k meou-api/overlay/prod/`

### ReactJS:

1. Run the command.

   - `kubectl apply -k meou-client/overlay/prod/`

<a name="Four"></a>

## CI/CD installation.

### MongoDB:

1. Run the command to create application.

   - `argocd app create mongodb --repo https://github.com/faisallarai/meou-manisfests.git --path mongodb --dest-server https://kubernetes.default.svc --dest-namespace meou`

### Redis:

1. Run the command to create application.

   - `argocd app create redis --repo https://github.com/faisallarai/meou-manisfests.git --path redis --dest-server https://kubernetes.default.svc --dest-namespace meou`

### NodeJS API:

1. Run the command to create application.

   - `argocd app create meou-api --repo https://github.com/faisallarai/meou-manisfests.git --path meou-api --dest-server https://kubernetes.default.svc --dest-namespace meou`

### ReactJS API:

1. Run the command to create application.

   - `argocd app create meou-client --repo https://github.com/faisallarai/meou-manisfests.git --path meou-client --dest-server https://kubernetes.default.svc --dest-namespace meou`

<a name="Five"></a>

## API Testing.

1. Run the command to have access to the api locally.

   - `kubectl port-forward svc/meou-api-service -n meou 8080:80`

### POST Request:

```
POST `http://localhost:8080/api/v1/cats`

Body
{
"imageId":1
}
```

### GET Request:

```
GET `http://localhost:8080/api/v1/cats/:ID`

```

-

## Improvement

### Saving secret in vault or using sealed secret
