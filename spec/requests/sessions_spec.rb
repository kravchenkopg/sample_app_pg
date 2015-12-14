require 'spec_helper'

RSpec.describe "SessionPages", type: :request do
  subject { page }
  describe "sign in" do
    before do 
      visit signin_path 
    end  
    it { should have_content('Sign in') }
    it { should have_title("Sign in")  }
  end  
    
    describe "with invalid information" do
      before do
        visit signin_path        
        click_button('Sign in')
      end        
      it {should have_title('Sign in')}
      it {should have_selector('div.alert.alert-error')}
      it "after invalid visit" do
        click_link "Home"
        expect(page).not_to have_selector('div.alert.alert-error')
      end  
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user)}
      before do
        visit signin_path
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      it { should have_selector('div.alert.alert-success') }

      describe "followed by signout" do
        it "click Sign out" do
          click_link "Sign out" 
          expect(page).to have_link("Sign in")
        end          
      end
    end
 end
