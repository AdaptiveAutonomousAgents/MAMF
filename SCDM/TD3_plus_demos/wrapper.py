import gym
import random
import numpy as np

class BasicWrapper(gym.Wrapper):
    def __init__(self, env):
        super().__init__(env)
        self.env = env
        # double the size of action space
        low = np.concatenate((env.action_space.low, env.action_space.low))
        high = np.concatenate((env.action_space.high, env.action_space.high))
        self.action_space = gym.spaces.Box(low=low, high=high, dtype=env.action_space.dtype)

        low = np.concatenate((env.observation_space.low, np.array([0])))
        high = np.concatenate((env.observation_space.high, np.array([1])))
        self.observation_space = gym.spaces.Box(low=low, high=high, dtype=env.observation_space.dtype)

        self._max_episode_steps = self.env._max_episode_steps

        self.status_indicator = np.array([0])
        self.timestep = 0
        self.horizon_to_switch = 200


    def step(self, action):
        action_dim = int(self.action_space.shape[0]/2)
        if self.status_indicator[0] == 0:
            next_state, reward, done, info = self.env.step(action[:action_dim])
        else:
            next_state, reward, done, info = self.env.step(action[action_dim:])
        self.timestep += 1
        if self.timestep == self.horizon_to_switch:
            self.timestep = 0
            self.status_indicator = 1-self.status_indicator
        next_state = self._get_obs()
        # print(self.status_indicator)
        return next_state, reward, done, info


    def _get_obs(self):
        obs = self.env.env._get_obs()
        new_obs = np.concatenate((obs, self.status_indicator))
        return new_obs

    def reset(self):
        obs = self.env.reset()
        self.status_indicator = np.array([0])
        self.timestep = 0
        new_obs = np.concatenate((obs, self.status_indicator))
        return new_obs

