#!/bin/bash

env_name="Swimmer-v3"
tag=test
seed=1

demo_tag=""

#CUDA_VISIBLE_DEVICES=0

echo "start running $env_name $tag with seed $seed"

#swimmer
python main.py --policy='SAC' --add_artificial_transitions_type="ours" --prediction_horizon=3 --max_timesteps=3000000 --model_start_timesteps=5000 --start_timesteps=25000 --without_demo --seed=$seed --use_normaliser --env=$env_name --expt_tag="$tag" --demo_tag=$demo_tag --save_model
