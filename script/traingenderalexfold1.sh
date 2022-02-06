#!/usr/bin/env sh

python train.py \
--multitask=False \
--model_type=alexnet_single \
--class_type=Gender \
--train_dir=./tfrecord/train_val_test_per_fold_agegender/test_fold_is_0 \
--model_dir=./models \
--optim=Momentum \
--eta=0.001 \
--eta_decay_rate=0.1 \
--max_steps=50000 \
--steps_per_decay=10000 \
--batch_size=128