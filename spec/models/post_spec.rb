require 'spec_helper'

describe Post do
  before { @post = Post.new(name: "Hello World", content: "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ") }

  subject { @post }

  it { should respond_to(:name) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:tag_list) }



  describe "when name is blank" do
  	before { @post.name = " " }
  	it { should_not be_valid }
  end

  describe "when content is blank" do
  	before { @post.content = " " }
  	it { should_not be_valid }
  end
end
