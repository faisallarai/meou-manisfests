## Author: Issaka Faisal

## Getting Started.

<a name="One"></a>

### Prerequisite:

1. kubectl
2. kustomize
3. argocd

<a name="Two"></a>

## Manual installation.

### ArgoCD:

1. Run the command.

   - `kubectl apply -n argocd -k argocd/`
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

## CI/CD installation.

### NodeJS API:

1. Run the command.

   - `argocd app create meou-api --repo https://github.com/faisallarai/meou-manifests.git --path meou-api --dest-server https://kubernetes.default.svc --dest-namespace meou`

## Improvement

### Saving secret in vault or using sealed secret
