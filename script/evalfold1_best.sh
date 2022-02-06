#!/usr/bin/env sh

python eval.py \
--multitask True \
--model_type alexnet \
--eval_dir ./tfrecord/train_val_test_per_fold_agegender/test_fold_is_0 \
--eval_data test \
--model_dir ./models/train_val_test_per_fold_agegender/test_fold_is_0/alexnet-run-24189 \
--result_dir ./results \
--batch_size 128
