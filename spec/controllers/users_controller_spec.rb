require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do

  describe '#new' do
    before do
      @user = mock_model(User)
      User.stub!(:new => @user)
    end

    it 'creates a new user' do
      User.should_receive(:new)
      get :new
    end

    it 'exposes the user' do
      get :new
      assigns[:user].should == @user
    end
  end

  describe '#create' do
    before(:each) do
      @new_user = mock_model(User, :save => true)
      User.stub!(:new => @new_user)
      @user_params = {'login' => 'aimee'}
    end

    def do_post
      post :create, :user => @user_params
    end

    it "creates a new user with the parameters given" do
      User.should_receive(:new).with(@user_params)
      do_post
    end

    it "attempts to save the new user" do
      @new_user.should_receive(:save)
      do_post
    end

    context "when the user is valid" do
      before(:each) do
        @new_user.stub!(:save => true)
      end

      it "provides feedback" do
        do_post
        flash[:success].should_not be_blank
      end

      it "redirects to the home page" do
        do_post
        response.should redirect_to(root_path)
      end
    end

    context "when the user is not valid" do
      before(:each) do
        @new_user.stub!(:save => false)
      end

      it "shows the new user page again" do
        do_post
        response.should render_template(:new)
      end
    end
  end
  

end
