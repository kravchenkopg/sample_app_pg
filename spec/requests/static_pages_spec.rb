require 'spec_helper'

RSpec.describe "StaticPages" do
  describe "GET /static_pages" do
    let(:base_title) { 'SampleAppPg' }
    it "works! (now write some real specs)" do
      get static_pages_home_path 
      expect(response).to have_http_status(200)
    end

    it "home content" do
      visit 'static_pages/home'
      expect(page).to have_title("#{base_title}")
    end
  end
end
