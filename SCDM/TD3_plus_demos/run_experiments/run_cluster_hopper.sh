#!/bin/bash

env_name="Hopper-v3"
tag=test
seed=1

demo_tag=""

#CUDA_VISIBLE_DEVICES=0

echo "start running $env_name $tag with seed $seed"

#hopper
python main.py --policy='SAC' --without_demo --add_artificial_transitions_type="ours" --prediction_horizon=3 --max_timesteps=3000000 --model_start_timesteps=5000 --start_timesteps=25000 --seed=$seed --use_normaliser --env=$env_name --expt_tag="$tag" --demo_tag=$demo_tag --save_model
