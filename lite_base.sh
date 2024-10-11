#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --time=24:00:00
#SBATCH --partition=blanca-curc-gpu
#SBATCH --gres=gpu:1
#SBATCH --output=lite_base-%j.out
#SBATCH --mail-type="ALL"
#SBATCH --mail-user="asum8093@colorado.edu"

module purge

module load anaconda
module load cuda/12.1.1
cd /rc_scratch/asum8093/lite/data/

wget http://nlp.cs.washington.edu/entity_type/data/ultrafine_acl18.tar.gz

tar -xvzf ultrafine_acl18.tar.gz

echo "== Running Process_Ultrafine.py =="
python process_ultrafine.py

cd ../
mkdir output

conda activate py38-pt1131-cuda117

echo "== This is the scripting step! =="

!python3 lite.py --data_dir './data/processed_data/' --output_dir './output' --train_batch_size 4 --num_train_epochs 2000 --margin 0.1 --save_epochs 200 --learning_rate 1e-6 --lamb 0.05

echo "== End of Job =="