import json

# from .GENERATED._WEBAPP_VITE_MANIFEST import _WEBAPP_FRONT_VITE_MANIFEST

def get_webapp_assets(config):
    try:
        _WEBAPP_FRONT_VITE_MANIFEST = config.get('frontend_webapp_manifest_string',None)
        manifest = None
        try:
            manifest = json.loads(_WEBAPP_FRONT_VITE_MANIFEST)
        except json.decoder.JSONDecodeError as e:
            raise ValueError(f'Error parsing webapp manifest: failed to parse {repr(_WEBAPP_FRONT_VITE_MANIFEST)}') from e

        webapp_js_file = manifest["index.html"]["file"]
        webapp_css_files = manifest["index.html"].get("css", [])
        return webapp_js_file, webapp_css_files
    except Exception as e:
        raise Exception(f'Failed to extract assets path from vite manifest: {e}') from e
