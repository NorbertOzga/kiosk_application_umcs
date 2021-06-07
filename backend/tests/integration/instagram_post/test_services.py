import fakeredis

from backend_application.instagram_post.services import InstaScraper
from tests.integration.test_case import BaseTestCase


class TestInstagramServices(BaseTestCase):
    def setUp(self):  # noqa
        super().setUp()

    def test_get_posts(self):
        scraper = InstaScraper(self.cache)
        scraper.get_instagram_data()

        self.assertTrue("payload" in self.cache.get("instagram_posts").decode())
