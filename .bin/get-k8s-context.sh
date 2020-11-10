#!/bin/bash
get-k8s-context() {
    kubectl config current-context | sed 's#gke_##g' | cut -d'_' -f3
}

get-k8s-context
