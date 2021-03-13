from flask import Response
import json
import requests
from instaloader import Instaloader, Profile

class InstaScraper:
	def __init__(self):
		self.gotInitData = False
		self.jsonData = json.dumps({
    		'success': False, 
    		'payload': []
		})
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

	def start(self):
		data = self.getInstagramData()
		self.gotInitData = True
		self.jsonData = json.dumps(data)

	def getInstagramData(self):
		self.posts.clear()
		if not self.loaded:
			instaLoader = Instaloader()
			PROFILENAME = 'umcs_lublin'
			profile = Profile.from_username(instaLoader.context, PROFILENAME)
		iter = 0
		for post in profile.get_posts():
			iter += 1
			self.posts.append({
				'photo_url': post.url,
				'caption': post.caption,
				'likes': post.likes
	        })
			if iter == 5:
				break
		request = {
			'success': True,
			'info': {
				'followers': profile.followers
			},
			'payload': self.posts
		}
		# TODO: cache request to redis
		return request

if __name__ == "__main__":
	insta = InstaScraper()
	insta.start()
	print(insta.response())