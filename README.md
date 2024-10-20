# Kuberneters-vs-Slurm

A technical comparison of Kubernetes and Slurm command usage for analogous functions is provided here. Additionally, this repository offers a comparative perspective on employing both solutions for scaling high-speed data processing. Based on my research experience with both systems, this repository provides insights into factors such as ease of use and efficiency for each platform.

Disclaimer: While Kubernetes and Slurm have fundamentally different job submission mechanisms, this comparative analysis aims to illustrate how proficiency in one platform can facilitate understanding of the other.

|  | Slurm Tutorial | Kubernetes Tutorial |
| :---:   | :---: | :---: |
| **Scripts** | uses shell script to make batch file to run job(s)| uses YAML files to run a job(s)|
| **Dyanamic in nature?** | Slurm consists of a slurmd daemon running on each compute node and a central slurmctld daemon running on a management node | Here, slurmctld equivalent is master node and slurm equivalent is worker/compute node |
| **Autoscaling?**	   | Slurm lacks auto-scaling and is designed for a fixed scale. | Autoscaling is a key feature of Kubernetes. K8s primarily designed for a public cloud environment where additional compute power is always available. If you want to launch a workload that exceeds the current capacity of the cluster, the deployment just fails or scales the cluster to meet the required resources. |
|**Jobs Status**  |   |     |
| Check active, failed, completed etc. | sacct -u <username> | kubectl get pods, kubectl get jobs, <br>kubectl describe pod <podname> |
|Report the running jobs in priority order and then the pending jobs in priority order| squeue -u <username> | kubectl get pods, kubectl get jobs, <br>kubectl describe pod <podname> |
| **Submit a job to run (automating):** Submit a job script for later execution. Script will typically contain one or more srun commands to launch parallel tasks.| sbatch file.sh (file.sh contains the running instructions) | "kubectl create pod -f <YAMLfile>" or "kubectl create pod -f <YAMLfile>" (can also use apply instead of create but once created apply can help in modifications) |
| **Submit a job to run (interactively):** Submit a job for execution or initiate job steps in real time, interactivly | srun | "kubectl create pod -f <YAMLfile>" or <br> "kubectl create pod -f <YAMLfile>" |
| **Transering data on nodes**: Transfer a data from local disk to local disk on the nodes allocated to a job.| sbcast  | Launch the pod first to create a medium to connect to PVC. So launch the pod with PVC you want to transfer data first. Once the pod is running you can give the following command: <br> **kubectl cp /path/to/local/file my-pod:/data/** <br> This command will copy the file from your local path to the /data/ directory inside my-pod, which is the mounted PV. |
|**Cancel a pending or running job**| "scancel ID1" (ID1 is the job id)<br>scancel -t PENDING (cancel all pending jobs) <br>or scancel -u username (cancel all jobs with a specific user name). Likewise many examples are there.| kubectl delete pod <podname> <br> kubectl delete job <jobname>|
|**Allocate resources for a job in real time**| salloc | set resources requirements in pod or job yaml |
|**Attach standard input, output, and error** plus signal capabilities to a currently running job or job step	| sttach | set input output in the python file mentioned in pod or job yaml | 

**Some key things to remember while running kubernetes**<br>
- Building the yaml files for pods and YAML <br>
- Create persistent volume on node for disk usage on node locally. This is not local to your system. PVs can be build using yaml files and a fixed amount of volume is dedicated for storage of inputs and outputs and scripts on node. This can be expanded too as needed. <br>
- Before running pods or jobs, PVs have to build local on the node. <br>




Convert it into table here
https://docs.google.com/spreadsheets/d/1qMnKAA5yYIJGemuwOGr8rjKKR-OGtrx08P2S95erjek/edit?gid=0#gid=0
