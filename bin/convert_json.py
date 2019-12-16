# convert exported json to payload with Update Collection API.
import glob
import json
import os


if __name__ == '__main__':
    files = glob.glob('collections/*/*.json')
    for f in files:
        with open(f, 'r+') as f1, open(os.path.join('/tmp', os.path.basename(f)), 'w') as f2:
          data = json.load(f1)

          postman_id = data['info']['_postman_id']
          converted = {}
          converted['collection'] = data

          json.dump(converted, f2, indent=2)
