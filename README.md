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
| **Submit a job to run **  | :---: | :---: |
| Seconds | 301   | 283   |

Convert it into table here
https://docs.google.com/spreadsheets/d/1qMnKAA5yYIJGemuwOGr8rjKKR-OGtrx08P2S95erjek/edit?gid=0#gid=0
