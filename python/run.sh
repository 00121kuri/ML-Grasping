#!/bin/bash
# 現在の日付をY-m-d形式で取得
current_date=$(date +'%Y-%m-%d')

# 入力がある場合は入力と日付を結合、ない場合はデフォルトのタイムスタンプを使用
if [ -n "$1" ]; then
    run_id="${current_date}-${1}"
else
    run_id=$(date +'%Y-%m-%d-%H-%M-%S')
fi

echo "Using run_id: $run_id"

mlagents-learn ./config/one-hand.yaml --run-id=$run_id --env=build-app/ml-grasping --no-graphics --num-envs=4 &
# mlagents-learn ./config/one-hand.yaml --run-id=$run_id &
wait