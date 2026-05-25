import json

from ._WEBAPP_VITE_MANIFEST import _WEBAPP_FRONT_VITE_MANIFEST

manifest = None
try:
    manifest = json.loads(_WEBAPP_FRONT_VITE_MANIFEST)
except json.decoder.JSONDecodeError as e:
    raise ValueError(f'Error parsing webapp manifest: failed to parse {repr(_WEBAPP_FRONT_VITE_MANIFEST)}') from e

webapp_js_file = manifest["index.html"]["file"]
webapp_css_files = manifest["index.html"].get("css", [])
