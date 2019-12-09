class UrlsController < ApplicationController
  helper_method :urls

  def index
  end

  def create
    text = params[:url][:message]
    @new_message = "#{text} with urls changed"

    render :index
  end

  def redirect
  end

  def urls
    @urls ||= Url.all
  end
end
