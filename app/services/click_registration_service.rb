class ClickRegistrationService < ApplicationService
  def initialize(url, request)
    @url = url
    @request = request
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