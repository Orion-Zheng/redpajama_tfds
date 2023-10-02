(Please replace `$SCRATCH` in all scripts with the actual path to `redpajama_tfds` on your machine)
# 1. Download raw data files  
Run `download_scripts\subsets_wget.sh`, and then all raw data files will appear under the `redpajama_raw` directory.  
# 2. Check the Checksum and decompress common_crawl subset from .zst to .jsonl  
1. Run `redpajama_raw\check_checksum.sh`, making sure all downloaded data files are complete.  
2. Run `redpajama_raw\decompress_cc.sh`, decompressing common_crawl subset from .zst to .jsonl and delete original .zst files.  
# 3. Generate TFDS of all redpajama subsets
Run `run_build\generate_SUBSET_NAME.sh` to generate TFDS of all subsets to the `redpajama_data` directory.
Among these scripts:
```
--manual_dir: The source directory for storing raw data.
--data_dir: The target directory for storing the generated TFDS.
```
# 4. Upload all TFDS to Google Cloud
Install gsutil and sign in your Google Account, run `upload.sh` to upload TFDS to your storage bucket.
[ref](https://cloud.google.com/storage/docs/gsutil_install#linux)