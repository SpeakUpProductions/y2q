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

    just_url
  end

  def get_embed_src(embed_url, options = %w{autoplay=1 autohide=1})
    src = embed_url.sub('watch?v=', 'embed/')
    src = src << "?#{options.join('&')}" unless options.blank?
    src
  end

    def get_num_matches(i_id, hb_id, i_filter, hb_filter)
      num_matches = 0
      if hb_filter.include?(hb_id)
        num_matches += 1
      end
      if i_filter.include?(i_id)
        num_matches += 1
      end
      return num_matches
    end
end
