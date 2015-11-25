require 'spec_helper'

RSpec.describe "GET /static_pages" do
  let(:base_title) { 'RoR sample' } 
  describe "Home page" do
    it "home content" do
        visit 'static_pages/home'
        expect(page).to have_content("Home")
    end

    it "home title" do
        visit 'static_pages/home'
        expect(page).not_to have_title("|Home")
    end

    it "should home base title" do
      visit 'static_pages/home'
      expect(page).to have_title("#{base_title}")
    end
  end
  describe "Help page" do
    it "help content" do
      visit 'static_pages/help'
      expect(page).to have_content("Help")
    end

    it "help title" do
      visit 'static_pages/help'
      expect(page).to have_title("#{base_title}|Help")
    end
  end

  describe "About page" do
    it "about us content" do
      visit 'static_pages/about'
      expect(page).to have_content("About Us")
    end

    it "about us title" do
      visit 'static_pages/about'
      expect(page).to have_title("#{base_title}|About us")
    end
  end

  describe "Contact page" do
    it "contact content" do
      visit 'static_pages/contact'
      expect(page).to have_content("Contact")
    end

    it "contact title" do
      visit 'static_pages/contact'
      expect(page).to have_title("#{base_title}|Contact")
    end
  end
  
end
