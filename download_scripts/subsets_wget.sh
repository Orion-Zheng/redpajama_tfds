nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/arxiv -i ./urls/arxiv.txt > ./arxiv_wget_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/book -i ./urls/book.txt > ./book_wget_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/c4 -i ./urls/c4.txt > ./c4_wget_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/github -i ./urls/github.txt > ./github_wget_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/stackexchange -i ./urls/stackexchange.txt > ./stackexchange_wget_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/wikipedia -i ./urls/wikipedia.txt > ./wikipedia_wget_log.txt 2>&1 &
# common_crawl subset has several dumps needed to be saved in different sub-directories. Otherwise some files with the same name will overide each other.
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/common_crawl/2019-30 -i ./urls/common_crawl_2019-30_urls.txt > ./common_crawl_2019-30_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/common_crawl/2020-05 -i ./urls/common_crawl_2020-05_urls.txt > ./common_crawl_2020-05_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/common_crawl/2021-04 -i ./urls/common_crawl_2021-04_urls.txt > ./common_crawl_2021-04_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/common_crawl/2022-05 -i ./urls/common_crawl_2022-05_urls.txt > ./common_crawl_2022-05_log.txt 2>&1 &
nohup wget -nc -P $SCRATCH/redpajama_tfds/redpajama_raw/common_crawl/2023-06 -i ./urls/common_crawl_2023-06_urls.txt > ./common_crawl_2023-06_log.txt 2>&1 &