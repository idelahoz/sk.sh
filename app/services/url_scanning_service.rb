require 'uri'

class UrlScanningService < ApplicationService
  def initialize(message)
    @message = message
  end

  def call
    urls = URI.extract(message, /http(s)?/)
    urls.map { |url| remove_trailing_punctuation(url) }
  end

  private

  attr_reader :message

  def remove_trailing_punctuation(str)
    str.chomp(",").chomp(".")
  end
end