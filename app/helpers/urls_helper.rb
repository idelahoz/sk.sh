module UrlsHelper
  def url_for_token(token)
    click_url(token)
  end

  def clickable_text(text)
    text.gsub(URI.regexp, '<a href="\0">\0</a>').html_safe
  end
end
