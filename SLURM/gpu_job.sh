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


#!/bin/bash
#SBATCH --job-name=palg_multimodal_gpu_job_32 
#SBATCH --output=output/visuals_%j.txt
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=06:00:00
#SBATCH --partition=i.q
#SBATCH --gres=gpu:l40s:1 #gpu:h100:1 #gpu:1 #gpu:h100:2 #gpu:1              # Request 1 GPU

#Ask GPT how to check how to check nvcc --version on slurm? and then ask your system to get the correct version for yourself for nvcc and cuda
module --ignore_cache load nvhpc-hpcx-cuda12/24.5

# Print the GPU being used
echo "SLURM job running on GPU(s):"
nvidia-smi --list-gpus

# Alternatively, print the CUDA_VISIBLE_DEVICES environment variable (useful in multi-GPU environments)
echo "CUDA_VISIBLE_DEVICES: $CUDA_VISIBLE_DEVICES"

#python RunLLaVa.py
#python /home/pgupt60/TestScripts/Run_LLaVa_Audio_Video.py #irrelevant
#python TestScripts/Run_LLaVa_Next_Audio_Video.py
python TestScripts/Video_LLaVa.py
#python test.py
