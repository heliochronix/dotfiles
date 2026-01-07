function k8s-show-ns --description 'Show all resources in a Kubernetes namespace' --argument ns
    kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n $ns
end
