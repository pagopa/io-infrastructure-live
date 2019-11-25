#!/usr/bin/env bash

# Script to ease secret uploading to keyvault loaded by the function app module
# Each secret "name" parameter should match its own "Alias" declared within the  terraform.tfvar file for the function module
# Replace "xxxxxxxxx" with the secret value (do not commit the resulting file) and set VAULT_NAME with the right value es.: io-dev-keyvault

VAULT_NAME="io-prod-keyvault"

# FUNCTIONS
az keyvault secret set --vault-name "$VAULT_NAME" --name "fn2-commons-mailup-username" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "fn2-commons-mailup-secret" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "fn2-app-public-api-key" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "fn2-services-webhook-channel-url" --value "VALUE"

# APIM
az keyvault secret set --vault-name "$VAULT_NAME" --name "apim-01-fn2-admin-host-key" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "apim-01-fn2-services-host-key" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "generated-cert" --value "VALUE"

# APPLICATION GATEWAY
az keyvault secret set --vault-name "$VAULT_NAME" --name "application-gateway-to-apim-01-cert" --value "VALUE"

# NOTIFICATION HUB
az keyvault secret set --vault-name "$VAULT_NAME" --name "notification-hub-01-bundle-id" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "notification-hub-01-gc-m-key" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "notification-hub-01-key-id" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "notification-hub-01-team-id" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "notification-hub-01-token" --value "VALUE"

# KUBERNETES
az keyvault secret set --vault-name "$VAULT_NAME" --name "k8s-app-backend-secrets" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "k8s-app-backend-secrets-spid-certs" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "k8s-developer-portal-backend-secrets" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "k8s-pagopa-proxy-prod-secrets" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "k8s-pagopa-proxy-test-secrets" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "k8s-pagopa-proxy-test-secrets-io-certs" --value "VALUE"
az keyvault secret set --vault-name "$VAULT_NAME" --name "k8s-pagopa-proxy-test-secrets-pagopa-ca-chain-certs" --value "VALUE"

# MONITORING
az keyvault secret set --vault-name "$VAULT_NAME" --name "app-insight-web-tests-ocp-apim-subscription-key" --value "VALUE"
