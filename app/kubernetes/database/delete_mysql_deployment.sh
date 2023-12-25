echo "******* deleting db deployment ******"
echo "######## deleting service"
kubectl delete -f service.yaml || true
echo "######## deleting storage"
kubectl delete -f  storage.yaml || true
echo "######## deleting deployment"
kubectl delete -f deployment.yaml || true
echo "######## deleting deployment"
kubectl delete -f secret.yaml || true
