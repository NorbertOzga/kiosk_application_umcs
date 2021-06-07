import json
import base64

from flask import Response
from instaloader import Instaloader, Profile

from ..extensions import cache


class InstaScraper:
    def __init__(self):
        self.gotInitData = False
        self.jsonData = json.dumps(
            {
                'success': False,
                'payload': []
            }
        )
        self.loaded = False
        self.posts = []

    def response(self):
        if self.gotInitData:
            return Response(
                response=self.jsonData,
                status=200,
                mimetype='application/json'
            )
        else:
            return Response(
                response=self.jsonData,
                status=400,
                mimetype='application/json'
            )

    def get_instagram_data(self):
        self.posts.clear()
        if not self.loaded:
            insta_loader = Instaloader()
            profile_name = 'umcs_lublin'
            profile = Profile.from_username(insta_loader.context, profile_name)

        for i, post in enumerate(profile.get_posts()):
            temp = post.caption.encode("utf-8")
            temp2 = base64.b64encode(temp)
            self.posts.append(
                {
                    'photo_url': post.url,
                    'caption': temp2.decode("utf-8"),
                    'likes': post.likes
                }
            )
            if i == 5:
                break

        data = {
            'info': {
                'followers': profile.followers
            },
            'payload': self.posts
        }

        cache.set("instagram_posts", str(data))
