#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --time=24:00:00
#SBATCH --partition=blanca-curc-gpu
#SBATCH --gres=gpu:1
#SBATCH --output=lite_test_600-%j.out
#SBATCH --mail-type="ALL"
#SBATCH --mail-user="asum8093@colorado.edu"

module purge

module load anaconda
module load cuda/12.1.1
cd /rc_scratch/asum8093/lite/data/


echo "== Running Reduced Dataset.py =="
python process_ultrafine.py

#python reduced_dataset.py

cd ../
ls
#mkdir output

conda activate py38-pt1131-cuda117

echo "== This is the scripting step! =="

#python lite.py --data_dir './data/processed_data/' --output_dir './output' --train_batch_size 4 --num_train_epochs 2000 --margin 0.1 --save_epochs 200 --learning_rate 1e-6 --lamb 0.05
python eval.py --model_dir "./output/02_11_22_Oct_11_2024_batch4_margin0.1_lr1e-06lambda0.05/epochs600" --eval_data_path "./data/processed_data/dev_processed.json" --type_vocab_file "./data/processed_data/types.txt" --batch 64

python result.py  --dev "./output/02_11_22_Oct_11_2024_batch4_margin0.1_lr1e-06lambda0.05/epochs600/Evaluation_dev_processed.json"  --test "./output/02_11_22_Oct_11_2024_batch4_margin0.1_lr1e-06lambda0.05/epochs600/Evaluation_test_processed.json" --model_dir "./output/02_11_22_Oct_11_2024_batch4_margin0.1_lr1e-06lambda0.05/epochs600" --threshold_step 0.05

#python result.py  --test "./output/02_11_22_Oct_11_2024_batch4_margin0.1_lr1e-06lambda0.05/epochs600/Evaluation_test_processed.json"  --model_dir "./output/02_11_22_Oct_11_2024_batch4_margin0.1_lr1e-06lambda0.05/epochs600" --threshold_step 0.05


echo "== End of Job =="