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

   - `cd meou-manifests`
   - `chmod +x argocd.sh`
   - `./argocd.sh`

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

1. Run the command to create application on ArgoCD.

   - `cd meou-manifests`
   - `chmod +x argocdapps.sh`
   - `./argocdapps.sh`

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

## Improvement

### Saving secret in vault or using sealed secret
