# convert exported json to payload with Create Collection API.
import glob
import json
import os

root_path = 'collections'

if __name__ == '__main__':
    files = glob.glob('collections/*')
    for f in files:
        with open(f, 'r+') as jf:
          data = json.load(jf)
          if 'collection' in data.keys():
            postman_id = data['collection']['info']['_postman_id']
            os.rename(f, os.path.join(root_path, f'{postman_id}.json'))
            continue

          postman_id = data['info']['_postman_id']
          converted = {}
          converted['collection'] = data

          jf.seek(0)
          json.dump(converted, jf, indent=2)
          os.rename(f, os.path.join(root_path, f'{postman_id}.json'))
