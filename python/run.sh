#!/bin/bash
run_id="RollerBall_$(date +'%Y-%m-%d-%H-%M-%S')"
mlagents-learn ./config/RollerBall.yaml --run-id=$run_id --env=unity-build/unity-build --no-graphics --num-envs=16 &
tensorboard --logdir=results --port=6006 --host=0.0.0.0 &
wait