echo "******* deploying db deployment ******"
echo "######## applying service"
kubectl apply -f secret.yaml || true
echo "######## applying storage"
kubectl apply -f storage.yaml || true
echo "######## applying deployment"
kubectl apply -f deployment.yaml || true
echo "######## applying service"
kubectl apply -f service.yaml || true