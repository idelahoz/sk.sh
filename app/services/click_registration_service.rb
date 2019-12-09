class ClickRegistrationService < ApplicationService
  def initialize(url, request)
    @url = url
    @request = request
  end

  def call
    url.clicks.create(
      browser: browser.name,
      platform: browser.platform.name,
      user_agent: request.user_agent,
      ip: request.remote_ip,
      location: request.location.region
    )
  end

  private

  attr_reader :url, :request

  def browser
    @browser ||= Browser.new(request.user_agent, accept_language: "en-us")
  end
end