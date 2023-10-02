'''Redpajama_cc dataset.'''

import tensorflow_datasets as tfds
import os


class Builder(tfds.core.GeneratorBasedBuilder):
  '''DatasetBuilder for Redpajama_Test dataset.'''

  VERSION = tfds.core.Version('1.0.0')
  RELEASE_NOTES = {
      '1.0.0': 'Initial release.',
  }
  MANUAL_DOWNLOAD_INSTRUCTIONS = """
  Place the '.jsonl' files in the `manual_dir/`.
  """
  def __init__(self, *args, **kwargs):
    super().__init__(*args, **kwargs)
    self.selected_subset = 'common_crawl'

  def _info(self) -> tfds.core.DatasetInfo:
    '''Returns the dataset metadata.'''
    # TODO(Redpajama_Test): Specifies the tfds.core.DatasetInfo object
    return self.dataset_info_from_configs(
        features=tfds.features.FeaturesDict({
            'text': tfds.features.Text(),
            'meta': tfds.features.Text(),
            # 'red_pajama_subset':tfds.features.Text()
        }),
        # If there's a common (input, target) tuple from the
        # features, specify them here. They'll be used if
        # `as_supervised=True` in `builder.as_dataset`.
        supervised_keys=None,  # Set to `None` to disable
        homepage='https://dataset-homepage/',
    )

  def _split_generators(self, dl_manager: tfds.download.DownloadManager):
    '''Returns SplitGenerators.'''
    from etils import epath
    def find_jsonl_files(directory):  # , years
        jsonl_files = []
        for root, dirs, files in os.walk(directory):
            for file in files:
                file_path = os.path.join(root, file)
                if file.endswith('.jsonl'): # and any(year in file_path for year in years):
                    jsonl_files.append(file_path)
        return jsonl_files
      
    jsonl_files = find_jsonl_files(dl_manager.manual_dir)
    jsonl_files = [epath.Path(path) for path in sorted(jsonl_files)]  

    print('jsonl files num:', len(jsonl_files))
    print('jsonl files names:', jsonl_files)
    return {
        'train': self._generate_examples(jsonl_files)
    }

  def _generate_examples(self, files):
    '''Yields examples.'''
    import traceback
    import json
    key = 0
    for path in files:
        with open(path, encoding='utf-8') as f:
            for row in f:
                try:
                    data = json.loads(row)
                    if 'meta' not in data:
                        text = data['text']
                        del data['text']
                        yield key, {
                            'text': text,
                            'meta': json.dumps(data),
                            # 'red_pajama_subset': self.selected_subset,
                        }
                    else:
                        yield key, {
                            'text': data['text'],
                            'meta': str(data['meta']),
                            # 'red_pajama_subset': self.selected_subset,
                        }
                    key += 1
                except Exception as e:
                    print(f'Subset: {self.selected_subset}')
                    print(f'Path: {path}')
                    print(f'Row: {row}')
                    traceback.print_exc()

                    raise e
