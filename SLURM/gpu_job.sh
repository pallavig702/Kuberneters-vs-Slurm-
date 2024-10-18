#!/bin/bash
#SBATCH --job-name=palg_gpu_job
#SBATCH --output=output_%j.txt
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G 
#SBATCH --time=06:00:00
#SBATCH --partition=i.q # Get the name of the gpu_partition by the command "scontrol show partition"
#SBATCH --gres=gpu:1              # Request 1 GPU

module load cuda/10.2             # Load CUDA or other GPU-related modules

source ~/LLaVaNV_env/bin/activate  #The environment equipped with all the dependentcies
python RunLLaVa.py 
