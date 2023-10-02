#!/bin/bash
#SBATCH -J decompress_cc_del_zst_files       # Job name
#SBATCH -p normal          # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 1               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-user=your_email_address
#SBATCH --mail-type=all    # Send email at begin and end of job

find ./common_crawl -name '*.zst' -exec bash -c 'zstd -d "$0" && rm "$0"' {} \;
