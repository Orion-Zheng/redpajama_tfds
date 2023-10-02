#!/bin/bash
#SBATCH -N 1 
#SBATCH -n 1
#SBATCH --time=48:00:00
#SBATCH --job-name=generate_common_crawl_subset
#SBATCH --partition=normal
#SBATCH --mail-user=your_email_address
#SBATCH --mail-type=all    # Send email at begin and end of job
export PATH="$HOME/.local/bin:$PATH"
cd $SCRATCH/redpajama_tfds/build_scripts && \
	                tfds build redpajama_common_crawl_dataset_builder.py --manual_dir "$SCRATCH/redpajama_tfds/redpajama_raw/common_crawl" --data_dir "$SCRATCH/redpajama_tfds/redpajama_data"
