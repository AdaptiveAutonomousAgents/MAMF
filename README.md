# Solving Complex Dexterous Manipulation Tasks with Model-Assisted Model-Free Reinforcement Learning

This repository is the code for CoRL 2022 paper: <a href="https://openreview.net/forum?id=7CrXRhmzVVR&referrer=%5BAuthor%20Console%5D(%2Fgroup%3Fid%3Drobot-learning.org%2FCoRL%2F2022%2FConference%2FAuthors%23your-submissions)">Solving Complex Dexterous Manipulation Tasks with Model-Assisted Model-Free Reinforcement Learning</a> (link to openreview). 

And this is based on the code for ICML 2021 paper: <a href="https://arxiv.org/abs/2009.05104">Solving Complex Dexterous Manipulation Tasks with Trajectory Optimisation and Reinforcement Learning</a> (link to arXiv version). 
Before you start, you can first check the original repository.

Requirements:
* Mujoco-py
* Pytorch
* Numpy
* joblib
* <a href="https://github.com/henrycharlesworth/dexterous-gym">Dexterous-Gym</a>

Install with ```pip install -e .```

Our work is maly defined in the SCDM/TD3_plus_demos/.
We learn a dynamics model during the training of a reinforcement learning agent and use the dynamics model to generate imaginary transitions to help learn the critic.

To run the experiments, please check the files under SCDM/TD3_plus_demos/run_experiments/
