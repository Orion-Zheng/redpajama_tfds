#!/bin/bash
#SBATCH -N 1 
#SBATCH -n 1
#SBATCH --time=4:00:00
#SBATCH --job-name=check_integrity
#SBATCH --partition=normal
sha256sum -c ./sha256_checksums/arxiv_sha256sums.txt --ignore-missing
sha256sum -c ./sha256_checksums/book_sha256sums.txt --ignore-missing
sha256sum -c ./sha256_checksums/c4_sha256sums.txt --ignore-missing
sha256sum -c ./sha256_checksums/common_crawl_sha256sums.txt --ignore-missing
sha256sum -c ./sha256_checksums/github_sha256sums.txt --ignore-missing
sha256sum -c ./sha256_checksums/stackexchange_sha256sums.txt --ignore-missing
sha256sum -c ./sha256_checksums/wikipedia_sha256sums.txt --ignore-missing
