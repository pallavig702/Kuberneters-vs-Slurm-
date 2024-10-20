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

## Step 3: Alternatively, https://github.com/pallavig702/Kuberneters-vs-Slurm-/blob/main/README.md

## Get data into PVC via S3 buckets
Launch the pod first to create a medium to connect to PVC. So launch the pod with PVC you want to transfer data first. Once the pod is running you can give the following command:<br><br>
**kubectl cp /path/to/local/file my-pod:/data/** <br><br>
This command will copy the file from your local path to the /data/ directory inside my-pod, which is the mounted PV. <br>

To ensure the files are copied successfully to the Persistent Volume, you can log into the pod and check:<br><br> **kubectl exec -it my-pod -- ls /data**


## create jobs
