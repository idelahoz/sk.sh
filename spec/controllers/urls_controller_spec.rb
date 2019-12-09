require 'rails_helper'

RSpec.describe UrlsController, type: :request do

  describe "#create" do
    let(:message){ "hi check this url http://example.com/url, and how about this: http://som.com/awesome_site/other_things, awesome." }

    it "should generate urls for a given text" do
      expect{ post "/", params: { url: { message: message } } }.to change{Url.count}.by(2)
    end

    it "should render the last created urls" do
      post "/", params: { url: { message: message } }

      expect(response.body).to include(Url.descendent.first.token)
      expect(response.body).to include(Url.descendent.second.token)
    end

    describe "rendering the new message" do
      let(:message){ "enter this site http://example.com/coolstuff, it rocks!!!!"}

      it "should render the last created urls" do
        post "/", params: { url: { message: message } }
  
        url = Url.descendent.first

        expect(response.body).to include("enter this site <a href=\"http://localhost:3000/#{url.token},\">http://localhost:3000/#{url.token},</a> it rocks!!!!")
      end
    end
  end
end