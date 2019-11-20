echo "Your current cluster is:"
kubectl config current-context
echo "The pods in the cluster are:"
kubectl get pods --all-namespaces
echo "Please enter the spinnaker namespace:"
read SPINNAKER_NAMESPACE
echo "I saw $SPINNAKER_NAMESPACE as the namespace."
echo "I will forward the gate pod output from the spinnaker installation to your localhost so you can see the GUI - do not close this window."
export GATE_POD=$(kubectl get pods --namespace ${SPINNAKER_NAMESPACE} -l "cluster=spin-gate" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace ${SPINNAKER_NAMESPACE} $GATE_POD 8084
