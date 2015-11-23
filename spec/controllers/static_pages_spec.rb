require 'spec_helper'

RSpec.describe "StaticPages" do
  describe "GET /static_pages" do
    let(:base_title) { 'SampleAppPg' }
    

    it "home content" do
      visit 'static_pages/home'
      expect(page).to have_title("SampleAppPg")
      expect(page).to have_title("#{base_title}")
    end
  end
end
