#!/bin/bash
default_run_id="$(date +'%Y-%m-%d-%H-%M-%S')"
run_id=${1:-$default_run_id}
echo "Using run_id: $run_id"

if [ "$run_id" != "$default_run_id" ]; then
    resume_option="--resume"
    echo "Resuming previous training session"
else
    resume_option=""
    echo "Starting new training session"
fi

# mlagents-learn ./config/one-hand.yaml --run-id=$run_id --env=unity-build/unity-build --no-graphics --num-envs=4 &
mlagents-learn ./config/one-hand.yaml --run-id=$run_id $resume_option &
wait