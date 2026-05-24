
from .lib.htmltmpl.src import make_html


def render(path, request):
    response = make_html(
        title = '404 not found',
        page = '404 not found',
        h1 = '404 not found!',
        meta = [],
        assets = [],
        cssclasses = ['page-error','page-error-404'],
        banners = [],
        sections = [],
    )
    return response, 'text/html'
