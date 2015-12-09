require 'spec_helper'
require 'helpers/utilities_helper'
include UtilitiesHelper  

RSpec.describe "UserPages", type: :request do
  subject { page }

  describe "signup page" do
    before { visit new_user_path }
    it { should have_title( full_title("Sing up") )}
    it { should have_content('Sing up') }
    let(:submit){ "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change  {User.count}
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",          with: "Kovalenko S.A."
        fill_in "Email",         with: "kovalnkosa_1@mail.ru"
        fill_in "Password",      with: "foobar"
        fill_in "Confirmation",  with: "foobar" 
      end
      it "should create a user" do
        expect {click_button submit}.to change {User.count}.by(1)
      end
    end

  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before {visit user_path(user)}
    it {should have_content(user.email)}
    it {should have_title(user.name)}
  end
end
