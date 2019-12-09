class MessageProcessingService < ApplicationService
  def initialize(message)
    @message = message
    @created_urls = []
  end

  def call
    scanned_urls.each do |url|
      url_record = create_url_record(url)
      created_urls << url_record
      replace_url_on_message!(url_record)
    end

    OpenStruct.new(new_message: message, created_urls: created_urls)
  end

  private

  attr_accessor :message, :created_urls

  def scanned_urls
    @scanned_urls ||= UrlScanningService.call(message)
  end

  def create_url_record(url)
    Url.create(original_url: url)
  end

  def replace_url_on_message!(url_record)
    message.sub!(url_record.original_url, "http://#{ENV['SK_SH_HOST']}/#{url_record.token}")
  end
end