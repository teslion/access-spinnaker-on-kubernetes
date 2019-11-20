echo "Your current cluster is:"
kubectl config current-context
echo "The pods in the cluster are:"
kubectl get pods --all-namespaces
echo "Please enter the spinnaker namespace:"
read SPINNAKER_NAMESPACE
echo "I saw $SPINNAKER_NAMESPACE as the namespace."
echo "I will forward the deck pod output from the spinnaker installation to your localhost so you can see the GUI - do not close this window."
export DECK_POD=$(kubectl get pods --namespace spinnaker -l "cluster=spin-deck" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace spinnaker $DECK_POD 9000
