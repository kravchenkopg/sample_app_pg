require 'spec_helper'
require 'helpers/utilities_helper'
include UtilitiesHelper  

RSpec.describe "UserPages", type: :request do
  subject { page }

  describe "GET /user_pages" do
    before { visit singup_path }
    it { should have_title( full_title("Sing up") )}
    it { should have_content('Sing up') }
  end
end
