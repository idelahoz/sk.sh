class UrlsController < ApplicationController
  helper_method :urls

  def index
  end

  def create
    @message_data = process_message
    @new_message = @message_data.new_message
    @created_urls = @message_data.created_urls

    render :index
  end

  def show
    url = Url.find_by!(token: params[:token])
    process_click(url)
    redirect_to url.original_url
  end

  def urls
    @urls ||= Url.descendent
  end

  private

  def message
    params[:url][:message]
  end

  def process_message
    MessageProcessingService.call(message)
  end

  def process_click(url)
    ClickRegistrationService.call(url, request) #This should be done on a side job to improve performance.
  end
end
