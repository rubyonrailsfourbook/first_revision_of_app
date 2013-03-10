require 'spec_helper'

describe User do
	before { @user = User.new(name: 'foobar', email: "test@test.com", password: 'password')}

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:url) }
	it { should respond_to(:password) }
	it { should respond_to(:admin) }


	it { should_not be_admin }

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "when email is not present" do
	  before { @user.email =  "" }
	  it { should_not be_valid }
	end

	describe "when password is not present" do
	  before { @user.password = "" }
	  it { should_not be_valid }
	end

	describe "when email address is already taking" do
		before do
			@user.save
			user_with_same_email = @user.dup
			user_with_same_email.save
		end
	end


	describe "email should be store in lowercase" do
		it "description" do
		  	mixed_case_email = "UsER@uSeR.CoM"
			@user.email = mixed_case_email
			@user.save!
			@user.reload.email.should == mixed_case_email.downcase
		end
	end
end
