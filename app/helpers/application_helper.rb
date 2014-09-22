module ApplicationHelper

  def twitter_share_url(text, url)
    escaped_text = URI.escape(text)
    escaped_url = URI.escape(url)
    referer_url = 'http://www.sevenounces.com'
    "https://twitter.com/intent/tweet?text=#{escaped_text}&url=#{escaped_url}&original_referer=#{referer_url}"
  end



end
