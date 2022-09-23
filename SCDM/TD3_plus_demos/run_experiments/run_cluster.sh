#!/bin/bash

#env_name="PenSpin-v0"

env_name="EggCatchUnderarm-v0"
#env_name="EggCatchOverarm-v0"

tag=test
seed=1

demo_tag=""

#CUDA_VISIBLE_DEVICES=0

echo "start running $env_name $tag with seed $seed"
python main.py --policy='SAC' --add_artificial_transitions_type='ours' --prediction_horizon=3 --start_timesteps=25000 --seed=$seed --use_normaliser --env=$env_name --expt_tag="$tag" --demo_tag=$demo_tag --save_model
