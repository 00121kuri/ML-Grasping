#!/bin/bash
run_id="$(date +'%Y-%m-%d-%H-%M-%S')"
# mlagents-learn ./config/one-hand.yaml --run-id=$run_id --env=unity-build/unity-build --no-graphics --num-envs=4 &
mlagents-learn ./config/one-hand.yaml --run-id=$run_id
tensorboard --logdir=results --port=6006 --host=0.0.0.0 &
wait