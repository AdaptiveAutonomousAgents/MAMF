#!/bin/bash

cd /bigdata/users/jhu/SCDM/SCDM/TD3_plus_demos/
source /bigdata/users/jhu/anaconda3/bin/activate
conda activate SCDM

env_name="HalfCheetah-v3"

tag=test
seed=1

demo_tag=""

#CUDA_VISIBLE_DEVICES=0

echo "start running $env_name $tag with seed $seed"
#cheetah
python main.py --eval_freq=200 --max_timesteps=200000 --model_start_timesteps=5000 --start_timesteps=10000 --without_demo --seed=$seed --use_normaliser --env=$env_name --expt_tag="$tag" --demo_tag=$demo_tag --save_model
