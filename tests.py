import muffin
import pytest

@pytest.fixture(scope='session')
def app(loop, test=False):
    return muffin.Application(
        'cached_app', loop=loop,
        PLUGINS=('muffin_dogpilecache',)
    )

def test_plugin_register(app):
    assert 'dogpilecache' in app.ps
    assert 'configs' in app.ps.dogpilecache.cfg
