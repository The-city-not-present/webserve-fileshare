#!/usr/bin/env bash
set -e



echo "Sync assets name from front..."
mkdir -p src_backend/endpoints/GENERATED
echo "" > src_backend/endpoints/GENERATED/__init__.py
echo '"""Generated with make build from git describe; must include _WEBAPP_FRONT_VITE_MANIFEST = ...something"""' > src_backend/endpoints/GENERATED/_WEBAPP_VITE_MANIFEST.py
echo "# updated" >> src_backend/endpoints/GENERATED/_WEBAPP_VITE_MANIFEST.py
python -c 'from datetime import datetime; print(f"# {datetime.now()}")' >> src_backend/endpoints/GENERATED/_WEBAPP_VITE_MANIFEST.py
echo "_WEBAPP_FRONT_VITE_MANIFEST = '''" >> src_backend/endpoints/GENERATED/_WEBAPP_VITE_MANIFEST.py
python -c 'import json
with open("dist/webapp/.vite/manifest.json", "r", encoding="utf-8") as f:
    d=json.load(f)
    print(json.dumps(d))
' >> src_backend/endpoints/GENERATED/_WEBAPP_VITE_MANIFEST.py
echo "'''" >> src_backend/endpoints/GENERATED/_WEBAPP_VITE_MANIFEST.py
echo "done"
echo -
echo -
