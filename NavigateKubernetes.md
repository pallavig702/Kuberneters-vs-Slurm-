#### Note all the yml files required to work with kubernetes are placed in kubernetes folder
# Create a PVC first. 
This is a persistent volume or data drive at the spot where node is located. This is not local to your system. For node to pick scripts to run and the data to be used, it has to be local on node.
### kubectl create -f pvc.yml

# Step 2 is to create a pod
To interact with PVC or to explore PVC or to run test scripts, spinning pods can be the best way
kubectl create -f pod.yml

### Check pods status
kubectl get pods
add screenshot

kubectl describe pod <podname>
add screenshot

## Step 3 Get into the pods and explore PVC

## Get data into PVC via S3 buckets

## create jobs
