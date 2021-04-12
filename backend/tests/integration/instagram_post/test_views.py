from flask import url_for, Response

from tests.integration.test_case import BaseTestCase


class TestInstagramViews(BaseTestCase):
    def setUp(self): # noqa
        super().setUp()

    def test_testing_package(self):
        self.assertEqual(1, 1)
