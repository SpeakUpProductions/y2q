require 'net/http'
require 'uri'

module VideosHelper
    def open(url)
      Net::HTTP.get(URI.parse(url))
    end
    def get_thumb_url(embed_url)
    	google_id = embed_url.sub 'https://www.youtube.com/watch?v=', ''
	page_content = open('http://gdata.youtube.com/feeds/api/videos/'+google_id)
	url_and_beyond = page_content.partition("media:thumbnail url='").last
        just_url = url_and_beyond.partition("'").first
	return just_url
    end
end
