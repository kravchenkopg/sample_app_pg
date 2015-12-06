require 'spec_helper'

RSpec.describe User, type: :model do
  describe User do
    before { @user = User.new(name:"Pg",email:"pg@mail.ru",
                              password: "foobar", password_confirmation: "foobar")}
    #before { @user = User.new()}
    subject { @user }
    it { should respond_to(:name)}
    it { should respond_to(:email)}
    it { should respond_to(:password_digest)}
    it { should respond_to(:password)}
    it { should respond_to(:password_confirmation)}
    it { should respond_to(:authenticate)}
    it { should be_valid }

    describe "when name is not present" do
      before { @user.name = "" }
      it { should_not be_valid}
    end

    describe  "when email is not present" do
      before {@user.email = " "}
      it { should_not be_valid }
    end

    describe "when email address is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end

      it {should_not be_valid}
    end

    describe "when name is too long" do
      before {@user.name = "a" * 51}
      it { should_not be_valid }
    end

    describe "when email format is invalid" do
      address = %w[user@foo user_at.org example.user@foo.
                    foo@bar_baz.com foo@bar+baz.com]
      address.each do |invalid_address|
        #@user = User.new(name:"Pg",email:invalid_address)
        it "check invalid address" do 
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end  
      end               
    end

    describe "when email format is valid" do
      address = %w[user@foo.Com user_at-US@f.b.org example.user@foo.jp]
      address.each do |valid_address|        
        it "check valid address" do
          @user.email = valid_address
          expect(@user).to be_valid
        end  
      end               
    end

  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "new name", email: "user@example.com",
                        password: "" , password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before do
      @user = User.new(name: "new name", email: "user@example.com",
                        password: "foo" , password_confirmation: "bar")
    end
    it { should_not be_valid}
  end

  describe "return value authenticate method" do
    before do
      @user = User.new(name:"Pg",email:"pg@gmail.com",
                       password: "foobar", password_confirmation: "foobar")
      @user.save
    end
    
    let(:found_user) { User.find_by(email: @user.email)}

    describe "with valid password" do       
      it "valid password" do
        expect(@user).to eq(found_user.authenticate(@user.password))       
      end
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid")}
      it { should_not eq user_for_invalid_password}
      specify { expect(user_for_invalid_password).not_to be}
    end

    describe "with password thats too short" do
      before {@user.password = @user.password_confirmation = "a"*5}
      it { should_not be_valid}
    end
  end

end
