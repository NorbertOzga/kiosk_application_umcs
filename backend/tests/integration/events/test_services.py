import fakeredis

from backend_application.events.services import Events
from tests.integration.test_case import BaseTestCase


class TestEventsServices(BaseTestCase):
    def setUp(self):  # noqa
        super().setUp()

    def test_get_events(self):
        events = Events(self.cache)
        events.get_events()

        self.assertTrue("payload" in self.cache.get("events").decode())
