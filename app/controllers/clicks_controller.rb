class ClicksController < ApplicationController
  helper_method :urls

  def index
    @url = Url.find(params[:url_id])
    @clicks = @url.clicks.descendent
  end
end
