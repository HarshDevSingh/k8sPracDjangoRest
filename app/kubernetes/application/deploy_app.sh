echo "******* deploying db deployment ******"
echo "######## applying secret"
kubectl apply -f secret.yaml || true
echo "######## applying configmap"
kubectl apply -f configmap.yaml
echo "######## applying deployment"
kubectl apply -f deployment.yaml || true
echo "######## applying service"
kubectl apply -f service.yaml || true