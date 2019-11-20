echo "Your current cluster is:"
kubectl config current-context
echo "The pods in the cluster are:"
kubectl get pods --all-namespaces
echo "The helm deployments in this cluster are:"
helm list
echo "Please enter the spinnaker namespace:"
read SPINNAKER_NAMESPACE
echo "I saw $SPINNAKER_NAMESPACE as the namespace."
echo "Please enter the spinnaker release name:"
read SPINNAKER_RELEASE_NAME
echo "I saw $SPINNAKER_RELEASE_NAME as the spinnaker release name."
echo "I will open a command bash prompt on the pod running halyard in the cluster now."
kubectl exec --namespace ${SPINNAKER_NAMESPACE} -it ${SPINNAKER_RELEASE_NAME}-spinnaker-halyard-0 bash
