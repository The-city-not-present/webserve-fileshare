#!/usr/bin/env bash
set -e


echo "Clear up \"dist/\"..."
mkdir -p dist
rm -rf dist
mkdir -p dist
echo "done"
echo -
echo -

echo "Re-build front..."
./scripts_build/build_front.sh
echo "done"
echo -
echo -

echo "Sync assets name from front..."
echo "# updated" > src_backend/endpoints/_WEBAPP_VITE_MANIFEST.py
python -c 'from datetime import datetime; print(f"# {datetime.now()}")' >> src_backend/endpoints/_WEBAPP_VITE_MANIFEST.py
echo "_WEBAPP_FRONT_VITE_MANIFEST = '''" >> src_backend/endpoints/_WEBAPP_VITE_MANIFEST.py
python -c 'import json
with open("dist/webapp/.vite/manifest.json", "r", encoding="utf-8") as f:
    d=json.load(f)
    print(json.dumps(d))
' >> src_backend/endpoints/_WEBAPP_VITE_MANIFEST.py
echo "'''" >> src_backend/endpoints/_WEBAPP_VITE_MANIFEST.py
echo "done"
echo -
echo -

echo "Re-build back..."
./scripts_build/build_back.sh
echo "done"
echo -
echo -
