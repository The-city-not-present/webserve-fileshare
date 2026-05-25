#!/usr/bin/env bash
set -e


echo "Calling git describe..."
echo "# updated" > src_backend/_VERSION.py
python -c 'from datetime import datetime; print(f"# {datetime.now()}")' >> src_backend/_VERSION.py
echo "_VERSION = '''" >> src_backend/_VERSION.py
git describe >> src_backend/_VERSION.py
echo "'''" >> src_backend/_VERSION.py
echo "done"
echo -
echo -
