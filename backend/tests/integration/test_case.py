import fakeredis
from unittest import TestCase

import testing.redis

from backend_application.app import create_app
from backend_application.settings import ConfigType


class BaseTestCase(TestCase):
    def setUp(self) -> None:
        self.cache = fakeredis.FakeStrictRedis()
        app = create_app(ConfigType.DEV)
        self.base_app = app
        self.app = app.test_client()

    def tearDown(self) -> None:
        pass
