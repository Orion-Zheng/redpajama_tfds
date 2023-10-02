#!/bin/bash
#SBATCH -N 1 
#SBATCH -n 1
#SBATCH --time=48:00:00
#SBATCH --job-name=upload_redpajama
#SBATCH --partition=normal
# load PATH
source ~/.bashrc
# scp files in multi-process manner
gsutil -m cp -r $SCRATCH/redpajama_tfds/redpajama_data/redpajama_arxiv gs://fuzhao/
gsutil -m cp -r $SCRATCH/redpajama_tfds/redpajama_data/redpajama_book gs://fuzhao/
gsutil -m cp -r $SCRATCH/redpajama_tfds/redpajama_data/redpajama_c4 gs://fuzhao/
gsutil -m cp -r $SCRATCH/redpajama_tfds/redpajama_data/redpajama_common_crawl gs://fuzhao/
gsutil -m cp -r $SCRATCH/redpajama_tfds/redpajama_data/redpajama_github gs://fuzhao/
gsutil -m cp -r $SCRATCH/redpajama_tfds/redpajama_data/redpajama_stackexchange gs://fuzhao/
gsutil -m cp -r $SCRATCH/redpajama_tfds/redpajama_data/redpajama_wikipedia gs://fuzhao/
