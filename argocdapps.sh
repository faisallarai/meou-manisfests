#!/bin/sh


argocd app create mongodb --repo https://github.com/faisallarai/meou-manisfests.git --path mongodb --dest-server https://kubernetes.default.svc --dest-namespace meou

argocd app create redis --repo https://github.com/faisallarai/meou-manisfests.git --path redis --dest-server https://kubernetes.default.svc --dest-namespace meou

argocd app create meou-api --repo https://github.com/faisallarai/meou-manisfests.git --path meou-api/overlays/prod --dest-server https://kubernetes.default.svc --dest-namespace meou

argocd app create meou-client --repo https://github.com/faisallarai/meou-manisfests.git --path meou-client/overlays/prod --dest-server https://kubernetes.default.svc --dest-namespace meou