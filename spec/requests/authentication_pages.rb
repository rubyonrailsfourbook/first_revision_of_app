require 'spec_helper'

describe "Authentication" do
	subject { page }

	describe "sign in page" do
	 before { visit sign_in_path }

		it { should have_selector('h1', text: 'Sign In') }
		it { should have_selector('title', text: 'Sign In') }
	end
end