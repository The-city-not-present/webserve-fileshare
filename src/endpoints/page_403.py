
from .lib.htmltmpl.src import make_html


def render(path, request):
    response = make_html(
        title = '403 access denied',
        page = '403 access denied',
        h1 = '403 access denied!',
        meta = [],
        assets = [],
        cssclasses = ['page-error','page-error-403'],
        banners = [],
        sections = [],
    )
    return response, 'text/html'
