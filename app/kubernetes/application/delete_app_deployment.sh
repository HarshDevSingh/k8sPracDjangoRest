echo "******* deleting db deployment ******"
echo "######## deleting service"
kubectl delete -f service.yaml || true
echo "######## deleting configmap"
kubectl delete -f configmap.yaml || true
echo "######## deleting deployment"
kubectl delete -f deployment.yaml || true
echo "######## deleting deployment"
kubectl delete -f secret.yaml || true
